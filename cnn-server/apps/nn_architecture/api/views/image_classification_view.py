
from apps.base.api import GeneralListApiView
from rest_framework import (
    generics,
    status
)
from rest_framework.response import Response
from apps.nn_architecture.api.serializers import ListClassificationImagesSerializer


class ClassificationImageListApiView(GeneralListApiView):
    serializer_class = ListClassificationImagesSerializer
    fields = ['img_name', 'img']
    # def get(self, request, *args, **kwargs):
    #     serializer = self.serializer_class.data
    #     return Response({"Content":"hello"}, status=status.HTTP_200_OK)


class ClassificationImageCreateApiView(generics.CreateAPIView):
    serializer_class = ListClassificationImagesSerializer
    def post(self, request, *args, **kwargs):
        try:
            serializer = self.serializer_class(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response({"Message":"Content was saved successfully"}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(str(e))
            return Response({"Message":f"{str(e)}"}, status=status.HTTP_400_BAD_REQUEST)            