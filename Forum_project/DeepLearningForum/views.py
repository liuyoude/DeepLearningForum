from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.hashers import make_password, check_password
from django.contrib.auth import login as Django_login
from django.db.models import Q
from django.core.paginator import Paginator, InvalidPage, EmptyPage, PageNotAnInteger
import django.core.validators as validators
import logging
import re
import os
import datetime

from .models import User, Article, Tag, Category, Comment, Follow
from .forms import *
from Forum_project.settings import STATICFILES_DIRS

# 日志记录器
logger = logging.getLogger("console")

# Create your views here.
def index(request):
    try:
        if 'is_active' in request.session.keys():
            if request.session['is_active']:
                user = User.objects.filter(id=request.session['user_id'])[0]
                follows = Follow.objects.filter(follower_id=user.id)
        categorys = Category.objects.all()
        # 主页文章
        articles = Article.objects.all()
        # 高赞文章
        highlike_articles = articles.order_by('-like_num')[:5]
        # 热评文章
        hot_articles = articles.order_by('-comment_num')[:5]
        # 分页
        paginator = Paginator(articles, 6)
        try:
            page = int(request.GET.get('page', 1))
            articles = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            articles = paginator.page(1)
        # 推荐文章
        recommend_articles = None
        day = 1
        while recommend_articles is None:
            now_time = datetime.datetime.now()
            delta = datetime.timedelta(days=day)
            before_time = now_time - delta
            recommend_articles = Article.objects.filter(time__range=(before_time, now_time)).order_by('-like_num', '-comment_num')[:5]
            day += 1
        tags = Tag.objects.all()
        if len(articles) > 0:
            request.session['have_articles'] = True
        else:
            request.session['have_articles'] = False
        request.session['tag_id'] = None
        request.session['category_id'] = None
        request.session['to_position'] = True
        request.session['to_personal'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'DeepLearningForum/index.html', locals())

# 显示相关标签文章
def tag(request, id):
    try:
        tag = Tag.objects.filter(id=id)[0]
        request.session['tag_id'] = id
        if request.session['is_active']:
            user = User.objects.filter(id=request.session['user_id'])[0]
            follows = Follow.objects.filter(follower_id=user.id)
        categorys = Category.objects.all()
        tags = Tag.objects.all()
        if request.session['category_id']:
            show_category = Category.objects.filter(id=request.session['category_id'])[0]
            articles = tag.article_set.filter(category_id=request.session['category_id'])
        else:
            articles = tag.article_set.all()
        highlike_articles = articles.order_by('-like_num')[:5]
        hot_articles = articles.order_by('-comment_num')[:5]
        # 推荐文章
        recommend_articles = None
        day = 1
        while recommend_articles is None:
            now_time = datetime.datetime.now()
            delta = datetime.timedelta(days=day)
            before_time = now_time - delta
            recommend_articles = Article.objects.filter(time__range=(before_time, now_time)).order_by('-like_num','-comment_num')[:5]
            day += 1
        # 分页
        paginator = Paginator(articles, 6)
        try:
            page = int(request.GET.get('page', 1))
            articles = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            articles = paginator.page(1)
        if len(articles) > 0:
            request.session['have_articles'] = True
        else:
            request.session['have_articles'] = False
        request.session['to_position'] = False
        request.session['to_personal'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'DeepLearningForum/index.html', locals())
# 显示相关类别文章
def category(request, id):
    try:
        if request.session['is_active']:
            user = User.objects.filter(id=request.session['user_id'])[0]
            follows = Follow.objects.filter(follower_id=user.id)
        show_category = Category.objects.filter(id=id)[0]
        articles = Article.objects.filter(category_id=id)
        highlike_articles = articles.order_by('-like_num')[:5]
        hot_articles = articles.order_by('-comment_num')[:5]
        # 推荐文章
        recommend_articles = None
        day = 1
        while recommend_articles is None:
            now_time = datetime.datetime.now()
            delta = datetime.timedelta(days=day)
            before_time = now_time - delta
            recommend_articles = Article.objects.filter(time__range=(before_time, now_time)).order_by('-like_num','-comment_num')[:5]
            day += 1
        # 分页
        paginator = Paginator(articles, 6)
        try:
            page = int(request.GET.get('page', 1))
            articles = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            articles = paginator.page(1)
        categorys = Category.objects.all()
        tags = Tag.objects.all()
        if len(articles) > 0:
            request.session['have_articles'] = True
        else:
            request.session['have_articles'] = False
        request.session['category_id'] = id
        request.session['tag_id'] = None
        request.session['to_position'] = False
        request.session['to_personal'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'DeepLearningForum/index.html', locals())
