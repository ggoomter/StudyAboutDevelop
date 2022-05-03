from django.db import models
from django.urls import reverse

from photo.fields import ThumbnailImageField


class Album(models.Model):
    name = models.CharField('NAME', max_length=30)
    description = models.CharField('One Line Description', max_length=100, blank=True)
    owner = models.ForeignKey('auth.User', on_delete=models.CASCADE, verbose_name='OWNER', blank=True, null=True)

    class Meta:
        ordering = ('name',)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('photo:album_detail', args=(self.id,))


class Photo(models.Model):
    album = models.ForeignKey(Album, on_delete=models.CASCADE)
    title = models.CharField('TITLE', max_length=30)
    description = models.TextField('Photo Description', blank=True)
    image = ThumbnailImageField('IMAGE', upload_to='photo/%Y/%m')
    upload_dt = models.DateTimeField('UPLOAD DATE', auto_now_add=True)
    owner = models.ForeignKey('auth.User', on_delete=models.CASCADE, verbose_name='OWNER', blank=True, null=True)

    class Meta:
        ordering = ('title',)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('photo:photo_detail', args=(self.id,))


# Album:Publication = N:N
class Publication(models.Model):
    title = models.CharField(max_length=30)
    albums = models.ManyToManyField(Album)


# Place:Restaurant = 1:1
class Place(models.Model):
    name = models.CharField(max_length=50)
    address = models.CharField(max_length=80)

    def __str__(self):
        return f"Place-{self.name}"


class Restaurant(models.Model):
    place = models.OneToOneField(Place, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    serves_pizza = models.BooleanField(default=False)

    def __str__(self):
        return f"Restaurant-{self.name}"

