from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, Group, Permission
from django.utils import timezone
from django.utils.translation import gettext_lazy as _

class User(AbstractBaseUser, PermissionsMixin):
    groups = models.ManyToManyField(
        Group,
        related_name='custom_groups',
        blank=True,
        help_text=(
            'The groups this user belongs to. A user will get all permissions '
            'granted to each of their groups.'
        ),
        related_query_name='user',
    )
    user_permissions = models.ManyToManyField(
        Permission,
        related_name='custom_user_permissions',
        blank=True,
        help_text='Specific permissions for this user.',
        related_query_name='user',
    )
    email = models.EmailField(_('email address'), unique=True)
    first_name = models.CharField(_('first name'), max_length=30, blank=True)
    last_name = models.CharField(_('last name'), max_length=150, blank=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')
        
    def __str__(self):
        return self.email

class Patient(User):
    cf = models.CharField(max_length=16)

class Doctor(User):
    codefnomceo = models.CharField(max_length=20)

class PrincipioAttivo(models.Model):
    nome = models.CharField(max_length=20, primary_key=True)
    def __str__(self):
        return self.nome

#farmaci
class Farmaco(models.Model):
    nome = models.CharField(max_length=20)
    principio = models.ForeignKey(PrincipioAttivo, on_delete=models.CASCADE)
    precauzioni = models.CharField(max_length=500)
    controindicazioni = models.CharField(max_length=500)
    posologia = models.CharField(max_length=500)
    def __str__(self):
        return self.nome

class FarmacoInArmadietto(models.Model):
    farmaco = models.ForeignKey(Farmaco, on_delete=models.CASCADE, related_name='patient_medicines')
    patient = models.ForeignKey(User, on_delete=models.CASCADE, related_name='patient_medicines')
    scadenza = models.DateField()
    quantity = models.PositiveIntegerField()
    type = models.CharField(max_length=50)


class Reminder(models.Model):
    DAYS_OF_WEEK = [
        (0, 'Lunedì'),
        (1, 'Martedì'),
        (2, 'Mercoledì'),
        (3, 'Giovedì'),
        (4, 'Venerdì'),
        (5, 'Sabato'),
        (6, 'Domenica'),
    ]

    patient = models.ForeignKey(User, on_delete=models.CASCADE, related_name='reminders')
    doctor = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='shared_reminders', null=True, blank=True)
    is_visible = models.BooleanField(default=False)
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.text

#memorizza le ore di un promemoria in un giorno specifico
class ReminderHour(models.Model):
    reminder = models.ForeignKey(Reminder, on_delete=models.CASCADE, related_name='hours')
    day_of_week = models.PositiveSmallIntegerField(choices=Reminder.DAYS_OF_WEEK)
    hour = models.TimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.reminder} - {self.day_of_week} {self.hour}'


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