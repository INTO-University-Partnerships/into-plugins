from unipath import Path


BASE_DIR = Path(__file__).ancestor(2)

gettext = lambda s: s

WWWROOT = 'http://10.0.0.10:8000'

MOODLEWWWROOT = 'http://10.0.0.10'

SECRET_KEY = 'top-secret'

NOTIFICATION_BASIC_AUTH = ('plugins', 'W0mb4t666!')

VLE_SYNC_BASIC_AUTH = ('plugins', 'W0mb4t666!')

DEBUG = True

ANGULARJS_DEBUG = False

JS_DEBUG = True

ALLOWED_HOSTS = ['10.0.0.10', '10.0.0.10:8000', 'localhost']

MEDIA_ROOT = BASE_DIR.child('mediafiles')

STATIC_ROOT = BASE_DIR.child('staticfiles')

MESSAGE_ATTACHMENT_ROOT = BASE_DIR.child('attachmentfiles')

INSTALLED_APPS = (
    'djangocms_admin_style',
    'djangocms_text_ckeditor',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'cms',
    'mptt',
    'treebeard',
    'menus',
    'sekizai',
    'djangocms_style',
    'reversion',
    'django_js_reverse',
    'django_cron',
    'oauth2_provider',
    'into_oauth',
    'vle',
    'messaging',
)

MIDDLEWARE_CLASSES = (
    'cms.middleware.utils.ApphookReloadMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.toolbar.ToolbarMiddleware',
    'cms.middleware.language.LanguageCookieMiddleware',
    'oauth2_provider.middleware.OAuth2TokenMiddleware',
)

ROOT_URLCONF = 'plugins.urls'

TEMPLATES = [{
    'BACKEND': 'django.template.backends.django.DjangoTemplates',
    'OPTIONS': {
        'context_processors': [
            'django.template.context_processors.debug',
            'django.template.context_processors.request',
            'django.contrib.auth.context_processors.auth',
            'django.contrib.messages.context_processors.messages',
            'sekizai.context_processors.sekizai',
            'django.core.context_processors.static',
            'cms.context_processors.cms_settings',
            'plugins.context_processors.misc',
        ],
        'loaders': [
            'django.template.loaders.filesystem.Loader',
            'django.template.loaders.app_directories.Loader',
            'django.template.loaders.eggs.Loader',
        ],
        'debug': False,
    },
    'DIRS': [
        BASE_DIR.child('templates'),
    ]
}]

WSGI_APPLICATION = 'plugins.wsgi.application'

SITE_ID = 1

DATABASES = {
    'default': {
        # 'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'ENGINE': 'django.db.backends.mysql',
        'NAME': u'plugins_django',
        'HOST': u'localhost',
        # 'PORT': 5432,
        # 'USER': u'postgres',
        'USER': u'root',
        'PASSWORD': u'W0mb4t666!',
    }
}

LANGUAGE_CODE = 'en'

CRON_CLASSES = [
    'vle.cron.FullSync',
]

LANGUAGES = (
    ('en', gettext('en')),
)

CMS_LANGUAGES = {
    'default': {
        'public': True,
        'hide_untranslated': False,
        'redirect_on_fallback': True,
    },
    1: [
        {
            'public': True,
            'code': 'en',
            'hide_untranslated': False,
            'name': gettext('en'),
            'redirect_on_fallback': True,
        },
    ],
}

CMS_TEMPLATES = (
    ('page.html', 'Page'),
)

CMS_PERMISSION = True

CMS_PLACEHOLDER_CONF = {}

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

MEDIA_URL = '/media/'

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    BASE_DIR.child('static'),
)

AUTHENTICATION_BACKENDS = (
    'oauth2_provider.backends.OAuth2Backend',
    'django.contrib.auth.backends.ModelBackend',
)

OAUTH2_PROVIDER_APPLICATION_MODEL = 'oauth2_provider.Application'  # must be here, even though this is the default model

INTO_OAUTH_USERDATA = {
    'username': 'username',
    'email': 'email',
    'first_name': 'first_name',
    'last_name': 'last_name',
}

MESSAGING_SEARCH_RESULTS_PER_PAGE = 5
