from django.conf.urls import url, include
from django.contrib.auth.models import User, Group
from django.contrib import admin
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework import permissions, routers, serializers, viewsets
from oauth2_provider.ext.rest_framework import TokenHasReadWriteScope, TokenHasScope
from registerAgent.views import registerAgentList
from registerCustomer.views import registerCustomerList


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^agents/', registerAgentList.as_view(),name="agent-list-create"),
    url(r'^customers/', registerCustomerList.as_view(),name="customer-list-create"),
    url(r'^o/', include('oauth2_provider.urls', namespace='oauth2_provider')),
]

urlpatterns = format_suffix_patterns(urlpatterns)
