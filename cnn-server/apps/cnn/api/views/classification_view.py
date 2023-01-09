from apps.base.api import GeneralListApiView
from apps.cnn.api.serializers import (
    ClassificationSerializer,
    ListClassificationSerializer,
    MainClassificationViewSerializer
    )

from apps.cnn.models import Classification
from rest_framework import (
    generics,
    status
)

from rest_framework.parsers import JSONParser, MultiPartParser

from rest_framework.response import Response

class ClassificationListApiView(GeneralListApiView):
    serializer_class = ListClassificationSerializer
    fields = ['img_name', 'img']
    
    # def get(self, request, *args, **kwargs):
    #     serializer = self.serializer_class.data
    #     return Response({"Content":serializer}, status=status.HTTP_200_OK)
    


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



class MainClassificationCreateAPIView(GeneralListApiView):
    serializer_class = MainClassificationViewSerializer
    
    
    def get(self, request, *args, **kwargs):
        
        models = Classification.objects.all().values("accuracy_healthy")
        highest_value = list()
        for x in models:
            highest_value.append(x['accuracy_healthy'])
        
        sorted(highest_value, reverse=False)
        return Response({"images_stored":str(len(Classification.objects.all())), "highest_value":float(f"{float(highest_value[len(highest_value)-1]):.2f}")}, status=status.HTTP_200_OK)
    