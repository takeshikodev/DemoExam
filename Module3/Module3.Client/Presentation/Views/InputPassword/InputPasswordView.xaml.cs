using System.Windows;
using System.Windows.Controls;
using Module3.Client.Models;
using Module3.Client.Presentation.Views.AdminPanel;
using Module3.Client.Presentation.Views.Navigation;
using Module3.Client.Presentation.Views.UserPanel;

namespace Module3.Client.Presentation.Views.InputPassword;

public partial class InputPasswordView : Page
{
    private readonly User _user;
    
    public InputPasswordView(User user)
    {
        _user = user;
        
        InitializeComponent();
    }

    private void InputPasswordBtn_OnClick(object sender, RoutedEventArgs e)
    {
        var newPassword = NewPasswordTxt.Password.Trim();
        var repeatNewPassword = RepeatNewPasswordTxt.Password.Trim();

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

        var dbContext = new DbContext();

        _user.Password = newPassword;
        dbContext.Users.Update(_user);
        dbContext.SaveChanges();
            
        MessageBox.Show("Вы успешно установили пароль!", "Успешное изменение пароля!", MessageBoxButton.OK, MessageBoxImage.Information);
        
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

    private void InputPasswordView_OnLoaded(object sender, RoutedEventArgs e)
    {
        NewPasswordTxt.Focus();
    }
}