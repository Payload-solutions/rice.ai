# Generated by Django 4.1.3 on 2022-12-05 03:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_historicaluser_updated_at_user_updated_at_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='historicaluser',
            name='role',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='position'),
        ),
        migrations.AddField(
            model_name='user',
            name='role',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='position'),
        ),
    ]
