from django.shortcuts import render
from rest_framework import generics

# Create your views here.
from app import models
from .serializers import UserSerializer, DoctoreSerializer

#visualizzione ad elenco di tutti gli utenti
class ListUser(generics.ListCreateAPIView):
    queryset=models.User.objects.all()
    serializer_class=UserSerializer
'''
class EmailUser(generics.RetrieveUpdateDestroyAPIView):
    queryset=models.User.objects.all()
    serializer_class=UserSerializer
'''
class ListDoctor(generics.ListCreateAPIView):
    queryset=models.Doctor.objects.all()
    serializer_class=DoctoreSerializer