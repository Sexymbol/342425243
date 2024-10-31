from django.contrib import admin
from assets.models import Assets

# Register your models here.
@admin.register(Assets)
class AssetAdmin(admin.ModelAdmin):
    list_display = ['type','quantity','ubication']
    
