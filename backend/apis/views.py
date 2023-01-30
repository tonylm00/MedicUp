from django.shortcuts import render
from rest_framework import generics

# Create your views here.
from app import models
from .serializers import UserSerializer, FarmacoSerializer

#visualizzione ad elenco di tutti gli utenti
class ListUser(generics.ListCreateAPIView):
    queryset=models.User.objects.all()
    serializer_class=UserSerializer

#visualizzione di tutti i farmaci / di uno specifico
class ListFarmaco(generics.ListCreateAPIView):
    serializer_class=FarmacoSerializer
    def get_queryset(self):
        queryset=models.Farmaco.objects.all()
        nome = self.request.query_params.get('nome')
        if nome is not None:
            queryset = queryset.filter(farmaco__nome=nome)
        return queryset


