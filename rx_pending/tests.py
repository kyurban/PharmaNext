from django.test import TestCase

from django.test import TestCase
from django.urls import reverse
from .models import Prescription
from patient_management.models import Patient
from inventory_management.models import InventoryItem

class PrescriptionModelTest(TestCase):

    def setUp(self):
        self.patient = Patient.objects.create(
            first_name='John', last_name='Doe', dob='1990-01-01',
            phone='1234567890', email='john@example.com', address='123 Main St'
        )
        self.drug = InventoryItem.objects.create(
            name='Ibuprofen', uses='Pain relief', quantity=100,
            price=10.00, expiration_date='2026-01-01'
        )

    def test_prescription_creation(self):
        prescription = Prescription.objects.create(
            patient=self.patient,
            drug=self.drug,
            sig='Take one tablet daily',
            quantity=30,
            prescribed_by='Dr. Smith'
        )
        self.assertEqual(prescription.status, 'Pending')
        self.assertEqual(str(prescription), 'John Doe - Ibuprofen')

class PendingListViewTest(TestCase):

    def setUp(self):
        self.patient = Patient.objects.create(
            first_name='John', last_name='Doe', dob='1990-01-01',
            phone='1234567890', email='john@example.com', address='123 Main St'
        )
        self.drug = InventoryItem.objects.create(
            name='Ibuprofen', uses='Pain relief', quantity=100,
            price=10.00, expiration_date='2026-01-01'
        )
        Prescription.objects.create(
            patient=self.patient,
            drug=self.drug,
            sig='Take one tablet daily',
            quantity=30,
            prescribed_by='Dr. Smith'
        )

    def test_pending_list_view(self):
        response = self.client.get(reverse('pending_list'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Ibuprofen')

class PendingDetailViewTest(TestCase):

    def setUp(self):
        self.patient = Patient.objects.create(
            first_name='John', last_name='Doe', dob='1990-01-01',
            phone='1234567890', email='john@example.com', address='123 Main St'
        )
        self.drug = InventoryItem.objects.create(
            name='Ibuprofen', uses='Pain relief', quantity=100,
            price=10.00, expiration_date='2026-01-01'
        )
        self.prescription = Prescription.objects.create(
            patient=self.patient,
            drug=self.drug,
            sig='Take one tablet daily',
            quantity=30,
            prescribed_by='Dr. Smith'
        )

    def test_pending_detail_post_updates_status(self):
        response = self.client.post(reverse('pending_detail', kwargs={'pk': self.prescription.pk}), {
            'patient': self.patient.pk,
            'drug': self.drug.pk,
            'sig': 'Take two tablets daily',
            'quantity': 60,
            'prescribed_by': 'Dr. Smith'
        })
        self.assertEqual(response.status_code, 302)
        self.prescription.refresh_from_db()
        self.assertEqual(self.prescription.status, 'In Production')
        self.assertEqual(self.prescription.sig, 'Take two tablets daily')

class PendingDeleteViewTest(TestCase):

    def setUp(self):
        self.patient = Patient.objects.create(
            first_name='John', last_name='Doe', dob='1990-01-01',
            phone='1234567890', email='john@example.com', address='123 Main St'
        )
        self.drug = InventoryItem.objects.create(
            name='Ibuprofen', uses='Pain relief', quantity=100,
            price=10.00, expiration_date='2026-01-01'
        )
        self.prescription = Prescription.objects.create(
            patient=self.patient,
            drug=self.drug,
            sig='Take one tablet daily',
            quantity=30,
            prescribed_by='Dr. Smith'
        )

    def test_pending_delete_view(self):
        response = self.client.post(reverse('pending_delete', kwargs={'pk': self.prescription.pk}))
        self.assertEqual(response.status_code, 302)
        self.assertEqual(Prescription.objects.count(), 0)
