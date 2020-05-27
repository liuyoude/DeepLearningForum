from django import template
register = template.Library()

@register.filter(name='is_follow')
def is_follow(follows, article_author):
    for follow in follows:
        if follow.followed_id.id == article_author.id:
            return True
    return False
@register.filter(name='follow_num')
def follow_num(follows):
    return len(follows)
@register.filter(name='str_len')
def str_len(username):
    if len(username) > 4:
        return True
    else:
        return False