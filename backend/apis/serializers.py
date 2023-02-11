from rest_framework import serializers
from app.models import *

from rest_framework import serializers
from app.models import Patient, Doctor, FarmacoInArmadietto, Farmaco, Promemoria, PromemoriaSchedule

class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient
        fields = ['nome', 'cognome', 'cf', 'data_nascita', 'email', 'password']

class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = '__all__'
    
class FarmacoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Farmaco
        fields = '__all__'

class FarmacoInArmadiettoSerializer(serializers.ModelSerializer):

    class Meta:
        model = FarmacoInArmadietto
        fields = '__all__'

class PromemoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Promemoria
        fields =  ['paziente', 'nome', 'descrizione', 'dottore']
        extra_kwargs = {
            'dottore': {'allow_null': True, 'required': False}
        }

class PromemoriaScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = PromemoriaSchedule
        fields = ['promemoria', 'giorno', 'orario']

class PromemoriaUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Promemoria
        fields = ['nome', 'descrizione', 'dottore']