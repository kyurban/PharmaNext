from django.shortcuts import redirect, render
from rx_pending.models import Prescription

# Displays page showing all prescriptions in production
def production_list(request):
    prescriptions = Prescription.objects.filter(status='In Production')
    return render(request, 'QP_list.html', {'prescriptions': prescriptions})

# Displays form to complete production prior to verification
def production_detail(request, pk):
    prescription = Prescription.objects.get(pk=pk)
    if request.method == 'POST':
        prescription.status = 'Awaiting Verification'
        prescription.save()
        return redirect('production_list')
    return render(request, 'QP_detail.html', {'prescription': prescription})