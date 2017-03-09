from django.db import models
from django.contrib.auth.models import User


class registerAgent(models.Model):
    F_Name = models.CharField(max_length = 250)
    L_Name = models.CharField(max_length = 250)
    User = models.OneToOneField(User,on_delete=models.CASCADE)
    Phonenumber = models.IntegerField(default=0)
    Email = models.CharField(max_length = 250)
    County = models.CharField(max_length = 250)
    Constituency = models.CharField(max_length = 250)
    Locality = models.CharField(max_length = 250)

    def __str__(self):
        return self.F_Name+' '+self.L_Name
