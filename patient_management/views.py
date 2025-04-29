from django.shortcuts import get_object_or_404, render, redirect

from rx_pending.models import Prescription
from .models import Patient
from .forms import PatientForm, PatientSearchForm

# Displays primary page to search for patients
def search_patient(request):
    form = PatientSearchForm(request.GET or None)
    patients = []
    if request.GET and form.is_valid():
        first_name = form.cleaned_data["first_name"][:3]
        last_name = form.cleaned_data["last_name"][:3]
        dob = form.cleaned_data["dob"]

        patients = Patient.objects.filter(
            first_name__istartswith=first_name,
            last_name__istartswith=last_name,
            dob=dob
        )
    return render(request, 'search_patient.html', {"form": form, "patients": patients})

# Displays form for adding a new patient profile
def patient_create(request):
    if request.method == 'POST':
        form = PatientForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('search_patient')
    else:
        form = PatientForm()
    return render(request, 'patient_form.html', {'form': form})

# Displays patient profile with prescriptions and allows for editing
def patient_update(request, pk):
    patient = Patient.objects.get(pk=pk)
    prescriptions = Prescription.objects.filter(patient=patient)

    if request.method == 'POST':
        form = PatientForm(request.POST, instance=patient)
        if form.is_valid():
            form.save()
            return redirect('search_patient')
    else:
        form = PatientForm(instance=patient)
    
    return render(request, 'patient_form.html', {
        'form': form,
        'prescriptions': prescriptions,
    })

# Displays seperate confirmation page to delete a patient profile
def patient_delete(request, pk):
    patient = Patient.objects.get(pk=pk)
    if request.method == 'POST':
        patient.delete()
        return redirect('search_patient')
    return render(request, 'patient_confirm_delete.html', {'patient': patient})


