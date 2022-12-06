
from rest_framework import serializers
from apps.nn_architecture.models import ImageTrainingClassification



class ListClassificationImagesSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = ImageTrainingClassification
        exclude = ('state', 'created_at','modified_at','deleted_at')

    
    def to_representation(self, instance):
        return {
            # 'id': instance.id,
            'img_name':instance.img_name,
            'img': instance.img.url if instance.img != '' else '',
            'category':instance.category,
            'tag_label':instance.tag_label,
        }
    
    