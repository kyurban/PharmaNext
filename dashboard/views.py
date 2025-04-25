from django.shortcuts import render
from inventory_management.models import InventoryItem
from patient_management.models import Patient
from rx_pending.models import Prescription

def dashboard(request):
    is_pharmacist = request.user.groups.filter(name="Pharmacists").exists()

    context = {
        'count_qt': Prescription.objects.filter(status='Pending').count(),
        'count_qp': Prescription.objects.filter(status='In Production').count(),
        'count_qv': Prescription.objects.filter(status='Awaiting Verification').count(),
        'is_pharmacist': is_pharmacist,
    }
    return render(request, 'dashboard.html', context)
