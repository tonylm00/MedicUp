from django.urls import path

from .views import ListUser, ListFarmaco

urlpatterns = [
    path('user/', ListUser.as_view()),
    path('farmaco/', ListFarmaco.as_view()),
    #path('<int:pk>/', EmailUser.as_view())
]