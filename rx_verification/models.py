from django.db import models

class QV(models.Model):
    prescription = models.OneToOneField(Prescription, on_delete=models.CASCADE)
    verified_by = models.ForeignKey(User, on_delete=models.CASCADE)
    verified_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=20, choices=[('Verified', 'Verified')], default='Verified')

    def __str__(self):
        return f"Verified - {self.prescription}"