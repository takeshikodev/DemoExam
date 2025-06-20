USE [master]
GO
/****** Object:  Database [TransportLogistics]    Script Date: 11.06.2025 19:37:10 ******/
CREATE DATABASE [TransportLogistics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TransportLogistics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TransportLogistics.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TransportLogistics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TransportLogistics_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TransportLogistics] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TransportLogistics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TransportLogistics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TransportLogistics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TransportLogistics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TransportLogistics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TransportLogistics] SET ARITHABORT OFF 
GO
ALTER DATABASE [TransportLogistics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TransportLogistics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TransportLogistics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TransportLogistics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TransportLogistics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TransportLogistics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TransportLogistics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TransportLogistics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TransportLogistics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TransportLogistics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TransportLogistics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TransportLogistics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TransportLogistics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TransportLogistics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TransportLogistics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TransportLogistics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TransportLogistics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TransportLogistics] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TransportLogistics] SET  MULTI_USER 
GO
ALTER DATABASE [TransportLogistics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TransportLogistics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TransportLogistics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TransportLogistics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TransportLogistics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TransportLogistics] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TransportLogistics] SET QUERY_STORE = ON
GO
ALTER DATABASE [TransportLogistics] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TransportLogistics]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [nvarchar](255) NOT NULL,
	[ContactPerson] [nvarchar](255) NULL,
	[ContactPhone] [nvarchar](50) NULL,
	[ContactEmail] [nvarchar](255) NULL,
	[Address] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NULL,
	[Position] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[EmploymentDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[WeeklyWorkHours] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelLogs]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelLogs](
	[FuelLogID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleID] [int] NOT NULL,
	[FuelDate] [datetime] NOT NULL,
	[FuelAmountLiters] [decimal](10, 2) NOT NULL,
	[FuelCost] [decimal](10, 2) NOT NULL,
	[MileageAtFill] [int] NOT NULL,
	[DriverID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FuelLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceRecords]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceRecords](
	[MaintenanceRecordID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleID] [int] NOT NULL,
	[MaintenanceTypeID] [int] NOT NULL,
	[MaintenanceDate] [date] NOT NULL,
	[MileageAtMaintenance] [int] NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[PerformedByEmployeeID] [int] NULL,
	[IsScheduled] [bit] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaintenanceRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceTypes]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceTypes](
	[MaintenanceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaintenanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[PickupLocation] [nvarchar](500) NOT NULL,
	[DeliveryLocation] [nvarchar](500) NOT NULL,
	[CargoDescription] [nvarchar](max) NULL,
	[CargoWeight] [decimal](10, 2) NULL,
	[CargoVolume] [decimal](10, 2) NULL,
	[RequiredDeliveryDate] [datetime] NOT NULL,
	[ActualDeliveryDate] [datetime] NULL,
	[OrderStatusID] [int] NOT NULL,
	[DeclaredValue] [decimal](18, 2) NULL,
	[DistanceKm] [decimal](10, 2) NULL,
	[CalculatedCost] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](255) NOT NULL,
	[ProjectType] [nvarchar](50) NOT NULL,
	[ProjectDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RoleID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteOrders]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteOrders](
	[RouteOrderID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[OrderSequence] [int] NOT NULL,
	[DeliveryConfirmationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleID] [int] NOT NULL,
	[DriverID] [int] NOT NULL,
	[RouteStartDate] [datetime] NOT NULL,
	[RouteEndDate] [datetime] NULL,
	[PlannedDistanceKm] [decimal](10, 2) NULL,
	[ActualDistanceKm] [decimal](10, 2) NULL,
	[FuelConsumedLiters] [decimal](10, 2) NULL,
	[RouteStatusID] [int] NOT NULL,
	[OptimalRoutePolyline] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteStatuses]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteStatuses](
	[RouteStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduledMaintenances]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduledMaintenances](
	[ScheduledMaintenanceID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleID] [int] NOT NULL,
	[MaintenanceTypeID] [int] NOT NULL,
	[PlannedDate] [date] NULL,
	[PlannedMileage] [int] NULL,
	[IntervalDays] [int] NULL,
	[IntervalMileage] [int] NULL,
	[LastMaintenanceDate] [date] NULL,
	[LastMaintenanceMileage] [int] NULL,
	[IsCompleted] [bit] NOT NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduledMaintenanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeEntries]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeEntries](
	[TimeEntryID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[HoursSpent] [decimal](5, 2) NOT NULL,
	[EntryDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeEntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[RoleID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 11.06.2025 19:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[LicensePlate] [nvarchar](50) NOT NULL,
	[VehicleType] [nvarchar](100) NOT NULL,
	[Make] [nvarchar](100) NOT NULL,
	[Model] [nvarchar](100) NOT NULL,
	[YearManufacture] [int] NOT NULL,
	[LoadCapacity] [decimal](10, 2) NOT NULL,
	[VolumeCapacity] [decimal](10, 2) NOT NULL,
	[FuelType] [nvarchar](50) NOT NULL,
	[FuelConsumptionPer100Km] [decimal](5, 2) NULL,
	[PurchaseDate] [date] NULL,
	[CurrentMileage] [int] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[VIN] [nvarchar](17) NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Maintena__D4E7DFA83281B4C7]    Script Date: 11.06.2025 19:37:10 ******/
ALTER TABLE [dbo].[MaintenanceTypes] ADD UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__OrderSta__05E7698A305BCE3D]    Script Date: 11.06.2025 19:37:10 ******/
ALTER TABLE [dbo].[OrderStatuses] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Permissi__0FFDA35752424133]    Script Date: 11.06.2025 19:37:10 ******/
ALTER TABLE [dbo].[Permissions] ADD UNIQUE NONCLUSTERED 
(
	[PermissionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__8A2B6160E1345320]    Script Date: 11.06.2025 19:37:10 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_RouteOrder]    Script Date: 11.06.2025 19:37:10 ******/
ALTER TABLE [dbo].[RouteOrders] ADD  CONSTRAINT [UQ_RouteOrder] UNIQUE NONCLUSTERED 
(
	[RouteID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__RouteSta__05E7698AAD862143]    Script Date: 11.06.2025 19:37:10 ******/
ALTER TABLE [dbo].[RouteStatuses] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E43ED2BE67]    Script Date: 11.06.2025 19:37:10 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Vehicles__026BC15C1038B6FB]    Script Date: 11.06.2025 19:37:10 ******/
ALTER TABLE [dbo].[Vehicles] ADD UNIQUE NONCLUSTERED 
(
	[LicensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Vehicles__C5DF234CD8326C11]    Script Date: 11.06.2025 19:37:10 ******/
ALTER TABLE [dbo].[Vehicles] ADD UNIQUE NONCLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((40)) FOR [WeeklyWorkHours]
GO
ALTER TABLE [dbo].[MaintenanceRecords] ADD  DEFAULT ((0)) FOR [IsScheduled]
GO
ALTER TABLE [dbo].[MaintenanceRecords] ADD  DEFAULT ('Завершено') FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Projects] ADD  DEFAULT ('Operational') FOR [ProjectType]
GO
ALTER TABLE [dbo].[ScheduledMaintenances] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Vehicles] ADD  DEFAULT ((0)) FOR [CurrentMileage]
GO
ALTER TABLE [dbo].[Vehicles] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[FuelLogs]  WITH CHECK ADD  CONSTRAINT [FK_FuelLogs_Employees] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[FuelLogs] CHECK CONSTRAINT [FK_FuelLogs_Employees]
GO
ALTER TABLE [dbo].[FuelLogs]  WITH CHECK ADD  CONSTRAINT [FK_FuelLogs_Vehicles] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[FuelLogs] CHECK CONSTRAINT [FK_FuelLogs_Vehicles]
GO
ALTER TABLE [dbo].[MaintenanceRecords]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceRecords_Employees] FOREIGN KEY([PerformedByEmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[MaintenanceRecords] CHECK CONSTRAINT [FK_MaintenanceRecords_Employees]
GO
ALTER TABLE [dbo].[MaintenanceRecords]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceRecords_MaintenanceTypes] FOREIGN KEY([MaintenanceTypeID])
REFERENCES [dbo].[MaintenanceTypes] ([MaintenanceTypeID])
GO
ALTER TABLE [dbo].[MaintenanceRecords] CHECK CONSTRAINT [FK_MaintenanceRecords_MaintenanceTypes]
GO
ALTER TABLE [dbo].[MaintenanceRecords]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceRecords_Vehicles] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[MaintenanceRecords] CHECK CONSTRAINT [FK_MaintenanceRecords_Vehicles]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatuses] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatuses] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatuses]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([PermissionID])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Permissions]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Roles]
GO
ALTER TABLE [dbo].[RouteOrders]  WITH CHECK ADD  CONSTRAINT [FK_RouteOrders_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[RouteOrders] CHECK CONSTRAINT [FK_RouteOrders_Orders]
GO
ALTER TABLE [dbo].[RouteOrders]  WITH CHECK ADD  CONSTRAINT [FK_RouteOrders_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
GO
ALTER TABLE [dbo].[RouteOrders] CHECK CONSTRAINT [FK_RouteOrders_Routes]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Employees] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Employees]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_RouteStatuses] FOREIGN KEY([RouteStatusID])
REFERENCES [dbo].[RouteStatuses] ([RouteStatusID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_RouteStatuses]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Vehicles] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Vehicles]
GO
ALTER TABLE [dbo].[ScheduledMaintenances]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledMaintenances_MaintenanceTypes] FOREIGN KEY([MaintenanceTypeID])
REFERENCES [dbo].[MaintenanceTypes] ([MaintenanceTypeID])
GO
ALTER TABLE [dbo].[ScheduledMaintenances] CHECK CONSTRAINT [FK_ScheduledMaintenances_MaintenanceTypes]
GO
ALTER TABLE [dbo].[ScheduledMaintenances]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledMaintenances_Vehicles] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[ScheduledMaintenances] CHECK CONSTRAINT [FK_ScheduledMaintenances_Vehicles]
GO
ALTER TABLE [dbo].[TimeEntries]  WITH CHECK ADD  CONSTRAINT [FK_TimeEntries_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TimeEntries] CHECK CONSTRAINT [FK_TimeEntries_Employees]
GO
ALTER TABLE [dbo].[TimeEntries]  WITH CHECK ADD  CONSTRAINT [FK_TimeEntries_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TimeEntries] CHECK CONSTRAINT [FK_TimeEntries_Projects]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employees]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [TransportLogistics] SET  READ_WRITE 
GO
