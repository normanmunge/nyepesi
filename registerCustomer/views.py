from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import registerCustomer
from .serializers import registerCustomerSerializer

#Lists all customers or creates a new one
class registerCustomerList(APIView):
    def get(self, request):
        customers = registerCustomer.objects.all()
        serializer = registerCustomerSerializer(customers, many=True)
        return Response(serializer.data)

    def post(self):
        pass
