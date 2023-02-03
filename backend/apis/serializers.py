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
        fields = ['cf','first_name', 'last_name', 'email', 'password']

    def create(self, validated_data):
        patient = Patient.objects.create(
            cf=validated_data['cf'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            email=validated_data['email']
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
        fields = ['codefnomceo','first_name', 'last_name', 'email', 'password']

    def create(self, validated_data):
        patient = Patient.objects.create(
            codefnomceo=validated_data['codefnomceo'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            email=validated_data['email']
        )
        Doctor.set_password(validated_data['password'])
        Doctor.save()
        return Doctor

class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
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