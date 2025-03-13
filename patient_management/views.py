from django.shortcuts import render, redirect
from .models import Patient
from .forms import PatientForm, PatientSearchForm

def search_patient(request):
    form = PatientSearchForm(request.GET or None)
    patients = []
    if request.GET and form.is_valid():
        first_name = form.cleaned_data["first_name"][:3]
        last_name = form.cleaned_data["last_name"][:3]
        dob = form.cleaned_data["dob"]
    
        patients = Patient.objects.filter(
            first_name__startswith=first_name,
            last_name__startswith=last_name,
            dob=dob
    )
    return render(request, 'search_patient.html', {"form": form, "patients": patients})

def patient_create(request):
    if request.method == 'POST':
        form = PatientForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('search_patient')
    else:
        form = PatientForm()
    return render(request, 'patient_form.html', {'form': form})

def patient_update(request, pk):
    patient = Patient.objects.get(pk=pk)
    if request.method == 'POST':
        form = PatientForm(request.POST, instance=patient)
        if form.is_valid():
            form.save()
            return redirect('search_patient')
    else:
        form = PatientForm(instance=patient)
    return render(request, 'patient_form.html', {'form': form})

def patient_delete(request, pk):
    patient = Patient.objects.get(pk=pk)
    if request.method == 'POST':
        patient.delete()
        return redirect('search_patient')
    return render(request, 'patient_confirm_delete.html', {'patient': patient})


