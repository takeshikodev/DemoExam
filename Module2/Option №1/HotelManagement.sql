USE [master]
GO
/****** Object:  Database [Module2]    Script Date: 11.06.2025 19:56:20 ******/
CREATE DATABASE [Module2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Module2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Module2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Module2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Module2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Module2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Module2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Module2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Module2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Module2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Module2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Module2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Module2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Module2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Module2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Module2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Module2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Module2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Module2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Module2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Module2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Module2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Module2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Module2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Module2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Module2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Module2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Module2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Module2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Module2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Module2] SET  MULTI_USER 
GO
ALTER DATABASE [Module2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Module2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Module2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Module2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Module2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Module2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Module2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Module2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Module2]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 11.06.2025 19:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[CheckInDate] [date] NOT NULL,
	[CheckOutDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 11.06.2025 19:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Floors]    Script Date: 11.06.2025 19:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Floors](
	[FloorID] [int] IDENTITY(1,1) NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[FloorName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FloorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomCategories]    Script Date: 11.06.2025 19:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 11.06.2025 19:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [nvarchar](10) NOT NULL,
	[FloorID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (1, 1, 1, CAST(N'2025-02-14' AS Date), CAST(N'2025-03-02' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (2, 2, 2, CAST(N'2025-02-28' AS Date), NULL)
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (3, 4, 3, CAST(N'2025-02-23' AS Date), CAST(N'2025-02-02' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (4, 5, 4, CAST(N'2025-03-01' AS Date), CAST(N'2025-03-07' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (5, 7, 5, CAST(N'2025-02-27' AS Date), CAST(N'2025-04-22' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (6, 7, 6, CAST(N'2025-02-24' AS Date), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (7, 8, 7, CAST(N'2025-02-15' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (8, 9, 8, CAST(N'2025-02-27' AS Date), CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (9, 10, 9, CAST(N'2025-02-14' AS Date), CAST(N'2025-02-02' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (10, 11, 10, CAST(N'2025-02-24' AS Date), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (11, 13, 11, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-07' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (12, 15, 12, CAST(N'2025-03-01' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (13, 16, 13, CAST(N'2025-02-02' AS Date), CAST(N'2025-02-02' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (14, 17, 14, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (15, 18, 15, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (16, 19, 16, CAST(N'2025-02-27' AS Date), NULL)
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (17, 23, 17, CAST(N'2025-02-28' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Bookings] ([BookingID], [RoomID], [ClientID], [CheckInDate], [CheckOutDate]) VALUES (18, 25, 18, CAST(N'2025-02-11' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (1, N'Шевченко Ольга Викторовна')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (2, N'Мазалова Ирина Львовна')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (3, N'Семеняка Юрий Геннадьевич')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (4, N'Савельев Олег Иванович')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (5, N'Бунин Эдуард Михайлович')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (6, N'Бахшиев Павел Иннокентьевич')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (7, N'Тюренкова Наталья Сергеевна')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (8, N'Любяшева Галина Аркадьевна')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (9, N'Александров Петр Константинович')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (10, N'Мазалова Ольга Николаевна')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (11, N'Лапшин Виктор Романович')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (12, N'Гусев Семен Петрович')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (13, N'Гладилина Вера Михайловна')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (14, N'Масюк Динара Викторовна')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (15, N'Лукин Илья Федорович')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (16, N'Петров Станислав Игоревич')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (17, N'Филь Марина Федоровна')
INSERT [dbo].[Clients] ([ClientID], [FullName]) VALUES (18, N'Михайлов Игорь Вадимович')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Floors] ON 

INSERT [dbo].[Floors] ([FloorID], [FloorNumber], [FloorName]) VALUES (1, 1, N'1 этаж')
INSERT [dbo].[Floors] ([FloorID], [FloorNumber], [FloorName]) VALUES (2, 2, N'2 этаж')
INSERT [dbo].[Floors] ([FloorID], [FloorNumber], [FloorName]) VALUES (3, 3, N'3 этаж')
SET IDENTITY_INSERT [dbo].[Floors] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomCategories] ON 

INSERT [dbo].[RoomCategories] ([CategoryID], [CategoryName]) VALUES (5, N'3-местный бюджет')
INSERT [dbo].[RoomCategories] ([CategoryID], [CategoryName]) VALUES (6, N'Бизнес с 1 или 2 кроватями')
INSERT [dbo].[RoomCategories] ([CategoryID], [CategoryName]) VALUES (7, N'Двухкомнатный двухместный стандарт с 1 или 2 кроватями')
INSERT [dbo].[RoomCategories] ([CategoryID], [CategoryName]) VALUES (9, N'Люкс с 2 двуспальными кроватями')
INSERT [dbo].[RoomCategories] ([CategoryID], [CategoryName]) VALUES (1, N'Одноместный стандарт')
INSERT [dbo].[RoomCategories] ([CategoryID], [CategoryName]) VALUES (2, N'Одноместный эконом')
INSERT [dbo].[RoomCategories] ([CategoryID], [CategoryName]) VALUES (3, N'Стандарт двухместный с 2 раздельными кроватями')
INSERT [dbo].[RoomCategories] ([CategoryID], [CategoryName]) VALUES (8, N'Студия')
INSERT [dbo].[RoomCategories] ([CategoryID], [CategoryName]) VALUES (4, N'Эконом двухместный с 2 раздельными кроватями')
SET IDENTITY_INSERT [dbo].[RoomCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (1, N'101', 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (2, N'102', 1, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (3, N'103', 1, 2)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (4, N'104', 1, 2)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (5, N'105', 1, 3)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (6, N'106', 1, 3)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (7, N'107', 1, 4)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (8, N'108', 1, 4)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (9, N'109', 1, 5)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (10, N'110', 1, 5)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (11, N'201', 2, 6)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (12, N'202', 2, 6)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (13, N'203', 2, 6)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (14, N'204', 2, 7)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (15, N'205', 2, 7)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (16, N'206', 2, 7)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (17, N'207', 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (18, N'208', 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (19, N'209', 2, 1)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (20, N'301', 3, 8)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (21, N'302', 3, 8)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (22, N'303', 3, 8)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (23, N'304', 3, 9)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (24, N'305', 3, 9)
INSERT [dbo].[Rooms] ([RoomID], [RoomNumber], [FloorID], [CategoryID]) VALUES (25, N'306', 3, 9)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
/****** Object:  Index [UQ__Floors__632D9B2B95674361]    Script Date: 11.06.2025 19:56:20 ******/
ALTER TABLE [dbo].[Floors] ADD UNIQUE NONCLUSTERED 
(
	[FloorNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__RoomCate__8517B2E0665F2655]    Script Date: 11.06.2025 19:56:20 ******/
ALTER TABLE [dbo].[RoomCategories] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Rooms__AE10E07ACBB6C396]    Script Date: 11.06.2025 19:56:20 ******/
ALTER TABLE [dbo].[Rooms] ADD UNIQUE NONCLUSTERED 
(
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[RoomCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([FloorID])
REFERENCES [dbo].[Floors] ([FloorID])
GO
USE [master]
GO
ALTER DATABASE [Module2] SET  READ_WRITE 
GO
