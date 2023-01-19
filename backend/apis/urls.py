from django.urls import path

from .views import ListUser, ListDoctor

urlpatterns = [
    path('user/', ListUser.as_view()),
    path('doc/', ListDoctor.as_view()),
    #path('<int:pk>/', EmailUser.as_view())
]