from django.db import models

# Create your models here.


class Classification(models.Model):
    img = models.ImageField(upload_to='test_images')
    prediction = models.CharField(max_length=200, blank=True)

