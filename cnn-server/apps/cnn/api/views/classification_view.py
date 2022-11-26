from apps.base.api import GeneralListApiView
from apps.cnn.api.serializers import ClassificationSerializer

from rest_framework import generics

class ClassificationListApiView(GeneralListApiView):
    serializer_class = ClassificationSerializer


class ClassificationCreateAPIView(generics.CreateAPIView):
    serializer_class = ClassificationSerializer

    def post(self, request):
        print(request.data)
        