USE [master]
GO
/****** Object:  Database [Notes]    Script Date: 07-04-2021 14:39:02 ******/
CREATE DATABASE [Notes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Notes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Notes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Notes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Notes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Notes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Notes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Notes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Notes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Notes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Notes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Notes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Notes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Notes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Notes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Notes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Notes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Notes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Notes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Notes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Notes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Notes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Notes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Notes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Notes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Notes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Notes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Notes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Notes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Notes] SET RECOVERY FULL 
GO
ALTER DATABASE [Notes] SET  MULTI_USER 
GO
ALTER DATABASE [Notes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Notes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Notes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Notes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Notes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Notes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Notes', N'ON'
GO
ALTER DATABASE [Notes] SET QUERY_STORE = OFF
GO
USE [Notes]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CountryCode] [varchar](5) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Downloads]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Downloads](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[SellerID] [int] NOT NULL,
	[DownloaderID] [int] NOT NULL,
	[isSellerHasAllowedDownload] [bit] NOT NULL,
	[AttachmentPath] [varchar](max) NULL,
	[IsAttachmentDownloaded] [bit] NOT NULL,
	[AttachmentDownloadedDate] [datetime] NULL,
	[isPaid] [bit] NOT NULL,
	[PurchasedPrice] [decimal](18, 0) NULL,
	[NoteTitle] [varchar](100) NOT NULL,
	[NoteCategory] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Downloads] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoteStatus]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoteStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NoteStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceData]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[DataValue] [varchar](100) NOT NULL,
	[RefCategory] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_ReferenceData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotes]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[ActionedBY] [int] NULL,
	[AdminRemarks] [varchar](max) NULL,
	[PublishedDate] [datetime] NULL,
	[Title] [varchar](100) NOT NULL,
	[Category] [int] NOT NULL,
	[DisplayPicture] [varchar](500) NULL,
	[NoteType] [int] NULL,
	[NumberofPages] [int] NULL,
	[Description] [varchar](max) NOT NULL,
	[UniversityName] [varchar](200) NULL,
	[Country] [int] NULL,
	[Course] [varchar](100) NULL,
	[CourseCode] [varchar](100) NULL,
	[Professor] [varchar](100) NULL,
	[IsPaid] [bit] NOT NULL,
	[SellingPrice] [decimal](18, 0) NOT NULL,
	[NotesPreview] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_SellerNotes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotesAttachements]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotesAttachements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_SellerNotesAttachements] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotesReportedIssues]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotesReportedIssues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[ReportedByID] [int] NOT NULL,
	[AgainstDownloadID] [int] NOT NULL,
	[Remarks] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_SellerNotesReportedIssues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotesReviews]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotesReviews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[ReviewedByID] [int] NOT NULL,
	[AgainstDownloadsID] [int] NOT NULL,
	[Ratings] [int] NOT NULL,
	[Comments] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_SellerNotesReviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfigurations]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfigurations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[Value] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_SystemConfigurations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DOB] [datetime] NULL,
	[Gender] [int] NULL,
	[SecondaryEmailAddress] [varchar](100) NULL,
	[CountryCode] [varchar](5) NOT NULL,
	[PhoneNo] [varchar](20) NOT NULL,
	[ProfilePicture] [varchar](500) NULL,
	[AddressLine1] [varchar](100) NOT NULL,
	[AddressLine2] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[University] [varchar](100) NULL,
	[College] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07-04-2021 14:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailID] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[isEmailVerified] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifedDate], [ModifiedBy], [isActive]) VALUES (1, N'Science', N'Science is Subject', CAST(N'2021-03-24T19:58:18.283' AS DateTime), 23, NULL, NULL, 1)
INSERT [dbo].[Categories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifedDate], [ModifiedBy], [isActive]) VALUES (2, N'Social', N'Social Category', CAST(N'2021-03-24T19:58:18.283' AS DateTime), 23, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1, N'India', N'91', CAST(N'2021-03-24T20:43:43.287' AS DateTime), 23, NULL, NULL, 1)
INSERT [dbo].[Countries] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (2, N'USA', N'11', CAST(N'2021-03-24T20:43:43.287' AS DateTime), 23, NULL, NULL, 1)
INSERT [dbo].[Countries] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (3, N'Canada', N'12', CAST(N'2021-03-24T20:43:43.287' AS DateTime), 23, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Downloads] ON 

