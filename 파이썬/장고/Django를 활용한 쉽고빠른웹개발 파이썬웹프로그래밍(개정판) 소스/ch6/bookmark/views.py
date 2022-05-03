from django.views.generic import ListView, DetailView
from bookmark.models import Bookmark


class BookmarkLV(ListView):
    model = Bookmark

class BookmarkDV(DetailView):
    model = Bookmark

