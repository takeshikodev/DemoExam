using Module3.Client.Models;
using Module3.Client.Presentation.Views.Navigation;
using System.Windows;
using System.Windows.Controls;
using Module3.Client.Presentation.Views.AdminPanel;
using Module3.Client.Presentation.Views.InputPassword;
using Module3.Client.Presentation.Views.UserPanel;

namespace Module3.Client.Presentation.Views.Login;

public partial class LoginView : Page
{
    private const int MaxLoginAttempts = 3;
    private readonly Dictionary<int, int> _loginAttempts = [];

    public LoginView()
    {
        InitializeComponent();
    }

    private void LoginBtn_OnClick(object sender, RoutedEventArgs e)
    {
        var login = LoginTxt.Text.Trim();
        var password = PasswordTxt.Password.Trim();

        if (string.IsNullOrEmpty(login))
        {
            LoginTxt.Focus();
            return;
        }

        if (string.IsNullOrEmpty(password))
        {
            PasswordTxt.Focus();
            return;
        }

        var dbContext = new DbContext();

        var user = dbContext.Users.FirstOrDefault(x => x.Login == login);
        if (user == null)
        {
            MessageBox.Show("", "Произошла ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
        }

        var bannedUser = dbContext.BannedUsers.FirstOrDefault(x => x.UserId == user.Id);
        if (bannedUser != null)
        {
            MessageBox.Show("", "Произошла ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
        }

        if (!user.Password.Equals(password))
        {
            _loginAttempts.TryAdd(user.Id, 0);
            _loginAttempts[user.Id]++;

            if (_loginAttempts[user.Id] >= MaxLoginAttempts)
            {
                var newBannedUser = new BannedUser
                {
                    UserId = user.Id
                };

                dbContext.BannedUsers.Add(newBannedUser);
                dbContext.SaveChanges();

                MessageBox.Show("", "Произошла ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            MessageBox.Show("", "Произошла ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
        }

        if (user.LastLogin != null && (DateTime.Now - user.LastLogin.Value).TotalDays >= 30)
        {
            var newBannedUser = new BannedUser
            {
                UserId = user.Id
            };

            dbContext.BannedUsers.Add(newBannedUser);
            dbContext.SaveChanges();

            MessageBox.Show("", "Произошла ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            return;
        }

        if (!user.LastLogin.HasValue || !user.FirstLogin.HasValue)
        {
            user.FirstLogin = DateTime.Now;
            user.LastLogin = DateTime.Now;
            NavigationView.NavFrame?.Navigate(new InputPasswordView(user));
            return;
        }

        user.LastLogin = DateTime.Now;
        dbContext.SaveChanges();

        switch (user.RoleId)
        {
            case 1:
                NavigationView.NavFrame?.Navigate(new AdminPanelView(user));
                break;
            case 2:
                NavigationView.NavFrame?.Navigate(new UserPanelView(user));
                break;
        }

        _loginAttempts.Remove(user.Id);
    }

    private void LoginView_OnLoaded(object sender, RoutedEventArgs e)
    {
        LoginTxt.Focus();
    }
}