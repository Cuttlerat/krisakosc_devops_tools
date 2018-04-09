from .settings import INSTALLED_APPS, MIDDLEWARE

SECRET_KEY = 'Your secret key'
DEBUG = True # False if your want to use fastpost in production
ALLOWED_HOSTS = ['*'] # for docker-compose

STATIC_ROOT = "main/static/" # For nginx in docker

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'LoshadkaSkobkaBatareyka',
        'HOST': 'fastpost_postgres',
        'PORT': '5432',
    }}

# if you want to use debug_toolbar
#INSTALLED_APPS.append('debug_toolbar')
#MIDDLEWARE_CLASSES.append('debug_toolbar.middleware.DebugToolbarMiddleware')
