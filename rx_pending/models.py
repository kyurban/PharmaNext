from django.db import models
from patient_management.models import Patient
from inventory_management.models import InventoryItem

class Prescription(models.Model):
    STATUS_CHOICES = [
        ('Pending', 'Pending'),
        ('In Production', 'In Production'),
        ('Verified', 'Verified'),
    ]

    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    drug = models.ForeignKey(InventoryItem, on_delete=models.CASCADE)
    sig = models.TextField(max_length=1000)
    quantity = models.IntegerField()
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Pending')
    prescribed_by = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.patient} - {self.drug}"

