"""Serializers for the generic view in the cnn"""


from apps.cnn.models import Classification
from apps.cnn.api.helper.helpers import (
    recomendation,
    predicction_difference,
    values_formatter
)
from rest_framework import serializers


class ClassificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classification
        exclude = ('state', 'created_at','modified_at','deleted_at')
    
    def to_representation(self, instance):
        
        return {
            'id': instance.id,
            'img_name':instance.img_name,
            'img': instance.img.url if instance.img != '' else '',
            'healthy':instance.accuracy_healthy,
            'sick':instance.loss_nitrogen,
            "recomendation": recomendation(instance.accuracy_healthy,instance.loss_nitrogen)
        }


class ListeClassificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classification
        exclude = ('state', 'created_at','modified_at','deleted_at')
    
    
    def to_representation(self, instance):
        return {
            'img_name':instance.img_name,
            'img': instance.img.url if instance.img != '' else '',
            'healthy':float("{0:.2f}".format(float(instance.accuracy_healthy))),
            'sick':float("{0:.2f}".format(float(instance.loss_nitrogen))),
            'diff':predicction_difference(instance.accuracy_healthy, instance.loss_nitrogen),
            "recomendation": recomendation(instance.accuracy_healthy, instance.loss_nitrogen),
        }


class MainClassificationViewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classification
        exclude = ('state', 'created_at','modified_at','deleted_at')
    
    def to_representation(self, instance):
        return {
            # 'img_name':instance.img_name,
            # 'img': instance.img.url if instance.img != '' else '',
            # 'healthy':instance.accuracy_healthy,
            # "recomendation": recomendation(instance.accuracy_healthy, instance.loss_nitrogen),
            "images_stored":len(Classification.objects.all()),
        }
    