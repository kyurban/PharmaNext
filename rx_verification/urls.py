from django.urls import path
from . import views

urlpatterns = [
    path("", views.verification_list, name="verification_list"),
    path("verfication/<int:pk>/", views.verification_detail, name="verification_detail"),
]