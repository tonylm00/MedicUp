from rest_framework import serializers
from app import models

#serve per inviare in formato json i dati
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User
        fields = [ 'email','pw']

class DoctoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Doctor
        fields = [ 'codice','pw']
        