from django.shortcuts import redirect, render
from .models import Prescription
from .forms import PrescriptionForm

# Displays page showing all pending prescriptions
def pending_list(request):
    prescriptions = Prescription.objects.filter(status='Pending')
    return render(request, 'QT_list.html', {'prescriptions': prescriptions})

# Displays form for adjustment prior to production
def pending_detail(request, pk):
    prescription = Prescription.objects.get(pk=pk)
    if request.method == 'POST':
        form = PrescriptionForm(request.POST, instance=prescription)
        if form.is_valid():
            form.save()
            prescription.status = 'In Production'
            prescription.save()
            return redirect('pending_list')
    else:
        form = PrescriptionForm(instance=prescription)
    return render(request, 'QT_form.html', {'form': form, 'prescription': prescription})

# Displays a confirmation page to delete a prescription
def pending_delete(request, pk):
    prescription = Prescription.objects.get(pk=pk)
    if request.method == 'POST':
        prescription.delete()
        return redirect('pending_list')
    return render(request, 'QT_confirm_delete.html', {'prescription': prescription})