# 删除文章
def delete_article(request, article_id):
    try:
        article = Article.objects.filter(id=article_id)[0]
        article.delete()
        if request.session['to_personal']:
            return redirect('personal_show', request.session['user_id'])
    except Exception as e:
        logger.error(e)
    return redirect('index')
# 查询
def search(request):
    try:
        if 'is_active' in request.session.keys():
            if request.session['is_active']:
                user = User.objects.filter(id=request.session['user_id'])[0]
                follows = Follow.objects.filter(follower_id=user.id)
        categorys = Category.objects.all()
        articles = Article.objects.all()
        highlike_articles = articles.order_by('-like_num')
        if len(highlike_articles) > 5:
            highlike_articles = highlike_articles[:5]
        hot_articles = articles.order_by('-comment_num')
        if len(hot_articles) > 5:
            hot_articles = hot_articles[:5]
        tags = Tag.objects.all()
        # 查询
        keywords = request.POST.get('search_articles')
        articles = Article.objects.filter(
            Q(title__icontains=keywords)|Q(author__username__icontains=keywords)|Q(desc__icontains=keywords)|Q(content__icontains=keywords)|Q(tag__name__icontains=keywords)
        )

        if len(articles) > 0:
            request.session['have_articles'] = True
        else:
            request.session['have_articles'] = False
        request.session['tag_id'] = None
        request.session['category_id'] = None
        request.session['to_position'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'DeepLearningForum/index.html', locals())
# 关注他人
def follow_user(request):
    re_dict = {
        'msg': 'success!'
    }
    try:
        follower_id = request.POST.get('follower_id')
        followed_id = request.POST.get('followed_id')
        if request.POST.get('is_follow') == 'follow':
            follow = Follow.objects.create(
                followed_id_id=followed_id,
                follower_id_id=follower_id,
            )
            follower = User.objects.filter(id=follower_id)[0]
            followed = User.objects.filter(id=followed_id)[0]
            follow.follower_id = follower
            follow.followed_id = followed
            follow.save()
            follower.followed_num += 1
            followed.follower_num += 1
            follower.save()
            followed.save()
        elif request.POST.get('is_follow') == 'unfollow':
            follow = Follow.objects.filter(followed_id=followed_id, follower_id=follower_id)
            follow.delete()
            follower = User.objects.filter(id=follower_id)[0]
            followed = User.objects.filter(id=followed_id)[0]
            follower.followed_num -= 1
            followed.follower_num -= 1
            follower.save()
            followed.save()
    except Exception as e:
        logger.error(e)
    return JsonResponse(re_dict)
# Login
def is_login_valid(res_form):
    if validateEmail(res_form.data['email']) is False:
        return '邮箱格式不正确(꒪Д꒪)ノ'
    return True
def is_login(res_form):
    user = User.objects.filter(email=res_form.data['email'])
    if user is None:
        return '邮箱未注册(꒪Д꒪)ノ'
    else:
        print(make_password(res_form.data['password']))
        print(user[0].password)
        if check_password(res_form.data['password'], user[0].password) is not True:
            return '密码错误(꒪Д꒪)ノ'
    return True
def login(request):
    try:
        if request.method == 'POST':
            res_form = RegForm(request.POST)
            msg = is_login_valid(res_form)
            if msg is True:
                msg = is_login(res_form)
                if msg is True:
                    user = User.objects.filter(email=res_form.data['email'])[0]
                    user.backend = 'django.contrib.auth.backends.ModelBackend'
                    Django_login(request, user)
                    request.session['is_active'] = True
                    request.session['user_id'] = user.id
                    return redirect('index')
                else:
                    contnets = {'msg': msg, 'fail': True, 'res_form': res_form}
                    return render(request, 'Log/login.html', contnets)
            else:
                contnets = {'msg': msg, 'fail': True, 'res_form': res_form}
                return render(request, 'Log/login.html', contnets)
        else:
            res_form = RegForm()
    except Exception as e:
        logger.error(e)
    return render(request, 'Log/login.html', locals())

# register
# 验证邮箱格式
def validateEmail(email):
    if len(email) > 7:
        if re.match("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$", email) != None:
            return True
    return False
# 验证表单格式
def is_valid(res_form):
    if len(res_form.data['username']) > 20:
        return '用户名过长(꒪Д꒪)ノ'
    if validateEmail(res_form.data['email']) is False:
        return '邮箱格式不正确(꒪Д꒪)ノ'
    if len(res_form.data['password']) > 30:
        return '密码长度过长(꒪Д꒪)ノ'
    if res_form.data['password'] != res_form.data['repassword']:
        return '重复密码不一致(꒪Д꒪)ノ'
    return True
