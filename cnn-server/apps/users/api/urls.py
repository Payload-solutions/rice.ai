from django.urls import path
from apps.users.api.api import (
    user_api_view, 
    user_detail_view,
    image_convolution
)


urlpatterns = [
    path('user/', user_api_view, name="user_api"),
    path('user/<int:pk>/', user_detail_view, name="user_detail_api_view"),
    path('user/convolution', image_convolution, name="image_convolution"),
]