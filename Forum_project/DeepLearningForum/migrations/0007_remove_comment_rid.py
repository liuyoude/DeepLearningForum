# Generated by Django 2.2 on 2019-12-30 21:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('DeepLearningForum', '0006_comment_rid'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comment',
            name='rid',
        ),
    ]