# 验证插入数据库数据
def is_insert(res_form):
    same_name_user = User.objects.filter(username=res_form.data['username'])
    same_email_user = User.objects.filter(email=res_form.data['email'])
    if same_name_user:
        return '用户名已存在っﾟДﾟ)っ'
    if same_email_user:
        return '邮箱已被注册っﾟДﾟ)っ'
    if res_form.data['password'] != res_form.data['repassword']:
        return '重复密码错误っﾟДﾟ)っ'
    return True
def register(request):
    try:
        if request.method == 'POST':
            res_form = RegForm(request.POST)
            msg = is_valid(res_form)
            print(msg)
            if msg is True:
                msg = is_insert(res_form)
                if msg is True:
                    user = User.objects.create(
                        username=res_form.data['username'],
                        email=res_form.data['email'],
                        password=make_password(res_form.data['password']),
                    )
                    user.save()
                    # 自动登录
                    user.backend = 'django.contrib.auth.backends.ModelBackend'
                    Django_login(request, user)
                    request.session['is_active'] = True
                    request.session['user_id'] = user.id
                    return redirect('index')
                else:
                    print(msg)
                    contnets = {'msg': msg, 'fail': True, 'res_form': res_form}
                    return render(request, 'Log/register.html', contnets)
            else:
                print(msg)
                contnets = {'msg': msg, 'fail': True, 'res_form': res_form}
                return render(request, 'Log/register.html', contnets)

        else:
            res_form = RegForm()
    except Exception as e:
        logger.error(e)
    return render(request, 'Log/register.html', locals())

# Logout
def logout(request):
    request.session['is_active'] = False
    return redirect('index')

# 写文章
def is_article(request):
    if request.POST.get('title') == '':
        return '请填写文章标题'
    if request.POST.get('desc') == '':
        return '请填写文章简介'
    if request.POST.get('imagelabels') == '' and request.POST.get('newtext') == '':
        return '至少为文章添加一个标签'
    if len(request.POST.get('text')) <= 40:
        return '正文至少需要编辑20个字'
    return True
def write(request):
    try:
        categorys = Category.objects.all()
        tags = Tag.objects.all()
        tags = tags[:33]
        if request.method == 'POST':
            msg = is_article(request)
            if msg is True:
                # 添加文章的作者、类别外键
                user_id = request.session['user_id']
                user = User.objects.filter(id=user_id)[0]
                category = Category.objects.filter(name=request.POST.get('category'))[0]
                category_id = category.id

                article = Article.objects.create(
                    title=request.POST.get('title'),
                    desc=request.POST.get('desc'),
                    content=request.POST.get('html'),
                    author_id=user_id,
                    category_id=category_id,
                )
                article.author = user
                article.category = category
                article.save()
                # 添加文章与已有标签的多对多关系
                old_id_tags = request.POST.get('imagelabels').split(',')
                for i in range(len(old_id_tags) - 1):
                    old_tag = Tag.objects.filter(id=old_id_tags[i])[0]
                    article.tag.add(old_tag)
                # 加入新标签, 并增加文章-标签 多对多关系
                new_name_tags = request.POST.get('newtext').split(',')
                for i in range(len(new_name_tags)-1):
                    new_name_tag = new_name_tags[i]
                    tags = Tag.objects.filter(name=new_name_tag)
                    if len(tags) == 0:
                        new_tag = Tag.objects.create(name=new_name_tag)
                        new_tag.save()
                        article.tag.add(new_tag)
                return redirect('index')
            else:
                title = request.POST.get('title')
                desc = request.POST.get('desc')
                html = request.POST.get('html')
                text = request.POST.get('text')
                fail = True
                return render(request, 'Article/write.html', locals())
    except Exception as e:
        logger.error(e)
    return render(request, 'Article/write.html', locals())
# 显示文章
def article(request, id):
    try:
        if 'is_active' in request.session.keys():
            if request.session['is_active']:
                user = User.objects.filter(id=request.session['user_id'])[0]
        request.session['to_position'] = False
        request.session['to_position_comment_id'] = False
        request.session['comment_sort'] = 1
        categorys = Category.objects.all()
        comments = Comment.objects.filter(article_id=id)
        # 分页
        paginator = Paginator(comments, 6)
        try:
            page = int(request.GET.get('page', 1))
            comments = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            comments = paginator.page(1)
        article = Article.objects.filter(id=id)[0]
        if article.comment_num > 0:
            request.session['have_comments'] = True
        else:
            request.session['have_comments'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'Article/article.html', locals())
