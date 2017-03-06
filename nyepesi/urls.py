from django.conf.urls import url
from django.contrib import admin
from rest_framework.urlpatterns import format_suffix_patterns
from registerAgent.views import registerAgentList
from registerCustomer.views import registerCustomerList

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^agents/', registerAgentList.as_view(),name="agent-list-create"),
    url(r'^customers/', registerCustomerList.as_view(),name="customer-list-create"),
]

urlpatterns = format_suffix_patterns(urlpatterns)
