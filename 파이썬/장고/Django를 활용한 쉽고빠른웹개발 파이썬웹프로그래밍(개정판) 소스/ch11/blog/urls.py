from django.urls import path, re_path
from blog import views


app_name = 'blog'
urlpatterns = [

    # Example: /blog/
    path('', views.PostLV.as_view(), name='index'),

    # Example: /blog/post/ (same as /blog/)
    path('post/', views.PostLV.as_view(), name='post_list'),

    # Example: /blog/post/django-example/
    re_path(r'^post/(?P<slug>[-\w]+)/$', views.PostDV.as_view(), name='post_detail'),

    # Example: /blog/archive/
    path('archive/', views.PostAV.as_view(), name='post_archive'),

    # Example: /blog/archive/2019/
    path('archive/<int:year>/', views.PostYAV.as_view(), name='post_year_archive'),

    # Example: /blog/archive/2019/nov/
    path('archive/<int:year>/<str:month>/', views.PostMAV.as_view(), name='post_month_archive'),

    # Example: /blog/archive/2019/nov/10/
    path('archive/<int:year>/<str:month>/<int:day>/', views.PostDAV.as_view(), name='post_day_archive'),

    # Example: /blog/archive/today/
    path('archive/today/', views.PostTAV.as_view(), name='post_today_archive'),

    # Example: /blog/tag/
    path('tag/', views.TagCloudTV.as_view(), name='tag_cloud'),

    # Example: /blog/tag/tagname/
    path('tag/<str:tag>/', views.TaggedObjectLV.as_view(), name='tagged_object_list'),

    # Example: /blog/search/
    path('search/', views.SearchFormView.as_view(), name='search'),

    # Example: /blog/add/
    path('add/',
         views.PostCreateView.as_view(), name="add",
    ),

    # Example: /blog/change/
    path('change/',
         views.PostChangeLV.as_view(), name="change",
    ),

    # Example: /blog/99/update/
    path('<int:pk>/update/',
         views.PostUpdateView.as_view(), name="update",
    ),

    # Example: /blog/99/delete/
    path('<int:pk>/delete/',
         views.PostDeleteView.as_view(), name="delete",
    ),
]

