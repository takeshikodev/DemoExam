using System.Text.Json;
using System.Text.Json.Serialization;

namespace Module4.Client.Domain.Models;

public class Response
{
    [JsonPropertyName("code")]
    public int Code {  get; set; }
    
    [JsonPropertyName("status")]
    public string Status {  get; set; }
    
    [JsonPropertyName("message")]
    public JsonElement Message {  get; set; }
}