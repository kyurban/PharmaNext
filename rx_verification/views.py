from django.shortcuts import redirect, render, HttpResponse
from rx_pending.models import Prescription

def verification_list(request):
    prescriptions = Prescription.objects.filter(status='Awaiting Verification')
    return render(request, 'QV_list.html', {'prescriptions': prescriptions})

def verification_detail(request, pk):
    prescription = Prescription.objects.get(pk=pk)
    if request.method == 'POST':
        prescription.status = 'Verified'
        prescription.save()
        return redirect('verification_list')
    return render(request, 'QV_detail.html', {'prescription': prescription})