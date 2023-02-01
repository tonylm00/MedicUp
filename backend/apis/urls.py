from django.urls import path

from .views import RegistrazionePazienteView, LoginPazienteView, ElencoFarmaciView, DettaglioFarmacoView

urlpatterns = [
    path('registrazione/paziente', RegistrazionePazienteView.as_view(), name="Registrazione di un utente", kwargs={'methods': ['post']}),
    path('login/paziente', LoginPazienteView.as_view(), name="Login di un utente"),
    path('farmaco/', ElencoFarmaciView.as_view(), name="Elenco dei farmaci"),
    path('farmaco/<int:pk>/', DettaglioFarmacoView.as_view(), name="Visualizza Farmaco"),
]