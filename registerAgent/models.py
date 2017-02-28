from django.db import models


class registerAgent(models.Model):
    F_Name = models.CharField(max_length = 250)
    L_Name = models.CharField(max_length = 250)
    Phonenumber = models.CharField(max_length = 250)
    Email = models.CharField(max_length = 250)
    County = models.CharField(max_length = 250)
    Constituency = models.CharField(max_length = 250)
    Locality = models.CharField(max_length = 250)
    isActive = models.CharField(max_length = 250)
    regDate = models.CharField(max_length = 250)
