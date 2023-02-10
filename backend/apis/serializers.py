from rest_framework import serializers
from app.models import *

from rest_framework import serializers
from app.models import Patient, Doctor, Reminder, ReminderHour, FarmacoInArmadietto, Farmaco

class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient
        fields = ['email', 'first_name', 'last_name', 'cf']

class PatientRegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = Patient
        fields = ['cf','nome', 'cognome', 'email', 'password', 'data_nascita']

    def create(self, validated_data):
        patient = Patient.objects.create(
            cf=validated_data['cf'],
            nome=validated_data['nome'],
            cognome=validated_data['cognome'],
            email=validated_data['email'],
            data_nascita=validated_data['data_nascita']
        )
        patient.set_password(validated_data['password'])
        patient.save()
        return patient

class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = ['email', 'first_name', 'last_name', 'codefnomceo']

class DoctorRegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = Doctor
        fields = ['fnomceo','nome', 'cognome', 'email', 'password']

    def create(self, validated_data):
        Doctor = Doctor.objects.create(
            fnomceo=validated_data['fnomceo'],
            nome=validated_data['nome'],
            cognome=validated_data['cognome'],
            email=validated_data['email']
        )
        Doctor.set_password(validated_data['password'])
        Doctor.save()
        return Doctor

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
    medicine = FarmacoSerializer(many=False)
    class Meta:
        model = FarmacoInArmadietto
        fields = ['id', 'farmaco', 'scadenza', 'quantity', 'type']

    def create(self, validated_data):
            medicine_data = validated_data.pop('medicine')
            farmaco = Farmaco.objects.create(**medicine_data)
            FarmacoInArmadietto = FarmacoInArmadietto.object.create(farmaco=farmaco, **validated_data)
            return FarmacoInArmadietto

class ReminderHourSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReminderHour
        fields = '__all__'

class ReminderSerializer(serializers.ModelSerializer):
    hours = ReminderHourSerializer(many=True)
    doctor = serializers.PrimaryKeyRelatedField(queryset=User.objects.filter(groups__name='Doctors'), required=False)

    class Meta:
        model = Reminder
        fields = '__all__'

    def create(self, validated_data):
        hours_data = validated_data.pop('hours')
        reminder = Reminder.objects.create(**validated_data)
        for hour_data in hours_data:
            ReminderHour.objects.create(reminder=reminder, **hour_data)
        return reminder