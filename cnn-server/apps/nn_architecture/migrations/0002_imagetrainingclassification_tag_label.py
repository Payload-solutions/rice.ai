# Generated by Django 4.1.3 on 2022-12-06 07:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nn_architecture', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='imagetrainingclassification',
            name='tag_label',
            field=models.CharField(blank=True, max_length=50, verbose_name='tag for the kind of image'),
        ),
    ]
