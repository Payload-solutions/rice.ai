from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status


from apps.users.api.serializers import UserSerializer, UserListSerializer, ImageForm
from apps.users.models import User


@api_view(['GET', 'POST'])
def user_api_view(request):
    
    if request.method == "GET":
        users = User.objects.all().values('id', 'username', 'email', 'password', 'created_at')
        user_serializers = UserListSerializer(users, many=True)
        return Response(user_serializers.data, status=status.HTTP_200_OK)
    
    elif request.method == "POST":
        user_seializers = UserSerializer(data=request.data)
        if user_seializers.is_valid():
            user_seializers.save()
            return Response({"message":"user created successfully"}, status=status.HTTP_201_CREATED)

        return Response(user_seializers.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["GET", "PUT", "DELETE"])
def user_detail_view(request, pk=None):

    user = User.objects.filter(id=pk).first()
    if user:

        if request.method == "GET":
            
            user_seializer = UserSerializer(user)
            return Response(user_seializer.data, status=status.HTTP_200_OK)

        elif request.method == "PUT":
            
            user_seializer = UserSerializer(user, data=request.data)
            if user_seializer.is_valid():
                user_seializer.save()
                return Response(user_seializer.data, status=status.HTTP_200_OK)

            return Response(user_seializer.errors, status=status.HTTP_400_BAD_REQUEST)

        elif request.method == "DELETE":

            delete_user = User.objects.filter(id=pk).update(is_active=False)
            if delete_user == 1:
                return Response({"message":"User delete it successfully"}, status=status.HTTP_200_OK)
            return Response(user_seializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    return Response({"message": "We can't found that user with these params"}, status=status.HTTP_400_BAD_REQUEST)


@api_view(["GET", "POST"])
def image_convolution(request):
    try:
        from apps.users.core.nn.Net import init_training, prediction
        from apps.users.core.helper.image_handler import validate_image
        import os
        from pprint import pprint
        # pprint(dir(request))
        if request.method == "GET":
            return Response({"type":"OK", "message":"success", "content":init_training()}, status=status.HTTP_200_OK)
        elif request.method == "POST":
            # data = validate_image(request, "File")
            form = ImageForm(request.POST, request.FILES)
            if form.is_valid():
                return Response({"type":"OK", "message":"success"}, status=status.HTTP_200_OK)
            else:
                return Response({"type":"NOT OK", "message":"so success"}, status=status.HTTP_200_OK)
    except Exception as e:
        print(str(e))
        return Response({"type":"ERROR", "message":"Error trying to get information"}, status=status.HTTP_400_BAD_REQUEST)
