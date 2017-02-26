from django.conf.urls import include, url
from django.contrib import admin


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^registeragent/', include('registerAgent.urls')),
    url(r'^registercustomer/', include('registerCustomer.urls')),
]
