using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Module3.Client.Models;

public partial class User
{
    public int Id { get; set; }

    public string LastName { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string? MiddleName { get; set; }

    public int RoleId { get; set; }

    public string Login { get; set; } = null!;

    public string Password { get; set; } = null!;

    public DateTime? FirstLogin { get; set; }

    public DateTime? LastLogin { get; set; }
    
    [NotMapped]
    public virtual string RoleName { get; set; } = null!;
    
    [NotMapped]
    public virtual string Status { get; set; } = null!;

    public virtual ICollection<BannedUser> BannedUsers { get; set; } = new List<BannedUser>();

    public virtual Role Role { get; set; } = null!;
}
