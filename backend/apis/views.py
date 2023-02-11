from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth import authenticate
from django.shortcuts import get_object_or_404
from django.contrib.auth.hashers import make_password
from app.models import Patient, Farmaco, Doctor, FarmacoInArmadietto, PromemoriaSchedule, Promemoria
from .serializers import PromemoriaUpdateSerializer, FarmacoSerializer, PatientSerializer, DoctorSerializer, FarmacoInArmadiettoSerializer, PromemoriaScheduleSerializer, PromemoriaSerializer

'''
Login diversi, in cui restituisco tutto l'oggetto Paziente o Dottore, utilizzando queryparams

Paziente login -> email, pass
Dottore login -> codefnomceo, pass

Registrazione Paziente, Dottore
Restituire true e false

Aggiungere campi al farmaco
'''
class PatientList(generics.ListCreateAPIView):
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

class PatientDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

#registrazione paziente
class PatientRegistration(generics.CreateAPIView):
    serializer_class = PatientSerializer
    queryset = Patient.objects.all()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response({"success": True}, status=status.HTTP_201_CREATED, headers=headers)
    
    def perform_create(self, serializer):
        serializer.save()

class DoctorList(generics.ListCreateAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

class DoctorDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

#registrazione medico
class DoctorRegistration(generics.CreateAPIView):
    serializer_class = DoctorSerializer
    queryset = Doctor.objects.all()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response({"success": True}, status=status.HTTP_201_CREATED, headers=headers)
    
    def perform_create(self, serializer):
        serializer.save()

class PatientLoginView(generics.RetrieveAPIView, generics.CreateAPIView):
    #serializer_class = LoginSerializerPaziente
    serializer_class = PatientSerializer

    def post(self, request, *args, **kwargs):
        email = request.data.get('email')
        password = request.data.get('password')
        patient = Patient.objects.get(email=email, password=password)
        if patient is not None:
            serializer = self.get_serializer(patient)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response({"error": "Paziente non registrato o Credenziali non valide"}, status=status.HTTP_401_UNAUTHORIZED)

class DoctorLoginView(generics.RetrieveAPIView, generics.CreateAPIView):
    #serializer_class = LoginSerializerDottore
    serializer_class = DoctorSerializer

    def post(self, request, *args, **kwargs):
        fnomceo = request.data.get('fnomceo')
        password = request.data.get('password')

        doctor = Doctor.objects.get(fnomceo=fnomceo, password=password)
        if doctor is not None :#and doctor.is_active:
            doctor = Doctor.objects.get(fnomceo=fnomceo, password=password)
            serializer = self.get_serializer(doctor)
            return Response(serializer.data)
        else:
            return Response({"error": "Dottore non registrato o Credenziali non valide"}, status=status.HTTP_401_UNAUTHORIZED)

#visualizzione di tutti i farmaci
class ElencoFarmaciView(generics.ListCreateAPIView):
    queryset=Farmaco.objects.all()
    serializer_class=FarmacoSerializer
    
#visualizzione di un farmaco tramite id
class DettaglioFarmacoView(generics.RetrieveAPIView):
    queryset = Farmaco.objects.all()
    serializer_class = FarmacoSerializer
    lookup_field = 'pk'

#ricerca di un farmaco per nome
class FarmacoSearchNomeView(generics.RetrieveAPIView):
    serializer_class = FarmacoSerializer
    queryset = Farmaco.objects.all()
    lookup_field = 'nome'

    def get_object(self):
        queryset = self.get_queryset()
        filter_kwargs = {self.lookup_field: self.request.query_params.get("nome")}
        obj = get_object_or_404(queryset, **filter_kwargs)
        return obj

#ricerca di un farmaco per principio attivo
class FarmacoSearchPrincipioView(generics.ListCreateAPIView):
    serializer_class = FarmacoSerializer
    queryset = Farmaco.objects.all()
    lookup_field = 'principio'

    def get_object(self):
        queryset = self.get_queryset()
        filter_kwargs = {self.lookup_field: self.request.query_params.get("principio")}
        obj = get_object_or_404(queryset, **filter_kwargs)
        return obj

#aggiungere farmaci all'armadietto
class AggiungiFarmacoArmadiettoView(generics.CreateAPIView):
    serializer_class = FarmacoInArmadiettoSerializer
    queryset = FarmacoInArmadietto.objects.all()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response({"success": True}, status=status.HTTP_201_CREATED, headers=headers)
    
    def perform_create(self, serializer):
        serializer.save()
        
#visualizzazione armadietto dei farmaci
class ArmadiettoView(generics.ListCreateAPIView):
    serializer_class = FarmacoInArmadiettoSerializer
    queryset = FarmacoInArmadietto.objects.all()
    lookup_field = 'paziente'
    
    def get_object(self):
        queryset = self.get_queryset()
        filter_kwargs = {self.lookup_field: self.request.query_params.get("paziente")}
        obj = get_object_or_404(queryset, **filter_kwargs)
        return obj

#aggiunta di un promemoria
class PromemoriaCreateView(generics.CreateAPIView):
    queryset = Promemoria.objects.all()
    serializer_class = PromemoriaSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response({"success": True}, status=status.HTTP_201_CREATED, headers=headers)
    
    def perform_create(self, serializer):
        serializer.save()

#aggiunta schedule promemoria
class PromemoriaScheduleCreateView(generics.CreateAPIView):
    serializer_class = PromemoriaScheduleSerializer
    queryset = PromemoriaSchedule.objects.all()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response({"success": True}, status=status.HTTP_201_CREATED, headers=headers)
    
    def perform_create(self, serializer):
        serializer.save()

#visualizza dettagli di un promemoria
class PromemoriaDetailView(generics.RetrieveAPIView):
    queryset = Promemoria.objects.all()
    serializer_class = PromemoriaSerializer

#visualizzazione scheduling
class PromemoriaDetailScheduleView(generics.ListAPIView):
    serializer_class = PromemoriaScheduleSerializer
    queryset = PromemoriaSchedule.objects.all()
    lookup_field = 'promemoria'
    
    def get_object(self):
        queryset = self.get_queryset()
        filter_kwargs = {self.lookup_field: self.request.query_params.get("promemoria")}
        obj = get_object_or_404(queryset, **filter_kwargs)
        return obj

#delete promemoria
class PromemoriaDeleteView(generics.DestroyAPIView):
    queryset = Promemoria.objects.all()
    serializer_class = PromemoriaSerializer

#lista promemoria di un paziente
class PromemoriaPazienteListView(generics.ListAPIView):
    serializer_class = PromemoriaSerializer

    def get_queryset(self):
        paziente = self.kwargs.get('paziente_id')
        return Promemoria.objects.filter(paziente=paziente)

class PromemoriaDottoreListView(generics.ListAPIView):
    serializer_class = PromemoriaSerializer

    def get_queryset(self):
        dottore = self.kwargs.get('dottore_id')
        return Promemoria.objects.filter(dottore=dottore)

#aggiornamento di un promemoria
class PromemoriaUpdateView(generics.UpdateAPIView):
    queryset = Promemoria.objects.all()
    serializer_class = PromemoriaUpdateSerializer