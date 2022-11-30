from apps.base.api import GeneralListApiView
from apps.cnn.api.serializers import ClassificationSerializer


from rest_framework import (
    generics,
    status
)

from rest_framework.parsers import JSONParser, MultiPartParser

from rest_framework.response import Response

class ClassificationListApiView(GeneralListApiView):
    serializer_class = ClassificationSerializer
    fields = ['img_name', 'img']


class ClassificationCreateAPIView(generics.CreateAPIView):
    serializer_class = ClassificationSerializer
    parser_classes = (JSONParser, MultiPartParser, )

    def post(self, request):
        try:
            serializer = self.serializer_class(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response({"Content":serializer.data}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print("Error by: "+str(e))
            return Response({"message":"Error", "Error":str(e)},status=status.HTTP_400_BAD_REQUEST)




