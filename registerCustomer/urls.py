from django.conf.urls import url
from . import views

urlpatterns = [
    #default page
    url(r'^$', views.index, name='index'),
]
