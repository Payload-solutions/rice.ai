from django.db import models
from django.contrib.auth.models import (
    BaseUserManager,
    AbstractBaseUser,
    PermissionsMixin
)
from simple_history import HistoricalRecords

# Create your models here.



class UserManager():
    pass


class User(AbstractBaseUser, PermissionsMixin):
    username = models.CharField()
    email = models.CharField()
    name = models.CharField()
    last_name = models.CharField()
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    historical = HistoricalRecords()
