from django.sortcuts import render, HttpResponse
import random

# Create your views here.
def index(reques):
	return HttpResponse('<h1>Random</h1>'+str(random.random())

def create(request):
	return HttpResponse('Create')

def read(request, id):
	return HttpResponse('Read!'+id)
