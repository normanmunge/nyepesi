from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User,Group
from .models import registerAgent
from .serializers import registerAgentSerializer

#Lists all agents or creates a new one
class registerAgentList(APIView):
    def get(self, request):
        agents = registerAgent.objects.all()
        serializer = registerAgentSerializer(agents, many=True)
        return Response(serializer.data)

    def post(self,request,format=None):
        #data=request.data['user']
        details=request.data

        #Create a user for the agent with a default password 'p@ssw0rd'
        agent=User.objects.create_user(username=details['phonenumber'],password='p@ssw0rd')

        #add the user to agents group
        g=Group.objects.get(name="agents")
        g.user_set.add(agent)

        #set the created user to link to agent profile with the created id
        details["details"]["user"]=agent.id

        #serialieze the agent details
        serializer=registerAgentSerializer(data=details['details'])
        if(serializer.is_valid()):
            #Create the teacher
            serializer.save()
            return Response(serializer.validated_data,status=status.HTTP_201_CREATED)
        else:
            agent.delete()
            return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)

    #What the post method expects in the request body
    def options(self,request,format=None):
        return Response({"username":"Phonenumber",
                         "details":{"Phonenumber":"2547..",
                                    "F_Name":"firstname",
                                    "L_Name":"lastname",
                                    "Email":"n@s.com",
                                    "County":"Nairobi",
                                    "Constituency":"nn",
                                    "Locality":"s"
                                    }
                         })
