from django.conf import settings


def misc(request):
    return {
        'JS_DEBUG': settings.JS_DEBUG if hasattr(settings, 'JS_DEBUG') else False,
    }
