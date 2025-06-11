using System.Windows;
using System.Windows.Controls;
using Module3.Client.Models;
using Module3.Client.Presentation.Views.AdminPanel;
using Module3.Client.Presentation.Views.Navigation;
using Module3.Client.Presentation.Views.UserPanel;

namespace Module3.Client.Presentation.Views.ChangePassword;

public partial class ChangePasswordView : Page
{
    private readonly User _user;
    
    public ChangePasswordView(User user)
    {
        _user = user;
        
        InitializeComponent();
    }

    private void ChangePasswordBtn_OnClick(object sender, RoutedEventArgs e)
    {
        var oldPassword = OldPasswordTxt.Password.Trim();
        var newPassword = NewPasswordTxt.Password.Trim();
        var repeatNewPassword = RepeatNewPasswordTxt.Password.Trim();

        if (string.IsNullOrEmpty(oldPassword))
        {
            OldPasswordTxt.Focus();
            return;
        }

        if (string.IsNullOrEmpty(newPassword))
        {
            NewPasswordTxt.Focus();
            return;
        }

        if (string.IsNullOrEmpty(repeatNewPassword))
        {
            RepeatNewPasswordTxt.Focus();
            return;
        }

        if (!repeatNewPassword.Equals(newPassword))
        {
            RepeatNewPasswordTxt.Focus();
            return;
        }

        if (_user.Password != oldPassword)
        {
            MessageBox.Show("", "Произошла ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
        }
        
        var dbContext = new DbContext();

        _user.Password = newPassword;
        dbContext.Users.Update(_user);
        dbContext.SaveChanges();
            
        MessageBox.Show("Вы успешно изменили пароль!", "Успешное изменение пароля!", MessageBoxButton.OK, MessageBoxImage.Information);
        
        switch (_user.RoleId)
        {
            case 1:
                NavigationView.NavFrame?.Navigate(new AdminPanelView(_user));
                break;
            case 2:
                NavigationView.NavFrame?.Navigate(new UserPanelView(_user));
                break;
        }
    }

    private void QuitBtn_OnClick(object sender, RoutedEventArgs e)
    {
        NavigationView.NavFrame?.GoBack();
    }

    private void ChangePasswordView_OnLoaded(object sender, RoutedEventArgs e)
    {
        OldPasswordTxt.Focus();
    }
}