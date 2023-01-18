from rest_framework import serializers

from .models import user


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = user
        fields = [
            'email',
            'pw'
    ]