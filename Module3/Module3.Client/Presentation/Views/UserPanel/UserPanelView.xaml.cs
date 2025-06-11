using System.Windows;
using System.Windows.Controls;
using Module3.Client.Models;
using Module3.Client.Presentation.Views.ChangePassword;
using Module3.Client.Presentation.Views.Login;
using Module3.Client.Presentation.Views.Navigation;

namespace Module3.Client.Presentation.Views.UserPanel;

public partial class UserPanelView : Page
{
    private readonly User _user;
    
    public UserPanelView(User user)
    {
        _user = user;
        
        InitializeComponent();
    }

    private void QuitBtn_OnClick(object sender, RoutedEventArgs e)
    {
        NavigationView.NavFrame?.Navigate(new LoginView());
    }

    private void ChangePasswordBtn_OnClick(object sender, RoutedEventArgs e)
    {
        NavigationView.NavFrame?.Navigate(new ChangePasswordView(_user));
    }
}