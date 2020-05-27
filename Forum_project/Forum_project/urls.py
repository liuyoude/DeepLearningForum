"""Forum_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings

from DeepLearningForum.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),
    path('login/', login, name='login'),
    path('register/', register, name='register'),
    path('logout/', logout, name='logout'),
    path('write/', write, name='write'),
    path('article/<int:id>/', article, name='article'),
    path('tag/<int:id>/', tag, name='tag'),
    path('category/<int:id>/', category, name='category'),
    path('delete_article/<int:article_id>/', delete_article, name='delete_article'),
    path('is_like/', is_like, name='is_like'),
    path('comment_is_like/', comment_is_like, name='comment_is_like'),
    path('article_comments/<int:id>/', article_comments, name='article_comments'),
    path('comment_article/<int:article_id>/<int:user_id>/', comment_article, name='comment_article'),
    path('pcomment/<int:comment_id>/<int:user_id>/', pcomment, name='pcomment'),
    path('comment_sort/<int:id>/', comment_sort, name='comment_sort'),
    path('delete_comment/<int:comment_id>/', delete_comment, name='delete_comment'),
    path('follow_user/', follow_user, name='follow_user'),
    path('personal_show/<int:user_id>/', personal_show, name='personal_show'),
    path('set_info/', set_info, name='set_info'),
    path('search_articles/', search, name='search'),
]

# urlpatterns += static(settings.STATIC_URL, document_root=settings.STATICFILES_DIRS)
