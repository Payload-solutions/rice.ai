from django.urls import path

from apps.cnn.api.views.classification_view import ClassificationListApiView


urlpatterns = [
    path('cnn/', ClassificationListApiView.as_view(), name="classification"),
]