from rest_framework import serializers
from api.models import User

class QuestionSerializer(serializers.ModelSerializer):
  class Meta:
    model = User
    fields = ('age', 'gender')
