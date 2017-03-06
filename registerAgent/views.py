from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import registerAgent
from .serializers import registerAgentSerializer

#Lists all agents or creates a new one
class registerAgentList(APIView):
    def get(self, request):
        agents = registerAgent.objects.all()
        serializer = registerAgentSerializer(agents, many=True)
        return Response(serializer.data)

    def post(self):
        pass
