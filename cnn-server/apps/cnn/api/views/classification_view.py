from apps.base.api import GeneralListApiView
from apps.cnn.api.serializers import ClassificationSerializer



class ClassificationListApiView(GeneralListApiView):
    serializer_class = ClassificationSerializer