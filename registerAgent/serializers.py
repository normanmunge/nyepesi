from rest_framework import serializers
from .models import registerAgent


class registerAgentSerializer(serializers.ModelSerializer):

    class Meta:
        model = registerAgent
        fields = '__all__'
