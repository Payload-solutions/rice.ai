from .base import *
import pymysql
import os
pymysql.install_as_MySQLdb()
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# ALLOWED_HOSTS = []

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}
# DATABASES = {
#         'default': {
#             'ENGINE': 'django.db.backends.mysql',
#             'NAME': os.getenv('DB_NAME'),
#             'USER': os.getenv('DB_USER'),
#             'PASSWORD': os.getenv('DB_PASSWORD'),
#             'HOST': os.getenv('DB_HOST'),
#             'PORT': os.getenv('DB_PORT'),
#         }
#     }
# DATABASES = {
#         'default': {
#             'ENGINE': 'django.db.backends.mysql',
#             'NAME': 'riceai',
#             'USER': 'root_arturo',
#             'PASSWORD': 'arturo_root',
#             'HOST': 'db',
#             'PORT': '3306',
#             'ATOMIC_REQUESTS': True,
#         }
#     }

# DATABASES = {
#     'default': 'mysql://root_arturo:arturo_root@db:3306/riceai',
# }
# DATABASES['default']['ATOMIC_REQUESTS'] = True
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.1/howto/static-files/

STATIC_URL = 'static/'