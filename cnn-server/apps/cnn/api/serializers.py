"""Serializers for the generic view in the cnn"""


from apps.cnn.models import Classification

from rest_framework import serializers


class ClassificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classification
        exclude = ('state', 'created_at','modified_at','deleted_at')