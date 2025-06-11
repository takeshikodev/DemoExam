using System.Windows;
using System.Windows.Controls;
using Module3.Client.Models;
using Module3.Client.Presentation.Views.Navigation;

namespace Module3.Client.Presentation.Views.CreateUser;
    public partial class CreateUserView : Page
    {
        public CreateUserView()
        {
            InitializeComponent();
            LoadRoles();
        }
        
        private void LoadRoles()
        {
            using var dbContext = new DbContext();
            var roles = dbContext.Roles.ToList();

            RoleComboBox.ItemsSource = roles;
            RoleComboBox.DisplayMemberPath = "Name";
            RoleComboBox.SelectedValuePath = "Id";
        }
        
        private async void CreateUserButton_Click(object sender, RoutedEventArgs e)
    {
        try
        {
            var lastName = LastNameTextBox.Text.Trim();
            var firstName = FirstNameTextBox.Text.Trim();
            var middleName = MiddleNameTextBox.Text.Trim();
            var login = LoginTextBox.Text.Trim();
            var password = PasswordTextBox.Password.Trim();

            if (string.IsNullOrEmpty(lastName) ||
                string.IsNullOrEmpty(firstName) ||
                string.IsNullOrEmpty(login) ||
                string.IsNullOrEmpty(password) ||
                RoleComboBox.SelectedValue == null)
            {
                throw new Exception("");
            }

            var roleId = (int)RoleComboBox.SelectedValue;

            await using var dbContext = new DbContext();

            if (dbContext.Users.Any(u => u.Login == login))
            {
                throw new Exception("");
            }

            var newUser = new User
            {
                LastName = lastName,
                FirstName = firstName,
                MiddleName = middleName,
                Login = login,
                Password = password,
                RoleId = roleId,
                FirstLogin = null,
                LastLogin = null
            };

            dbContext.Users.Add(newUser);
            await dbContext.SaveChangesAsync();

            MessageBox.Show("", "Успешное добавление!", MessageBoxButton.OK, MessageBoxImage.Information);

            ClearFields();
            NavigationView.NavFrame?.GoBack();
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.Message, "Произошла ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private void ClearFields()
    {
        LastNameTextBox.Text = string.Empty;
        FirstNameTextBox.Text = string.Empty;
        MiddleNameTextBox.Text = string.Empty;
        LoginTextBox.Text = string.Empty;
        PasswordTextBox.Password = string.Empty;
        RoleComboBox.SelectedIndex = -1;
    }

    private void GoBackButton_Click(object sender, RoutedEventArgs e)
    {
        NavigationView.NavFrame?.GoBack();
    }
}
