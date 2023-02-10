from django.urls import path
from .views import FarmacoSearchNomeView, FarmacoSearchPrincipioView,PatientList, PatientDetail, PatientRegistration, DoctorRegistration, DoctorList, DoctorDetail, DoctorLoginView, PatientLoginView, ElencoFarmaciView, DettaglioFarmacoView, ArmadiettoView, AggiungiFarmacoArmadiettoView

urlpatterns = [
    path('farmaco/', ElencoFarmaciView.as_view(), name="Elenco dei farmaci"),
    path('farmaco/<int:pk>/', DettaglioFarmacoView.as_view(), name="Visualizza Farmaco"),
    path('farmaco/cerca/nome/', FarmacoSearchNomeView.as_view(), name="Ricerca Farmaco per Nome"),
    path('farmaco/cerca/principio/', FarmacoSearchPrincipioView.as_view(), name="Ricerca Farmaco per Nome"),


    path('paziente/', PatientList.as_view(), name='patient-list'),
    path('paziente/<int:pk>/', PatientDetail.as_view(), name='patient-detail'),
    path('paziente/registration/', PatientRegistration.as_view(), name='patient-detail'),

    path('dottore/', DoctorList.as_view(), name='doctor-list'),
    path('dottore/<int:pk>/', DoctorDetail.as_view(), name='doctor-detail'),
    path('dottore/registration/', DoctorRegistration.as_view(), name='patient-detail'),

    path('paziente/login/', PatientLoginView.as_view(), name='login paziente'),
    path('dottore/login/', DoctorLoginView.as_view(), name='login medico'),

    #path('reminders/', ReminderCreateView.as_view(), name='reminders'),
    #path('doctors/reminders/', DoctorReminderListView.as_view(), name='doctor_reminders'),
    #path('patients/reminders/', PatientReminderListView.as_view(), name='patient_reminders'),

    path('armadietto/', ArmadiettoView.as_view(), name='arm'),
    path('armadietto/aggiungifarmaco/', AggiungiFarmacoArmadiettoView.as_view(), name='add_med_to_arm'),

]