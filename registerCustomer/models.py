from django.db import models


class registerCustomer(models.Model):
    F_Name = models.CharField(max_length = 250)
    L_Name = models.CharField(max_length = 250)
    Phonenumber = models.IntegerField(default=0)

    def __str__(self):
        return self.F_Name+' '+self.L_Name
