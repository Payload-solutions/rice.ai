
from django.urls import path

from apps.nn_architecture.api.views.image_classification_view import (
    ClassificationImageListApiView,
    ClassificationImageCreateApiView
)


urlpatterns = [
    path('images', ClassificationImageListApiView.as_view(), name="image_classifiaction"),
    path('images/create', ClassificationImageCreateApiView.as_view(), name="image_classifiaction_create"),
]
