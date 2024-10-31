# Generated by Django 5.1.2 on 2024-10-19 17:01

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Assets',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(max_length=50)),
                ('state', models.CharField(max_length=50)),
                ('quantity', models.IntegerField(default=0)),
                ('description', models.TextField(default=0)),
                ('brand', models.CharField(max_length=30)),
                ('serie', models.CharField(max_length=30)),
                ('hardware', models.CharField(max_length=30)),
                ('software', models.CharField(max_length=30)),
                ('ubication', models.CharField(max_length=30)),
                ('price', models.DecimalField(decimal_places=2, max_digits=8)),
            ],
        ),
    ]