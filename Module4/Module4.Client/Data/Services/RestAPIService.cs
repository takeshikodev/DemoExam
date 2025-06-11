using System.Net.Http;
using System.Text.Json;
using System.Windows;
using Module4.Client.Domain.Models;

namespace Module4.Client.Data.Services;

public class RestApiService(HttpClient httpClient, string baseUrl)
{
    private readonly HttpClient _httpClient = httpClient ??
                                              throw new ArgumentNullException(nameof(httpClient), "HttpClient не может быть null.");
    private readonly string _baseUrl = !string.IsNullOrWhiteSpace(baseUrl)
        ? baseUrl
        : throw new ArgumentNullException(nameof(baseUrl), "Базовый URL не может быть пустым.");

    private async Task<string> SendRequestAsync(Func<Task<HttpResponseMessage>> requestFunc)
    {
        var response = await requestFunc();
        response.EnsureSuccessStatusCode();
        return await response.Content.ReadAsStringAsync();
    }

    public Task<string> GetAsync(string endpoint) =>
        SendRequestAsync(() => _httpClient.GetAsync($"{_baseUrl}/{endpoint}"));

    public List<Passport>? DeserializePassports(string json)
    {
        try
        {
            var response = JsonSerializer.Deserialize<Response>(json);

            if (response != null && response.Code == 200)
            {
                switch (response.Message.ValueKind)
                {
                    case JsonValueKind.Array:
                        return JsonSerializer.Deserialize<List<Passport>>(response.Message.GetRawText());
                    case JsonValueKind.String:
                    {
                        var errorMessage = response.Message.GetString();
                        MessageBox.Show($"Ошибка: {errorMessage}");
                        return [];
                    }
                }
            }
            else
            {
                if (response != null) MessageBox.Show("Неизвестный код ответа: " + response.Code);
            }

            return [];
        }
        catch (JsonException)
        {
            throw new Exception("Ошибка при обработке JSON.");
        }
    }
}