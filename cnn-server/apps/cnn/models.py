from django.db import models

# Create your models here.
from apps.base.models import BaseModel
from simple_history.models import HistoricalRecords


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
    
    

    def predict_acc(self):
        model = create_and_load_convolution_model(".weights/rice_model_4.hdf5")
        img_to_conv = load_img(self.img.path, target_size=(64,64))
        x = img_to_array(img_to_conv)
        x = x.reshape(1, 64, 64, 3)
        result = model.predict(x)

        return result[0][0], result[0][1]
    

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        acc_healthy, loss_healthy = self.predict_acc()
        self.accuracy_healthy, self.loss_nitrogen = acc_healthy, loss_healthy
        

    def __str__(self):
        """Unicode representation about the convolution"""
        print(f"the path {self.img.path}")
        print(f"the type {self.img}")
        return f"Accuracy healthy leaf: {self.accuracy_healthy} Accuracy Loss nitrogen: {self.loss_nitrogen}"


