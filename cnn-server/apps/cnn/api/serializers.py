"""Serializers for the generic view in the cnn"""

from apps.cnn.models import Classification
from apps.cnn.api.helper.helpers import (
    recommendation,
    prediction_difference
)
from rest_framework import serializers


class ClassificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classification
        exclude = ('state', 'created_at', 'modified_at', 'deleted_at')

    def to_representation(self, instance):
        return {
            'id': instance.id,
            'img_name': instance.img_name,
            'img': instance.img.url if instance.img != '' else '',
            'healthy': instance.accuracy_healthy,
            'sick': instance.loss_nitrogen,
            "recommendation": recommendation(instance.accuracy_healthy, instance.loss_nitrogen)
        }


class ListClassificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classification
        exclude = ('state', 'created_at', 'modified_at', 'deleted_at')

    def to_representation(self, instance):
        return {
            'img_name': instance.img_name,
            'img': instance.img.url if instance.img != '' else '',
            'healthy': float("{0:.2f}".format(float(instance.accuracy_healthy))),
            'sick': float("{0:.2f}".format(float(instance.loss_nitrogen))),
            'diff': prediction_difference(instance.accuracy_healthy, instance.loss_nitrogen),
            "recommendation": recommendation(instance.accuracy_healthy, instance.loss_nitrogen),
        }


class MainClassificationViewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classification
        exclude = ('state', 'created_at', 'modified_at', 'deleted_at')

    def to_representation(self, instance):
        return {
            # 'img_name':instance.img_name,
            # 'img': instance.img.url if instance.img != '' else '',
            # 'healthy':instance.accuracy_healthy,
            # "recommendation": recommendation(instance.accuracy_healthy, instance.loss_nitrogen),
            "images_stored": len(Classification.objects.all()),
        }
