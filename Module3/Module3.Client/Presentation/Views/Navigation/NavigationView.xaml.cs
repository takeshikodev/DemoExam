using System.Windows;
using System.Windows.Controls;

namespace Module3.Client.Presentation.Views.Navigation;

public partial class NavigationView : Window
{
    public static Frame? NavFrame { get; private set; }
    
    public NavigationView()
    {
        InitializeComponent();

        NavFrame = NavigationFrame;
    }
}