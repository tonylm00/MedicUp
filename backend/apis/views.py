from django.shortcuts import render
from rest_framework import generics, permissions
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from app.models import Paziente, Farmaco
from .serializers import FarmacoSerializer, PazienteSerializer
from django.contrib.auth import authenticate

#registrazione paziente
class RegistrazionePazienteView(generics.CreateAPIView):
    serializer_class = PazienteSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            "user": PazienteSerializer(user, context=self.get_serializer_context()).data,
            "token": token.key
        })

#login paziente
class LoginPazienteView(generics.GenericAPIView):
    serializer_class = PazienteSerializer

    permission_classes = (permissions.AllowAny,)

    def post(self, request, *args, **kwargs):
        username = request.data.get("username")
        password = request.data.get("password")
        user = Paziente.objects.filter(username=username, password=password).first()
        if user:
            token, _ = Token.objects.get_or_create(user=user)
            return Response({
                "token": token.key
            })
        else:
            return Response({"error": "Invalid credentials"}, status=400)
        

#visualizzione di tutti i farmaci
class ElencoFarmaciView(generics.ListCreateAPIView):
    queryset=Farmaco.objects.all()
    serializer_class=FarmacoSerializer
    
#visualizzione di un farmaco
class DettaglioFarmacoView(generics.RetrieveAPIView):
    queryset=Farmaco.objects.all()
    serializer_class=FarmacoSerializer
