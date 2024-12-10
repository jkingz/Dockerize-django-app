from django.shortcuts import render, redirect

from .tasks import count_task
# Create your views here.

def home(request):
    return render(request, 'home.html')

def count_to_10(request):
    count_task.delay()
    return redirect('home')