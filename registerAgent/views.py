from django.shortcuts import get_object_or_404,render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User,Group
from .models import registerAgent
from .serializers import registerAgentSerializer,UserSerializer



#Lists all agents or creates a new one
class registerAgentList(APIView):
    def get(self, request,format=None):
        agents = registerAgent.objects.all()
        serializer = registerAgentSerializer(agents, many=True)
        return Response(serializer.data)


    def post(self,request,format=None):
        #data=request.data['user']
        details=request.data
        #details["cleanings"]=0

    #Create a user for the agent with a default password 'p@ssw0rd'
        try:
            agent=User.objects.create_user(username=details['Phonenumber'],password='p@ssw0rd')
        except Exception as inst:
            return Response(data=inst,status=status.HTTP_400_BAD_REQUEST)

        #add the user to agents group
        g=Group.objects.get(name="agents")
        g.user_set.add(agent)

        #set the created user to link to agent profile with the created id
        mutable = details._mutable
        details._mutable = True
        details["User"]=agent.id
        details._mutable = mutable
        print agent.id
        #serialize the agent details
        serializer=registerAgentSerializer(data=details)

        if(serializer.is_valid()):
            #Create the teacher
            dev = serializer.save()
            ser = registerAgentSerializer(dev)
            return Response(ser.data,status=status.HTTP_201_CREATED)
        else:
            print serializer.errors
            # /agent.delete()
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
