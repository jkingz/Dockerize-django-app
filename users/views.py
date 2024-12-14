from django.shortcuts import render, redirect
from rest_framework import viewsets

from users.models import UserAccount
from users.serializers import UsersSerializer


class UsersViewSet(viewsets.ModelViewSet):
    queryset = UserAccount.objects.all()
    serializer_class = UsersSerializer