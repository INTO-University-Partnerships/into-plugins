from django.conf import settings
from django.contrib.auth.views import login
from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.i18n import javascript_catalog
from django.views.static import serve

from django_js_reverse.views import urls_js

from vle.views import full_sync_view

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^o/', include('into_oauth.urls', namespace='oauth2_provider')),
    url(r'^accounts/login/$', login, {'template_name': 'admin/login.html'}),
    url(r'^accounts/', include('django.contrib.auth.urls')),
    url(r'^jsreverse/$', urls_js, name='js_reverse'),
    url(r'^jsi18n/$', javascript_catalog, name='js_i18n'),
    url(r'^messaging/', include('messaging.urls_json_api', namespace='messaging_api')),
    url(r'^vle/', include('vle.urls_json_api', namespace='vle_api')),
    url(r'^full_sync/', full_sync_view),
    url(r'^', include('cms.urls')),
]

# Runserver patterns
if settings.DEBUG:
    urlpatterns = [
        url(
            r'^media/(?P<path>.*)$',
            serve,
            {
                'document_root': settings.MEDIA_ROOT,
                'show_indexes': True
            }
        ),
    ] + staticfiles_urlpatterns() + urlpatterns
