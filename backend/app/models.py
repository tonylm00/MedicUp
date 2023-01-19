from django.db import models


 # 'paziente', specializzazione di utente, scelto il collasso verso il basso e chiamato user per semplicità
class User(models.Model):  
    email = models.EmailField(max_length=254, primary_key=True)
    pw = models.CharField(max_length=16)

    def __str__(self):
        return self.email

class Doctor(models.Model):  
    codice = models.IntegerField(primary_key=True)
    pw = models.CharField(max_length=16)

    def __str__(self):
        return self.codice

"""
#farmaci
class Medicine(models.Model):
    barcode = models.PositiveIntegerField(primary_key=True)
    commercial_name = models.CharField(max_length=20)

    def __str__(self):
        return self.barcode

#armadietto - utente 1,1
class Closet(models.Model): 
    id = models.PositiveIntegerField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    def __str__(self):
        return self.id

#armadietto contiene farmaci - n,m
class ClosetContains(models.Model):
    idCloset = models.ForeignKey(Closet, on_delete=models.CASCADE)
    medicine = models.ForeignKey(Medicine, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()
    type = models.CharField(max_length=10)    #pillola, compressa, dose endovena <3
    def __str__(self):
        return self.idCloset 

##################################################################################################################################
#utente - dati sanitari 1,n
#dati sanitari (health data) - pressione sanguigna
class HDblood(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    minvalue = models.IntegerField(null=False)
    maxvalue = models.IntegerField(null=False)
    def __str__(self):
        return self.id

#dati sanitari - peso
class HDweight(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    value = models.IntegerField(null=False)
    def __str__(self):
        return self.id

#dati sanitari - frequenza cardiaca
class HDheart(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    value = models.IntegerField(null=False)
    def __str__(self):
        return self.id

#dati sanitari - colesterolo
class HDcholesterol(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    value = models.IntegerField(null=False)
    def __str__(self):
        return self.id

class Posology(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    def __str__(self):
        return self.id
"""