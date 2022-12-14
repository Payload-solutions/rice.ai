# Generated by Django 4.1.3 on 2022-11-26 22:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cnn', '0003_remove_classification_loss_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='classification',
            name='accuracy',
        ),
        migrations.RemoveField(
            model_name='historicalclassification',
            name='accuracy',
        ),
        migrations.AddField(
            model_name='classification',
            name='accuracy_healthy',
            field=models.CharField(blank=True, max_length=200, verbose_name='healthy leaf'),
        ),
        migrations.AddField(
            model_name='classification',
            name='loss_nitrogen',
            field=models.CharField(blank=True, max_length=200, verbose_name='low nitrogen leaf'),
        ),
        migrations.AddField(
            model_name='historicalclassification',
            name='accuracy_healthy',
            field=models.CharField(blank=True, max_length=200, verbose_name='healthy leaf'),
        ),
        migrations.AddField(
            model_name='historicalclassification',
            name='loss_nitrogen',
            field=models.CharField(blank=True, max_length=200, verbose_name='low nitrogen leaf'),
        ),
    ]
