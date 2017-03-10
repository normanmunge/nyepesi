'''
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .sendsms import sendSMS
from .serializers import smsSerializer


#Lists all customers or creates a new one
class smsList(APIView):
    url =  /api/sms/dlr
    def post(self,url,format=None):
        serializer = smsSerializer(data=self.dlr_callback())
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def dlr_callback(self):
        # Reads the variables sent via POST from our gateway
        _from = request.values.get('from', None)
        to = request.values.get('to', None)
        text = request.values.get('text', None)
        date = request.values.get('date', None)
        id_ = request.values.get('id', None)

        try:
            # update db or some sort of operation
            logging.info(_from, to, text, date, id_)

        except Exception as e:
            logging.error('Failed with - ', e)

        resp = make_response('Ok', 200)
        resp.headers['Content-Type'] = 'text/plain'
        resp.cache_control.no_cache = True
        return resp
'''
