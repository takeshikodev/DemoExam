using System;
using System.Collections.Generic;

namespace Module3.Client.Models;

public partial class BannedUser
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public DateTime ExpiredDate { get; set; }

    public virtual User User { get; set; } = null!;
}
