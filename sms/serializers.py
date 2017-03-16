from rest_framework import serializers
from json import dumps, loads
from .AfricasTalkingGateway import AfricasTalkingGateway,AfricasTalkingGatewayException


#class smsSerializer(AfricasTalkingGateway):
class sendSMS:
    def __init__(self,Name,Phonenumber):
        self.Name = Name
        self.Phonenumber = Phonenumber


    def sendSMS(self):
        # Specify your login credentials
        username = "normanmunge"
        apikey   = "e99917d095881a6a3400380d124ef051e3383c51480e078ef9c1f9778badeca1"

        # Please ensure you include the country code (+254 for Kenya in this case)
        to      = self.Phonenumber

        message = "Dear agent, welcome to NYEPESI, your reliable and trusted partner to send your goods fast. Happy to stay in touch"

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
