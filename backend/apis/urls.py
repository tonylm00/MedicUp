from django.urls import path
from .views import PatientList, PatientDetail, PatientRegistration, DoctorRegistration, DoctorList, DoctorDetail, LoginView, ElencoFarmaciView, DettaglioFarmacoView, ReminderCreateView, DoctorReminderListView, PatientReminderListView, AggiungiFarmacoArmadiettoView, ArmadiettoView

urlpatterns = [
    path('farmaco/', ElencoFarmaciView.as_view(), name="Elenco dei farmaci"),
    path('farmaco/<int:pk>/', DettaglioFarmacoView.as_view(), name="Visualizza Farmaco"),

    path('paziente/', PatientList.as_view(), name='patient-list'),
    path('paziente/<int:pk>/', PatientDetail.as_view(), name='patient-detail'),
    path('paziente/registration/', PatientRegistration.as_view(), name='patient-detail'),

    path('dottore/', DoctorList.as_view(), name='doctor-list'),
    path('dottore/<int:pk>/', DoctorDetail.as_view(), name='doctor-detail'),
    path('dottore/registration/', DoctorRegistration.as_view(), name='patient-detail'),

    path('login/', LoginView.as_view(), name='login'),

    path('reminders/', ReminderCreateView.as_view(), name='reminders'),
    path('doctors/reminders/', DoctorReminderListView.as_view(), name='doctor_reminders'),
    path('patients/reminders/', PatientReminderListView.as_view(), name='patient_reminders'),

    path('armadietto/', ArmadiettoView.as_view(), name='arm'),
    path('armadietto/aggiungifarmaco/', AggiungiFarmacoArmadiettoView.as_view(), name='add_med_to_arm'),

]