from django.shortcuts import get_object_or_404,render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User,Group
from .models import registerAgent
from .serializers import registerAgentSerializer,UserSerializer
#from africastalking.AfricasTalkingGateway import (AfricasTalkingGateway, AfricasTalkingGatewayException)
from .AfricasTalkingGateway import AfricasTalkingGateway,AfricasTalkingGatewayException




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
            self.sendSMS('254'+details['Phonenumber'],details['F_Name'],details['L_Name'])
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

    def sendSMS(self,phonenumber,f_name,l_name):
        # Specify your login credentials
        username = "Nyepesi"
        apikey   = "0b7e1db47d7a2afb61bf9a5212f7243831764707d78396a372a6fd018f3db85e"

        # Please ensure you include the country code (+254 for Kenya in this case)
        to      = phonenumber
        message = "Dear "+f_name+" "+ l_name+ ", welcome to NYEPESI, your reliable and trusted partner to send your goods fast. You are now an agent"

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

class registerAgentDetail(APIView):
    """
    Retrieve, update or delete a user instance.
    """
    def get_object(self, pk):
        try:
            return registerAgent.objects.get(pk=pk)
        except registerAgent.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        agent = self.get_object(pk)
        agent = registerAgentSerializer(agent)
        return Response(agent.data)

    def put(self, request, pk, format=None):
        agent = self.get_object(pk)
        serializer = registerAgentSerializer(agent, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        agent = self.get_object(pk)
        agent.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
