from django.db import models

# Create your models here.
class User(models.Model):
  age = models.IntegerField()
  gender = models.CharField(max_length=4)