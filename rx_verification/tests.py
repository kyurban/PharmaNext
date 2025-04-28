from django.test import TestCase
from django.urls import reverse
from django.contrib.auth.models import User, Group
from PharmaNext import settings
from rx_pending.models import Prescription
from patient_management.models import Patient
from inventory_management.models import InventoryItem

class VerificationListViewTest(TestCase):

    def setUp(self):
        self.group = Group.objects.create(name='Pharmacists')
        self.user = User.objects.create_user(username='pharmacist', password='testpass')
        self.user.groups.add(self.group)

        self.patient = Patient.objects.create(
            first_name='Alice', last_name='Johnson', dob='1985-05-05',
            phone='5555555555', email='alice@example.com', address='789 Main St'
        )
        self.drug = InventoryItem.objects.create(
            name='Metformin', uses='Diabetes', quantity=300,
            price=20.00, expiration_date='2027-01-01'
        )
        self.prescription = Prescription.objects.create(
            patient=self.patient,
            drug=self.drug,
            sig='Take one tablet twice daily',
            quantity=60,
            prescribed_by='Dr. Brown',
            status='Awaiting Verification'
        )

    def test_verification_list_requires_login(self):
        response = self.client.get(reverse('verification_list'))
        expected_login_url = settings.LOGIN_URL
        expected_redirect_url = f'{expected_login_url}?next={reverse("verification_list")}'
        self.assertRedirects(response, expected_redirect_url)

    def test_verification_list_view_authenticated(self):
        self.client.login(username='pharmacist', password='testpass')
        response = self.client.get(reverse('verification_list'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Metformin')

class VerificationDetailViewTest(TestCase):

    def setUp(self):
        self.group = Group.objects.create(name='Pharmacists')
        self.user = User.objects.create_user(username='pharmacist', password='testpass')
        self.user.groups.add(self.group)

        self.patient = Patient.objects.create(
            first_name='Alice', last_name='Johnson', dob='1985-05-05',
            phone='5555555555', email='alice@example.com', address='789 Main St'
        )
        self.drug = InventoryItem.objects.create(
            name='Metformin', uses='Diabetes', quantity=300,
            price=20.00, expiration_date='2027-01-01'
        )
        self.prescription = Prescription.objects.create(
            patient=self.patient,
            drug=self.drug,
            sig='Take one tablet twice daily',
            quantity=60,
            prescribed_by='Dr. Brown',
            status='Awaiting Verification'
        )

    def test_verification_detail_updates_status_and_inventory(self):
        self.client.login(username='pharmacist', password='testpass')
        response = self.client.post(reverse('verification_detail', kwargs={'pk': self.prescription.pk}))
        self.assertEqual(response.status_code, 302)

        self.prescription.refresh_from_db()
        self.drug.refresh_from_db()

        self.assertEqual(self.prescription.status, 'Verified')
        self.assertEqual(self.drug.quantity, 240)
