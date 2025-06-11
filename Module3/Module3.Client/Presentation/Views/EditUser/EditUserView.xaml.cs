using System.Windows;
using System.Windows.Controls;
using Module3.Client.Models;
using Module3.Client.Presentation.Views.Navigation;

namespace Module3.Client.Presentation.Views.EditUser;

public partial class EditUserView : Page
{
    private readonly User _user;

    public EditUserView(User user)
    {
        _user = user;

        InitializeComponent();
        LoadUserData();
        LoadRoles();
    }

    private void LoadUserData()
    {
        TitleTextBlock.Text = $"ДАННЫЕ ПОЛЬЗОВАТЕЛЯ: {_user.Login}";
        LastNameTextBox.Text = _user.LastName;
        FirstNameTextBox.Text = _user.FirstName;
        MiddleNameTextBox.Text = _user.MiddleName ?? "";
        LoginTextBox.Text = _user.Login;

        using var dbContext = new DbContext();
        var bannedUser = dbContext.BannedUsers.FirstOrDefault(b => b.UserId == _user.Id);

        UnlockUserButton.Visibility = bannedUser != null ? Visibility.Visible : Visibility.Collapsed;
    }

    private void LoadRoles()
    {
        using var dbContext = new DbContext();
        var roles = dbContext.Roles.ToList();

        RoleComboBox.ItemsSource = roles;
        RoleComboBox.DisplayMemberPath = "Name";
        RoleComboBox.SelectedValuePath = "Id";
        RoleComboBox.SelectedValue = _user.RoleId;
    }

    private async void UnlockUserButton_Click(object sender, RoutedEventArgs e)
    {
        try
        {
            await using var dbContext = new DbContext();
            var bannedUser = dbContext.BannedUsers.FirstOrDefault(b => b.UserId == _user.Id);

            if (bannedUser == null) return; 

            dbContext.BannedUsers.Remove(bannedUser);
            await dbContext.SaveChangesAsync();

            MessageBox.Show("", "Успешная разблокировка!", MessageBoxButton.OK, MessageBoxImage.Information);
            UnlockUserButton.Visibility = Visibility.Collapsed;
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.Message, "Произошла ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private async void SaveUserDataButton_Click(object sender, RoutedEventArgs e)
    {
        try
        {
            var lastName = LastNameTextBox.Text.Trim();
            var firstName = FirstNameTextBox.Text.Trim();
            var middleName = MiddleNameTextBox.Text.Trim();
            var login = LoginTextBox.Text.Trim();
            var roleId = (int)RoleComboBox.SelectedValue;

            if (string.IsNullOrEmpty(lastName) || string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(login))
            {
                throw new Exception("");
            }

            await using var dbContext = new DbContext();

            var userExists = dbContext.Users.Any(u => u.Login == login && u.Id != _user.Id);
            if (userExists)
            {
                throw new Exception("");
            }

            var userToUpdate = await dbContext.Users.FindAsync(_user.Id);
            if (userToUpdate == null)
            {
                throw new Exception("");
            }

            userToUpdate.LastName = lastName;
            userToUpdate.FirstName = firstName;
            userToUpdate.MiddleName = middleName;
            userToUpdate.Login = login;
            userToUpdate.RoleId = roleId;

            await dbContext.SaveChangesAsync();

            MessageBox.Show("", "Успешное сохранение!", MessageBoxButton.OK, MessageBoxImage.Information);
            NavigationView.NavFrame?.GoBack();
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.Message, "Произошла ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private void GoBackButton_Click(object sender, RoutedEventArgs e)
    {
        NavigationView.NavFrame?.GoBack();
    }
}
