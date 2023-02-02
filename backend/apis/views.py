from rest_framework import generics
from app.models import Patient, Farmaco, Doctor, Reminder, FarmacoInArmadietto
from .serializers import FarmacoSerializer, PatientSerializer, DoctorSerializer, ReminderSerializer, FarmacoInArmadiettoSerializer

class PatientList(generics.ListCreateAPIView):
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

class PatientDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

class DoctorList(generics.ListCreateAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

class DoctorDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

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