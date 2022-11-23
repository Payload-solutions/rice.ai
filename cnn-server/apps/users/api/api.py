from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.decorators import api_view

from apps.users.api.serializers import UserSerializer
from apps.users.models import User


@api_view(['GET', 'POST'])
def user_api_view(request):
    
    if request.method == "GET":
        users = User.objects.all()
        user_serializers = UserSerializer(users, many=True)
        return Response(user_serializers.data)
    
    elif request.method == "POST":
        user_seializers = UserSerializer(data=request.data)
        if user_seializers.is_valid():
            user_seializers.save()
            return Response(user_seializers.data)
        return Response(user_seializers.errors)