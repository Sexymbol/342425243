from django.core.exceptions import ValidationError
from django.db import models

# Create your models here.
class Assets(models.Model):
    type = models.CharField(max_length=50, blank=False)
    state = models.CharField(max_length=50, blank=False)
    quantity = models.IntegerField(default=0, null=False)
    description = models.TextField(default=0, blank=False)
    brand = models.CharField(max_length=30, blank=False)
    serie = models.CharField(max_length=30, blank=False)
    hardware = models.CharField(max_length=30, blank=False)
    software = models.CharField(max_length=30, blank=False)
    ubication = models.CharField(max_length=30, blank=False)
    price = models.DecimalField(max_digits=8, decimal_places=2, null=False)


    def clean(self):
        if self.quantity < 0:
            raise ValidationError('La cantidad no puede ser negativa.')
        if self.price < 0:
            raise ValidationError('El precio no puede ser negativo.')

    def save(self, *args, **kwargs):
        self.clean()  
        super().save(*args, **kwargs)