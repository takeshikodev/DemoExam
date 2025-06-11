using System.Net.Http;
using System.Text.RegularExpressions;
using System.Windows;
using Module4.Client.Data.Services;
using TestCaseReporter.Interfaces;
using TestCaseReporter.Managers;
using TestCaseReporter.Models;

namespace Module4.Client.Presentation.Main;

public partial class MainView : Window
{
    private readonly RestApiService _apiService;
    private readonly IDocumentManager _documentManager;
    private readonly ReportGenerator _reportGenerator;
    private bool _receivedData = false;

    public MainView()
    {
        InitializeComponent();
        _apiService = new RestApiService(new HttpClient(), "http://localhost:4444");
        _documentManager = new DocumentManager();
        _reportGenerator = new ReportGenerator(_documentManager, "Resources/TestCases.docx");
    }

    private bool ValidatePassportSeries(string series)
    {
        if (string.IsNullOrWhiteSpace(series))
            return false;
        
        return Regex.IsMatch(series.Trim(), @"^\d{4}$");
    }

    private bool ValidatePassportNumber(string number)
    {
        if (string.IsNullOrWhiteSpace(number))
            return false;
        
        return Regex.IsMatch(number.Trim(), @"^\d{6}$");
    }

    private async void CheckBtn_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            var jsonResponse = await _apiService.GetAsync("Passport/Series,Number");

            var passports = _apiService.DeserializePassports(jsonResponse);

            if (passports != null && passports.Count > 0)
            {
                var randomIndex = new Random().Next(passports.Count);
                var randomPassport = passports[randomIndex];
                var passportSerial = randomPassport.Series.Trim();
                var passportNumber = randomPassport.Number.Trim();

                CheckTxb.Text = passportSerial + " " + passportNumber;
                _receivedData = true;
            }
            else
            {
                CheckTxb.Text = "Паспортные данные не найдены в ответе.";
                _receivedData = false;
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            _receivedData = false;
        }
    }

    private void TestBtn_OnClick(object sender, RoutedEventArgs e)
    {
        if (!_receivedData)
        {
            TestTxb.Text = "Сначала получите данные из API.";
            return;
        }

        var passportData = CheckTxb.Text.Split([' '], StringSplitOptions.RemoveEmptyEntries);
        
        if (passportData.Length < 2)
        {
            TestTxb.Text = "Неверный формат данных паспорта.";
            return;
        }

        var series = passportData[0];
        var number = passportData[1];

        var isPassportSeriesValid = ValidatePassportSeries(series);
        var isPassportNumberValid = ValidatePassportNumber(number);

        var resultMessage = isPassportSeriesValid && isPassportNumberValid 
            ? "Данные паспорта корректны." 
            : "Паспортные данные содержат запрещенные символы или неверный формат.";

        TestTxb.Text = resultMessage;

        if (_receivedData)
        {
            _reportGenerator.AddTestCase(new TestCase("Проверка паспорта", 
                series + " " + number, 
                isPassportSeriesValid && isPassportNumberValid));
            _documentManager.SaveDocument();
        }
    }

    private void Window_Closed(object sender, EventArgs e)
    {
        _documentManager.CloseDocument();
    }
}