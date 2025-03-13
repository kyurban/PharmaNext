from django import forms
from .models import Patient

class PatientForm(forms.ModelForm):
    class Meta:
        model = Patient
        fields = ['first_name', 'last_name', 'dob', 'phone', 'email', 'address']

class PatientSearchForm(forms.Form):
    first_name = forms.CharField(
        label="First Name",
        max_length=10,
        required=True
    )
    last_name = forms.CharField(
        label="Last Name",
        max_length=10,
        required=True
    )
    dob = forms.DateField(
        label="Date of Birth",
        input_formats=["%m/%d/%Y"],
        widget=forms.TextInput(attrs={"placeholder": "MM/DD/YYYY"}),
    )