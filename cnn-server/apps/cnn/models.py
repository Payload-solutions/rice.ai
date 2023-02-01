from django.db import models

# Create your models here.
from apps.base.models import BaseModel
from simple_history.models import HistoricalRecords

import tensorflow as tf
from tensorflow.python.keras.models import (
    load_model,
    model_from_json
)
from tensorflow.python.keras.initializers import glorot_uniform
from tensorflow.keras.utils import CustomObjectScope
from tensorflow.keras import backend as K
from tensorflow.keras.preprocessing.image import (
    load_img,
    img_to_array,
    array_to_img
)
from tensorflow.keras.applications import imagenet_utils
from PIL import Image


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

    def predict(self):
        K.reset_uids()
        model = "apps/cnn/models/riceai_json_model_2.json"
        weights = "apps/cnn/models/final_model_2.hdf5"

        with CustomObjectScope({'GlorotUniform': glorot_uniform()}):
            with open(model, 'r') as f:
                model = model_from_json(f.read())
                model.load_weights(weights)

        image = Image.open(self.img)
        img = img_to_array(load_img(self.img, target_size=(224, 224))) / 255.0
        img = img.reshape(1, 224, 224, 3)

        result = model.predict(img)

        return result[0][0], result[0][1]

    def save(self, *args, **kwargs):
        K.reset_uids()
        model = "apps/cnn/models/testing2.json"
        weights = "apps/cnn/models/testing2.hdf5"

        with CustomObjectScope({'GlorotUniform': glorot_uniform()}):
            with open(model, 'r') as f:
                model = model_from_json(f.read())
                model.load_weights(weights)

        image = Image.open(self.img)
        image = image.resize((224, 224))
        x = img_to_array(image) / 255.0
        x = x.reshape(1, 224, 224, 3)

        result = model.predict(x)

        self.accuracy_healthy, self.loss_nitrogen = str(float(result[0][0]) * 100), str(float(result[0][1]) * 100)
        super().save(*args, **kwargs)

    def __str__(self):
        return f"Accuracy healthy leaf: {self.accuracy_healthy} Accuracy Loss nitrogen: {self.loss_nitrogen}"
