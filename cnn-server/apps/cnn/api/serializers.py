"""Serializers for the generic view in the cnn"""


from apps.cnn.models import Classification

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
            'sick':instance.loss_nitrogen
        }