# 跳转到文章评论处
def article_comments(request, id):
    try:
        if 'is_active' in request.session.keys():
            if request.session['is_active']:
                user = User.objects.filter(id=request.session['user_id'])[0]
        request.session['to_position'] = True
        request.session['to_position_comment_id'] = False
        request.session['comment_sort'] = 1
        categorys = Category.objects.all()
        comments = Comment.objects.filter(article_id=id)
        # 分页
        paginator = Paginator(comments, 6)
        try:
            page = int(request.GET.get('page', 1))
            comments = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            comments = paginator.page(1)
        article = Article.objects.filter(id=id)[0]
        if article.comment_num > 0:
            request.session['have_comments'] = True
        else:
            request.session['have_comments'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'Article/article.html', locals())
# 评论文章
def comment_article(request, article_id, user_id):
    try:
        if len(request.POST.get('html')) > 0:
            user = User.objects.filter(id=user_id)[0]
            c_article = Article.objects.filter(id=article_id)[0]
            comment = Comment.objects.create(
                content=request.POST.get('html'),
                user_id=user_id,
                article_id=article_id,
            )
            comment.user = user
            comment.article = c_article
            comment.save()
            c_article.comment_num += 1
            c_article.save()
        else:
            msg = '评论不能为空(((;꒪ꈊ꒪;)))'

        if 'is_active' in request.session.keys():
            if request.session['is_active']:
                user = User.objects.filter(id=request.session['user_id'])[0]
        request.session['to_position'] = True
        request.session['to_position_comment_id'] = False
        request.session['comment_sort'] = 1
        categorys = Category.objects.all()
        comments = Comment.objects.filter(article_id=article_id)
        # 分页
        paginator = Paginator(comments, 6)
        try:
            page = int(request.GET.get('page', 1))
            comments = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            comments = paginator.page(1)
        article = Article.objects.filter(id=article_id)[0]
        if article.comment_num > 0:
            request.session['have_comments'] = True
        else:
            request.session['have_comments'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'Article/article.html', locals())
# 子评论
def pcomment(request, comment_id, user_id):
    try:
        if len(request.POST.get('pcomment')) > 0:
            user = User.objects.filter(id=user_id)[0]
            comment = Comment.objects.filter(id=comment_id)[0]
            c_article = comment.article
            article_id = c_article.id
            p_comment = Comment.objects.create(
                content=request.POST.get('pcomment'),
                user_id=user_id,
                article_id=article_id,
                pid_id=comment_id,
            )
            comment.user = user
            comment.article = c_article
            p_comment.pid = comment
            comment.save()
            c_article.comment_num += 1
            c_article.save()
            comment.comment_num += 1
            comment.save()
        else:
            msg = '评论不能为空(((;꒪ꈊ꒪;)))'

        if 'is_active' in request.session.keys():
            if request.session['is_active']:
                user = User.objects.filter(id=request.session['user_id'])[0]
        request.session['to_position_comment_id'] = comment_id
        request.session['comment_sort'] = 1
        categorys = Category.objects.all()
        comment = Comment.objects.filter(id=comment_id)[0]
        article = comment.article
        comments = Comment.objects.filter(article_id=article.id)
        # 分页
        paginator = Paginator(comments, 6)
        try:
            page = int(request.GET.get('page', 1))
            comments = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            comments = paginator.page(1)
        if article.comment_num > 0:
            request.session['have_comments'] = True
        else:
            request.session['have_comments'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'Article/article.html', locals())
# 评论排序
def comment_sort(request, id):
    try:
        if 'is_active' in request.session.keys():
            if request.session['is_active']:
                user = User.objects.filter(id=request.session['user_id'])[0]
        request.session['to_position'] = True
        request.session['to_position_comment_id'] = False
        categorys = Category.objects.all()
        if request.session['comment_sort'] == 2:
            comments = Comment.objects.filter(article_id=id)
            request.session['comment_sort'] = 1
        else:
            comments = Comment.objects.filter(article_id=id).order_by('-like_num', '-comment_num')
            request.session['comment_sort'] = 2
        # 分页
        paginator = Paginator(comments, 6)
        try:
            page = int(request.GET.get('page', 1))
            comments = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            comments = paginator.page(1)
        article = Article.objects.filter(id=id)[0]
        if article.comment_num > 0:
            request.session['have_comments'] = True
        else:
            request.session['have_comments'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'Article/article.html', locals())
