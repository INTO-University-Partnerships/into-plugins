from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.i18n import javascript_catalog

from django_js_reverse.views import urls_js

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^o/', include('into_oauth.urls', namespace='oauth2_provider')),
    url(r'^accounts/login/$', 'django.contrib.auth.views.login', {'template_name': 'admin/login.html'}),
    url(r'^accounts/', include('django.contrib.auth.urls')),
    url(r'^jsreverse/$', urls_js, name='js_reverse'),
    url(r'^jsi18n/$', javascript_catalog, name='js_i18n'),
    url(r'^messaging/', include('messaging.urls_json_api', namespace='messaging_api')),
    url(r'^vle/', include('vle.urls_json_api', namespace='vle_api')),
    url(r'^full_sync/', 'vle.views.full_sync_view'),
    url(r'^', include('cms.urls')),
]

# Runserver patterns
if settings.DEBUG:
    urlpatterns = [
        url(
            r'^media/(?P<path>.*)$',
            'django.views.static.serve',
            {
                'document_root': settings.MEDIA_ROOT,
                'show_indexes': True
            }
        ),
    ] + staticfiles_urlpatterns() + urlpatterns
