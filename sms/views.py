from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import sendSMS
import json
from json import dumps, loads


#import africastalking helper gateway class
#from africastalking.AfricasTalkingGateway import (AfricasTalkingGateway, AfricasTalkingGatewayException)
#from lib import AfricasTalkingGateway

class smsList(APIView):
    def post(self,request,format=None):
        print(request.data)
        serializer = sendSMS(json.dumps(self,request.data.get))
        if serializer.sendSMS:
            return Response(serializer, status=status.HTTP_201_CREATED)
        return Response(status=status.HTTP_400_BAD_REQUEST)
