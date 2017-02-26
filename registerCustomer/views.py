from django.http import HttpResponse

def index(request):
    return HttpResponse("<h1>This is a a customer page</h1>")
