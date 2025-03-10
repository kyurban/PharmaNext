from django.db import models

class InventoryItem(models.Model):
    name = models.CharField(max_length=255)
    uses = models.TextField()
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    expiration_date = models.DateField()

    def __str__(self):
        return self.name
