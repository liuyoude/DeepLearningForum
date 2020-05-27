from django import forms
from django.core.exceptions import ValidationError
import django.core.validators as validators

class RegForm(forms.Form):
    """
    注册表单
    """
    username = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'lowin-input', 'required': 'required'}),
        max_length=50, error_messages={'required': '用户名不能为空'})
    email = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'lowin-input', 'required': 'required'}),
        max_length=50, error_messages={'required': '邮箱不能为空'}, validators=[validators.EmailValidator(message='邮箱格式不正确')])
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'lowin-input', 'required': 'required'}),
        max_length=20, error_messages={'required': '密码不能为空'})
    repassword = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'lowin-input', 'required': 'required'}),
        max_length=20, error_messages={'required': '重复密码不能为空'})

    def __init__(self, *args, **kwargs):
        super(RegForm, self).__init__(*args, **kwargs)

    def clean(self):
        if self.cleaned_data.get('password') != self.cleaned_data.get('repassword'):
            raise ValidationError('密码不一致')
        else:
            return self.cleaned_data
