using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Module3.Client.Models;
using Module3.Client.Presentation.Views.CreateUser;
using Module3.Client.Presentation.Views.EditUser;
using Module3.Client.Presentation.Views.Navigation;

namespace Module3.Client.Presentation.Views.UserControl;

public partial class UserControlView : Page
{
    private readonly User _user;
    
    public UserControlView(User user)
    {
        _user = user;
        
        InitializeComponent();

        LoadUsers();
    }

    private void LoadUsers()
    {
        var dbContext = new DbContext();
        
        var users = dbContext.Users.ToList();
        var bannedUsers = dbContext.BannedUsers.ToList();
        var roles = dbContext.Roles.ToList();
        foreach (var user in users)
        {
            user.RoleName = roles.FirstOrDefault(r => r.Id == user.RoleId)?.Name ?? "Неизвестная роль";
            user.Status = bannedUsers.Any(b => b.UserId == user.Id) ? "Заблокирован" : "Не заблокирован";
        }
        UserDataGrid.ItemsSource = users;
    }

    private void UserDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (UserDataGrid.SelectedIndex != -1)
        {
            if (UserDataGrid.SelectedItem is User user)
            {
                NavigationView.NavFrame?.Navigate(new EditUserView(user));
            }
        }
    }

    private void UpdateDataButton_Click(object sender, RoutedEventArgs e)
    {
        LoadUsers();
    }

    private void AddUserButton_Click(object sender, RoutedEventArgs e)
    {
        NavigationView.NavFrame?.Navigate(new CreateUserView());
    }

    private void DeleteUserButton_Click(object sender, RoutedEventArgs e)
    {
        try
        {
            if (UserDataGrid.SelectedIndex != -1)
            {
                var selectedItem = UserDataGrid.SelectedItem;
                if (selectedItem is User user)
                {
                    var dbContext = new DbContext();
                    
                    var userInDb = dbContext.Users.Find(user.Id) ?? throw new Exception("Пользователь не найден в базе данных!");
                    dbContext.Users.Remove(userInDb);
                    dbContext.SaveChanges();
                    
                    MessageBox.Show($"Пользователь {user.Login} был успешно удален!", "Успешное удаление!", MessageBoxButton.OK, MessageBoxImage.Information);
                    LoadUsers();
                }
                else
                {
                    throw new Exception("Выбранный элемент не является пользователем!");
                }
            }
            else
            {
                throw new Exception("Выберите пользователя для удаления!");
            }
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