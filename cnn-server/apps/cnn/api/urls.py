from django.urls import path

from apps.cnn.api.views.classification_view import (
    ClassificationListApiView,
    ClassificationCreateAPIView,
    MainClassificationCreateAPIView
)


urlpatterns = [
    path('cnn/', ClassificationListApiView.as_view(), name="classification"),
    path('main/', MainClassificationCreateAPIView.as_view(), name="classification"),
    path('play_cnn', ClassificationCreateAPIView.as_view(), name="classification"),
]