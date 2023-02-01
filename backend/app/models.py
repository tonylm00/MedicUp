from django.contrib.auth.models import AbstractUser, Group, Permission
from django.db import models


class Paziente(AbstractUser):
    groups = models.ManyToManyField(
        Group,
        related_name='paziente_groups',
        blank=True,
        help_text=(
            'The groups this user belongs to. A user will get all permissions '
            'granted to each of their groups.'
        ),
        related_query_name='paziente',
        )
    user_permissions = models.ManyToManyField(
        Permission,
        related_name='paziente_user_permissions',
        blank=True,
        help_text='Specific permissions for this user.',
        related_query_name='paziente',
    )
    
class Doctor(models.Model):  
    codice = models.IntegerField(primary_key=True)
    pw = models.CharField(max_length=16)
    def __str__(self):
        return self.codice

class PrincipioAttivo(models.Model):
    nome = models.CharField(max_length=20, primary_key=True)
    def __str__(self):
        return self.nome

#farmaci
class Farmaco(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    nome = models.CharField(max_length=20)
    principio = models.ForeignKey(PrincipioAttivo, on_delete=models.CASCADE)
    precauzioni = models.CharField(max_length=500)
    controindicazioni = models.CharField(max_length=500)
    posologia = models.CharField(max_length=500)
    def __str__(self):
        return self.nome

'''
class Promemoria(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    inizio = models.DateField
    fine = models.DateField
    ora = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    def __str__(self):
        return self.id

class Posologia(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    paziente = models.ForeignKey(Paziente, on_delete=models.CASCADE)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    def __str__(self):
        return self.id

class Reminder(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    posologia = models.ForeignKey(Posologia, on_delete=models.CASCADE)
    promemoria = models.ForeignKey(Promemoria, on_delete=models.CASCADE)
    def __str__(self):
        return self.id

#armadietto - utente 1,1
class Armadio(models.Model): 
    id = models.PositiveIntegerField(primary_key=True)
    paziente = models.ForeignKey(Paziente, on_delete=models.CASCADE)
    def __str__(self):
        return self.id

#armadietto contiene farmaci - n,m
class ArmadioContiene(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    armadio = models.ForeignKey(Armadio, on_delete=models.CASCADE)
    farmaco = models.TextField(max_length=20)
    scadenza = models.DateField()
    quantita = models.PositiveIntegerField()
    tipo = models.CharField(max_length=10)    #pillola, compressa, dose endovena <3
    def __str__(self):
        return self.id 

#utente - dati sanitari 1,n
#dati sanitari (health data) - pressione sanguigna
class DSpressione(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    paziente = models.ForeignKey(Paziente, on_delete=models.CASCADE)
    minvalue = models.IntegerField(null=False)
    maxvalue = models.IntegerField(null=False)
    def __str__(self):
        return self.id

#dati sanitari - peso
class DSpeso(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    paziente = models.ForeignKey(Paziente, on_delete=models.CASCADE)
    peso = models.IntegerField(null=False)
    def __str__(self):
        return self.id

#dati sanitari - frequenza cardiaca
class DSbpm(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    paziente = models.ForeignKey(Paziente, on_delete=models.CASCADE)
    valore = models.IntegerField(null=False)
    def __str__(self):
        return self.id

#dati sanitari - colesterolo
class DScolesterolo(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField(null=False)
    paziente = models.ForeignKey(Paziente, on_delete=models.CASCADE)
    valore = models.IntegerField(null=False)
    def __str__(self):
        return self.id
'''