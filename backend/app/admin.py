from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

# Register your models here.
from .models import Patient, Doctor


admin.site.register(Patient)
admin.site.register(Doctor)