from rest_framework import serializers
from app.models import *

class PazienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paziente
        fields = '__all__'

    def create(self, validated_data):
        user = Paziente(username=validated_data['username'])
        user.set_password(validated_data['password'])
        user.save()
        return user

class DottoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = [ 'codice','pw']
     
class FarmacoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Farmaco
        fields = ['id','nome', 'principio', 'precauzioni', 'controindicazioni', 'posologia']

