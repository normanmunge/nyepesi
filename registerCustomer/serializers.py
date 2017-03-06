from rest_framework import serializers
from .models import registerCustomer

class registerCustomerSerializer(serializers.ModelSerializer):

    class Meta:
        model = registerCustomer
        fields = '__all__'
