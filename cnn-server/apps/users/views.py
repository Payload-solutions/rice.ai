from django.contrib.sessions.models import Session
from datetime import datetime

from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework import status
from rest_framework.views import APIView
from apps.users.api.serializers import UserTokenSerializer

"""
This class implementation is for the basic authentication
retrieving a token in the login
"""


class Login(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        try:
            login_serializer = self.serializer_class(
                data=request.data, context={'request': request})
            if login_serializer.is_valid():
                user = login_serializer.validated_data['user']
                if user.is_active:
                    token, created = Token.objects.get_or_create(user=user)
                    user_serializer = UserTokenSerializer(user)
                    if created:
                        return Response({
                            'token': token.key,
                            'user': user_serializer.data,
                            'is_admin': True if user.is_superuser else False,
                            'message': 'login successfully'
                        }, status=status.HTTP_200_OK)
                    else:
                        all_sessions = Session.objects.filter(
                            expire_date__gte=datetime.now())
                        if all_sessions.exists():
                            for session in all_sessions:
                                session_data = session.get_decoded()
                                if user.id == int(session_data.get('_auth_user_id')):
                                    session.delete()
                        token.delete()
                        token = Token.objects.create(user=user)
                        return Response({
                            'token': token.key,
                            'user': user_serializer.data,
                            'is_admin': True if user.is_superuser else False,
                            'message': 'login successfully'
                        }, status=status.HTTP_200_OK)
                else:
                    return Response({"message": "This user can't make login"}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message": "Wrong credentials"}, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            print(str(e))
            return Response({"message": "problems in the login"}, status=status.HTTP_401_UNAUTHORIZED)


class Logout(APIView):
    def get(self, request, *args, **kwargs):
        token = request.GET.get("token")
        token = Token.objects.filter(key=token).first()
        if token:
            user = Token.user
            all_sessions = Session.objects.filter(
                expire_date__gte=datetime.now())
            if all_sessions.exists():
                for session in all_sessions:
                    session_data = session.get_decoded()
                    if user.id == int(session_data.get('_auth_user_id')):
                        session.delete()
            session_messagee = "token deleted"
            token.delete()
