from rest_framework import serializers
from django.contrib.auth.models import User

class PersonSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=('username','id','is_superuser')
