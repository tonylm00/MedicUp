from django.db import models
from django.utils.translation import gettext_lazy as _

class Patient(models.Model):
    cf = models.CharField(max_length=16, unique=True)
    data_nascita = models.CharField(max_length=10)
    email = models.EmailField(unique=True)
    nome = models.CharField(max_length=30, blank=True)
    cognome = models.CharField(max_length=150, blank=True)
    password = models.CharField(null=False, max_length=64)

class Doctor(models.Model):
    fnomceo = models.CharField(max_length=7)
    email = models.EmailField(unique=True)
    nome = models.CharField(max_length=30, blank=True)
    cognome = models.CharField(max_length=150, blank=True)
    password = models.CharField(null=False, max_length=64)

#farmaci
class Farmaco(models.Model):
    nome = models.CharField(max_length=20, unique=True)
    principio = models.CharField(max_length=30)
    descrizioneBugiardino = models.TextField()
    descrizioneRCP = models.TextField()
    precauzioniBugiardino = models.TextField()
    precauzioniRCP = models.TextField()
    posologiaBugiardino = models.TextField()
    posologiaRCP = models.TextField()
    controindicazioniBugiardino = models.TextField()
    controindicazioniRCP = models.TextField()
    informazioniBugiardino = models.TextField()
    informazioniRCP = models.TextField()


    def __str__(self):
        return self.nome

class FarmacoInArmadietto(models.Model):
    paziente = models.ForeignKey(Patient, on_delete=models.CASCADE) #paziente
    farmaco = models.ForeignKey(Farmaco, on_delete=models.CASCADE) #farmaco
    scadenza = models.CharField(max_length=10)
    quantity = models.PositiveIntegerField()
    type = models.CharField(max_length=50)

#promemoria
class Promemoria(models.Model):
    paziente = models.ForeignKey(Patient, on_delete=models.CASCADE)
    dottore = models.ForeignKey(Doctor, on_delete=models.SET_NULL, null=True, blank=True)
    nome = models.TextField(null=False)
    descrizione = models.TextField(null=True)

#memorizza le ore di un promemoria in un giorno specifico
class PromemoriaSchedule(models.Model):
    promemoria = models.ForeignKey(Promemoria, on_delete=models.CASCADE)
    giorno = models.CharField(max_length=10)
    orario = models.CharField(max_length=8)

'''
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