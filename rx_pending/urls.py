from django.urls import path
from . import views

urlpatterns = [
    path("", views.pending_list, name="pending_list"),
    path("pending/<int:pk>/", views.pending_detail, name="pending_detail"),
    path("pending/<int:pk>/delete/", views.pending_delete, name="pending_delete"),
]