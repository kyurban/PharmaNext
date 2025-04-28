from django.test import TestCase
from django.urls import reverse
from .models import Patient

class PatientTests(TestCase):

    def setUp(self):
        self.patient = Patient.objects.create(
            first_name="Jane",
            last_name="Smith",
            dob="1985-05-20",
            phone="0987654321",
            email="janesmith@example.com",
            address="456 Oak St"
        )

    def test_patient_str(self):
        self.assertEqual(str(self.patient), "Jane Smith")

    def test_search_patient(self):
        response = self.client.get(reverse('search_patient'), {
            'first_name': 'Jan',
            'last_name': 'Smi',
            'dob': '05/20/1985'
        })
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Jane')

    def test_create_patient(self):
        response = self.client.post(reverse('patient_create'), {
            'first_name': 'Mike',
            'last_name': 'Tyson',
            'dob': '1966-06-30',
            'phone': '5551234567',
            'email': 'miketyson@example.com',
            'address': '789 Pine St'
        })
        self.assertEqual(response.status_code, 302)
        self.assertEqual(Patient.objects.count(), 2)

    def test_update_patient(self):
        response = self.client.post(reverse('patient_update', kwargs={'pk': self.patient.pk}), {
            'first_name': 'Janet',
            'last_name': 'Smith',
            'dob': '1985-05-20',
            'phone': '1112223333',
            'email': 'janetsmith@example.com',
            'address': '789 Oak St'
        })
        self.assertEqual(response.status_code, 302)
        self.patient.refresh_from_db()
        self.assertEqual(self.patient.first_name, 'Janet')

    def test_delete_patient(self):
        response = self.client.post(reverse('patient_delete', kwargs={'pk': self.patient.pk}))
        self.assertEqual(response.status_code, 302)
        self.assertEqual(Patient.objects.count(), 0)
