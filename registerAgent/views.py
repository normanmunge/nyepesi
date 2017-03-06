from django.http import HttpResponse
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from django.contrib.auth import authenticate,login
from django.views import generic
from django.views.generic import View
from .models import registerAgent
from .forms import AgentForm

def index(request):
    return HttpResponse("<h1>This is a an agent page</h1>")


class AgentCreate(CreateView):
    model = registerAgent
    fields = ["F_Name", "L_Name", "Phonenumber","Email","County","Constituency","Locality"]

class AgentUpdate(UpdateView):
    model = registerAgent
    fields = ["F_Name", "L_Name", "Phonenumber","Email","County","Constituency","Locality"]

class AgentDelete(DeleteView):
    model = registerAgent

class UserFormView(View):
    form_class = AgentForm

    #process form data
    def post(self, request):
        form = self.form_class(request.POST)

        if form.is_valid():
            user = form.save(commit= False)
            #cleaned (normalized) data
            phonenumber = form.cleaned_data['email']
            password = form.cleaned_data['password']
            user.set_password(password)
            user.save()

            #return user object if credentials are correct
            user = authenticate(email=email, password=password)

            if user is not None:

                if user.is_active:
                    login(request, user)

        return HttpResponse("<h1>Not logged in</h1>")

    def get(self, request):
        pass
