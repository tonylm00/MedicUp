from django.db import models
from django.contrib.auth.models import AbstractUser

 # 'paziente', specializzazione di utente, scelto il collasso verso il basso e chiamato user per semplicità
class user(models.Model):  
    cf = models.CharField(max_length=16, primary_key=True)
    email = models.EmailField(blank=False, max_length=254, unique=True)
    pw = models.CharField(max_length=16)
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    born = models.DateField()

#farmaci
class medicine(models.Model):
    AICcode = models.PositiveIntegerField(primary_key=True)
    commercial_name = models.CharField(max_length=50)

#specializzazione di utente, scelto il collasso verso il basso
class doctor(models.Model): 
    cf = models.CharField(max_length=16, primary_key=True)
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    email = models.CharField(max_length=50)
    pw = models.CharField(max_length=50)
    born = models.DateField()
    description = models.CharField(max_length=100)
    specialist = models.CharField(max_length=50)

#armadietto - utente 1,1
class closet(models.Model): 
    id = models.PositiveIntegerField(primary_key=True)
    user = models.ForeignKey(user, on_delete=models.CASCADE)

#armadietto contiene farmaci - n,m
class closetContains(models.Model):
    idCloset = models.ForeignKey(closet, on_delete=models.CASCADE)
    medicine = models.ForeignKey(medicine, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()
    type = models.CharField(max_length=10)    #pillola, compressa, dose endovena <3, 

##################################################################################################################################
#utente - dati sanitari 1,n
#dati sanitari (health data) - pressione sanguigna
class HDblood(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    user = models.ForeignKey(user, on_delete=models.CASCADE)
    minvalue = models.IntegerField(null=False)
    maxvalue = models.IntegerField(null=False)

#dati sanitari - peso
class HDweight(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    user = models.ForeignKey(user, on_delete=models.CASCADE)
    value = models.IntegerField(null=False)
   
#dati sanitari - frequenza cardiaca
class HDheart(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    user = models.ForeignKey(user, on_delete=models.CASCADE)
    value = models.IntegerField(null=False)

#dati sanitari - colesterolo
class HDcholesterol(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    user = models.ForeignKey(user, on_delete=models.CASCADE)
    value = models.IntegerField(null=False)
##################################################################################################################################

class posology(models.Model):
    user = models.ForeignKey(user, on_delete=models.CASCADE)
