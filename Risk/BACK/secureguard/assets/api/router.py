from rest_framework.routers import DefaultRouter
from assets.api.views import AssetModelViewSet

router_asset = DefaultRouter()

router_asset.register(prefix="assets", basename="assets", viewset=AssetModelViewSet)