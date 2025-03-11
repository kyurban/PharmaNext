from django.urls import path
from . import views

urlpatterns = [
    path('', views.inventory_list, name='inventory_list'),  # Display all items
    path('create/', views.inventory_create, name='inventory_create'),  # Add a new item
    path('update/<int:pk>/', views.inventory_update, name='inventory_update'),  # Update an existing item
    path('delete/<int:pk>/', views.inventory_delete, name='inventory_delete'),  # Delete an item
]