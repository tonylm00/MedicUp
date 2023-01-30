from django.shortcuts import render
from rest_framework import generics

# Create your views here.
from app import models
from .serializers import UserSerializer, FarmacoSerializer

#visualizzione ad elenco di tutti gli utenti
class ListUser(generics.ListCreateAPIView):
    queryset=models.User.objects.all()
    serializer_class=UserSerializer

#visualizzione di tutti i farmaci
class ListFarmaco(generics.ListCreateAPIView):
    queryset=models.Farmaco.objects.all()
    serializer_class=FarmacoSerializer

#visualizzione di un farmaco
class SingleFarmaco(generics.CreateAPIView):
    serializer_class=FarmacoSerializer
    def get_queryset(self):
        queryset=models.Farmaco.objects.all()
        par = self.request.query_params.get('id')
        if par is not None:
            queryset = queryset.filter(farmaco__id=par)
        return queryset


