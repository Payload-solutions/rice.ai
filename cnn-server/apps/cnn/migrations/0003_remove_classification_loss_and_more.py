# Generated by Django 4.1.3 on 2022-11-26 21:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cnn', '0002_rename_updated_at_classification_deleted_at_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='classification',
            name='loss',
        ),
        migrations.RemoveField(
            model_name='historicalclassification',
            name='loss',
        ),
    ]