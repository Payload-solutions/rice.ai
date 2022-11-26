from django.db import models

# Create your models here.
from apps.base.models import BaseModel
from simple_history.models import HistoricalRecords



class Classification(BaseModel):
    img_name = models.CharField("image name", max_length=200, blank=True)
    img = models.ImageField("the image", upload_to='test_images/')
    accuracy = models.CharField("accuracy from the convolution", max_length=200, blank=True)
    loss = models.CharField("loss about the model training", max_length=200, blank=True)
    historical = HistoricalRecords()

    class Meta:
        """Meta definition for the classification cnn"""
        verbose_name = "Classification"
        verbose_name_plural = "Classifications"
    
    def __str__(self):
        """Unicode representation about the convolution"""
        return f"Accuracy: {self.accuracy} and Loss: {self.loss}"


