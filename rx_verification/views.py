from django.shortcuts import redirect, render
from rx_pending.models import Prescription
from inventory_management.models import InventoryItem
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import login_required, user_passes_test

# method for checking if user is a pharmacist
def is_pharmacist(user):
    if user.groups.filter(name='Pharmacists').exists():
        return True
    raise PermissionDenied

# Displays page showing all prescriptions awaiting verification
@login_required
@user_passes_test(is_pharmacist)
def verification_list(request):
    prescriptions = Prescription.objects.filter(status='Awaiting Verification')
    return render(request, 'QV_list.html', {'prescriptions': prescriptions})

# Displays form to complete verification of a prescription
@login_required
@user_passes_test(is_pharmacist)
def verification_detail(request, pk):
    prescription = Prescription.objects.get(pk=pk)

    if request.method == 'POST':
        if prescription.status != 'Verified':
            drug = InventoryItem.objects.get(pk=prescription.drug_id)
            
            if drug.quantity >= prescription.quantity:
                drug.quantity -= prescription.quantity
                drug.save()

                prescription.status = 'Verified'
                prescription.save()
        return redirect('verification_list')

    return render(request, 'QV_detail.html', {'prescription': prescription})