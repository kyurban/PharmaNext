from django.test import TestCase
from .models import InventoryItem
from django.urls import reverse

class InventoryItemModelTest(TestCase):

    def test_inventory_item_creation(self):
        item = InventoryItem.objects.create(
            name='Aspirin',
            uses='For headaches',
            quantity=100,
            price=19.99,
            expiration_date='2025-12-31'
        )
        self.assertEqual(item.name, 'Aspirin')
        self.assertEqual(item.quantity, 100)
        self.assertEqual(item.price, 19.99)
        self.assertEqual(str(item), 'Aspirin')

class InventoryListViewTest(TestCase):

    def setUp(self):
        self.item1 = InventoryItem.objects.create(name='Aspirin', quantity=100, uses='For headaches', price=19.99, expiration_date='2025-12-31')
        self.item2 = InventoryItem.objects.create(name='Ibuprofen', quantity=50, uses='For pain relief', price=9.99, expiration_date='2025-06-30')

    def test_inventory_list_view(self):
        response = self.client.get(reverse('inventory_list'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Aspirin')
        self.assertContains(response, 'Ibuprofen')

    def test_inventory_list_view_with_search(self):
        response = self.client.get(reverse('inventory_list') + '?q=Aspirin')
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Aspirin')
        self.assertNotContains(response, 'Ibuprofen')

class InventoryCreateViewTest(TestCase):

    def test_inventory_create_view(self):
        response = self.client.post(reverse('inventory_create'), {
            'name': 'Paracetamol',
            'uses': 'For fever',
            'quantity': 150,
            'price': 29.99,
            'expiration_date': '2026-01-01'
        })
        self.assertEqual(response.status_code, 302) 
        self.assertRedirects(response, reverse('inventory_list'))
        self.assertEqual(InventoryItem.objects.count(), 1)
        self.assertEqual(InventoryItem.objects.first().name, 'Paracetamol')

class InventoryUpdateViewTest(TestCase):

    def setUp(self):
        self.item = InventoryItem.objects.create(
            name='Aspirin',
            uses='For headaches',
            quantity=100,
            price=19.99,
            expiration_date='2025-12-31'
        )

    def test_inventory_update_view(self):
        response = self.client.post(reverse('inventory_update', kwargs={'pk': self.item.pk}), {
            'name': 'Aspirin 500mg',
            'uses': 'For severe headaches',
            'quantity': 200,
            'price': 25.99,
            'expiration_date': '2026-01-01'
        })
        self.assertEqual(response.status_code, 302)  
        self.assertRedirects(response, reverse('inventory_list'))
        self.item.refresh_from_db() 
        self.assertEqual(self.item.name, 'Aspirin 500mg')
        self.assertEqual(self.item.quantity, 200)

class InventoryDeleteViewTest(TestCase):

    def setUp(self):
        self.item = InventoryItem.objects.create(
            name='Aspirin',
            uses='For headaches',
            quantity=100,
            price=19.99,
            expiration_date='2025-12-31'
        )

    def test_inventory_delete_view(self):
        response = self.client.post(reverse('inventory_delete', kwargs={'pk': self.item.pk}))
        self.assertEqual(response.status_code, 302)  
        self.assertRedirects(response, reverse('inventory_list'))
        self.assertEqual(InventoryItem.objects.count(), 0)