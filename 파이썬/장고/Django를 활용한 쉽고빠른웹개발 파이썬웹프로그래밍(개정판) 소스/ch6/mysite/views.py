from django.views.generic import TemplateView


#--- TemplateView
class HomeView(TemplateView):
    template_name = 'home.html'

