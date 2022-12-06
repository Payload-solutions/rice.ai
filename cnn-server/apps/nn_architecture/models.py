from django.db import models

# Create your models here.

from apps.base.models import BaseModel



class ImageTrainingClassification(BaseModel):
    
    img_name = models.CharField("image name", max_length=200, blank=True)
    img = models.ImageField(upload_to="nn_architecture/images")
    category = models.CharField("category for the image (train, test or validation)", max_length=200, blank=True)
    tag_label = models.CharField("tag for the kind of image", max_length=50, blank=True)
    
    class Meta:
        verbose_name = "ImageTraining"
        verbose_name_plural = "ImagesTraining"
    
    def __str__(self) -> str:
        return f"Image: {self.img_name} and the path => {self.img.path}"