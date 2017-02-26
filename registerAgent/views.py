from django.http import HttpResponse

def index(request):
    return HttpResponse("<h1>This is a an agent page</h1>")
