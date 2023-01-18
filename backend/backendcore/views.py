from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import CreateView
from frontend.flutterfrontend.lib import SignUpForm

# Sign Up View
class SignUpView(CreateView):
    form_class = SignUpForm
    success_url = reverse_lazy('login')
    template_name = 'frontend/flutterfrontend/lib/main.dart'
