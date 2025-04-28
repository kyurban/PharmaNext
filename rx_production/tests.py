from django.test import TestCase
from django.urls import reverse
from rx_pending.models import Prescription
from patient_management.models import Patient
from inventory_management.models import InventoryItem

class ProductionListViewTest(TestCase):

    def setUp(self):
        self.patient = Patient.objects.create(
            first_name='Jane', last_name='Smith', dob='1992-02-02',
            phone='9876543210', email='jane@example.com', address='456 Main St'
        )
        self.drug = InventoryItem.objects.create(
            name='Amoxicillin', uses='Antibiotic', quantity=200,
            price=15.00, expiration_date='2026-06-01'
        )
        self.prescription = Prescription.objects.create(
            patient=self.patient,
            drug=self.drug,
            sig='Take one capsule every 8 hours',
            quantity=21,
            prescribed_by='Dr. Adams',
            status='In Production'
        )

    def test_production_list_view(self):
        response = self.client.get(reverse('production_list'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Amoxicillin')

class ProductionDetailViewTest(TestCase):

    def setUp(self):
        self.patient = Patient.objects.create(
            first_name='Jane', last_name='Smith', dob='1992-02-02',
            phone='9876543210', email='jane@example.com', address='456 Main St'
        )
        self.drug = InventoryItem.objects.create(
            name='Amoxicillin', uses='Antibiotic', quantity=200,
            price=15.00, expiration_date='2026-06-01'
        )
        self.prescription = Prescription.objects.create(
            patient=self.patient,
            drug=self.drug,
            sig='Take one capsule every 8 hours',
            quantity=21,
            prescribed_by='Dr. Adams',
            status='In Production'
        )

    def test_production_detail_post_updates_status(self):
        response = self.client.post(reverse('production_detail', kwargs={'pk': self.prescription.pk}))
        self.assertEqual(response.status_code, 302)
        self.prescription.refresh_from_db()
        self.assertEqual(self.prescription.status, 'Awaiting Verification')

