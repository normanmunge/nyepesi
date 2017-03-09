from rest_framework import serializers
from .models import registerAgent
from django.contrib.auth.models import User
class registerAgentSerializer(serializers.ModelSerializer):

    class Meta:
        model = registerAgent
        fields = '__all__'

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=('username','id')
