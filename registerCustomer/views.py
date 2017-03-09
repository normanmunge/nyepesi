from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import registerCustomer
from .serializers import registerCustomerSerializer

#Lists all customers or creates a new one
class registerCustomerList(APIView):
    def get(self, request,format=None):
        customers = registerCustomer.objects.all()
        serializer = registerCustomerSerializer(customers, many=True)
        return Response(serializer.data)

    def post(self,request,format=None):
        serializer = registerCustomerSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    #What the post method expects in the request body
    def options(self,request,format=None):
        return Response({"F_Name": "n",
                        "L_Name": "L",
                        "Phonenumber":"90.."
                         })

class registerCustomerDetail(APIView):
    """
    Retrieve, update or delete a user instance.
    """
    def get_object(self, pk):
        try:
            return registerCustomer.objects.get(pk=pk)
        except registerCustomer.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        customer = self.get_object(pk)
        customer = registerCustomerSerializer(customer)
        return Response(customer.data)

    def put(self, request, pk, format=None):
        customer = self.get_object(pk)
        serializer = registerCustomerSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        customer = self.get_object(pk)
        customer.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
