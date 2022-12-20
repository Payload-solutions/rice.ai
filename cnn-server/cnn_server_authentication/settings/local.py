from .base import *
# import pymysql
import os
# pymysql.install_as_MySQLdb()
# # SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# ALLOWED_HOSTS = []

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': BASE_DIR / 'db.sqlite3',
#     }
# }


# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'riceaiv2',
#         'USER': 'root_aturo',
#         'PASSWORD': 'arturo_root',
#         'HOST': 'mysql',
#         'PORT': '3306'
#     }
# }

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'riceaiv3',
        'USER': 'root_arturo',
        'PASSWORD': 'arturo_root',
        #'HOST':'0.0.0.0',
        'HOST': '127.0.0.1',
        'PORT': '3306'
        #'PORT': '3306'
    }
}


# DATABASES['default']['ATOMIC_REQUESTS'] = True
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.1/howto/static-files/

STATIC_URL = 'static/'