# 删除评论
def delete_comment(request, comment_id):
    try:
        if 'is_active' in request.session.keys():
            if request.session['is_active']:
                user = User.objects.filter(id=request.session['user_id'])[0]
        if request.session['to_position_comment_id']:
            request.session['to_position'] = False
        else:
            request.session['to_position'] = True
        categorys = Category.objects.all()
        comment = Comment.objects.filter(id=comment_id)[0]
        article = comment.article
        if comment.pid:
            sg_comment = comment.pid
            sg_comment.comment_num -= 1
            article.comment_num -= 1
            sg_comment.save()
            article.save()
        else:
            article.comment_num -= 1
            article.comment_num -= comment.comment_num
            article.save()
        comment.delete()
        comments = Comment.objects.filter(article_id=article.id)
        # 分页
        paginator = Paginator(comments, 6)
        try:
            page = int(request.GET.get('page', 1))
            comments = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            comments = paginator.page(1)
        if article.comment_num > 0:
            request.session['have_comments'] = True
        else:
            request.session['have_comments'] = False
    except Exception as e:
        logger.error(e)
    return render(request, 'Article/article.html', locals())
# 点赞功能
def is_like(request):
    re_dict = {
        'msg': 'success!'
    }
    try:
        print(request.POST.get('like'))
        if request.POST.get('like') == 'is_like':
            article = Article.objects.filter(id=request.POST.get('article_id'))[0]
            article.like_num += 1
            article.save()
            like_num = article.like_num
            re_dict = {
                'like_num': like_num,
            }
        elif request.POST.get('like') == 'no_like':
            article = Article.objects.filter(id=request.POST.get('article_id'))[0]
            article.like_num -= 1
            article.save()
            like_num = article.like_num
            re_dict = {
                'like_num': like_num,
            }
    except Exception as e:
        logger.error(e)
    return JsonResponse(re_dict)
def comment_is_like(request):
    re_dict = {
        'msg': 'success!'
    }
    try:
        print(request.POST.get('like'))
        if request.POST.get('like') == 'is_like':
            comment = Comment.objects.filter(id=request.POST.get('sg_comment_id'))[0]
            comment.like_num += 1
            comment.save()
            like_num = comment.like_num
            re_dict = {
                'like_num': like_num,
            }
        elif request.POST.get('like') == 'no_like':
            comment = Comment.objects.filter(id=request.POST.get('sg_comment_id'))[0]
            comment.like_num -= 1
            comment.save()
            like_num = comment.like_num
            re_dict = {
                'like_num': like_num,
            }
    except Exception as e:
        logger.error(e)
    return JsonResponse(re_dict)

# 个人主页
def personal_show(request, user_id):
    try:
        if 'is_active' in request.session.keys():
            if request.session['is_active']:
                myself = User.objects.filter(id=request.session['user_id'])[0]
                follows = Follow.objects.filter(follower_id=myself.id)
        user = User.objects.filter(id=user_id)[0]
        followed = Follow.objects.filter(follower_id_id=user_id)
        follower = Follow.objects.filter(followed_id_id=user_id)
        articles = Article.objects.filter(author_id=user_id)
        # 分页
        paginator = Paginator(articles, 6)
        try:
            page = int(request.GET.get('page', 1))
            articles = paginator.page(page)
        except (InvalidPage, EmptyPage, PageNotAnInteger):
            articles = paginator.page(1)
        if len(articles) > 0:
            request.session['have_articles'] = True
        else:
            request.session['have_articles'] = False
        request.session['to_set'] = False
        request.session['to_personal'] = True
    except Exception as e:
        logger.error(e)
    return render(request, 'userShow/show.html', locals())
# 修改个人信息
def set_info(request):
    try:
        myself = User.objects.filter(id=request.session['user_id'])[0]
        follows = Follow.objects.filter(follower_id=myself.id)
        user = User.objects.filter(id=myself.id)[0]
        followed = Follow.objects.filter(follower_id_id=myself.id)
        follower = Follow.objects.filter(followed_id_id=myself.id)
        articles = Article.objects.filter(author_id=myself.id)
        if len(articles) > 0:
            request.session['have_articles'] = True
        else:
            request.session['have_articles'] = False
        request.session['to_set'] = True
        if request.method == 'POST':
            new_img = request.FILES.get('new_img')
            desc = request.POST.get('desc')
            password = request.POST.get('password')
            if new_img:
                myself.avatar = new_img
            if desc:
                myself.desc = desc
            if password:
                myself.password = make_password(password)
            myself.save()
            user = User.objects.filter(id=myself.id)[0]
    except Exception as e:
        logger.error(e)
    return render(request, 'userShow/show.html', locals())