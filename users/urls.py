from django.urls import path
from rest_framework  import routers


from users.views import *

router = routers.DefaultRouter()
router.register(r'users', UsersViewSet)