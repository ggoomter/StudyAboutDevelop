from django.views.generic import TemplateView
from django.views.generic import CreateView 
from django.contrib.auth.forms import UserCreationForm 
from django.urls import reverse_lazy


#--- Homepage
class HomeView(TemplateView):
    template_name = 'home.html'


#--- User Creation
class UserCreateView(CreateView): 
    template_name = 'registration/register.html' 
    form_class = UserCreationForm 
    success_url = reverse_lazy('register_done') 


class UserCreateDoneTV(TemplateView): 
    template_name = 'registration/register_done.html'

