from apps.base.api import GeneralListApiView
from apps.cnn.api.serializers import ClassificationSerializer



# CNN imports
from tensorflow.keras.preprocessing.image import load_img, img_to_array


from rest_framework import (
    generics,
    status
)

from rest_framework.response import Response


# local imports
import base64

class ClassificationListApiView(GeneralListApiView):
    serializer_class = ClassificationSerializer


class ClassificationCreateAPIView(generics.CreateAPIView):
    serializer_class = ClassificationSerializer
    fields = ['img_name', 'img']

    # def post(self, request):
    #     # image_64 = base64.encode(request.data['img'].read())
    #     # image_64 = image_64.deocde('utf-8')
    #     # img_type = img_to_array()
    #     # print(img_to_array(request.data['img'].read().content_type))

    #     try:
    #         print(dir(request.data['img'].read()))

    #         return Response({"Type":"Error", "message":"created!!!"}, status=status.HTTP_201_CREATED)
    #     except Exception as e:
    #         return Response({"Type":"Error", "Error":str(e)}, status=status.HTTP_400_BAD_REQUEST)