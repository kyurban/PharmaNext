# Generated by Django 5.1.6 on 2025-03-11 18:28

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('inventory_management', '0001_initial'),
        ('patient_management', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Prescription',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sig', models.TextField(max_length=1000)),
                ('quantity', models.IntegerField()),
                ('status', models.CharField(choices=[('Pending', 'Pending'), ('In Production', 'In Production'), ('Verified', 'Verified')], default='Pending', max_length=20)),
                ('prescribed_by', models.CharField(max_length=100)),
                ('drug', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='inventory_management.inventoryitem')),
                ('patient', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='patient_management.patient')),
            ],
        ),
        migrations.CreateModel(
            name='QT',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('received_at', models.DateTimeField(auto_now_add=True)),
                ('prescription', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='rx_pending.prescription')),
            ],
        ),
    ]
