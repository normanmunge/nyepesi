from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import registerCustomer
from .serializers import registerCustomerSerializer
from .AfricasTalkingGateway import AfricasTalkingGateway,AfricasTalkingGatewayException

#Lists all customers or creates a new one
class registerCustomerList(APIView):
    def get(self, request,format=None):
        customers = registerCustomer.objects.all()
        serializer = registerCustomerSerializer(customers, many=True)
        return Response(serializer.data)

    def post(self,request,format=None):
        details=request.data
        serializer = registerCustomerSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            self.sendSMS('254'+details['Phonenumber'],details['F_Name'],details['L_Name'])
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    #What the post method expects in the request body
    def options(self,request,format=None):
        return Response({"F_Name": "n",
                        "L_Name": "L",
                        "Phonenumber":"90.."
                         })

    def sendSMS(self,phonenumber,f_name,l_name):
        # Specify your login credentials
        username = "Nyepesi"
        apikey   = "0b7e1db47d7a2afb61bf9a5212f7243831764707d78396a372a6fd018f3db85e"

        # Please ensure you include the country code (+254 for Kenya in this case)
        to      = phonenumber
        message = "Dear "+f_name+" "+ l_name+ ", welcome to NYEPESI, your reliable and trusted partner to send your goods fast. Happy to stay in touch"

        # Create a new instance of our awesome gateway class
        gateway = AfricasTalkingGateway(username, apikey)

        try:
            # Thats it, hit send and we'll take care of the rest.

            results = gateway.sendMessage(to, message)

            for recipient in results:
                # status is either "Success" or "error message"
                print 'number=%s;status=%s;messageId=%s;cost=%s' %(recipient['number'],
                                                                recipient['status'],
                                                                recipient['messageId'],
                                                                recipient['cost'])
        except AfricasTalkingGatewayException, e:
            print 'Encountered an error while sending: %s' % str(e)


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
        serializer = registerCustomerSerializer(customer, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        customer = self.get_object(pk)
        customer.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
