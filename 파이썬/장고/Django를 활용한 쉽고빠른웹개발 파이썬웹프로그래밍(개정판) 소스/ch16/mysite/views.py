from django.views.generic import TemplateView
from django.views.generic import CreateView 
from django.contrib.auth.forms import UserCreationForm 
from django.urls import reverse_lazy

from django.contrib.auth.mixins import AccessMixin
from django.views.defaults import permission_denied


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


class OwnerOnlyMixin(AccessMixin):
    raise_exception = True
    permission_denied_message = "Owner only can update/delete the object"

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        if self.request.user != self.object.owner:
            self.handle_no_permission()
        return super().get(request, *args, **kwargs)

