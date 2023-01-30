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
     
class FarmacoSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Farmaco
        fields = ['id','nome', 'principio', 'precauzioni', 'controindicazioni', 'posologia']

class PromemoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Promemoria
        fields = ['id', 'inizio', 'fine', 'ora']

class PosologiaSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Posologia
        fields = ['id', 'user', 'doctor']
    
class RemiderSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Posologia
        fields = ['id', 'posologia', 'promemoria']

class Aramdio(serializers.ModelSerializer):
    class Meta:
        model = models.Armadio
        fields = ['id', 'user']

class AramdioContiene(serializers.ModelSerializer):
    class Meta:
        model = models.ArmadioContiene
        fields = ['id', 'armadio', 'farmaco', 'scadenza', 'quantita', 'tipo']    

class DSpressione(serializers.ModelSerializer):
    class Meta:
        model = models.ArmadioContiene
        fields = ['id', 'data', 'user', 'min', 'max']        

class DSpressione(serializers.ModelSerializer):
    class Meta:
        model = models.ArmadioContiene
        fields = ['id', 'data', 'user', 'min', 'max'] 
   
class DSpeso(serializers.ModelSerializer):
    class Meta:
        model = models.ArmadioContiene
        fields = ['id', 'data', 'user', 'peso'] 

class DSbpm(serializers.ModelSerializer):
    class Meta:
        model = models.ArmadioContiene
        fields = ['id', 'data', 'user', 'valore']

class DScolesterolo(serializers.ModelSerializer):
    class Meta:
        model = models.ArmadioContiene
        fields = ['id', 'data', 'user', 'valore']  
