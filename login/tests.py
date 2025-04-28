from django.test import TestCase
from django.urls import reverse
from django.contrib.auth import get_user_model

class LoginUserTests(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.admin_user = get_user_model().objects.create_user(
            username='admin',
            password='pharmanext'
        )
        cls.pharmacist_user = get_user_model().objects.create_user(
            username='pharmacist',
            password='pharmanext1'
        )
        cls.technician_user = get_user_model().objects.create_user(
            username='technician',
            password='pharmanext2'
        )

    def test_login_success(self):
        response = self.client.post(reverse('login_user'), {
            'username': 'admin',
            'password': 'pharmanext'
        })
        self.assertRedirects(response, reverse('dashboard'))
        self.assertTrue('_auth_user_id' in self.client.session)

    def test_login_failure(self):
        response = self.client.post(reverse('login_user'), {
            'username': 'admin',
            'password': 'wrongpassword'
        })
        self.assertContains(response, 'Invalid credentials')
        self.assertFalse('_auth_user_id' in self.client.session)

    def test_login_page_accessible(self):
        response = self.client.get(reverse('login_user'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'login.html')
