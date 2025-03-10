from django.db import models

class QP(models.Model):
    prescription = models.OneToOneField(Prescription, on_delete=models.CASCADE)
    started_at = models.DateTimeField(auto_now_add=True)
    completed_at = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"In Production - {self.prescription}"
