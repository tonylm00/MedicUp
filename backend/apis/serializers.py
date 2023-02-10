from rest_framework import serializers
from app.models import *

from rest_framework import serializers
from app.models import Patient, Doctor, FarmacoInArmadietto, Farmaco

class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient
        fields = ['nome', 'cognome', 'cf', 'data_nascita', 'email', 'password']

class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = '__all__'

class LoginSerializerPaziente(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField()

class LoginSerializerDottore(serializers.Serializer):
    fnomceo = serializers.CharField()
    password = serializers.CharField()
    
class FarmacoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Farmaco
        fields = '__all__'

class FarmacoInArmadiettoSerializer(serializers.ModelSerializer):

    class Meta:
        model = FarmacoInArmadietto
        fields = '__all__'

    #def create(self, validated_data):
    #        medicine_data = validated_data.pop('medicine')
    #        farmaco = Farmaco.objects.create(**medicine_data)
    #        FarmacoInArmadietto = FarmacoInArmadietto.object.create(farmaco=farmaco, **validated_data)
    #        return FarmacoInArmadietto

'''
class ReminderHourSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReminderHour
        fields = '__all__'

class ReminderSerializer(serializers.ModelSerializer):
    hours = ReminderHourSerializer(many=True)
    doctor = serializers.PrimaryKeyRelatedField(queryset=Doctor.objects.filter(groups__name='Doctors'), required=False)

    class Meta:
        model = Reminder
        fields = '__all__'

    def create(self, validated_data):
        hours_data = validated_data.pop('hours')
        reminder = Reminder.objects.create(**validated_data)
        for hour_data in hours_data:
            ReminderHour.objects.create(reminder=reminder, **hour_data)
        return reminder
'''