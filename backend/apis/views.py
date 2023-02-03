from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth import login, authenticate
from app.models import Patient, Farmaco, Doctor, Reminder, FarmacoInArmadietto
from .serializers import FarmacoSerializer, PatientSerializer, DoctorSerializer, ReminderSerializer, FarmacoInArmadiettoSerializer, PatientRegistrationSerializer, DoctorRegistrationSerializer, LoginSerializer

class PatientList(generics.ListCreateAPIView):
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

class PatientDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

class PatientRegistration(generics.CreateAPIView):
    serializer_class = PatientRegistrationSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

class DoctorList(generics.ListCreateAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

class DoctorDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

class DoctorRegistration(generics.CreateAPIView):
    serializer_class = DoctorRegistrationSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')
        
        # Try to authenticate as a Patient
        patient = authenticate(username=email, password=password)
        if patient is not None:
            if patient.is_active:
                login(request, patient)
                serializer = PatientSerializer(patient)
                return Response(serializer.data)
            else:
                return Response({'error': 'Patient account is inactive'}, status=400)
        
        # Try to authenticate as a Doctor
        doctor = authenticate(username=email, password=password)
        if doctor is not None:
            if doctor.is_active:
                login(request, doctor)
                serializer = DoctorSerializer(doctor)
                return Response(serializer.data)
            else:
                return Response({'error': 'Doctor account is inactive'}, status=400)
        
        # Authentication failed
        return Response({'error': 'Invalid email or password'}, status=400)


#visualizzione di tutti i farmaci
class ElencoFarmaciView(generics.ListCreateAPIView):
    queryset=Farmaco.objects.all()
    serializer_class=FarmacoSerializer
    
#visualizzione di un farmaco
class DettaglioFarmacoView(generics.RetrieveAPIView):
    queryset=Farmaco.objects.all()
    serializer_class=FarmacoSerializer

#visualizzazione dei suoi promemoria da parte di un paziente
class PatientReminderListView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Reminder.objects.all()
    serializer_class = ReminderSerializer

    def get_queryset(self):
        return self.queryset.filter(patient=self.request.user)

class ReminderCreateView(generics.CreateAPIView):
    queryset = Reminder.objects.all()
    serializer_class = ReminderSerializer

#visualizzazione dei promemoria condivisi
class DoctorReminderListView(generics.ListAPIView):
    serializer_class = ReminderSerializer

    def get_queryset(self):
        doctor = self.request.user
        return Reminder.objects.filter(doctor=doctor, is_visible=True)

#aggiungere farmaci all'armadietto
class AggiungiFarmacoArmadiettoView(generics.CreateAPIView):
    serializer_class = FarmacoSerializer
    def perform_create(self, serializer):
        serializer.save(patient=self.request.user.patient)

#visualizzazione armadietto dei farmaci
class ArmadiettoView(generics.ListAPIView):
    serializer_class = FarmacoInArmadiettoSerializer
    def get_queryset(self):
        return FarmacoInArmadietto.objects.filter(patient=self.request.user.patient)