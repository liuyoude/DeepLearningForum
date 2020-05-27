from django.db import models
from django.contrib.auth.models import AbstractUser

from .storage import ImageStorage
# Create your models here.
# User(继承自带 AbstracterUser)
class User(AbstractUser):
    avatar = models.ImageField(max_length=200, upload_to='static/img/avatar/%Y/%m', default='static/img/avatar/default.png', verbose_name='用户头像', storage=ImageStorage())
    desc = models.CharField(max_length=50, verbose_name='个人简介', default="这个人很懒，还没有留下简介哦")
    follower_num = models.IntegerField(verbose_name="关注人数", default=0)
    followed_num = models.IntegerField(verbose_name="多少人关注", default=0)

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = '用户'
        verbose_name_plural = verbose_name
        ordering = ['-id']

# Tag
class Tag(models.Model):
    name = models.CharField(max_length=30, verbose_name='标签名称')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '标签'
        verbose_name_plural = verbose_name
        ordering = ['id']
# Category
class Category(models.Model):
    name = models.CharField(max_length=30, verbose_name='类别名称')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '分类'
        verbose_name_plural = verbose_name
        ordering = ['id']

# Article
class Article(models.Model):
    title = models.CharField(max_length=50, verbose_name='文章标题')
    desc = models.CharField(max_length=500, verbose_name='文章简介')
    content = models.TextField(verbose_name='文章内容')
    page_view = models.IntegerField(default=0, verbose_name='浏览量')
    like_num = models.IntegerField(default=0, verbose_name='点赞数')
    comment_num = models.IntegerField(default=0, verbose_name='评论数')
    time = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    category = models.ForeignKey(Category, verbose_name='分类', on_delete=models.CASCADE)
    author = models.ForeignKey(User, verbose_name='作者', on_delete=models.CASCADE)
    tag = models.ManyToManyField(Tag, verbose_name='标签')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = '文章'
        verbose_name_plural = verbose_name
        ordering = ['-time']

class Comment(models.Model):
    content = models.TextField(verbose_name='文章评论')
    like_num = models.IntegerField(default=0, verbose_name='点赞数')
    comment_num = models.IntegerField(default=0, verbose_name='评论数')
    time = models.DateTimeField(auto_now_add=True, verbose_name='评论时间')
    user = models.ForeignKey(User, verbose_name='用户', on_delete=models.CASCADE)
    article = models.ForeignKey(Article, verbose_name='文章', on_delete=models.CASCADE)
    pid = models.ForeignKey('self', verbose_name='父级评论', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = '评论'
        verbose_name_plural = verbose_name
        ordering = ['-time']

# Follow
class Follow(models.Model):
    followed_id = models.ForeignKey(User, related_name='followed_id', verbose_name='被关注者', on_delete=models.CASCADE)
    follower_id = models.ForeignKey(User, related_name='follower_id', verbose_name='关注者', on_delete=models.CASCADE)
    time = models.DateTimeField(auto_now_add=True, verbose_name='关注时间')

    class Meta:
        verbose_name = '关注'
        verbose_name_plural = verbose_name
        ordering = ['-time']
# User-Article
# class User_Article(models.Model):
#     author_id = models.ForeignKey(User, related_name='author_id', verbose_name='文章作者', on_delete=models.DO_NOTHING, null=True)
#     coauthor_id = models.ForeignKey(User, related_name='coauthor_id', verbose_name='共同作者', on_delete=models.DO_NOTHING, null=True)
#     article_id = models.ForeignKey(Article, verbose_name='文章', on_delete=models.DO_NOTHING, null=True)
#
#     class Meta:
#         verbose_name = '文章作者'
#         verbose_name_plural = verbose_name
