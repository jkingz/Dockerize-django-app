from rest_framework  import serializers

from users.models import UserAccount


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserAccount
        fields = '__all__'