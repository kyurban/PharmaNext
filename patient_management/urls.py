from django.urls import path
from . import views

urlpatterns = [
    path('', views.search_patient, name='search_patient'), # Display patient by last name, first name, and dob
    path('create/', views.patient_create, name='patient_create'),  # Add a new patient
    path('update/<int:pk>/', views.patient_update, name='patient_update'),  # Update an existing patient profile
    path('delete/<int:pk>/', views.patient_delete, name='patient_delete'),  # Delete a patient profile
]