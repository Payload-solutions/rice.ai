from django.db import models

# Create your models here.
from apps.base.models import BaseModel
from simple_history.models import HistoricalRecords

from PIL import Image



# cnn model
from apps.cnn.core.cnn import create_and_load_convolution_model
from tensorflow.keras.preprocessing.image import load_img, img_to_array

class Classification(BaseModel):
    img_name = models.CharField("image name", max_length=200, blank=True)
    img = models.ImageField("the image", upload_to='cnn/images')
    accuracy_healthy = models.CharField("healthy leaf", max_length=200, blank=True)
    loss_nitrogen = models.CharField("low nitrogen leaf", max_length=200, blank=True)
    historical = HistoricalRecords()

    class Meta:
        """Meta definition for the classification cnn"""
        verbose_name = "Classification"
        verbose_name_plural = "Classifications"
    
    
    

    def save(self, *args, **kwargs):
        model = create_and_load_convolution_model(".weights/rice_model_4.hdf5")
        image = Image.open(self.img)
        image = image.resize((64,64))
        x = img_to_array(image)
        x = x.reshape(1,64,64,3)        
        result = model.predict(x)
        self.accuracy_healthy, self.loss_nitrogen = result[0][0], result[0][1]
        super().save(*args, **kwargs)
        

    def __str__(self):
        return f"Accuracy healthy leaf: {self.accuracy_healthy} Accuracy Loss nitrogen: {self.loss_nitrogen}"


