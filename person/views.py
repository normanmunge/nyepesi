from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth.models import User
from registerAgent.serializers import registerAgentSerializer
from registerAgent.models import registerAgent

class personList(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request, format=None):
        user = self.request.user
        agent = registerAgent.objects.filter(User_id=user.id)
        if(agent.exists()):
            serializer = registerAgentSerializer(agent[0])
            return Response(serializer.data)
        elif user.is_superuser:
            return Response({"Super Admin"})
        else:
            return Response({"Undefined"})