INSERT [dbo].[Downloads] ([ID], [NoteID], [SellerID], [DownloaderID], [isSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [isPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 2, 2, 1, 1, N'~/Members/2/2/sample.pdf', 1, CAST(N'2021-03-31T16:16:06.203' AS DateTime), 0, CAST(0 AS Decimal(18, 0)), N'Chemistry', N'Science', CAST(N'2021-03-24T16:47:18.437' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [SellerID], [DownloaderID], [isSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [isPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, 1, 1, 1, 1, N'~/Members/1/1/sample.pdf', 0, CAST(N'2021-03-24T16:47:18.437' AS DateTime), 1, CAST(7 AS Decimal(18, 0)), N'Physics', N'Science', CAST(N'2021-03-24T16:47:18.437' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [SellerID], [DownloaderID], [isSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [isPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, 1, 1, 1, 0, NULL, 0, NULL, 1, CAST(7 AS Decimal(18, 0)), N'Physics', N'Science', CAST(N'2021-03-24T16:47:18.437' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [SellerID], [DownloaderID], [isSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [isPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, 1009, 1, 1, 0, NULL, 0, NULL, 1, CAST(100 AS Decimal(18, 0)), N'Python', N'Science', CAST(N'2021-03-24T16:47:18.437' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [SellerID], [DownloaderID], [isSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [isPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, 2, 2, 8, 1, N'~/Members/2/2/sample.pdf', 1, CAST(N'2021-03-24T16:47:18.437' AS DateTime), 0, CAST(0 AS Decimal(18, 0)), N'Chemistry', N'Science', CAST(N'2021-03-24T16:47:18.437' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [SellerID], [DownloaderID], [isSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [isPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, 1, 1, 24, 1, N'~/Members/1/1/sample.pdf', 0, CAST(N'2021-04-07T11:09:32.853' AS DateTime), 1, CAST(7 AS Decimal(18, 0)), N'Physics', N'Science', CAST(N'2021-04-07T10:59:06.410' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [SellerID], [DownloaderID], [isSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [isPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, 2, 2, 24, 1, N'~/Members/2/2/sample.pdf', 1, CAST(N'2021-04-07T11:09:35.720' AS DateTime), 0, CAST(0 AS Decimal(18, 0)), N'Chemistry', N'Science', CAST(N'2021-04-07T10:59:31.997' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [SellerID], [DownloaderID], [isSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [isPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, 1010, 8, 24, 1, N'~/Members/8/1010/AI-Midsem.pdf', 0, CAST(N'2021-04-07T11:09:39.510' AS DateTime), 1, CAST(87 AS Decimal(18, 0)), N'Maths', N'Science', CAST(N'2021-04-07T10:59:53.070' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Downloads] OFF
GO
SET IDENTITY_INSERT [dbo].[NoteStatus] ON 

INSERT [dbo].[NoteStatus] ([ID], [Name]) VALUES (1, N'Draft')
INSERT [dbo].[NoteStatus] ([ID], [Name]) VALUES (2, N'Submitted')
INSERT [dbo].[NoteStatus] ([ID], [Name]) VALUES (3, N'InReview')
INSERT [dbo].[NoteStatus] ([ID], [Name]) VALUES (4, N'Published')
INSERT [dbo].[NoteStatus] ([ID], [Name]) VALUES (5, N'Rejected')
INSERT [dbo].[NoteStatus] ([ID], [Name]) VALUES (6, N'Removed')
SET IDENTITY_INSERT [dbo].[NoteStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ReferenceData] ON 

INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1, N'Draft', N'1', N'Status', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (2, N'Male', N'1', N'Gender', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1002, N'InReview', N'2', N'Status', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1003, N'Submitted', N'3', N'Status', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1004, N'Published', N'4', N'Status', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1005, N'Rejected', N'5', N'Status', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1006, N'Female', N'2', N'Gender', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1007, N'Others', N'3', N'Gender', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ReferenceData] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotes] ON 

INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBY], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1, 1, 4, NULL, NULL, NULL, N'Physics', 1, N'~/Members/1/1/search1.png', 1, 77, N'Physics is a Good Subject', N'Adani Institute', 1, N'Science', NULL, NULL, 1, CAST(7 AS Decimal(18, 0)), N'~/Members/1/1/sample.pdf', CAST(N'2021-03-03T18:19:00.000' AS DateTime), NULL, CAST(N'2021-03-24T16:47:18.437' AS DateTime), 23, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBY], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (2, 2, 4, NULL, NULL, NULL, N'Chemistry', 1, N'~/Members/2/2/search3.png', 1, 79, N'Chemistry  is good subject', N'Mansa College', 1, N'Commerce', NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), N'~/Members/2/2/sample.pdf', CAST(N'2021-03-03T18:34:00.000' AS DateTime), NULL, CAST(N'2021-03-24T16:47:18.437' AS DateTime), 23, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBY], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (10, 1, 4, 23, NULL, NULL, N'Biology', 1, N'~/Members/1/10/search3.png', 1, 77, N'Biology', N'LJ', 1, N'Science', N'777777', N'Ankita Mam', 0, CAST(0 AS Decimal(18, 0)), N'~/Members/1/10/class19.pdf', CAST(N'2021-03-18T10:40:00.000' AS DateTime), NULL, CAST(N'2021-03-24T16:47:18.437' AS DateTime), 23, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBY], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (11, 1, 4, 3, NULL, NULL, N'Biology1', 1, N'~/Members/1/11/search1.png', 1, 77, N'Biology1', N'Adani Institute', 1, N'Science', N'777777', N'Ankita Mam', 0, CAST(0 AS Decimal(18, 0)), N'~/Members/1/11/sample.pdf', CAST(N'2021-03-19T10:39:00.000' AS DateTime), NULL, CAST(N'2021-03-24T16:47:18.437' AS DateTime), 23, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBY], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1008, 2, 4, 23, NULL, NULL, N'vdvfvf', 1, N'~/Members/1/1008/search1.png', 1, 21, N'dfvdv', N'dvdvv', 1, N'vdvdvdv', N'556', N'vvdv', 0, CAST(0 AS Decimal(18, 0)), N'~/Members/1/1008/sample.pdf', CAST(N'2021-03-22T19:30:00.000' AS DateTime), NULL, CAST(N'2021-03-24T16:47:18.437' AS DateTime), 23, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBY], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1009, 1, 5, 3, N'Inappropraite Notes', NULL, N'Python', 1, N'~/Members/1/1009/search3.png', 1, 52, N'Python is easy language', N'Adani Institute', 1, N'Python', N'98765', N'Devang Pandya', 1, CAST(100 AS Decimal(18, 0)), N'~/Members/1/1009/sample.pdf', CAST(N'2021-03-23T17:11:00.000' AS DateTime), NULL, CAST(N'2021-03-24T16:47:18.437' AS DateTime), 23, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBY], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1010, 8, 4, NULL, NULL, NULL, N'Maths', 1, N'~/Members/8/1010/search6.png', 1, 63, N'Maths is my Favourite Subject. Maths is very fundamental subject', N'Mansa College', 1, N'Maths', N'380054', N'Nayan Patel', 1, CAST(87 AS Decimal(18, 0)), N'~/Members/8/1010/class19.pdf', CAST(N'2021-03-24T16:43:42.800' AS DateTime), NULL, CAST(N'2021-03-24T16:47:18.437' AS DateTime), 23, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBY], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1011, 24, 4, 23, NULL, NULL, N'IELTS', 1, N'~/Members/24/1011/search3.png', 2, 100, N'Cambridge IELTS book', N'Adani Institute', 1, N'IELTS Preparation', N'000000', N'Jainam', 1, CAST(10 AS Decimal(18, 0)), N'~/Members/24/1011/sample.pdf', CAST(N'2021-04-07T11:03:20.423' AS DateTime), 24, CAST(N'2021-04-07T11:44:42.243' AS DateTime), 24, 1)
SET IDENTITY_INSERT [dbo].[SellerNotes] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] ON 

INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1, 1, N'sample.pdf', N'~/Members/1/1/sample.pdf', CAST(N'2021-03-03T18:19:53.737' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (2, 2, N'sample.pdf', N'~/Members/2/2/sample.pdf', CAST(N'2021-03-03T18:34:55.947' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (7, 10, N'sample.pdf', N'~/Members/1/10/sample.pdf', CAST(N'2021-03-18T10:40:16.720' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (8, 11, N'sample.pdf', N'~/Members/1/11/sample.pdf', CAST(N'2021-03-19T10:39:51.983' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1007, 1008, N'sample.pdf', N'~/Members/1/1008/sample.pdf', CAST(N'2021-03-22T19:30:33.427' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1008, 1009, N'class19.pdf', N'~/Members/1/1009/class19.pdf', CAST(N'2021-03-23T17:11:40.613' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1009, 1010, N'class19.pdf', N'~/Members/8/1010/AI-Midsem.pdf', CAST(N'2021-03-24T16:43:43.427' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1010, 1011, N'sample.pdf', N'~/Members/24/1011/class19.pdf', CAST(N'2021-04-07T11:03:20.690' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] ON 

INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (18, 2, 1, 12, 5, N'Excellent Notes!!', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (19, 1010, 24, 23, 5, N'Excellent!!', CAST(N'2021-04-07T11:10:06.870' AS DateTime), 24, NULL, NULL, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (20, 2, 24, 22, 5, N'Excellent!!', CAST(N'2021-04-07T11:11:32.890' AS DateTime), 24, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemConfigurations] ON 

INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1040, N'SupportEmail', N'supportemail@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1041, N'SupportPhone', N'9426729210', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1042, N'Email', N'email@gmail.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1043, N'FacebookURL', N'fb.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1044, N'TwitterURL', N'twitter.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1045, N'LinkedinURL', N'linkedin.com', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1046, N'NotesPicture', N'~/Members/SystemConfig/deafultnotes.png', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[SystemConfigurations] ([ID], [Key], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1047, N'ProfilePicture', N'~/Members/SystemConfig/deafultmember.png', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[SystemConfigurations] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1, N'HandWrittenNotes', N'written by hand', CAST(N'2021-03-24T20:42:45.677' AS DateTime), 23, NULL, NULL, 1)
INSERT [dbo].[Types] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (2, N'Computer Notes', N'Computer Notes ', CAST(N'2021-03-24T20:42:45.677' AS DateTime), 23, NULL, NULL, 1)
INSERT [dbo].[Types] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (3, N'Type', N'Type', CAST(N'2021-03-24T20:42:45.677' AS DateTime), 23, CAST(N'2021-04-01T10:17:15.557' AS DateTime), 23, 0)
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [CountryCode], [PhoneNo], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, CAST(N'1999-10-07T00:00:00.000' AS DateTime), 2, NULL, N'91', N'9426729604', N'~/Members/1/DP_03042021.png', N'A-3/16 Shanti Apartment', N'Near AIS School', N'Ahmedabad', N'Gujarat', N'380054', N'India', N'GTU', N'Adani', CAST(N'2021-03-03T10:06:43.623' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [CountryCode], [PhoneNo], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 2, CAST(N'1967-08-08T00:00:00.000' AS DateTime), 2, NULL, N'91', N'9426729778', N'~/Members/2/customer-4.png', N'A-3/16 Shanti Apartment,', N'Near AIS School', N'Himmatngar', N'Gujarat', N'380015', N'India', N'GU', N'Mansa College', CAST(N'2021-03-03T10:09:03.050' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [CountryCode], [PhoneNo], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1003, 8, CAST(N'1968-04-13T00:00:00.000' AS DateTime), 1006, NULL, N'91', N'9426729406', N'~/Members/8/DP_24032021.png', N'A-3/16 Shanti Apartment', N'Near AIS School', N'Ahmedabad', N'Gujarat', N'380054', N'India', N'GU', N'Mansa College', CAST(N'2021-03-24T16:31:36.443' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [CountryCode], [PhoneNo], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1006, 23, NULL, NULL, N'7admin@gmail.com', N'11', N'9426729406', N'~/Members/23/customer-1.png', N'NULL', N'NUll', N'NULL', N'NULL', N'NULL', N'India', NULL, NULL, NULL, NULL, CAST(N'2021-04-02T16:29:37.960' AS DateTime), 23)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [CountryCode], [PhoneNo], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1010, 3, NULL, NULL, NULL, N'91', N'9426729604', N'~/Members/23/customer-1.png', N'NULL', N'NULL', N'NULL', N'NULL', N'NULL', N'India', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [CountryCode], [PhoneNo], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2007, 24, CAST(N'1999-10-07T00:00:00.000' AS DateTime), 2, NULL, N'91', N'9426729604', N'~/Members/24/DP_07042021.png', N'A-3/16 Shanti Apartment', N'Near AIS School', N'Ahmedabad', N'Gujarat', N'380054', N'India', N'GTU', N'Adani Institute', CAST(N'2021-04-07T10:57:44.677' AS DateTime), 24, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1, N'Member', N'Sell,View,Download Notes and Manage Own profile', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (2, N'Admin', N'Manage Profiles of Members', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[UserRoles] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (3, N'SuperAdmin', N'Manage subAdmin', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [isEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (1, 1, N'Meet', N'Patel', N'meet77741@gmail.com', N'Meet@123', 1, CAST(N'2021-03-03T09:52:00.000' AS DateTime), NULL, CAST(N'2021-04-03T10:40:27.820' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [isEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (2, 1, N'Manubhai', N'Patel', N'meetpatel.ict17@gmail.com', N'12345', 1, CAST(N'2021-03-03T09:53:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [isEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (3, 3, N'Admin', N'Admin', N'admin@gmail.com', N'12345', 1, CAST(N'2021-03-06T09:53:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [isEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (8, 1, N'Renuka', N'Patel', N'renukapatel@gmail.com', N'12345', 1, CAST(N'2021-03-24T16:27:37.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [isEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (23, 2, N'admin7', N'admin7', N'admin7@gmail.com', N'admin', 1, CAST(N'2021-03-28T09:11:41.693' AS DateTime), NULL, CAST(N'2021-04-02T16:29:37.960' AS DateTime), 23, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [EmailID], [Password], [isEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [isActive]) VALUES (24, 1, N'Technosoft', N'Patel', N'meet7777777777@gmail.com', N'Meet@123', 1, CAST(N'2021-04-07T10:55:08.000' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Countries]    Script Date: 07-04-2021 14:39:03 ******/
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [IX_Countries] UNIQUE NONCLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Countries_1]    Script Date: 07-04-2021 14:39:03 ******/
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [IX_Countries_1] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [DF_Countries_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[ReferenceData] ADD  CONSTRAINT [DF_ReferenceData_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[SellerNotes] ADD  CONSTRAINT [DF_SellerNotes_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[SellerNotesAttachements] ADD  CONSTRAINT [DF_SellerNotesAttachements_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[SellerNotesReviews] ADD  CONSTRAINT [DF_SellerNotesReviews_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[SystemConfigurations] ADD  CONSTRAINT [DF_SystemConfigurations_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Types] ADD  CONSTRAINT [DF_Types_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_isEmailVerified]  DEFAULT ((0)) FOR [isEmailVerified]
GO
ALTER TABLE [dbo].[Downloads]  WITH CHECK ADD  CONSTRAINT [FK_Downloads_SellerNotes] FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[Downloads] CHECK CONSTRAINT [FK_Downloads_SellerNotes]
GO
ALTER TABLE [dbo].[Downloads]  WITH CHECK ADD  CONSTRAINT [FK_Downloads_Users] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Downloads] CHECK CONSTRAINT [FK_Downloads_Users]
GO
ALTER TABLE [dbo].[Downloads]  WITH CHECK ADD  CONSTRAINT [FK_Downloads_Users1] FOREIGN KEY([DownloaderID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Downloads] CHECK CONSTRAINT [FK_Downloads_Users1]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_Categories] FOREIGN KEY([Category])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_Categories]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_Countries] FOREIGN KEY([Country])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_Countries]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_NoteStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[NoteStatus] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_NoteStatus]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_SellerNotes] FOREIGN KEY([ID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_SellerNotes]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_Types] FOREIGN KEY([NoteType])
REFERENCES [dbo].[Types] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_Types]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_Users] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_Users]
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotes_Users1] FOREIGN KEY([ActionedBY])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes] CHECK CONSTRAINT [FK_SellerNotes_Users1]
GO
ALTER TABLE [dbo].[SellerNotesAttachements]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesAttachements_SellerNotes] FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesAttachements] CHECK CONSTRAINT [FK_SellerNotesAttachements_SellerNotes]
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReportedIssues_Downloads] FOREIGN KEY([AgainstDownloadID])
REFERENCES [dbo].[Downloads] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues] CHECK CONSTRAINT [FK_SellerNotesReportedIssues_Downloads]
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReportedIssues_SellerNotes] FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues] CHECK CONSTRAINT [FK_SellerNotesReportedIssues_SellerNotes]
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReportedIssues_Users] FOREIGN KEY([ReportedByID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues] CHECK CONSTRAINT [FK_SellerNotesReportedIssues_Users]
GO
ALTER TABLE [dbo].[SellerNotesReviews]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReviews_Downloads] FOREIGN KEY([AgainstDownloadsID])
REFERENCES [dbo].[Downloads] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReviews] CHECK CONSTRAINT [FK_SellerNotesReviews_Downloads]
GO
ALTER TABLE [dbo].[SellerNotesReviews]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReviews_SellerNotes] FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReviews] CHECK CONSTRAINT [FK_SellerNotesReviews_SellerNotes]
GO
ALTER TABLE [dbo].[SellerNotesReviews]  WITH CHECK ADD  CONSTRAINT [FK_SellerNotesReviews_Users] FOREIGN KEY([ReviewedByID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReviews] CHECK CONSTRAINT [FK_SellerNotesReviews_Users]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Countries] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Countries] ([CountryCode])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Countries]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Countries1] FOREIGN KEY([Country])
REFERENCES [dbo].[Countries] ([Name])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Countries1]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_ReferenceData] FOREIGN KEY([Gender])
REFERENCES [dbo].[ReferenceData] ([ID])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_ReferenceData]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRoles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRoles]
GO
USE [master]
GO
ALTER DATABASE [Notes] SET  READ_WRITE 
GO
