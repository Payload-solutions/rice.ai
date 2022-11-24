from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework import status


from apps.users.api.serializers import UserTokenSerializer


"""
This class implementation is for the basic authentication
retrieving a token in the login
"""



class Login(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        login_serializer = self.serializer_class(data=request.data, context={'request':request})
        if login_serializer.is_valid():
            user = login_serializer.validated_data['user']
            if user.is_active:
                token, created = Token.objects.get_or_create(user=user)
                user_serializer = UserTokenSerializer(user)
                if created:
                    return Response({
                        'token':token.key,
                        'user':user_serializer.data,
                        'message':'login successfully'
                    }, status=status.HTTP_201_CREATED)
                else:
                    token.delete()
                    token = Token.objects.create(user=user)
                    return Response({
                        'token':token.key,
                        'user':user_serializer.data,
                        'message':'login successfully'
                    }, status=status.HTTP_201_CREATED)
            else:
                return Response({"message":"This user can't make login"}, status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response({"message":"Wrong credentials"}, status=status.HTTP_400_BAD_REQUEST0)

        return Response({"message":"Validaton wrong"}, status=status.HTTP_302_FOUND)