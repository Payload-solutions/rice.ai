# Generated by Django 4.1.3 on 2022-12-06 07:07

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ImageTrainingClassification',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('state', models.BooleanField(default=True, verbose_name='state')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('modified_at', models.DateTimeField(auto_now=True, null=True)),
                ('deleted_at', models.DateTimeField(auto_now=True, null=True)),
                ('img_name', models.CharField(blank=True, max_length=200, verbose_name='image name')),
                ('img', models.ImageField(upload_to='nn_architecture/images')),
            ],
            options={
                'verbose_name': 'ImageTraining',
                'verbose_name_plural': 'ImagesTraining',
            },
        ),
    ]