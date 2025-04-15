from django.shortcuts import render, redirect
from .models import InventoryItem
from .forms import InventoryItemForm

# Displays all inventory items
def inventory_list(request):
    items = InventoryItem.objects.all()
    return render(request, 'inventory_list.html', {'items': items})

# Displays a form for adding a new inventory item
def inventory_create(request):
    if request.method == 'POST':
        form = InventoryItemForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('inventory_list')
    else:
        form = InventoryItemForm()
    return render(request, 'inventory_form.html', {'form': form})

# Displays a form for updating an existing inventory item
def inventory_update(request, pk):
    item = InventoryItem.objects.get(pk=pk)
    if request.method == 'POST':
        form = InventoryItemForm(request.POST, instance=item)
        if form.is_valid():
            form.save()
            return redirect('inventory_list')
    else:
        form = InventoryItemForm(instance=item)
    return render(request, 'inventory_form.html', {'form': form})

# Deletes an inventory item
def inventory_delete(request, pk):
    item = InventoryItem.objects.get(pk=pk)
    if request.method == 'POST':
        item.delete()
        return redirect('inventory_list')
    return render(request, 'inventory_confirm_delete.html', {'item': item})

# Displays searched inventory items
def inventory_list(request):
    query = request.GET.get('q', '')
    if query:
        items = InventoryItem.objects.filter(name__icontains=query)
    else:
        items = InventoryItem.objects.all()
    return render(request, 'inventory_list.html', {'items': items})
