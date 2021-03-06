USE [master]
GO
/****** Object:  Database [QuanLyThuVien]    Script Date: 6/10/2019 7:56:42 PM ******/
CREATE DATABASE [QuanLyThuVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyThuVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuanLyThuVien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyThuVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuanLyThuVien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuanLyThuVien] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyThuVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyThuVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyThuVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyThuVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyThuVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyThuVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyThuVien] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyThuVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyThuVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyThuVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyThuVien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyThuVien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyThuVien] SET QUERY_STORE = OFF
GO
USE [QuanLyThuVien]
GO
/****** Object:  Table [dbo].[AudioBook]    Script Date: 6/10/2019 7:56:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AudioBook](
	[BookID] [int] NOT NULL,
	[AudioID] [int] NOT NULL,
	[AudioName] [nvarchar](250) NULL,
	[FileAudioSize] [int] NULL,
	[FileAudioPath] [nvarchar](150) NULL,
	[Alias] [varchar](250) NULL,
 CONSTRAINT [PK_AudioBook_1] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[AudioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](100) NULL,
	[DescriptionAuthor] [nvarchar](500) NULL,
	[Alias] [varchar](250) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCategories]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_BookCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[Alias] [varchar](250) NULL,
	[AuthorID] [int] NULL,
	[CategoryID] [int] NULL,
	[ViewCount] [int] NULL,
	[MoreImages] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[TopHot] [bit] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterDetails]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterDetails](
	[IDBook] [int] NOT NULL,
	[ChapterID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[NameChapter] [nvarchar](250) NULL,
	[Alias] [varchar](250) NULL,
 CONSTRAINT [PK_ChapterDetails] PRIMARY KEY CLUSTERED 
(
	[IDBook] ASC,
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ebook]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ebook](
	[BookID] [int] NOT NULL,
	[TypeEbookID] [int] NOT NULL,
	[Link] [nvarchar](500) NULL,
 CONSTRAINT [PK_Ebook] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[TypeEbookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotations]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotations](
	[QuotationID] [int] IDENTITY(1,1) NOT NULL,
	[NameQuotation] [nvarchar](250) NULL,
 CONSTRAINT [PK_Quotations] PRIMARY KEY CLUSTERED 
(
	[QuotationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTin]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThongTin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeEbook]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeEbook](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_TypeEbook] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeUsers]    Script Date: 6/10/2019 7:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeUsers](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeUsers] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/10/2019 7:56:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AudioBook] ([BookID], [AudioID], [AudioName], [FileAudioSize], [FileAudioPath], [Alias]) VALUES (17, 1, N'Thuận Pháo Phần 1', 67, N'~/AudioFile/Thuan Phao Phan 1.mp4', N'thuan-phao-phan-1')
INSERT [dbo].[AudioBook] ([BookID], [AudioID], [AudioName], [FileAudioSize], [FileAudioPath], [Alias]) VALUES (26, 1, N'Bên Rặng Tuyết Sơn Full', 218, N'~/AudioFile/BenRangTuyetSon.mp3', N'ben-rang-tuyet-son-full')
INSERT [dbo].[AudioBook] ([BookID], [AudioID], [AudioName], [FileAudioSize], [FileAudioPath], [Alias]) VALUES (30, 1, N'Audio Book - Đời Ngắn Đừng Ngủ Dài Phần 1', 58, N'~/AudioFile/Đời Ngắn Đừng Ngủ Dài.mp4', N'audio-book-doi-ngan-dung-ngu-dai-phan-1')
INSERT [dbo].[AudioBook] ([BookID], [AudioID], [AudioName], [FileAudioSize], [FileAudioPath], [Alias]) VALUES (1036, 1, N'Thép đã tôi thế đấy phần 1', 74, N'~/AudioFile/THÉP ĐÃ TÔI THẾ ĐẤY.mp4', N'thep-da-toi-the-day-phan-1')
INSERT [dbo].[AudioBook] ([BookID], [AudioID], [AudioName], [FileAudioSize], [FileAudioPath], [Alias]) VALUES (1041, 1, N'Hành Trình Về Phương Đông Phần 1', 86, N'~/AudioFile/Hành trình về Phương Đông Phần 1.webm', N'hanh-trinh-ve-phuong-dong-phan-1')
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (2, N'Ngô Thừa Ân', N'Tác giả của tác phẩm nổi tiếng Tây Du Ký', N'ngo-thua-an', 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (3, N'Tsutsumi Chiharu', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (10, N'Hứa Ngân Xuyên', N'Tiểu Hứa', NULL, 0)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (14, N'Tô Hoài', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (15, N'Nguyễn Nhật Ánh', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (16, N'Swami Amar Jyoti', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (17, N'Vô Danh', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (18, N'Nhiều Tác Giả', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (19, N'Sasaki Fumio', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (20, N'Đoàn Giỏi', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (21, N'Tracey Murket - Gill Rapley', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (22, N'Robin Sharma
', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (23, N'Vương Thiên Nhất', N'Ngoại tinh lai khách', N'vuong-thien-nhat', 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (24, N'Thi Nại Am', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (25, N'Kim Dung', N'Không có mô tả', NULL, 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (26, N'Tiểu Nghĩa', N'Không có mô tả', N'tieu-nghia', 0)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (27, N'zxcxzc', NULL, N'xzczx', 0)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (28, N'Hứa Ngân Xuyên', N'Không có mô tả', N'hua-ngan-xuyen', 0)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (29, N'Nicolas', NULL, N'nicolas', 0)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (30, N'Nicolas', N'Không mô tả', N'nicolas', 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (31, N'Tố Hữu', N'Nhà văn, nhà thơ Việt Nam', N'to-huu', 0)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (32, N'Dr. Blair T. Spalding', N'Không có mô tả', N'blair-spalding', 1)
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [DescriptionAuthor], [Alias], [Status]) VALUES (33, N'Demo', N'chưa có mô tả', N'demo', 1)
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[BookCategories] ON 

INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (1, N'Tất Cả Sách', N'tat-ca-sach', N'tat-ca-sach', N'Tất cả sách của thư viện', 1, CAST(N'2018-12-01T22:45:12.193' AS DateTime), N'Nghĩa', 1)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (2, N'Kiếm Hiệp', N'kiem-hiep', N'kiem-hiep', N'Thể Loại Kiếm Hiệp', 1, CAST(N'2018-12-01T22:45:12.193' AS DateTime), N'Nghĩa', 1)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (7, N'Tiểu Thuyết Trung Quốc', N'tieu-thuyet-trung-quoc', N'tieu-thuyet-trung-quoc', N'Thể Loại Tiểu Thuyết Trung Quốc', 1, CAST(N'2018-12-01T22:45:12.193' AS DateTime), N'Nghĩa', 0)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (8, N'Kinh Dị - Ma Quái', N'kinh-di-ma-quai', N'kinh-di-ma-quai', N'Thể Loại Kinh Dị Ma Quái', 1, CAST(N'2018-12-01T22:45:12.193' AS DateTime), N'Nghĩa', 0)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (9, N'Tuổi Học Trò', N'tuoi-hoc-tro', N'tuoi-hoc-tro', N'Thể Loại Tuổi Học Trò', 1, CAST(N'2018-12-01T22:45:12.193' AS DateTime), N'Nghĩa', 1)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (10, N'Khoa Học - Kỹ Thuật', N'khoa-hoc-ky-thuat', N'khoa-hoc-ky-thuat', N'Thể loại khoa học và kỹ thuật', 1, CAST(N'2018-12-05T14:37:09.030' AS DateTime), N'Nghĩa', 1)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (11, N'Tâm Lý - Kỹ Năng Sống', N'tam-ly-ky-nang-song', N'tam-ly-ky-nang-song', N'Thể loại Tâm Lý ', 1, CAST(N'2018-12-07T14:27:08.097' AS DateTime), N'Nghĩa', 1)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (12, N'Truyện Ngắn - Ngôn Tình', N'truyen-ngan-ngon-tinh', N'truyen-ngan-ngon-tinh', N'Truyện Ngắn Ngôn Tình', 1, CAST(N'2018-12-07T15:44:28.837' AS DateTime), N'Nghĩa', 1)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (13, N'Trinh Thám - Hình Sự', N'trinh-tham-hinh-su', N'trinh-tham-hinh-su', N'Thể loại Trinh Thám', 1, CAST(N'2018-12-07T19:33:03.080' AS DateTime), N'Nghĩa', 1)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (14, N'Văn Hóa - Tôn Giáo', N'van-hoa-ton-giao', N'van-hoa-ton-giao', N'Thể Loại Văn Hóa Tôn Giáo', 1, CAST(N'2018-12-07T21:50:30.913' AS DateTime), N'Nghĩa', 1)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (15, N'Văn Học Việt Nam', N'van-hoc-viet-nam', N'van-hoc-viet-nam', N'Thể Loại Văn Học Việt Nam', 1, CAST(N'2018-12-07T21:57:06.483' AS DateTime), N'Nghĩa', 1)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (19, N'Tình Yêu Tuổi Học Trò', N'tinh-yeu-tuoi-hoc-tro', N'tinh-yeu-tuoi-hoc-tro', N'Thể loại tình cảm tuổi học trò', 1, CAST(N'2019-06-09T17:17:32.523' AS DateTime), N'Nguyễn Trung Nghĩa', NULL)
INSERT [dbo].[BookCategories] ([CategoryID], [CategoryName], [SeoTitle], [MetaKeywords], [MetaDescription], [Status], [CreatedDate], [CreatedBy], [ShowOnHome]) VALUES (22, N'Minh Triết', N'minh-triet', N'minh-triet', N'Thể loại tâm linh', 1, CAST(N'2019-06-09T21:36:51.153' AS DateTime), N'Nguyễn Trung Nghĩa', 1)
SET IDENTITY_INSERT [dbo].[BookCategories] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (10, N'Nhân Hình Quán', N'Nhân Hình Quán là tác phẩm có màu sắc khác biệt nhất, cũng ngột ngạt nhất trong cả series Quán!

Sau khi cha mất, Soichi trở về nhà tổ, tiếp quản tài sản thừa kế đồ sộ, đồng thời tiếp quản cả những hình nhân cha để lại trong ngôi nhà này. Tất cả đều mất một phần thân thể, hoặc mặt hoặc tứ chi. Điều đó không khỏi khiến những người thích trinh thám, liên hệ đến vụ án phanh thây trong Tokyo hoàng đạo án. Nhưng đặc biệt hơn, các hình nhân này đã đặt theo những vị trí cố định, xoay mặt theo những hướng cố định. Dù khó chịu về sự có mặt của chúng, Soichi cũng không dám di dời hoặc thay đổi, bởi di ngôn của người cha quá cố chính là: Phải giữa nguyên các hình nhân.

Tuy không thể làm trái lời cha, nhưng không gì ngăn Soich khám phá bí mật ẩn sau các hình nhân đó.

Trong lúc Soichi miệt mài với trò chơi suy luận của mình thì các án mạng liên hoàn theo nhau xảy ra ngay bên ngoài, gần chỗ anh dạo chơi, chỗ anh uống cà phê, thậm chí sát cạnh nhà.

Cùng với sự hỗ trợ từ xa của người bạn giỏi suy luận là Shimada Kiyoshi, Soichi đã tìm ra mối liên hệ giữa Nhân Hình Quán với các “Quán” khác, cũng như phá giải được chân tướng của các án mạng gần và xa mình.

Một loạt sự thật của quá khứ lẫn hiện tại bắt đầu được phanh phui, bí mật về chính bản thân Soichi cũng theo đó hé lộ…', N'nhan-hinh-quan-yukito-ayatsuji', 3, 8, 1224, N'/assets/client/images/nhan-hinh-quan.jpg', CAST(N'2018-12-05T19:56:22.223' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (11, N'Thập Giác Quán', N'“Phải giết từng đứa, từng đứa một…”

Một ngày nọ, có bảy sinh viên thuộc Hội nghiên cứu tiểu thuyết trinh thám Đại học K ra thăm hoang đảo Tsunojima.

Ở đây có một tòa nhà độc đáo hình thập giác, tác phẩm của một kiến trúc sư đã chết cháy nửa năm về trước. Vốn yêu thích và ham suy luận, họ toan kết hợp việc vui chơi với điều tra khám phá các bí mật ẩn sau vụ chết cháy này, nhưng chẳng ai ngờ chuyến thăm đảo lại mau chóng biến thành một chuỗi án mạng mới, và các sinh viên lần lượt biến thành nạn nhân trong một kế hoạch ám sát tinh vi.

Bảy ngày và bảy người…

Giác quán giữa Giác đảo…

Ai là kẻ sát nhân?

Ai là người tiếp theo phải chết?

Tại sao? Và quan trọng hơn: Làm cách nào thoát nạn?

Chẳng thể tin tưởng một ai, từng nạn nhân đơn độc đối mặt với quỷ dữ, run rẩy vén bức màn ma mị để tìm ra sự thật. Bằng kiến thức thu lượm được từ kho truyện trinh thám đã tích lũy, liệu họ có vạch mặt chỉ tên được kẻ thủ ác và thoát nạn, hay có học mà không có hành, cuối cùng sẽ đi đến kết cục bi thảm là cuối cùng chẳng còn một ai?

Thập Giác Quán được đánh giá là có cái kết khiến người đọc sững sờ nhất trong lịch sử tiểu thuyết trinh thám Nhật Bản.', N'thap-giac-quan-yukito-ayatsuji', 3, 8, 1099, N'/assets/client/images/thap-giac-quan.jpg', CAST(N'2018-12-05T21:56:22.223' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (12, N'Mê Lộ Quán', N'Nghe nói, loài người xây dựng mê cung vốn để trừ tà. Người Trung Quốc thời xưa cho rằng ma quỷ chỉ có thể đi theo đường thẳng, vì vậy họ thường xây tường thành có hai lớp với hai cửa ra vào nằm lệch nhau, ở giữa là các lối đi uốn lượn. Còn người Anh cổ thì vẽ các hoa văn kiểu mê cung trên bậc thềm cửa chính, nhằm đề phòng ma quỷ xâm nhập.

Lấy ý tưởng từ câu chuyện quái vật mình người đầu bò Minotaur bị nhốt vào mê cung trong thần thoại Hy Lạp, Nakamura Seiji đã thiết kế nên Mê Lộ Quán.

Công trình kiến trúc dưới lòng đất này xứng đáng là một trong những kiệt tác xây dựng. Nhưng nó cũng kế thừa cái dớp chết chóc lạ kì bắt đầu từ Thập Giác Quán và Thủy Xa Quán, tiếp tục trở thành hiện trường của sát nhân hàng loạt.

Vào một ngày cuối xuân, 4 nhà văn tập trung ở đây, tham gia một cuộc thi viết truyện trinh thám lấy bối cảnh Mê Lộ Quán với người bị hại chính là tác giả câu chuyện.

Đề bài rất kích thích, đúng không?

Và kích thích hơn nữa là, các nhà văn đó đều lần lượt bị sát hại, đúng như cách thức mô tả trong tác phẩm của họ.

Xây mê cung, ý định ban đầu là để trừ tà, nhưng qua tay kiến trúc sư tài ba Nakamura, cuối cùng đã biến thành nơi tạo nên đủ điều tà ác…', N'me-lo-quan-yukito-ayatsuji', 3, 8, 2400, N'/assets/client/images/me-lo-quan.jpg', CAST(N'2018-12-06T01:11:13.807' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (13, N'Thủy Xa Quán', N'Vị kiến trúc sư tài hoa năm nào không còn, nhưng Thập Giác Quán, Thủy Xa Quán... và những tác phẩm tinh xảo kiêm quái đản khác của ông ta vẫn tiếp tục là hiện trường cho những cái chết thảm khốc. Sau khi Thập Giác Quán biến thành tro bụi, người anh em của nó là Thủy Xa Quán lại xuất hiện trên truyền thông với tư cách một mồ chôn lớn, chôn cả người chết lẫn người sống. Ở đây, một phụ nữ rơi xuống kênh, bị bánh xe nước cuốn lên rồi hất tung về phía hạ du. Một thanh niên ra ngoài đêm khuya bị chặt thành sáu mảnh rồi trụi lủi nham nhở trong lò đốt rác dưới chân Quán. Một nhà sư tan vào thinh không ngay trên tầng 2. Cũng ở đây, nữ chủ nhân chôn vùi tuổi hoa, và nam chủ nhân quyết tồn tại một cách khốn khổ, tách biệt xã hội, giấu diện mạo mình sau lớp mặt nạ cao su lạnh băng.

Họ muốn lãng quên xã hội, nhưng vì họ sở hữu nhiều tài sản quý giá quá và nhiều ân oán truyền kiếp quá, xã hội không chịu lãng quên họ. Cứ vào ngày giỗ của chủ nhân đời trước, Thủy Xa Quán lại mở cửa đón khách, và cuộc tiếp đón ấy năm nay, không thoát khỏi bóng đổ âm u của những cái chết bất ngờ…', N'thuy-xa-quan-yukito-ayatsuji', 3, 8, 1233, N'/assets/client/images/thuy-xa-quan.jpg', CAST(N'2018-12-06T01:12:59.637' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (14, N'Bí Ẩn Quân Hậu Đen', N'Một bức tranh cổ với dòng chữ kỳ lạ ẩn sâu bên dưới lớp màu vẽ. Một ván cờ trải dài 5 thế kỷ cùng những âm mưu và lời tố cáo mã hoá trong những nước cờ.

Quis necavit equitem? - Ai đã giết hiệp sĩ?

Câu hỏi ám ảnh về số phận của người hiệp sĩ xa xưa nay đã sống dậy, không chỉ hé lộ một chuyện tình buồn của hơn 500 năm trước mà còn kéo theo những vụ ám sát tàn nhẫn đến lạnh sống lưng. Kẻ nào đang núp bóng quân hậu đen đưa ra những nước đi chết chóc nối tiếp ván cờ cổ năm nào - những nước đi đại diện cho những toan tính chết người ngoài đời thật?

"Một câu đố hóc búa đầy hấp dẫn - một ván cờ nằm trong một ván cờ ẩn trong một ván cờ khác - được dẫn dắt tới lời giải theo một con đường trúc trắc nhưng cuốn hút vô vàn." - The Philadelphia Inquirer

"Đầy rẫy những nghịch lý và thách đố. Một bí ẩn mượt mà, công phu và tài tình đến điên rồ về cờ vua, cuộc sống và nghệ thuật." - The New York Time Book Review', N'bi-an-quan-hau-den-arturo-perez-reverte', 2, 13, 1400, N'/assets/client/images/bi-an-quan-hau-den.jpg', CAST(N'2018-12-06T03:01:20.503' AS DateTime), N'Nghĩa', 0, 0)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (15, N'Học Chơi Cờ Tướng', N'Học chơi cờ tướng dưới đây cung cấp những thông tin hữu ích, thú vị về nguồn gốc cũng như những thủ thuật, kỹ xảo khi chơi cờ tướng, cuốn sách còn tập hợp những thế cờ tiêu biểu, đặc sắc kèm theo những hình ảnh minh họa giúp bạn đọc tiện theo dõi, thưởng thức và học tập. Mời các bạn cùng tham khảo bộ môn nghệ thuật thú vị mang nét di sản tinh thần quý báu của dân tộc thông qua quyển sách này.Cờ tướng là một bộ phận của văn hóa trung hoa và nhân loại từ hàng nghìn năm nay và cũng là một thú vui giải trí.', N'hoc-choi-co-tuong-hai-phong', 2, 10, 2500, N'/assets/client/images/hoc-choi-co-tuong-hai-phong.jpg', CAST(N'2018-12-06T03:06:25.780' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (16, N'Truyện Ngắn Đặc Sắc Nga', N'Quyển sách do nhiều tác giả biên soạn, mang đến cho độc giả những tác phẩm truyện ngắn đặc sắc Nga. Đây được xem là tài liệu cần thiết cho những ai yêu thích văn học Nga cũng như nghiên cứu văn học Nga.', N'truyen-ngan-dac-sac-nga', 18, 12, 256, N'/assets/client/images/truyen-ngan-dac-sac-nga.jpg', CAST(N'2018-12-07T15:45:27.280' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (17, N'Cờ Tướng Những Phương Pháp Khai Cuộc Mới Nhất', N'Trong cờ tướng có 3 giai đoạn: khai cục, trung cục và tàn cục. Giai đoạn khai cục có vai trò rất quan trọng và đôi khi có ảnh hưởng tới quyền quyết định tới sự thành bại của ván đấu.
Cuốn Cờ tướng những phương pháp khai cục mới nhất đã được Nhà xuất bản TDTT in lần đầu vào năm 1997. Để giúp bạn đọc yêu thích môn Cờ tướng có thêm tài liệu tham khảo, học tập và nghiên cứu, Nhà xuất bản Thể dục Thể thao cho in lại cuốn sách này. Trong lần xuất bản này chúng tôi có chỉnh lý lại một số chỗ sai sót ở lần in trước và bỏ một số phần nhận thấy không còn phù hợp.', N'co-tuong-nhung-phuong-phap-khai-cuc-moi-nhat-hoang-thieu-long', 10, 10, 156, N'/assets/client/images/co-tuong-nhung-phuong-phap-khai-cuc-moi-nhat.jpg', CAST(N'2018-12-07T21:15:02.810' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (18, N'Chơi Cờ Tướng Như Thế Nào - Quyển 1', N'Chơi Cờ Tướng Như Thế Nào cung cấp cho các bạn mới chơi cờ những kiến thức cơ bản về phương pháp chơi cờ Tướng ở các giai đoạn của một ván cờ: Khai cuộc - Trung cuộc - Tàn cuộc. Với nhiều thế cờ minh họa cụ thể, sách giúp các bạn có thể tự mình học giỏi, nghiên cứu, dần dần nâng cao trình độ chơi cờ. Trong Quyển 1 sách giới thiệu những nội dung sau: Những khái niệm ban đầu. Khai cuộc căn bản. Cách bắt quân.', N'choi-co-tuong-nhu-the-nao-quyen-1', 10, 10, 241, N'/assets/client/images/choi-co-tuong-nhu-the-nao-quyen-1.jpg', CAST(N'2018-12-07T21:18:34.357' AS DateTime), N'Nghĩa', 1, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (19, N'Chơi Cờ Tướng Như Thế Nào - Quyển 2', N'Chơi Cờ Tướng Như Thế Nào cung cấp cho các bạn mới chơi cờ những kiến thức cơ bản về phương pháp chơi cờ Tướng ở các giai đoạn của một ván cờ: Khai cuộc - Trung cuộc - Tàn cuộc. Với nhiều thế cờ minh họa cụ thể, sách giúp các bạn có thể tự mình học giỏi, nghiên cứu, dần dần nâng cao trình độ chơi cờ. Trong Quyển 1 sách giới thiệu những nội dung sau: Những khái niệm ban đầu. Khai cuộc căn bản. Cách bắt quân.', N'choi-co-tuong-nhu-the-nao-quyen-2', 10, 10, 290, N'/assets/client/images/choi-co-tuong-nhu-the-nao-quyen-2.jpg', CAST(N'2018-12-07T21:21:06.670' AS DateTime), N'Nghĩa', 1, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (20, N'Luật Cờ Tướng', N'Sách giới thiệu đầy đủ các luật của cờ tướng, mong rằng cuốn sách sẽ giúp ích cho các bạn đang chơi bộ môn này. Sách do ủy ban thể dục thể thao biên soạn và phát hành.', N'luat-co-tuong', 10, 10, 250, N'/assets/client/images/luat-co-tuong.jpg', CAST(N'2018-12-07T21:22:43.090' AS DateTime), N'Nghĩa', 1, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (21, N'Lối Sống Tối Giản Của Người Nhật', N'Lối sống tối giản là cách sống cắt giảm vật dụng xuống còn mức tối thiểu. Và cùng với cuộc sống ít đồ đạc, ta có thể để tâm nhiều hơn tới hạnh phúc, đó chính là chủ đề của cuốn sách này.

Chẳng có ai từ khi sinh ra đã có tài sản, đồ đạc gì trong tay. Vậy nên bất cứ ai khi mới chào đời đều là những người sống tối giản. Cứ mỗi lần bạn sở hữu trong tay những đồ dùng hơn mức cần thiết là một lần bạn lấy mất tự do của chính mình. Giá trị bản thân chúng ta không đo bằng những đồ dùng mà chúng ta sở hữu. Những đồ dùng này chỉ cho chúng ta một chút cảm giác hạnh phúc nhất thời mà thôi. Mang theo những đồ dùng hơn mức cần thiết sẽ lấy hết thời gian, năng lượng của bạn. Khi nhận ra được điều đó, tức là bạn đã bắt đầu trở thành một người sống tối giản.

Những người sống tối giản luôn cảm thấy vui vẻ, mới lạ mỗi ngày. Cái cảm giác này, tôi nghĩ bất cứ ai cũng có thể cảm nhận được, dù bạn có phải là một người sống tối giản hay không, bởi bất cứ ai.

Lối sống tối giản của người Nhật gồm có năm chương, trong đó, chương một, tác giả sẽ giới thiệu cho bạn lối sống tối giản là gì, đưa ra định nghĩa của anh về nó. Sau đó anh sẽ đưa ra lý do vì sao mình lại theo lối sống này sau nhiều năm sống trong căn phòng của bản thân.

Chương hai tác giả sẽ đề cập đến tại sao sau ngần ấy năm, đồ đạc trong nhà lại chất nhiều đến thế. Những đồ đạc được tích tụ lại do thói quen hay nhu cầu của con người này mang ý nghĩa gì?

Chương ba là những bí quyết để cắt giảm đồ đạc trong nhà. Tác giả sẽ đưa ra cho bạn những quy tắc cụ thể, những phương pháp để có thể giảm bớt đồ đạc trong nhà. Thêm vào đó cũng sẽ giới thiệu cho bạn danh sách bổ sung 15 điều cho những người muốn tối giản hơn nữa cùng với toa thuốc cho “căn bệnh muốn vứt bỏ”.

Chương bốn, những thay đổi của chính tác giả sau khi dọn hết đồ đạc trong nhà. Kèm theo đó, anh còn phân tích và khảo sát thêm về các kết quả nghiên cứu tâm lý học.

Cuối cùng chương năm, tiếp nối ý từ chương bốn, tác giả sẽ giải thích tại sao những thay đổi của bản thân lại dẫn đến “hạnh phúc”.

Để hiểu sâu hơn về lối sống tối giản, bạn nên đọc hết từ chương một đến chương bốn. Tuy nhiên, bạn cũng có thể đọc riêng từng chương. Thậm chí chỉ cần đọc chương ba cũng có thể giúp bạn cắt giảm được đồ đạc của mình.

Trong cuốn sách này, “lối sống tối giản” được hiểu là: 1) giới hạn tối thiểu cần thiết cho bản thân và 2) vứt bỏ tất cả mọi thứ trừ những thứ quan trọng.

Và những người sống theo lối sống đó gọi là người sống tối giản.', N'loi-song-toi-gian-cua-nguoi-nhat', 19, 11, 9061, N'/assets/client/images/loi-song-toi-gian-cua-nguoi-nhat.jpg', CAST(N'2018-12-07T21:24:38.057' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (22, N'Đấu Phá Thương Khung', N'Đấu Phá Thương Khung là một câu chuyện huyền huyễn đặc sắc kể về Tiêu Viêm, một thiên chi kiêu tử với thiên phú tu luyện mà ai ai cũng hâm mộ, bỗng một ngày người mẹ mất đi đễ lại di vật là một chiếc giới chỉ màu đen nhưng từ khi đó Tiêu Viêm đã mất đi thiên phú tu luyện của mình.

Từ thiên tài rớt xuống làm phế vật trong 3 năm, rồi bị vị hôn thê thẳng thừng từ hôn, làm dấy lên ý chí nam nhi của mình, Tiêu Viêm nhờ di vật của mẫu thân để lại là 1 chiếc hắc giới chỉ (nhẫn màu đen)Tiêu Viêm gặp được hồn của Dược Lão (Dược Trần – Dược tôn giả) 1 đại luyện dược tông sư của đấu khí đại lục…

Từ đó cuộc đời của Tiêu Viêm có những biến hóa gì? Gặp được các đại ngộ gì? Thân phận thật sự của Huân Nhi (thanh mai trúc mã lúc nhỏ của Tiêu Viêm) ra sao? Bí mật của gia tộc hắn là gì? Cùng theo dõi bộ truyện Đấu Phá Thương Khung để có thể giải đáp các thắc mắc này các bạn nhé!', N'dau-pha-thuong-khung', 17, 2, 99280, N'/assets/client/images/dau-pha-thuong-khung.jpg', CAST(N'2018-12-07T21:34:40.700' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (23, N'Tây Du Ký', N'Tây Du Ký là bộ tiểu thuyết thần thoại thành công nhất trong lịch sử cổ đại Trung Quốc. Tiểu thuyết lấy câu chuyện Đường Tăng (Sư cụ Huyền Trang) - sư cụ Phật học nổi tiếng Trung Quốc thế kỷ 7 công nguyên sang Ấn Độ thỉnh kinh làm cốt truyện, hư cấu sư cụ Đường Tăng và ba học trò gặp phải các loại gian nan trắc trở trên con đường đi thỉnh kinh, xây dựng thành công nhân vật Tôn Ngộ Không - một hình tượng con khỉ thần không sợ bất cứ quyền uy gì, đấu tranh không ngừng với các thế lực xấu, bày tỏ nguyện vọng của tác giả đối với cuộc sống hiện thực.

Tây Du Ký hoàn toàn viết bằng hình thức câu chuyện. Mỗi một câu chuyện vừa độc lập riêng vừa có liên hệ với câu chuyện trước và câu chuyện sau, trong câu chuyện có các loại thần tiên quỷ quái, lần lượt đại diện chính nghĩa và gian ác.

Bộ Tây Du Ký của Ngô Thừa Ân ảnh hưởng to lớn tới đời sau, hàng trăm năm nay luôn là cội nguồn của tác phẩm văn học nhi đồng, tác phẩm phim ảnh và kịch.', N'tay-du-ky', 2, 7, 15252, N'/assets/client/images/tay-du-ky.jpg', CAST(N'2018-12-07T21:38:22.987' AS DateTime), N'Nghĩa', 1, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (24, N'Dế Mèn Phiêu Lưu Ký', N'"Dế mèn phiêu lưu kí" là tác phẩm văn xuôi đặc sắc và nổi tiếng nhất của Tô Hoài viết về loài vật, dành cho lứa tuổi thiếu nhi. Ban đầu truyện có tên là "Con dế mèn" (chính là ba chương đầu của truyện) do Nhà xuất bản Tân Dân, Hà Nội phát hành năm 1941.

Sau đó, được sự ủng hộ nhiệt tình của nhân dân, Tô Hoài viết thêm truyện "Dế Mèn phiêu lưu kí" (là bảy chương cuối của chuyện". Năm 1955, ông mới gộp hai chuyện vào với nhau để thành truyện "Dế mèn phiêu lưu kí" như ngày nay.', N'de-men-phieu-luu-ky', 14, 9, 18500, N'/assets/client/images/de-men-phieu-luu-ky.jpg', CAST(N'2018-12-07T21:45:01.497' AS DateTime), N'Nghĩa', 0, 0)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (25, N'Cô Gái Đến Từ Hôm Qua', N'Nếu ngày còn bé, Thư luôn tự hào mình là cậu con trai thông minh có quyền bắt nạt và sai khiến các cô bé cùng lứa tuổi thì giờ đây khi lớn lên, Thư luôn khổ sở khi thấy mình ngu ngơ và bị con gái “xỏ mũi”. Và điều nghịch lý ấy xem ra càng “trớ trêu” hơn, khi như một định mệnh, Thư nhận ra Việt An, cô bạn học thông minh cùng lớp thường làm mình bối rối bấy lâu nay chính là Tiểu Li - con bé hàng xóm ngốc nghếch từng chịu những trò nghịch ngợm của Thư hồi còn bé...', N'co-gai-den-tu-hom-qua', 15, 9, 21279, N'/assets/client/images/co-gai-den-tu-hom-qua-nguyen-nhat-anh.jpg', CAST(N'2018-12-07T21:47:12.400' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (26, N'Bên Rặng Tuyết Sơn', N'Bên Rặng Tuyết Sơn là quyển sách mới trong bộ sách khoa học tâm linh nổi tiếng của dịch giả Nguyên Phong. Khơi nguồn từ vùng núi Himalaya xa xôi và vùng đồng bằng Ấn Độ, Bên Rặng Tuyết Sơn mang đến cho bạn đọc những sự thật vĩ đại về tâm linh và vai trò của việc làm chủ tâm linh cũng như làm chủ số phận. Tác phẩm còn khơi dậy những giá trị cao đẹp như: Tính trung thực, trái tim bao dung, lòng trắc ẩn, sự thông thái, lòng tín ngưỡng và tình yêu bao la.

Câu chuyện bắt đầu từ việc Satyakam đến thung lũng Saraswati để tầm sư học đạo. Nhưng không ngờ rằng, khi đến đây, thì vị đạo sư già đã chờ anh rồi, không những thế, ông còn nói đúng tên anh và biết anh đến gặp ông để làm gì dù rằng anh chưa hề xưng tên cũng như chưa nói mục đích của mình đến đây.

Dài học đầu tiên của Satyakam là quên đi thời gian. Việc này nghe qua tưởng chừng như đơn giản nhưng khi bắt đầu thực hiện lại không đơn giản chút nào. Cũng như việc lắng nghe những âm thanh của vũ trụ như tiếng lá rơi, tiếng gió thổi, tiếng nước reo cũng không dễ dàng thực hiện nếu trong lòng ta vẫn còn nhiều tạp âm. Chúng ta sẽ được trải nghiệm những giây phút bình yên thông qua chuyến hành trình đi tìm chân lý của Satyakam dưới sự hướng dẫn của vị đạo sư trong dãy núi Tuyết Sơn để hiểu rõ hơn về sức mạnh vĩnh hằng của thế giới tâm linh cũng như khám phá chính tiếng nói nội tâm của bản thân mình.', N'ben-rang-tuyet-son', 16, 14, 5260, N'/assets/client/images/ben-rang-tuyet-son.jpg', CAST(N'2018-12-07T21:51:55.633' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (27, N'Cho Tôi Xin Một Vé Đi Tuổi Thơ', N'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.', N'cho-toi-xin-mot-ve-di-tuoi-tho', 15, 9, 16580, N'/assets/client/images/Cho-toi-xin-1-ve-di-tuoi-tho.jpg', CAST(N'2018-12-07T21:54:45.957' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (28, N'Đất Rừng Phương Nam', N'Câu chuyện mượn hình ảnh một cậu bé bị lưu lạc trong thời kỳ kháng chiến chống Pháp ở Nam bộ để giới thiệu "Đất rừng Phương Nam". Nơi đó, một vùng đất vô cùng giàu có, hào phóng và hùng vĩ với những con người trung hậu, trí dũng, một lòng một dạ theo kháng chiến.

"Đất rừng phương Nam" của Đoàn Giỏi như một xã hội của miền sông nước Tây Nam bộ thu nhỏ. Bởi ở nơi đó, người đọc đã tìm thấy hình ảnh người dân của vùng đất phương Nam từ sông Tiền, sông Hậu trải dài đến Kiên Giang - Rạch Giá, rồi xuống tận rừng U Minh, sau đó dừng lại ở Năm Căn Cà Mau.

Bối cảnh trong "Đất rừng phương Nam" là cả một đất trời thiên nhiên ưu đãi, cánh đồng bát ngát mênh mông, sóng nước rì rầm, rừng rậm bạt ngàn trù phú, thú rừng hoang dã muôn loài... Có thể nói truyện đã mang đến cho người đọc nhiều thú vị.', N'dat-rung-phuong-nam', 20, 15, 35007, N'/assets/client/images/dat-rung-phuong-nam.jpg', CAST(N'2018-12-07T21:58:22.013' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (29, N'Phương Pháp Ăn Dặm Bé Chỉ Huy', N'Nếu bạn đã quen với hình ảnh các bé được mẹ dùng muỗng đút thức ăn nghiền nhuyễn vào miệng, bé nhè ra và mẹ lại vét vào cho đến khi nào bé nuốt thì thôi, thì BLW sẽ là một hình ảnh hoàn toàn khác. Với phương pháp này, sẽ không có chuyện đút muỗng hay nghiền nhuyễn, mà ba mẹ sẽ cung cấp cho bé những thức ăn có hình dạng và kích cỡ phù hợp để bé có thể cầm lấy và tự đút cho mình bằng các ngón tay, tự chọn thức ăn, tự quyết định ăn bao nhiêu và ăn với tốc độ như thế nào. Rất có thể nhiều mẹ sẽ lo lắng bé ăn như thế nhỡ bị hóc thì sao.

Thực ra, bé cũng như người lớn, dễ bị hóc hay nghẹn hơn khi có người đút cho, bởi về cơ bản đó là kiểu ăn thụ động - bé không kiểm soát được lượng thức ăn đưa vào. Khi bé tự cho thức ăn vào miệng thì bé cũng nhận thức là mình đang ăn và sẽ điều khiển lưỡi, hàm, môi, họng một cách phù hợp. Nếu thức ăn to quá thì bé sẽ nhè ra. Tất nhiên, việc bé bị ọe vào thời gian đầu là hoàn toàn có thể. Nhưng ọe chỉ là một phản ứng của bé khi không chấp nhận đồ ăn. Sau vài lần ọe thì bé cũng hình thành ý thức và kỹ năng để biết ăn bao nhiêu, ăn như thế nào cho khỏi ọe. Thất bại là mẹ thành công mà.

Đã áp dụng phương pháp BLW thì mẹ phải tin tưởng bé. Tất cả những em bé khỏe mạnh đều có thể làm điều đó từ 6 tháng tuổi, khi bé đã có thể ngồi khá vững và hệ tiêu hóa cũng như miễn dịch đã đủ trưởng thành giúp bé hấp thụ các thức ăn khác ngoài sữa. Bé không cần được đút muỗng, bé chỉ cần được tạo cơ hội để tự ăn mà thôi. BLW sẽ giúp bé ăn uống một cách thoải mái, tự lập và rèn luyện kỹ năng ăn cho bé, cụ thể là:- Cho phép bé khám phá mùi vị và cảm giác về độ thô mịn;- Khuyến khích sự độc lập và tự tin;- Giúp bé phát triển các kỹ năng nhai và phối hợp giữa mắt và tay- Làm cho bữa ăn của bé bớt áp lực.', N'phuong-phap-an-dam-be-chi-huy', 21, 11, 958, N'/assets/client/images/phuong-phap-an-dam-be-chi-huy.jpg', CAST(N'2018-12-07T22:07:08.987' AS DateTime), N'Huy', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (30, N'Đời Ngắn Đừng Ngủ Dài', N'“Mọi lựa chọn đều giá trị. Mọi bước đi đều quan trọng. Cuộc sống vẫn diễn ra theo cách của nó, không phải theo cách của ta. Hãy kiên nhẫn. Tin tưởng. Hãy giống như người thợ cắt đá, đều đặn từng nhịp, ngày qua ngày. Cuối cùng, một nhát cắt duy nhất sẽ phá vỡ tảng đá và lộ ra viên kim cương. Người tràn đầy nhiệt huyết và tận tâm với việc mình làm không bao giờ bị chối bỏ. Sự thật là thế.”

Bằng những lời chia sẻ thật ngắn gọn, dễ hiểu về những trải nghiệm và suy ngẫm trong đời, Robin Sharma tiếp tục phong cách viết của ông từ cuốn sách Điều vĩ đại đời thường để mang đến cho độc giả những bài viết như lời tâm sự, vừa chân thành vừa sâu sắc.', N'doi-ngan-dung-ngu-dai', 22, 11, 52339, N'/assets/client/images/doi-ngan-dung-ngu-dai.jpg', CAST(N'2018-12-07T22:09:01.663' AS DateTime), N'Huy', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (31, N'Tam Quốc Diễn Nghĩa', N'Tam quốc diễn nghĩa nguyên tên là Tam quốc chí thông tục diễn nghĩa, là một tiểu thuyết lịch sử Trung Quốc được La Quán Trung viết vào thế kỷ 14 kể về thời kỳ hỗn loạn Tam Quốc (220-280), theo phương pháp bảy thực ba hư (bảy phần thực ba phần hư cấu). Tiểu thuyết này được xem là một trong bốn tác phẩm cổ điển hay nhất của văn học Trung Quốc.', N'tam-quoc-dien-nghia', 23, 7, 55867, N'/assets/client/images/tam-quoc-dien-nghia.jpg', CAST(N'2018-12-07T22:59:14.570' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (32, N'Thủy Hử', N'Quá trình tập hợp của các anh hùng thảo dã tại bến nước để hình thành quân khởi nghĩa Lương Sơn Bạc được Thi Nại Am dành 70 hồi để diễn giải. Tuy nhiên, nhân vật đầu tiên được đề cập không phải là một trong các vị anh hùng Lương Sơn, mà là Cao Cầu. Theo ý kiến các nhà nghiên cứu, quá trình thăng tiến của gian thần Cao Cầu chính là sự tố cáo cho chính sự thối nát của nhà Bắc Tống khi đó mà người chịu trách nhiệm cao nhất là hoàng đế Tống Huy Tông, một quân vương chơi bời, không quan tâm tới việc triều chính. Từ một thảo dân lông bông, Cao Cầu gặp may hết lần này tới lần khác, trở thành sủng thần của vua Tống Huy Tông và được phong chức Thái uý. Mối liên kết giữa các gian thần Cao Cầu, Lương Trung Thư, Vương Tiễn... và bộ máy quan lại tham lam, xảo quyệt, độc ác bên dưới đã làm hại các trung thần của triều đình (Lâm Xung, Võ Tòng, Dương Chí, Tống Giang, Hoa Vinh...) khiến họ lần lượt phải bỏ sự nghiệp đi theo Lương Sơn Bạc. Cũng có những anh hùng xuất thân nơi thôn dã, không có chức vụ quyền hành nhưng bất bình với sự áp chế, bóc lột của quan lại địa phương như Lý Quỳ, Sử Tiến, Lưu Đường... nên đã ra tay cứu giúp người hoạn nạn hoặc tự cứu bản thân mình, trở thành người phạm tội với triều đình và cũng lên Lương Sơn. Từng nhóm anh hùng được tập hợp riêng lẻ, rồi sau đó tất cả đều tụ về Lương Sơn. Theo đánh giá của các nhà nghiên cứu về Thủy hử, có những người con đường lên Lương Sơn vòng vo nhiều lần như Tống Giang, vì ông vốn mang tư tưởng trung hiếu với triều đình; lại có những người con đường lên Lương Sơn thẳng tuột như Lý Quỳ - ông coi việc làm phản khi bị hà hiếp là đương nhiên. Thủy hử phản ánh thực trạng trong xã hội phong kiến nhiều đời: "quan bức thì dân phản", điều đó rất hợp với tâm lý của đông đảo quần chúng lao động nghèo khổ bị bóc lột, áp bức nên Thủy hử dễ đi sâu vào tiềm thức của nhân dân. Điều khiến Thủy hử trở nên ly kỳ, hấp dẫn là ngoài tính cách đa dạng của các nhân vật, các tình tiết còn mang nhiều tính bất ngờ, thú vị cho người đọc. Người thủ lĩnh đầu tiên của Lương Sơn Bạc là Vương Luân, nhưng chính Vương Luân lại bị Lâm Xung giết để tôn Tiều Cái. Tiều Cái được xem là người khai sáng Lương Sơn, nhưng lại không thuộc vào số 108 vị anh hùng - không thuộc vào 36 vị thiên cang hay 72 vị địa sát - vì ông tử trận trước khi Lương Sơn tập hợp đủ 108 người. Tài năng, tính cách của các anh hùng Lương Sơn cũng phong phú, mỗi người một vẻ. Ngoài những người giỏi chinh chiến trên lưng ngựa như Quan Thắng, Lâm Xung, Hô Duyên Chước, Tần Minh, Đổng Bình... đánh bộ như Lý Quỳ, Võ Tòng, Lỗ Trí Thâm... còn một đội ngũ các tướng chuyên đánh thủy quân như anh em họ Trương, 3 anh em họ Nguyễn, Lý Tuấn; các quân sư tài ba như Ngô Dụng, Chu Vũ; những người di chuyển nhanh hoặc giỏi đột nhập như Đới Tung, Thời Thiên... Đặc biệt, trong các anh hùng Lương Sơn còn có 3 phụ nữ (Cố Đại Tẩu, Hỗ Tam Nương và Tôn Nhị Nương).', N'thuy-hu', 24, 7, 27883, N'/assets/client/images/thuy-hu.jpg', CAST(N'2018-12-07T23:00:30.890' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (33, N'Tuyết Sơn Phi Hồ', N'Tuyết Sơn Phi Hồ xảy ra trong bối cảnh tranh giành bảo đao của Sấm Vương Lý Tự Thành vào năm Càn Long thứ 48 đời nhà Thanh. Miêu Nhân Phụng trở thành nhân vật lẫy lừng trong chốn võ lâm với danh tiếng “Đi khắp thiên hạ không địch thủ”. Hồ Phỉ trẻ tuổi đã vang danh với ngoại hiệu Tuyết Sơn Phi Hồ, với cơ trí, võ công chữ Phi Hồ do “phi thiên hồ ly” (cáo bay trên trời) để ca ngợi hình ảnh tuổi trẻ tài cao. Hơn một trăm năm trước, vệ sĩ của Sấm Vương gồm họ Hồ, Miêu, Điền, Phạm vì tranh nhau để gây oán thù cho con cháu.', N'tuyet-son-phi-ho', 25, 2, 10294, N'/assets/client/images/tuyet-son-phi-ho.jpg', CAST(N'2018-12-07T23:03:03.130' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (34, N'Trật Tự Vũ Trụ', N'Cuốn Trật tự của Vũ trụ này là chìa khóa dẫn tới thiên đường. Nó là chiếc radar dò tìm giúp chỉ ra con đường giác ngộ đầy chông gai, hiểm nguy. Đây không phải là cuốn sách đọc bằng mắt. Hãy đọc và cảm nhận từng dòng, từng dòng bằng chính cơ thể mình.

Chiếc radar này sẽ từng giờ, từng phút dẫn lối, chỉ đường cho bạn tiến lên phía trước trong nơi sâu thẳm của cánh rừng sơ khai hay trong biển sóng đang nổi cơn thịnh nộ giữa gió bão mịt mù mà được người ta đặt cho tên gọi là CUỘC ĐỜI. Chiếc radar chỉ là thứ chỉ ra giúp bạn ở mỗi bước đi của bạn đâu là tảng đá ngầm chết chóc, đâu là eo biển sâu dữ dằn. Mọi nỗ lực tránh xa những chông gai, hiểm nguy đó để một mình tiếp tục cuộc hành trình nằm ở chính ý chí và kỹ năng của bạn.', N'trat-tu-vu-tru', 26, 11, 9055, N'/assets/client/images/trat-tu-vu-tru.jpg', CAST(N'2018-12-07T23:06:39.300' AS DateTime), N'Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (35, N'Nhật Ký Tiểu Hòa Thượng', N'Nhật Ký Tiểu Hòa Thượng', N'nhat-ky-tieu-hoa-thuong', 15, 11, 0, N'/Data/files/nhat-ky-tieu-hoa-thuong-o-thanh-pho.jpg', CAST(N'2018-12-22T22:29:09.227' AS DateTime), N'Trung Nghĩa', 1, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (1036, N'Thép đã tôi thế đấy', N'Nói về người lính', N'thep-da-toi-the-day', 29, 15, 0, N'/Data/files/thep-da-toi-the-day.jpg', CAST(N'2019-06-07T19:39:35.947' AS DateTime), N'Trung Nghĩa', 0, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (1038, N'Đảo Hoang', N'Đảo hoang: Ngược dòng thời gian, tác giả đưa ta về hoang đảo, nơi gia đình Mai Am Tiêm bị đày ải vì có ý coi thường ơn vua. Cuộc sống khó khăn nơi đây đã không khuất phục được những người con người khoáng đạt, tự do. Họ đã khai phá, tạo dựng nên những bãi bờ trù phú và đã tìm được một loại quả lạ, vỏ xanh, ruột đỏ, ngon ngọt mà ngày nay gọi là Dưa Hấu.', N'dao-hoang', 14, 15, 0, N'/Data/files/dao-hoang.jpg', CAST(N'2019-06-09T16:46:38.417' AS DateTime), N'Nguyễn Trung Nghĩa', 1, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (1039, N'Mắt Biếc', N'Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).', N'mat-biec', 15, 19, 0, N'/Data/files/mat-biec.jpg', CAST(N'2019-06-09T17:18:13.943' AS DateTime), N'Nguyễn Trung Nghĩa', 1, 1)
INSERT [dbo].[Books] ([BookID], [BookName], [Description], [Alias], [AuthorID], [CategoryID], [ViewCount], [MoreImages], [CreatedDate], [CreatedBy], [TopHot], [Status]) VALUES (1041, N'Hành Trình Về Phương Đông', N'Chưa có mô tả', N'hanh-trinh-ve-phuong-dong', 33, 22, 0, N'/Data/files/hanh-trinh-ve-phuong-dong(1).jpg', CAST(N'2019-06-09T21:37:27.897' AS DateTime), N'Nguyễn Trung Nghĩa', 1, 1)
SET IDENTITY_INSERT [dbo].[Books] OFF
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 1, N'<p><strong>C&aacute;ch đ&acirc;y đ&atilde; l&acirc;u, t&ocirc;i c&oacute; dịp đi thuyền tr&ecirc;n d&ograve;ng s&ocirc;ng Xibiri ảm đạm v&agrave;o một đ&ecirc;m thu tối trời. Đến kh&uacute;c s&ocirc;ng ngoặt, đột nhi&ecirc;n ở ph&iacute;a trước, dưới những d&atilde;y n&uacute;i tối om, vụt l&oacute;e l&ecirc;n một đ&aacute;m lửa nhỏ. Đốm lửa l&oacute;e s&aacute;ng, ch&oacute;i lọi, r&otilde; thật gần&hellip; &ndash;&ensp;Ch&agrave;, lạy Ch&uacute;a! - T&ocirc;i sung sướng thốt l&ecirc;n. - Sắp được nghỉ đ&ecirc;m rồi. Người l&aacute;i đ&ograve; ngo&aacute;i lại nh&igrave;n đốm lửa v&agrave; lại thản nhi&ecirc;n ra sức đẩy tay ch&egrave;o. &ndash;&ensp;C&ograve;n xa khướt! T&ocirc;i kh&ocirc;ng tin: th&igrave; đốm lửa vẫn đ&acirc;y kia, nhoi hẳn ra khỏi b&oacute;ng đ&ecirc;m mung lung. Nhưng người l&aacute;i đ&ograve; h&oacute;a ra lại đ&uacute;ng: quả l&agrave; c&ograve;n xa thật. Những đốm lửa đ&ecirc;m vốn dĩ như vậy đ&oacute;. Cứ lấn &aacute;t b&oacute;ng đ&ecirc;m m&agrave; tiến lại gần, cứ l&oacute;e s&aacute;ng l&ecirc;n, cứ hẹn, cứ l&agrave;m như ở ngay đ&oacute; gần gặn m&agrave; mồi ch&agrave;i. C&oacute; cảm gi&aacute;c rằng, chỉ hai ba ch&egrave;o nước nữa - thế l&agrave; đường d&agrave;i tới đ&iacute;ch&hellip; Vậy m&agrave; - c&ograve;n l&agrave; xa!&hellip; V&agrave; đ&ecirc;m ấy ch&uacute;ng t&ocirc;i c&ograve;n phải bơi thuyền m&atilde;i tr&ecirc;n d&ograve;ng s&ocirc;ng tối om như mực. Những đốm lửa nhỏ vẫn như gần, m&agrave; vẫn cứ xa&hellip; lập l&ograve;e mời nhử. Giờ đ&acirc;y t&ocirc;i thường hay nhớ lại d&ograve;ng s&ocirc;ng tối om giữa đ&ocirc;i bờ n&uacute;i đ&atilde; che tr&ugrave;m với đốm lửa nhỏ sống động đ&ecirc;m ấy. Cả trước đấy cũng như sau n&agrave;y, c&oacute; biết bao nhi&ecirc;u đốm lửa kh&aacute;c cũng đem c&aacute;i vẻ gần gặn của m&igrave;nh ra m&agrave; mồi nhử huyễn hoặc kh&ocirc;ng phải chỉ ri&ecirc;ng một m&igrave;nh t&ocirc;i. Nhưng cuộc sống vẫn tr&ocirc;i đi giữa đ&ocirc;i bờ ảm đạm ấy, c&ograve;n những đốm lửa vẫn cứ m&atilde;i xa xăm, v&agrave; đ&agrave;nh lại phải r&aacute;ng sức dấn th&ecirc;m tay ch&egrave;o&hellip;. Nhưng d&ugrave; sao&hellip; d&ugrave; sao đi nữa, ở ph&iacute;a trước - vẫn l&agrave; những đốm lửa!&hellip;</strong></p>
', N'Những Đốm Lửa', N'nhung-dom-lua')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 2, N'<p><em>Tr&ecirc;n mặt s&ocirc;ng, đối diện với th&agrave;nh phố, nh&oacute;m thợ mộc bảy người hối hả sửa chữa c&aacute;i cột chắn băng đỡ ch&acirc;n cầu: m&ugrave;a đ&ocirc;ng vừa qua, c&aacute;i cột đ&atilde; bị đ&aacute;m thị d&acirc;n ở c&aacute;c x&oacute;m ngoại &ocirc; dỡ trộm sạch. Năm nay m&ugrave;a xu&acirc;n đến muộn - th&aacute;ng Ba trẻ đẹp tr&ocirc;ng cứ như thể th&aacute;ng Mười gi&agrave; cỗi. M&atilde;i gần nửa buổi - m&agrave; chẳng phải ng&agrave;y n&agrave;o cũng thế - tr&ecirc;n nền trời đầy m&acirc;y đen, vầng mặt trời nhợt nhạt như trong ng&agrave;y đ&ocirc;ng th&aacute;ng r&eacute;t mới lấp l&oacute; trong những khoảng trống m&agrave;u lam giữa những đ&aacute;m m&acirc;y đen ấy, v&agrave; lạnh nhạt, cau c&oacute; ng&oacute; xuống mặt đất. H&ocirc;m nay đ&atilde; l&agrave; ng&agrave;y thứ s&aacute;u của Tuần Lễ Th&aacute;nh, vậy m&agrave; về đ&ecirc;m tuyết tan chảy giọt tr&ecirc;n m&aacute;i nh&agrave; lại đ&oacute;ng lại th&agrave;nh những băng nhũ xanh biếc d&agrave;i tới nửa arsin[1]; băng tr&ecirc;n s&ocirc;ng, kh&ocirc;ng c&ograve;n bị tuyết bao phủ, nom cũng xanh như những đ&aacute;m m&acirc;y m&ugrave;a đ&ocirc;ng. C&aacute;nh thợ mộc l&agrave;m việc, c&ograve;n ở đằng kia, trong th&agrave;nh phố, tiếng chu&ocirc;ng đổng ng&acirc;n nga buồn b&atilde; v&agrave; th&uacute;c giục. Những người thợ ngẩng đầu l&ecirc;n, mắt đăm chi&ecirc;u nh&igrave;n h&uacute;t v&agrave;o đ&aacute;m sương m&ugrave; xam x&aacute;m bao phủ th&agrave;nh phố, v&agrave; những lưỡi r&igrave;u vung l&ecirc;n để bổ xuống thường ngập ngừng dừng lại gi&acirc;y l&aacute;t tr&ecirc;n cao, hầu như sợ l&agrave;m đứt mất hồi chu&ocirc;ng ng&acirc;n nga &ecirc;m dịu. Đ&acirc;y đ&oacute; tr&ecirc;n dải s&ocirc;ng rộng, những c&agrave;nh t&ugrave;ng cong queo chồi l&ecirc;n, đ&aacute;nh dấu đường đi lại, đ&aacute;nh dấu những chỗ băng đ&atilde; tan v&agrave; những kẽ nứt tr&ecirc;n băng: ch&uacute;ng nh&ocirc; l&ecirc;n cao như những c&aacute;nh tay người chết đuối, co quắp v&igrave; những cơn giật dội. D&ograve;ng s&ocirc;ng gợi n&ecirc;n một cảm gi&aacute;c buồn nản, bải hoải: mặt s&ocirc;ng vắng ngắt, đầy những vết lốm đốm như vẩy mụn, như một con đường thẳng buồn tẻ hun h&uacute;t v&agrave;o c&otilde;i m&ugrave; mịt, nơi c&oacute; ngọn gi&oacute; lạnh buốt, ẩm ướt thoi th&oacute;p thở ra. Thợ cả &Ocirc;xip, một l&atilde;o mugich nhỏ b&eacute; chải chuốt, v&oacute;c người c&acirc;n đối, c&oacute; bộ r&acirc;u bạc trắng x&eacute;n vu&ocirc;ng vức, xoắn cẩn thận th&agrave;nh những v&ograve;ng nhỏ tr&ecirc;n đ&ocirc;i m&aacute; hồng h&agrave;o v&agrave; c&aacute;i cổ mềm mại, - lu&ocirc;n lu&ocirc;n c&oacute; mặt ở khắp mọi nơi v&agrave; mọi l&uacute;c, thỉnh thoảng lại qu&aacute;t th&aacute;o: &ndash;&ensp;Lũ g&agrave; con, nhanh tay l&ecirc;n n&agrave;o!? V&agrave; l&atilde;o n&oacute;i với t&ocirc;i, nửa như khuy&ecirc;n bảo, nửa như giễu cợt: &ndash;&ensp;Cậu gi&aacute;m thị, l&agrave;m g&igrave; m&agrave; cứ hếch c&aacute;i mũi đần độn của cậu l&ecirc;n trời thế? Ta hỏi cậu, cậu được cắt cử đến để&rsquo; tr&ocirc;ng nom c&ocirc;ng việc, phải kh&ocirc;ng n&agrave;o? Cậu l&agrave; người của &ocirc;ng chủ thầu Vaxi Xerg&acirc;uts cử đến, phải kh&ocirc;ng n&agrave;o? Thế nghĩa l&agrave; cậu phải đốc th&uacute;c bọn ta - bọn kia, l&agrave;m nhanh l&ecirc;n. Đ&oacute;, cậu được cắt cử đến để lập c&ocirc;ng trạng như thế, vậy m&agrave; cậu, ch&uacute; b&eacute; của ta, c&aacute;i c&acirc;y chết đắng chết kh&ocirc;, lại cứ hấp ha hấp h&aacute;y mắt m&agrave; nh&igrave;n c&ocirc;ng việc của m&igrave;nh! Cậu kh&ocirc;ng được quyền hấp h&aacute;y mắt, cậu phải mở to cả hai mắt ra m&agrave; nh&igrave;n, v&agrave; đ&ocirc;i khi phải th&eacute;t l&aacute;c l&ecirc;n, v&igrave; rằng người ta cắt cử cậu đến với ch&uacute;ng t&ocirc;i để l&agrave;m người cai quản&hellip; Vậy th&igrave; cậu chỉ huy đi, đồ trứng chim cu ạ! L&atilde;o lại qu&aacute;t anh em thợ: &ndash;&ensp;Đừng c&oacute; đứng m&agrave; ng&aacute;p d&agrave;i nữa! Đồ ma rừng, h&ocirc;m nay chẳng phải l&agrave; ng&agrave;y kết th&uacute;c c&ocirc;ng việc hay sao n&agrave;o? Bản th&acirc;n l&atilde;o l&agrave; kẻ lười biếng bậc nhất trong bọn. L&atilde;o th&ocirc;ng thạo c&ocirc;ng việc của m&igrave;nh, biết l&agrave;m ăn một c&aacute;ch th&aacute;o v&aacute;t, s&ocirc;i nổi, kh&eacute;o l&eacute;o v&agrave; say sưa, nhưng l&atilde;o kh&ocirc;ng th&iacute;ch nhọc x&aacute;c v&agrave; lu&ocirc;n lu&ocirc;n kể&rsquo; những chuyện hoang đường. Đ&uacute;ng v&agrave;o l&uacute;c c&ocirc;ng việc đang tr&ocirc;i chảy, khi người ta say m&ecirc; v&agrave; lặng lẽ chăm ch&uacute; l&agrave;m mọi việc cho thật trơn tru, đ&acirc;u v&agrave;o đấy, th&igrave; &Ocirc;xip đột nhi&ecirc;n cất l&ecirc;n c&aacute;i giọng nhỏ nhẹ như tiếng ong vo ve: &ndash;&ensp;Thế n&agrave;y n&agrave;y, anh em của t&ocirc;i ạ, c&oacute; một chuyện&hellip; Hai ba ph&uacute;t g&igrave; đ&oacute; người ta hầu như kh&ocirc;ng nghe l&atilde;o, mải m&ecirc; đẽo, b&agrave;o, chặt, nhưng c&aacute;i giọng nam cao nhỏ nhẹ cứ mơ m&agrave;ng tu&ocirc;n ra như nước chảy v&agrave; quấn qu&yacute;t lại, l&agrave;m lẫn lộn, tr&oacute;i buộc sự ch&uacute; &yacute; của người ta. Đ&ocirc;i mắt xanh lơ trong s&aacute;ng của &Ocirc;xip nheo lại một c&aacute;ch khoan kho&aacute;i. L&atilde;o đưa những ng&oacute;n tay l&ecirc;n xoắn xoắn bộ r&acirc;u quăn v&agrave;, bập m&ocirc;i kho&aacute;i ch&iacute;, nhẩn nha bu&ocirc;ng từng lời như x&acirc;u chuỗi hạt v&agrave;o chỉ. &ndash;&ensp;Hắn ta bắt được con c&aacute; nheo ấy, để n&oacute; v&agrave;o giỏ, đi qua rừng trở về, vừa đi vừa nghĩ bụng: &ldquo;Ch&agrave;, sẽ được một nồi canh c&aacute; ra tr&ograve; đấy?&rdquo; Nhưng bỗng đ&acirc;u chẳng hiểu từ chỗ n&agrave;o một giọng đ&agrave;n b&agrave; th&aacute;nh th&oacute;t k&ecirc;u: &ldquo;Elexya ơi, Elexya &agrave;&hellip;&rdquo; Anh ch&agrave;ng Lenka d&agrave;i ngh&ecirc;u xương xẩu, người Morđavi, c&oacute; c&aacute;i biệt hiệu Nar&ocirc;đetx, - một g&atilde; trai trẻ c&oacute; đ&ocirc;i mắt nhỏ l&uacute;c n&agrave;o cũng c&oacute; vẻ ngạc nhi&ecirc;n, - bu&ocirc;ng r&igrave;u xuống v&agrave; đứng ng&acirc;y ra, mồm h&aacute; hốc. &ndash;&ensp;C&ograve;n trong giỏ, một giọng trầm trầm ồm ồm đ&aacute;p lại: &ldquo;Ở đ&acirc;&hellip; &acirc;y!&rdquo; v&agrave; l&uacute;c đ&oacute; trong giỏ c&oacute; tiếng đập lộp bộp, con c&aacute; nheo quẫy m&igrave;nh, nhảy vọt ra v&agrave; đi trở lại, quay về vũng nước xo&aacute;y của m&igrave;nh&hellip; &Ocirc;ng l&iacute;nh gi&agrave; Xanhiavin, một tay n&aacute;t rượu, cau c&oacute;, bị bệnh tức thở v&agrave; từ l&acirc;u kh&ocirc;ng hiểu v&igrave; sao đ&atilde; bực bội với tất cả cuộc sống, cất giọng kh&agrave;n kh&agrave;n: &ndash;&ensp;C&aacute; nheo l&agrave;m sao lại đi tr&ecirc;n cạn được, n&oacute; l&agrave; c&aacute; kia m&agrave;? &ndash;&ensp;Thế c&aacute; c&oacute; n&oacute;i được kh&ocirc;ng đ&atilde; n&agrave;o? - &Ocirc;xip ngọt ng&agrave;o hỏi lại. M&ocirc;k&acirc;y Buđưrin, g&atilde; mugich tăm tối, c&oacute; bộ mặt như m&otilde;m ch&oacute;, lưỡng quyền v&agrave; cằm v&ecirc;u ra ph&iacute;a trước, c&ograve;n tr&aacute;n th&igrave; lại lẹm về đằng sau, - một con người lầm l&igrave; v&agrave; kh&ocirc;ng c&oacute; g&igrave; đặc sắc, chậm r&atilde;i tu&ocirc;n qua mũi mấy tiếng ưa d&ugrave;ng của m&igrave;nh: &ndash;&ensp;Ho&agrave;n to&agrave;n đ&uacute;ng&hellip;</em></p>
', N'Băng Chuyền', N'bang-chuyen')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 3, N' Anhia không nghe thấy có người gõ cửa sổ. Lúc đó cô đang đọc “Mùa hè kỳ lạ” của Feđin, đọc đến đoạn: Anôtska nói ra ý nghĩ của mình một cách mạnh bạo đến mức ngay cả ông nhà văn thủ đô Paxtukhốp cũng phải kiêng nể. Anhia thông cảm với Anôtska và tự hào về Anôtska, bởi vì bản thân cô hiểu rõ việc trước những người lớn tuổi, thông minh - mà thông minh theo cách của mình, khác hẳn cô, và vì thế mà coi cô nếu như không hẳn là một con ngốc thì cũng gần như thế - mà dám bảo vệ ý nghĩ của mình là một việc làm như thế nào!

Người ta lại gõ cửa lần nữa, bây giờ gõ ngoài cửa ra vào, ấy thế mà Anhia vẫn không nghe thấy. Và buổi tối hôm đó có thể cũng lại chỉ là một buổi tối bình thường, nếu như những người đứng ngoài cửa không đoán ra cứ tự tiện kéo mạnh cánh cửa và cứ tự tiện vào nhà không chờ Anhia mời.

Cô không nhìn thấy những người vừa vào nhà cô bị cái giá sách che mất cửa. Các em học sinh ở trường cô học trước cố ý đặt cái giá sách như vậy để luồng không khí giá lạnh không thổi vào bên sườn cô.

Và những ngày đầu tiên, khi, ngoài học sinh ra, hầu như chẳng có ai đến mượn sách nữa, mỗi tiếng cánh cửa bật là cô lại bật dậy. Cô hấp tấp nhảy ra khỏi chỗ ngồi sau bàn - lòng đầy hy vọng, tin tưởng thầm cầu khẩn một người nào đó không rõ, cầu khẩn sao ở ngưỡng cửa của cô xuất hiện ra một người bạn đọc thực sự, người mà vì người đó cô ngồi ở đây cho đến tận canh khuya và chịu đựng hết những lời nhạo báng. Chuyện đã cách đây hai năm về trước, từ đó đã qua nhiều biến đổi, và dần dà cô đã được ngồi yên sau bàn.

– Mà mình với cậu rơi vào chỗ thế nào thế này nhỉ? Chà, quỷ thật, đây cũng không phải văn phòng, mà… Này, ở đây có ai sống không đấy?

Loáng một cái Anhia vòng ra khỏi giá sách. Ở ngưỡng cửa có hai người đàn ông. Rõ ràng đây là hai người khách lạ - không phải người làng và cũng không phải là người ở trong quận nữa. Họ mặc những chiếc bành tô mùa thu ngắn, áo của một người bằng dạ mềm có hai nếp phủ rộng trên chỗ ngực, áo của người kia có bộ khuy vàng kỳ lạ, tất nhiên là hàng ngoại quốc. Một người quàng chiếc khăn viền đăng ten, còn ở người kia - chiếc khăn bằng lông dê - ở làng thì chỉ có những người đàn bà mới dùng những chiếc khăn như vậy… Anhia lướt nhìn họ một lượt, còn ý nghĩa của nó đã vượt đi ngược cả sự kiện diễn ra, - đây hẳn là đại biểu Xô viết về, thế thì bây giờ cô sẽ nói hết mọi cái về cái nhà câu lạc bộ - cái phòng ướp lạnh chứ không phải nhà cửa nữa. Xô viết thôn không cho chất đốt để sưởi, họ bảo sắp đến mùa xuân rồi. Mà có thể không phải đại biểu Xô viết? Vậy thì đây là ai? Hay từ tỉnh ủy về? Bất luận là ai cô cũng sẽ đem mọi việc ra tố cáo. Không phải từ tỉnh ủy ư? Vậy còn có thể là ai nữa?

Còn hai người khách cau có và lầm lầm, như Anhia cảm giác thế, xét nét cô. Cô theo dõi mắt nhìn của người quấn khăn quàng bằng lông dê, và cô nhìn thấy rõ bản thân như nhìn thấy một người khác: gương mặt có gò má cao, cặp mắt màu hạt dẻ, “những cái đuôi nhỏ” màu hung đỏ, món tóc con trai trên trán. Chiếc áo săng đay, chiếc quần trượt tuyết, đôi ủng dạ khâu đế, lại còn chiếc áo lông cừu từ thời học sinh khoác trên vai - chẳng ra con trai, mà cũng không ra con gái.

– Con bù nhìn có phải không? - Cô nói, sau khi cuối cùng đã gặp cặp mắt nhìn qua cái người quàng khăn lông dê. Và nhận thấy người ấy đỏ mặt tía tai lên. - Nhà chúng tôi hiện nay quả là tủ ướp lạnh, đành phải chất tất cả lên người - như vậy mà cũng chẳng thấy ấm. Ấy, mời các đồng chí vào đây, ở chỗ này ấm hơn, ở đây tôi có bếp…

Hai người khách, rõ ràng là hơi lúng túng vì sự tấn công trước của Anhia và vì cái khóa mở đầu quan hệ lại hóa ra ở trong tay cô, bèn ngoan ngoãn len theo cô vòng qua giá sách đến bên cái bếp đang cháy đỏ. Người đi trước - cái người quàng khăn bằng lông dê - không hiểu sao cô cảm thấy là người nhà hơn, anh ta có gương mặt rộng, nặng nê với đôi hàng lông mày chẳng dài. Anh ta nhìn gằm gằm, hơi lơ đãng. Còn ở người thứ hai gương mặt thanh tú, ngăm ngăm, bộ điệu giễu cợt, và cô lập tức quay ngoắt khỏi nụ cười giễu cợt, và chỉ nói với người quàng khăn lông dê:

– Tên tôi là Anhia Ptitxưna, - Cô tự giới thiệu. - coi thư viện. Còn các đồng chí là ai?

– Còn tôi là Đônxki. - Người da ngăm ngăm nói.

– Đừng bỡn cợt nữa. - Người kia bực bội càu nhàu. - Cô cho hỏi, ở đây có khách sạn hay cái gì đại loại như vậy không?

– Có nhà khách.

– Chúng tôi cần phải ngủ lại đêm. Mặt đường đóng băng… Xe của chúng tôi trơn trượt tẹo nữa thì lật ngửa, vì thế đành phải đợi đến sáng mai. Tỉnh lỵ còn xa đây không cô?

– Đi bằng xe tốt - ba giờ đồng hồ… Các đồng chí đi từ đâu tới vậy?

– Từ Mátxcơva. Tôi là nhạc công, ngày mai tôi phải biểu diễn… Đây là bạn của tôi, nhà văn. - Anh giới thiệu tên mình và tên người bạn.

Anh có thể thề rằng cô bé này trong giây lát lớn vụt lên trước mắt anh ta. Khi anh giới thiệu cái tên đồ sộ, vang dội, đã nổi tiếng vùng này, không hề sợ bao giờ đổ vỡ được của mình, thường là anh thấy người tiếp chuyện anh lập tức như bị chững lại - cái gì kia chứ. Sự kính trọng, lòng khâm phục, nỗi lúng túng? Chính bản thân anh do đó cũng cứng đờ, ngượng ngùng và buồn tẻ. Vậy mà cô bé này - cô ta đỏ bừng cả mặt cả tai, cặp mắt xanh xanh vàng vàng, màu hạt dẻ, hung đỏ của cô lóe lên một ý nghĩ đột ngột gì đó. Cô đứng trước họ - cao dong dỏng, căng thẳng, với gương mặt đỏ bừng bừng, gương mặt này giờ đây gợi nhớ đến một cái gì. Phải, phải, hoa Cháy, có cái thứ hoa như vậy ở Xibir, một lần anh đã được người ta tặng sau buổi biểu diễn. Hung đỏ như ngọn lửa.

Ở cô trên gương mặt chẳng có gì là cái vẫn thường thấy xuất hiện một cách ngán ngẩm và tầm thường ở những người khác mỗi khi nghe đến tên anh. Đúng hơn cả là, nói chung cô chẳng hề biết tí gì về anh. Và trong anh thoáng hiện lên thiện cảm chuyển thành ý nghĩ như thường có vào những đêm giao thừa, trong tiếng chuông đồng hồ điểm mười hai tiếng. Thế là tất cả cái gì nặng nề, ngờ vực xấu xí đã ở lại sau, và đã đến một giây phút - ngưỡng cửa vào cái mới, và cái mới ấy là một cái gì đó hoàn toàn khác hẳn. Sự ra đời mới của anh, tuổi trẻ, sự trong sạch và khả năng vui sướng… cái cảm giác này biểu hiện trong anh đơn giản hơn - nó gắn với chuyến đi này, và anh cảm thấy rằng thằng bạn của anh đã bày ra cái trò không đến nỗi ngu ngốc lắm - đi bằng xe hơi, và cũng không đến nỗi bi thảm cho lắm cái việc hai đứa bị ném vào một cái làng khỉ ho cò gáy này và anh sẽ ngủ không ra sao cả trước buổi biểu diễn của mình.

– Vâng, - Anhia, hít một hơi đầy, tựa hồ định lặn sâu khỏi bờ vực. - các đồng chí đã ở đây thì không thể đi đâu được nữa. Không-đi-đâu-được. Cho là có người đến đón các đồng chí đi cũng vậy. Ông chủ tịch mà nhìn thấy chiếc xe con là lập tức biết ngay là có khách. Thế là lập tức cho đón các đồng chí đến ngay chỗ ông ta. Nhưng mà các đồng chí đừng có mà đồng ý. Được không nào?

Cô vừa nói vừa hấp tấp đóng cúc áo ngoài, buộc dây mũ chụp tai.

– Tôi đi một loáng… đến nhà khách. Tôi sẽ thu xếp, các đồng chí cứ yên tâm. Mà trong thời gian đó thì các đồng chí sưởi cho ấm, nghỉ ngơi.

Đã ra tới cửa, cô quay lại chỗ hai người, chỗ cái bếp lò, mở cửa ngăn đặt thức ăn, xỏ bao tay chộp lấy cái chảo lôi ra. Cái chảo rắc đầy muối ngả màu nâu vì nóng, có những củ khoai tây nướng vỏ vàng rực. Anhia đổ khoai ra mặt chiếc bàn nhỏ kê sát bên tường, cất cái chảo vào ngăn bếp lò.

– Tạm thời các đồng chí ăn cho đỡ buồn. Cái thứ khoai tây như của chúng tôi đây không ở đâu có đâu… Tự nó sẽ chui tuốt vào mồm cho mà xem.

Cô chọn lấy một củ trong đống khoai, lấy nắm tay nhỏ đập xuống. Cái vỏ khoai nứt ra, và Anhia bửa củ khoai ra làm hai, mềm mại óng ánh hột đường.

– Chúng tôi ăn như thế này đây. - Cô nói và khi đã đi tới cửa lại quay lại kêu to. - Các đồng chí không được đi đâu đấy, tôi giao lại những tài sản quý giá cho các đồng chí đấy nhé! Ở đây là mười lăm ngàn đồng rúp mới đấy…

Cô lấy vai hất mạnh cánh cửa nặng nê và biến mất.

– Chà, cái cô bé điên rồ! - Anh chàng tự giới thiệu với Anhia là Đumitri Đônxki nói. - Tuôn ra một tràng, rồi thì xích chúng ta lại đây… Chà chà! Valeri, chúng ta làm gì đây?

– Ăn khoai tây.

– Vậy thì có thể đem cái “tráp nhỏ” ở xe vào chăng? Trong đó mình có mang cônhắc, cá hồng…

– Không, không, tôi không thể. Mà cả cậu mình cũng khuyên không nên - không tiện, đây là thư viện kia mà, người ta sẽ lui tới.

– Ôi lạy Chúa, thì đòi hỏi gì ở chúng ta kia chứ: chúng ta là những người khách đi đường. Với lại có ai phải giữ kẽ ở làng quê, cậu như là người ở sao Hỏa rơi xuống không bằng, thật đấy…

– Xasa ạ, thôi thì tùy ý cậu.

Trong câu trả lời rõ ràng có sự bực bội, mệt mỏi. Anh lại tiếc là đã bằng lòng đi chuyến này. Giá anh cứ đi bằng xe lửa chuyến đêm, tha hồ mà ngủ ngon, ngày mai tới biểu diễn - rồi là về. Đi nghe theo những lời lảm nhảm lãng mạn! Mà không, chẳng qua là anh đã đồng ý để khỏi bị Xasa, người bạn cũ đã có ý định “lay chuyển” anh khỏi rầy rà anh mãi. “Cậu tưởng tượng mà xem, chúng ta sẽ đi qua những thành phố Nga cổ, với những cái nhà thờ nhỏ bé đứng trên đồi, với những người đàn bà chậm rãi đi trên những thành phố vắng. Rồi trên đường về chúng ta sẽ vào ngủ đêm lại ở Xpaxki, nơi ngày xưa đủ loại lữ khách đã nghỉ lại nhà Turgheniép… Thế nào? Cậu có tưởng tượng được không? Hàng loạt những cảm xúc, những sự pha trộn kỳ lạ giữa các thời đại, những cảm giác mới… Tất cả mọi người đều đi vào mùa hè, còn chúng ta. - Chúng ta đi vào lúc mùa đông thở hơi thở cuối cùng, khi anh cảm thấy ở tất cả mọi cái đều có những sức lực tích lũy, những sức lực mà chỉ nay mai là bùng ra nổi loạn, làm nổ tung sự yên tĩnh của ngày đông… Xe của mình loại hảo hạng, mình sẽ chở cậu đi một cách thận trọng như chở một cái bát pha lê…”.

Không, nếu như hoàn toàn thành thực, thì chính cả anh cũng thích cái chuyến đi này, thích tới cái mức mà Xasa gán cho. Có điều không thể thú nhận với Xasa điều đó, nếu không sẽ bị hạ thấp trước đôi mắt đảo lộn cả tâm hồn người ta, đôi mắt hài hước; và anh ta sẽ cười khẩy mà theo dõi từng hơi thở và ánh mắt - nghiên cứu cái chuyển động tâm lý, kiểm tra xem hiệu lực của liều thuốc.

Liều thuốc… cái ấy thì anh tự thú nhận với bản thân mình, rằng dù sao đi nữa cũng có một cái gì trục trặc, rằng chính bản thân anh đang chờ đợi một liều thuốc gì đó. Mọi cái mà mới chỉ ít lâu làm anh vui sướng, thì nay chỉ gây cho anh thấy bực bội! Nào là ở những hàng ghế đầu trong bất cứ một buổi biểu diễn nào của anh, anh đều thấy thấp thoáng những đầu bạc, những mái tóc chải kiểu cách kỳ dị của các bà già mặc những chiếc áo váy dài hào nhoáng. Nào là sau cánh gà cũng chen chúc những chú bé và cô bé với những gương mặt ngây thộn ra vì thán phục. Nào đi ngoài phố luôn có những người không quen biết chào anh. Bây giờ anh cảm thấy rằng, những bà già đều dự các cuộc biểu diễn của anh không phải để nghe anh đàn, mà là để hồi tưởng, có nghĩa là không phải sống bằng nhạc của anh, bằng những đau khổ dằn vặt và hạnh phúc trong những tìm tòi qua anh, những viễn tưởng của anh, không cùng anh rơi xuống vực sâu và để rồi leo lên những đỉnh cao chói lọi của cái cuộc sống hùng vĩ khác đã khuất nhưng còn để lại sau mình những tâm sự này, mà là để hồi tưởng lại những cuộc sống bé nhỏ của mình, hồi tưởng cái tuổi thanh xuân vừa mới trở thành tro bụi của mình.

Có thể, cả chính anh đối với họ - cũng chỉ là giấc mộng của các hình ảnh khác, những thần tượng tuổi thanh xuân của họ? Bây giờ anh có cảm giác là sở dĩ những chú bé và cô bé đến túm tụm sau cánh gà là do một ngọn sóng hiếu danh nhục nhã xô đẩy chúng đến - chúng sẽ khoe với bạn bè rằng chúng đã được nhìn thấy anh, đã được nói chuyện với anh và cũng hoàn toàn như mọi người khác, không có dấu ấn thiên tài trên trán rằng, gương mặt của anh bình thường nặng nề… Và người ta chào anh trên đường phố không phải vì muốn biểu lộ sự biết ơn vì những giây phút cao cả của cuộc sống mà anh đã tặng cho họ, mà là muốn chứng tỏ rằng mình cũng thuộc vào cái loại người đặc biệt có khả năng đánh giá được “Tiếng ríu rít của bày quỷ” của Paganir.

Một thời gian dài, rất dài - mười lăm, hai mươi năm - anh đã đàn cho chính bản thân mình. Âm nhạc đối với anh là cả cuộc đời. Tất cả mọi cái không phải là nhạc đều làm anh bực bội - sự cần thiết phải ăn uống, phải may mặc, phải đó đây, chuẩn bị đi đường hay đi máy bay ra nước ngoài, - tất cả những gì ở giữa những lúc đàn, lúc nghỉ, hoạt động cần thiết của sự sống. Anh thấy khổ sở phải gặp gỡ mọi người, phải tiếp chuyện, hiểu cho được những gì người ta nói với anh khi một số phóng viên đến phỏng vấn anh sau chuyến đi biểu diễn của anh sang châu Âu và Mỹ về, do những giọng nói dai dẳng của họ, những câu hỏi rành rọt, liến láu của họ ở trong anh bùng sôi lên ngọn triều tức tối. Những câu hỏi của họ có quan hệ gì đến âm nhạc của anh kia chứ? “Ở Pháp anh thích gì? Người ta đón tiếp anh ra sao? Bao nhiêu người đến dự cái buổi biểu diễn của anh? Giờ rảnh rang anh sử dụng ra sao?” Anh sử dụng giờ rảnh rang của mình với cây vĩ cầm, và ở Pháp anh thích âm nhạc, âm nhạc của anh.

Thế mà, bỗng nhiên… mà có thể, không phải bỗng nhiên, có thể chẳng qua là trước đây anh không cho phép bản thân mình suy nghĩ và nhận xét cái tình cảm tự vệ tự nhiên này? Bỗng nhiên nảy ra cảm giác rằng anh và cử tọa - nói chung chẳng phải là một khối thống nhất gì. Rất nhiều những thế giới khác biệt, và mỗi thế giới - tự mình tồn tại lấy, và hai mươi năm anh chỉ sống bằng ảo mộng, rằng anh luôn luôn liên kết được những thế giới này vào một dù chỉ trong giây phút ngắn ngủi, nhưng có thể, là những giây phút có ý nghĩa duy nhất của cuộc đời.

Ai đàn cho ai mới được? Vì ai mà anh vét cặn bản thân mình - lần nào cũng vét đến đáy, vét đến mức là có cảm giác lần sau không còn có gì để đàn, anh hoàn toàn trống rỗng? Hoàn toàn bị hút cạn. Ờ, do đâu mà trong tiếng Nga có cái từ - hút cạn. Hít cạn. Uống cạn…

Mà có thể, chẳng qua là anh trở nên đàn tồi hơn? Đàn không có kỹ thuật - đâu phải. Tồi tệ hơn - lạnh lùng hơn? Có thể, chẳng qua là anh chẳng biết gì con người? Mà anh cần biết để làm gì kia chứ? Anh có một nhiệm vụ đời sống khác - anh muốn rằng người ta được biết những cuộc đời khác - cao thượng hơn, ý nghĩa hơn là cuộc đời của chính họ…

Tất cả cái đó nay sống trong anh, như một căn bệnh nặng nê, bí ẩn, cần phải phát hiện ra. Anh không còn tin vào sức mạnh siêu việt của âm nhạc nữa. Không còn tin vào cái quyền lực thần diệu của chính mình nữa. Không tin ở mình, mỗi một tác phẩm mới anh đều đi về địa phương đàn thử đã - cũng giống như thông qua một cuộc tổng duyệt gì đó.

Anh dễ dàng nghe theo Xasa, đề xướng ra cái chuyến đi vô nghĩa này - đi ô tô vào mùa đông, thêm vào đó cái bụng lại đói. Ngoài vợ và mẹ ra, Alecxanđr là người duy nhất anh có thể không phải vất vả gì cũng chịu đựng được trong cuộc sống của mình, - từ buổi biểu diễn ngày anh còn trẻ, cái buổi biểu diễn mà Alecxanđr đã đến dự với tư cách là một phóng viên tường thuật của tờ báo Mátxcơva. Khi đó hai người đã đi bộ trên phố Mátxcơva, cho mãi đến lúc những xe ô tô điện đầu tiên bắt đầu chạy mở đầu một ngày mới, thoạt tiên họ đi bộ là do cả hai đều không để ý đến thời gian, còn sau đó là do cả hai người đều không có tiên để đi xe tắc xi…

Xasa cuối cùng vẫn mang chiếc “tráp nhỏ” vào, một cái tráp gỗ sồi xinh xắn, quà của những người mến phục anh ta ở vùng sông Đông tặng cho anh ta. Alecxanđr đã sống cả một mùa hè ở làng Côdắc của họ. Anh ta cắt mỏng những miếng giò hun khói, bóc cá hồng, bày bánh mì, rượu cônhắc ra, và đến lúc này thì một lúc có mấy cô gái xộc vào thư viện, cô nọ đẩy cô kia đi trước, cười khúc khích và ngượng ngùng, có cả thảy ba cô, má đỏ ửng vì giá lạnh, cùng choàng một kiểu khăn lông giống nhau.

– Xin chào các bác! - Các cô cùng đồng thanh nói và lại cười khúc khích.

Một trong ba cô, đảo mắt nhìn qua những món nhắm trên bàn, bước lên trước, lôi ra một cái túi đặt xuống ghế, nhanh nhẹn lôi từ đó ra một cái bọc gói bằng khăn trải bàn để lên bàn và nói:

– Đây là cô Anhia bảo chuyển đến các bác. Và ra lệnh là: làm sao các bác ăn bằng hết. Nếu không cô ấy sẽ giận đấy.

Và, bây giờ thì cô nọ lại tranh vượt trước cô kia, cả ba lao vụt ra cửa.

Trong bọc khăn trải bàn có mấy quả trứng luộc còn nóng, miếng mỡ lợn, nắm muối và mấy trái táo to, tươi rói, tựa hồ vừa trẩy ở trên cây xuống, chín bóng, nửa vàng - nửa đỏ.

– Nào, ông bạn, coi bộ bắt đầu sống được đấy. - Xasa nói, hai bàn tay khô gầy xoa xoa vào nhau. - Cô bé điên rồ ấy - hóa ra là một cô gái thông minh. Có thể, dù sao cậu cũng uống chút ít giải nhọc đường trường chứ, Valeri?

– Không. - Anh ương bướng trả lời, mặc dù, nói chung thì tợp một ít rồi lăn ra ngủ li bì, như thể hàng nghìn năm nay chưa được ngủ rồi cũng không phải là việc tồi.

Anhia trở về, khi trên bàn chỉ còn cái cành táo và vỏ khoai tây.

– Ấy thế là mọi chuyện đâu vào đấy. - Cô nói. - Tôi đã thu xếp đâu vào đấy cả. Có điều là không ở nhà khách. Ở đấy hôm nay có anh em lái xe ngủ lại, anh em mệt nhừ vì con đường này nên giờ đã đang ngủ say cả rồi. Họ lại phải ra đi vào sáng sớm mai… Mấy lại nói chung, các đồng chí cũng chẳng ngủ nổi ở đấy đâu! Họ ngáy mới kinh khủng.

Cô cười ngượng nghịu, tựa hồ ngượng thay cho những cái anh chàng lái xe tuy không quen biết, nhưng là “người nhà” này và bào chữa cho sự mệt mỏi của họ.

– Mấy lại ở đây nóng lắm, bác Agasav đốt lò sưởi quá chăm… Ấy vậy, đồng chí kỹ sư trưởng về nông nghiệp mời các đồng chí lại chỗ các đồng chí ấy. Các đồng chí ấy ở căn nhà của các chuyên viên, căn nhà ở đấy đầy đủ tiện nghi. Các đồng chí đến đấy nghỉ, còn các đồng chí kia sẽ lại đây.

– Ôi lạy Chúa. - Xasa thở dài. - Sao lại phải rắc rối như vậy kia chứ, con người đáng yêu? Cô thích những câu chuyện huyễn hoặc? Cô nhận đi, rằng cô cố ý bày ra thế để thành ra sự cố chứ gì, có đúng không?

Cô gái hy vọng nhìn người thứ hai, và người kia hiểu cô, giật tay áo Xasa:

– Thôi đi, cậu. Nào, bây giờ chúng tôi phải đi đâu đây?

– Bây giờ… tạm thời ở đó còn đang sửa soạn… đồng chí có thể đi với tôi đến một chỗ. Chỗ này ngay cạnh đây thôi… Xem một chỗ…. một… - Cô nói, không nghe thấy lời mình, nhìn đăm đăm vào một mình anh, bằng ánh mắt đề nghị anh hiểu cho, tin mình.

– Thôi được, các bạn. - Xasa nói, cười khẩy. - Trong lúc các bạn đi đến một chỗ… một… còn tôi sẽ xem lại xe. Cô cho biết có thể để nó vào chỗ nào được nhỉ?

– Phải quá. - Anhia nói không giấu nổi sự nhẹ nhõm và mừng vui. - Bác thợ cơ khí đang đợi đồng chí ở bên cạnh xe của các đồng chí, lúc ấy sẽ chỉ nhà và sẽ sắp xếp đâu vào đấy.

Cái chỗ mà Anhia đưa anh nhạc công đến hóa ra là một nếp nhà gỗ nhỏ cùng dãy với nhà thư viện, cách nhà thư viện ba nhà. Anhia mở khóa, bật sáng đèn và anh đã nhìn thấy một gian phòng rộng với những bức tường trát vách sần sùi, nhưng quét vôi trắng kỹ lưỡng. Gian phòng tưởng như lớn hơn cả chính bản thân nếp nhà.

Khi đứng ngoài trời nhìn vào.

Trên tường treo những bức tranh đóng trong những cái khung gỗ đơn giản, có lẽ do bàn tay của một người thợ mộc trong thôn làm ra.

Đây là những bức tranh của các nghệ sĩ chuyên nghiệp. Anh còn chưa cảm thấy rõ họ tài hay không, nhưng tính chất nghê nghiệp ở đây không còn nghi ngờ gì cả. Đây không phải là những bản sao chép - anh không nhận ra một bức tranh quen nào cả, nhưng đôi ba tên tuổi anh cảm thấy lờ mờ có quen biết. “Sân bay miên Bắc”… Nếp nhà gỗ nhỏ, ngập trong tuyết đến mái, những chiếc xe trượt do hươu kéo, hẳn là vừa đưa hành khách đến sân bay, một con chó ló ra một cách lo lắng qua màn tối…

Bên một bức tranh anh dừng lại khá lâu, con suối hẹp xuyên qua những đống tuyết hiện ra dưới đáy một khe sâu phủ tuyết. Ở một điểm nó đan chéo với ánh sáng mặt trời, đường ánh sáng mặt trời từ trên cao xuyên đến gặp nó, và cái điểm giao tiếp ấy hồ như tóe ra tia lửa thần kỳ - tất cả bùng lên niềm hoan hỉ, niềm hoan hỉ của hứa hẹn không gì ngăn cản được, báo hiệu mùa xuân… Dường như tất cả thế gian hàng nghìn năm chỉ có sống để cái ánh sáng mặt trời này gặp được con suối mỏng manh, và chỉ giờ đây mới bắt đầu cuộc sống thực sự, con sông trở thành dòng thác, núi non mọc đầy rừng Taiga… Tên của bức tranh rất đơn giản và thanh thoát - “Con suối con Laletinô”.

Anh nghe thấy đằng sau lưng anh, Anhia thở hồi hộp, thế là quay lại, anh hỏi:

– Bức tranh này ở đâu ra thế?

– A, đây là những người của chúng tôi đưa về. Những người tốt nghiệp trung học của chúng tôi. Người phục vụ trong quân đội, người làm việc trong các lĩnh vực khác. Họ về nghỉ phép - chẳng ai là về tay không. Chúng tôi có thầy giáo Akim Ivanôvits. Một lần đội học sinh chúng tôi đã lao động mùa hè thu nhặt củ cải đường và được một số tiền kha khá. Còn nửa tháng nữa mới tới ngày tựu trường, vì thế Akim Ivanôvits mới bảo: “Các em ạ, số tiền này các em có thể mua quần áo. Quần áo thì rồi các em sẽ mặc rách đi - và thế là hết tiền… Còn với số tiền này các em có thể làm một việc mà không bao giờ hao tốn hết”. Lúc ấy chúng tôi đứng ngây ra mà nghe. Thầy giáo bảo: “Chẳng hạn như có thể tổ chức đi thăm Lêningrát”.

Chà, sau đó biết bao nhiêu là chuyện! Akim Ivanôvits đích thân đi đến gặp tất cả các phụ huynh, thầy giáo đã nói gì với các phụ huynh, như thuyết phục các phụ huynh ra sao?… Chỉ có thầy giáo mới có thể làm được. Đồng chí biết không, thầy mới chỉ năm mươi tuổi thôi nhưng ngay đối với các ông bà già thầy cũng đang là thầy dạy. Từ làng này thầy đã ra mặt trận, đã đi qua khắp cả châu Âu, nhưng rồi thầy chẳng muốn bỏ đi đâu, mà lại trở về làng.

Cô nói nhanh, hồ như nuốt mất chữ, lẫn mất cả ý. Và bỗng nhiên anh cảm thấy một cách sâu sắc rằng trong một tiếng đồng hồ qua, trong lúc cô gái bỏ đi đâu đó thì đã có chuyện gì xảy ra với cô: cô hoàn toàn khác hẳn với cô trong giây phút đầu tiên. Có thể chẳng qua là cô ngượng ngùng trước anh?

– Cô kể rất là lý thú. - Anh định giúp cô.

– Ôi, nếu như tôi có thể kể cho ra đầu ra cuối hẳn hoi! - Đột ngột, cô nói một cách thất vọng, đưa hai lòng bàn tay ôm chặt lấy má và nhìn thẳng vào mắt anh. - Akim Ivanôvits - đó là tất cả… Ở trường chúng tôi có một bảo tàng mới quý chứ! Trong đó có đủ mọi thứ trên khắp thế gian - cả những cây cỏ, cả những sinh vật… Thú rừng, chim muông, loài bò sát… Đài khí tượng tự tay chúng tôi cùng với Akim Ivanôvits xây dựng, xây dựng theo bản vẽ của thầy… Và đây nữa - phòng trưng bày tranh. Cái này là sau chuyến đi Lêningrát về, sau khi chúng tôi đi thăm bảo tàng Nga. Akim Ivanôvits luôn luôn nói: con người ta cần phải thấy cái chân chính… Đồng chí hiểu chứ? Và nếu như…

Tiếp theo đáng ra cô phải nói: và nếu như hôm nay đồng chí lại lên đàn, người của chúng tôi lại được nghe. Nhưng cô đã vấp và bây giờ cô không làm sao dám nói rằng lúc này đây, có lẽ là nhà câu lạc bộ đã chật ních những người rồi: bởi vì căn nhà khách cô chỉ ghé vào có một phút, còn suốt thời gian sau cô đi tập hợp các bạn gái trong câu lạc bộ và chạy đến trường tìm Akim Ivanôvits. Thầy hứa là sẽ cho tất cả học sinh nghỉ học giờ cuối cùng để về đưa cha mẹ đến câu lạc bộ. Chỉ đến lúc này cô mới tưởng tượng đầy đủ hết mức độ nỗi kinh khủng của cái việc cô đã bày ra đây là một tên tuổi lẫy lừng khắp thế giới, chắc là ngay cả người Mátxcơva cũng khó lọt được đến cái buổi biểu diễn của anh, vậy mà cô lại quyết định một việc không hỏi anh: báo động khắp cả hàng xóm. Cô đã học đủ các sách - mà lại quên mất rằng cuộc sống không phải sách vở, mà cô đâu có phải Anôtska của Fêđin. Mười tám tuổi, cô chẳng được một ai gọi một lần nào là Anôtska, chỉ những Anka, với Anna, với Nhưnrka, và chẳng ai quỳ dưới “chiếc giày vàng” của cô, như viết trong sách[6].

Mọi cái cô đều phải đoạt lấy qua đấu tranh, mọi cái cô đều phải chứng minh. Cô đã phải chịu đựng biết bao nhiêu chuyện vì cái thư viện này! Trước tiên là từ phía mẹ cô: “Thế nào, bị miếng bánh dê ăn quyến rũ hẳn? Chà, lũ các người, lũ thanh niên, mới thông minh gớm! Còn bọn chúng tao vào cái tuổi các người bây giờ lại hùng hục lao vào những chỗ khó khăn: cánh đàn ông lái máy kéo - bọn chúng tao cũng đi lái máy kéo. Mà cái máy kéo lúc đó như thế nào kia chứ? Đâu phải như máy kéo bây giờ - cứ bấm các thứ nút, thế là xong… Không, cô bé yêu quý của tôi ạ, thật là tên sen đầm Đức. Chỉ vừa ngồi vào cầm tay lái là cái đồ đểu giả ấy hất ngay cho cô một cái, như con ngựa bất kham ấy, thế là cô nằm ệch xuống đất. Không, cô đừng có tưởng rằng tôi than thở đâu, - tôi tự hào kia, phải! Cánh đàn ông ra mặt trận cả, vậy mà không có cánh lái máy kéo đàn bà này thì sự thể đã ra thế nào không biết? Chắc hẳn người ta đã phải tự nai lưng ra mà kéo cày lấy, khá thì cũng phải lẽo đẽo cày theo bằng bò… Chà! Và con cũng có thể thực sự vào đời, con gái ạ.

Con cứ xem xem - bạn bè của con sau khi tốt nghiệp trường trung học đều đi làm những công việc thực sự cả: người đi vắt sữa, người đi học lái máy kéo, người ra thành phố vào đại học. Mà con thì lúc đó lại có điều kiện hơn chúng - tiếng tăm của mẹ lúc đó còn chưa lắng mất. Mấy lại ngày nay chính Matrena dạy bảo bọn con gái. Matrena với Pasa Angheliha suốt đời đã thi đua nhau. Ai chứ Matrena biết rõ phải dạy bảo ra sao”.

Mẹ Anhia có gương mặt gò má cao giống người Kanmưc, nước da ngăm ngăm, mái tóc đen mượt, suốt đời cắt ngắn như kiểu tóc những năm ba mươi. Và bà giữ mãi chiếc khăn màu đỏ đội đầu cho đến lúc già.

Ngay cả bây giờ bà cũng vẫn còn mang cái khăn ấy, mặc dù đã không còn sức làm việc trên máy kéo nữa, đã mười năm rồi bà chuyển sang vắt sữa bò.

Tiếp theo mẹ Anhia - các bà phụ nữ khác trong làng cũng phụ vào: “Thế nào, Nhưnrka, con đường đi của bà mẹ - dốc trơn quá hẳn? Đâu phải, nói gì thì nói chứ, cô là cô bé thông minh, ở trong thư viện của cô tha hồ ấm áp và chẳng bao giờ lấm bụi cả”.

Nghe mọi người nói, cô chỉ cười. Đầu ngả sang vai, cô cười, cô nhìn vào mắt người nói. Các bà phụ nữ bảo với mẹ cô: “0, Nhưnrka tính tình thật là vàng… Nhổ vào mặt cô bé, mà nó vẫn cứ hồ hởi như hoa… Bỏ qua tai hết”. Nhưng Anhia có bỏ qua tai cái gì đâu, cô ghi nhớ tất cả. Chỉ có điều, làm sao lại có thể oán giận mọi người được, họ không được biết một điều khác, cái đó đâu có phải là lỗi tại họ, rằng thời trẻ họ không có thời giờ sức lực để cầm đến sách, mà đến tuổi già thì tâm hồn đã han gỉ, cứ thử mà nhồi nhét cái gì vào đó xem.

Đáng bực hơn cả là mẹ cô không muốn hiểu cô. Vào những ngày đầu tiên từ sáng cho đến nửa buổi trước khi mở cửa thư viện, Anhia chạy đến trại chăn nuôi giúp đỡ mẹ. Thấy thế một lần mẹ lại bảo cô: “Nhưnrka, mẹ nhận nuôi thêm mấy con bò nữa nhé? Nếu như con giúp mẹ, mẹ sẽ lo liệu được”. - “Mẹ, con chỉ muốn là giúp để mẹ đỡ vất vả hơn thôi, chứ đâu có phải để thêm công thêm điểm. Nhà ta cái gì cũng đã đầy đủ. Mẹ xem, chỉ sau một năm là người ta cho con hai bộ quần áo len, một đôi bốt, chiếc áo lông cừu màu… Việc gì cứ vì đồng tiên mà suốt đời đầu tắt mặt tối? Tốt hơn là mẹ nghỉ ngơi đi, ngồi mà đọc sách!”- “Hừm, hoặc con là một con ngốc loạn trí, hoặc chẳng qua là con muốn trêu chọc mẹ - mẹ mà ngồi đấy đọc sách, trong khi đôi bàn tay mẹ vẫn còn đòi hỏi công việc!” - “Mẹ, chẳng lẽ mẹ không muốn biết cuộc sống của những người khác ra sao ư? Mẹ đọc một trăm cuốn sách thì cũng hồ như mẹ sống thêm một trăm cuộc đời nữa!” - “Với mẹ thì chỉ nguyên một cuộc đời của mẹ cũng đủ rồi. Mẹ chẳng cần phải cuộc đời nào khác cả. Cũng như đối với người khác thì cuộc đời mẹ có cần làm gì”.

Khi Anhia đã làm ở thư viện được khoảng một năm, không một ai trong làng xóm còn lấy cái chỗ ngồi ấm áp và không lấm bụi ấy ra mà chê bai được cô nữa. Chẳng phải chờ đến lúc có được người đọc nghiêm túc tìm đến cô. Cô tự đeo lên lưng một chiếc ba lô cô đã mua để dùng cho chính việc này, và đi đến khắp những nơi xa xôi nhất trong làng xóm. Cô đi đến các nơi phân phát sách, ghi yêu cầu của người đọc để lần sau sẽ mang tới cho họ những cuốn sách họ cần, kể cho họ nghe về những cuốn sách cô yêu thích. Cô mang sách đến cho chị em thợ vắt sữa ở trại chăn nuôi. Mang sách đến cho anh em lái máy kéo ngoài đồng. Cứ đến giờ ăn trưa, ngồi vào ăn là họ đề nghị: “Nhưnrka, trong lúc chúng tôi ăn, - cô đọc cho nghe để giải trí chút ít nào”.

Rồi qua thêm một năm nữa mọi người thấy quen với việc trong làng của họ hàng tuần vào tối thứ bảy có tổ chức quán cà phê thanh niên, rằng trong câu lạc bộ của họ người ta diễn “Đám cưới ở Malinoska”, diễn khéo đến nỗi khách ở các nông trang khác cũng kéo đến xem. Rằng trong dạ hội Puskin, bà Agasa, người trông coi việc lao công ở nhà khách, đã hát bài “Bão tuyết mịt mù…” Và các bà phụ nữ đã ứa nước mắt. Và chẳng ai nghĩ ngợi rằng chính cái cô coi thư viện Nhưnrka, con gái bà lái máy kéo đã liên kết những con người sống trong cái làng này từ lọt lòng mẹ lại gần với nhau. Nghĩ ngợi thì chẳng nghĩ ngợi được điều đó đâu nhưng mọi người đã gọi cô là Anna, cô Anna yêu quý.

Còn bây giờ đây cô muốn lại làm cho mọi người được hưởng một điều vui sướng nữa - muốn nhà nghệ sĩ đàn cho họ nghe những khúc nhạc mà họ chỉ có thể được nghe trên đài. Và, biết đâu đấy, rất có thể họ không còn có dịp nào khác được nghe tiếng đàn của anh, tiếng đàn sinh động phát ra từ dưới những ngón tay anh bấm. Và cô tin ở mình rằng cô sẽ giải thích được cuộc đời của mình, cuộc đời của mẹ cô, cuộc đời của làng xóm cho anh hiểu… Chà, chẳng nhẽ lại có thể làm được điều đó ư? Lời nói theo nhau chậm rãi bò ra nhợt nhạt như thể tấm vải phai màu sau vụ nắng hè. Điều chủ yếu nhất là cô không làm sao giải thích được việc anh đàn sẽ quan trọng đến mức nào. Bởi vì anh đúng là cái chân chính, mà Akim Ivanôvits luôn luôn nói tới.

– Nếu như đồng chí biết được là tôi đã bày ra cái trò gì. - Cô nói, giọng hoàn toàn thất vọng và nức nở òa lên khóc.

– Có chuyện gì thế cô? - Anh hỏi, cô cảm thấy anh hỏi một cách nghiêm khắc giống hệt như Akim Ivanôvits hỏi mỗi khi một học sinh nào đó đến lớp mà không thuộc bài địa lý.

– Xin đồng chí tha thứ cho tôi… Ngượng quá… Tôi không thể nói ra được.

– Nào, nào, có chuyện gì xảy ra ghê gớm đến thế mới được kia chứ? - Anh còn mỉm cười, và gương mặt của anh thay đổi đến nỗi không nhận ra được nữa: cặp lông mày rướn lên cao, đôi mắt mở to, nghịch ngợm. Hồ như anh thông đồng tham gia với cô vào một trò chơi vui nhộn nào đó.

Tái mặt đi, cô se sẽ thở dài.

– Dân làng chúng tôi đang đợi đồng chí ở câu lạc bộ… chỉ có điều xin đồng chí đừng từ chối ngay. - Cô vặn vẹo ngón tay, nhưng cặp mắt vẫn nhìn thẳng. Đoạn cô nói thêm. - Bởi vì rất nhiều người trong bà con có thể sống hết cuộc đời của mình mà chẳng được nghe đồng chí đàn.

…Khi hai người đi vào câu lạc bộ, anh lập tức đưa mắt nhìn bao quát xem căn phòng sẽ truyền âm thanh ra sao. Anh yên tâm: đây là ngôi nhà thờ cũ, âm thanh sẽ trọn vẹn, ngân lên trang trọng. Sau đó anh nhìn khắp lượt cử tọa từ phía sau, phía lưng người ngồi trở lên - không có một chỗ trống nào, bọn trẻ con thì đứng chen chúc bên cạnh các thành cửa sổ, một lối đi thảm đỏ trải dài giữa các hàng ghế phô tơi thẳng lên sân khấu, và khi anh đi theo sau Anhia bước lên lối đi đó, người ta lập tức quay cả về phía anh mà nhìn.

Trong lúc anh lấy cây vĩ cầm ra khỏi hộp, Anhia bước ra trước sân khấu - thân người dong dỏng với đôi vai rộng, bộ áo váy da màu xanh sáng, đôi bốt da hai màu hung hung cao gót, mái tóc bồng lên đỏ rực. Anh đưa mắt nhìn cả căn phòng, rồi nhìn lên Anhia, cô gái dỏng cao với đôi vai khỏe mạnh và gương mặt sáng ngời, đỏ bừng, tràn ngập niêm hạnh phúc và trang trọng, và anh thấy nghẹn ngào.

Đây không phải là niêm cảm xúc của hai mươi năm về trước, khi lần đầu tiên anh đứng mặt đối mặt với một cử tọa rộng lớn, mà lúc đó anh sợ không dám nhìn thẳng xuống, khi đó trước cử tọa là một chú bé run rẩy, kẻ mà với tất cả sức lực hăng say của tuổi trẻ chỉ muốn một điều: sao để người ta hiểu được mình và công nhận mình. Sao để từ giây phút đó bắt đầu mối liên hệ hạnh phúc giữa anh với họ, những người có khả năng cũng yêu quý cái mà anh yêu quý, yêu quý âm nhạc. Giờ đây chỉ một cái nhìn anh cũng có thể thu hết cả cử tọa này, cả căn phòng được phân đôi ra bởi lối đi thảm đỏ, và trong giây lát chiếu sáng anh thấy ra cuộc đời của những con người, những con người mà trong giây phút này trên mặt hiện rõ sự sẵn sàng bắt tay vào công việc lao động.

Phải, phải, ở họ là những gương mặt chăm chú, nghiêm trang, kín đáo của những con người sẵn sàng bắt tay vào công việc lao động, công việc lao động mà họ buộc phải làm lấy một mình, công việc lao động mà họ không thể ỷ lại vào ai. Họ ngồi đó, đặt những bàn tay nặng nê lên đùi - những bàn tay cái gì cũng làm được, những bàn tay thần diệu, những bàn tay mà lúc này đây, trong giây phút rảnh rang đến đột ngột, đang khoan khoái nghỉ ngơi.

Phía bên phải, ở hàng hai, những cô gái choàng những chiếc khăn lụa màu kiểu cách rực rỡ bên trên những mái tóc chải bồng cao, cười nhìn nhau - và lập tức anh cũng lại hiểu họ: đấy là những người trợ lực của Anhia, những người mà chỉ trong một giờ đồng hồ tập hợp được tất cả làng đến ngôi nhà thờ cổ, sửa soạn được phòng nhạc, tìm mượn được cái thảm đỏ trải lối đi này và giờ đây còn chưa trấn tĩnh được sau cuộc phiêu lưu sung sướng.

Khi Anhia bằng cái giọng lảnh lót, hổn hển giới thiệu anh, anh nâng cây vĩ cầm trên đôi bàn tay đưa thẳng ra, nâng một cách nương nhẹ như thể nâng một đứa bé mới đẻ, bước tới trước, gần lại với gian phòng cử tọa và hạ thấp giọng nói:

– Đây là một cây vĩ cầm đặc biệt. Đây là cây vĩ cầm của Gvarneri, nghệ nhân tuyệt diệu của Ý. Trên thế giới này chỉ có vài ba cây.

Chính bản thân anh hẳn cũng không giải thích nổi vì sao anh lại nói vậy. Có thể vì anh cho rằng đó là món tặng phẩm quý giá nhất mà anh có thể đem đến tặng cho những người bà con của Anhia - bắt cái cây đàn kỳ diệu của Gvarneri phải lên tiếng cho họ nghe.

Anhia đứng ở bên cánh gà sân khấu, tựa lưng vào tường, nhìn xuống cử tọa, và khóc. Thoạt tiên cô nhìn anh, nhìn gương mặt to nặng nề của anh, cặp lông mày của anh rướn lên cao và động đậy, đôi mắt của anh mở to tròn, anh dẩu cặp môi lên, cặp má căng ra, gương mặt của anh lộ ra cuộc sống bấy nay anh vẫn giấu kín mọi người. Anh không còn cần biết là mọi người nhìn thấy nó thế nào - thấy nó đần độn hay thông minh, xấu xí hay xinh đẹp, và cái đó làm cho anh trong mắt nhìn của Anhia bỗng trở nên bé bỏng như một đứa trẻ, và trái tim cô thắt lại bởi một nỗi thương xót khôn cùng!

Cô tưởng tượng là hầu như mỗi tối anh đều ra đứng trước mọi người với cây vĩ cầm kỳ diệu của mình - cũng hoàn toàn cởi mở, và bất cứ một ai đều có thể nghĩ về anh tùy thích, tùy thích nghĩ về gương mặt nặng nề của anh, về cặp lông mày rướn lên cao một cách nực cười kia… Và anh có ai để thương anh, an ủi anh, yêu anh không biết mệt không nhỉ? Và cô thấy nhói lên đau xót vì rằng cái gương mặt này, cái gương mặt mà thoạt nhìn cô đã tin tưởng hết mức, thoáng hiện lên đây và rồi sẽ mãi mãi đi khỏi cuộc đời của cô. Và chẳng bao giờ anh còn nhớ tới cái cô bé tóc hung ở cái làng mà ngay cả tên làng anh cũng không biết.

Và cuộc đời của cô lại sẽ chảy đi như trước đây: sáng sớm cô sẽ lại chạy đến trại chăn nuôi chỗ mẹ làm, giúp mẹ, sau đó ngồi ở thư viện, đi đến các nhà, rồi trước khi đi ngủ lại tranh luận với mẹ - cuộc tranh luận không bao giờ kết thúc, - và mẹ cô lại chì chiết cô vì cái cuộc sống dễ dàng không lấm bụi.

Người mẹ yêu thương, phải đâu ngẫu nhiên mà mẹ cô căm ghét tất cả mọi cuộc sống không lấm bụi - mẹ cô căm ghét bởi vì chính do cái công việc “dầu mỡ” của mẹ cô mà cha cô đã bỏ đi. Cha bỏ đi với người đàn bà khác sạch sẽ gọn gàng.

Ngay bây giờ đôi khi Anhia cũng vẫn như thấy lại trước mặt cái cảnh đã diễn ra trong ngày đó. Đời cô không có gì ghê sợ hơn buổi ấy. Lúc đó cô đang ngồi học bài. Cánh cửa ra vào ầm ầm mở toang ra, đôi nạng gỗ của cha cô bay vào phòng, tiếp theo là mẹ cô tóc trần, mặc chiếc áo khoác ngoài ngắn bằng lông cừu không gài cúc. Mẹ ngã dụi xuống giường và gào khóc: “Lạy Chúa, vì sao mà Người trừng phạt con! Cả đời con, con làm lụng! Chính vì thế mà mọi người tôn trọng con, thế mà hắn, quân đê tiện, lại đi đánh đổi lấy kẻ nào kia chứ - đổi lấy mụ Marutka làm ở bưu điện! Đổi lấy đôi tay trắng trẻo!”

Anhia còn đang đi lại chỗ mẹ thì cha cô đã bò về, không nạng, đầm đìa mồ hôi, tóc xõa xuống trán, mặt đỏ bừng và đôi mắt điên dại… Chắc hẳn có chỗ cha cô đã phải nhảy lò cò trên một chân, tay vịn vào bờ rào của các nhà bên đường, có chỗ lại đã phải bò. May mà buổi tối không trăng sao. Đến lúc này, cha cô vịn vào thành cửa, toàn bộ thân hình vạm vỡ vươn thẳng dậy, và át những lời than vãn của mẹ, cha cô tuôn ra một tràng: “Hừm, thế là hết, cô vợ đáng yêu ạ, đến bước xuống lỗ tôi cũng không thể quên được! Lăng nhục một kẻ ở tiên tuyến về? Bắt bò như một con chó? Thế là hết. - Thôi ở đây mà làm bạn với cái máy cày, mụ đàn bà dầu mỡ ạ!… Nhưnrka, đưa đôi nạng đây!”

Và chẳng nhìn đến mẹ, cũng chẳng nhìn đến cô, cô bé Anhia, con gái của mình, cha cô cứ thế bỏ đi không đóng theo sau cánh cửa ra vào. Và ngay đêm đó, để sáng ra không phải thấy nỗi khinh bỉ mình trong mắt nhìn của mọi người, cha đã cùng Marutka - mụ đưa thư, tìm ra đường cái lớn và ra đi, chắc hẳn đi nhờ chiếc xe qua đường gặp đầu tiên. Cả hai hồ như rơi tõm xuống nước mất hút. Có người bảo hồ như cả hai đi đến vùng khai hoang. Có người khác lại bảo - họ đến công trình xây dựng ở Xibir. Có thể tin được điều đó - cha cô là một tay thợ mộc hạng giỏi, chỗ nào mà chẳng cần đến họ kia chứ…

Và bây giờ trong việc lựa chọn nghề của Anhia, mẹ cô thấy lại ánh phản chiếu của tất cả cuộc đời bà, sự thật của bà, khát vọng của bà. Bóng đen của nỗi đau khổ xa xưa và còn như sống đó, đôi bàn tay không bụi bặm của Marutka. Vì thế Anhia làm sao có thể chứng minh được cho bà thấy là đối với cô, đối với Anhia, sách không thua kém gì cái máy cày đối với mẹ cô. Đó là tình yêu của cô mà vì nó cô sẽ chịu đựng hết cả! “Được rồi, ta sẽ thi vào học ở trường đại học thư viện Mátxcơva, học hàm thụ, và mẹ sẽ hiểu rằng đây cũng là một sự nghiệp một khi có cả trường đại học như thế… Ta sẽ đi đến Mátxcơva để thi. Và sẽ đi dự tất cả các buổi biểu diễn của anh…”.

Cô mỉm cười, nhìn sâu vào trong sân khấu, khi cử tọa vỗ tay náo nhiệt. Cô có cảm giác là cô hoàn toàn không nghe nhạc, cái âm nhạc bắt cô hồi tưởng lại tất cả cuộc sống, nỗi đau xót và niềm sướng vui, nỗi tủi hận và điều tốt lành, cho phép cô khóc tiễn đưa và giải thoát khỏi hết thảy mọi cái - vì sự mở đầu của một cái gì mới mẻ, cái mới mẻ mà chính bản thân cô còn chưa thấy…

Khi người ta đưa anh về ngôi nhà, nơi người bạn của anh đã thiếp ngủ một cách vô tư, và mọi người đã ra về cả, anh còn đứng hồi lâu ở hiên cửa, lắng nghe ở đâu đó xa xa, những tiếng hát đồng ca của các cô thanh nữ mang lại thánh thót, rõ ràng:

Em sẽ gọi anh là vầng mặt trời nhỏ,

Chỉ có điều anh hãy chiếu sáng hơn…

Mùa xuân đang đến kia, một mùa xuân tràn đầy hứa hẹn.', N'Chiếc Vĩ Cầm Của Gvarneri', N'chiec-vi-cam-cua-gvarneri')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 4, N'Buổi tiếp bệnh nhân kéo dài, và đáng ra vào một giờ, mãi tận gần hai giờ Vera Paplốpna mới dãn việc. Chỉ chải lại tóc - tóc chị bị xổ ra dưới cái mũ trắng của bác sĩ, xếp ống nghe, giấy mẫu kê đơn và các bệnh án vào cái túi xách, nhìn quanh, kiểm tra lại xem đã thu xếp mọi thứ chưa, liệu có quên gì không, và đóng cửa phòng làm việc lại, chị đến phòng đăng ký.

Đăng ký mời thăm bệnh hóa ra khá nhiều. Nhiều hơn là chị dự kiến, và thậm chí hơn cả những ngày thường. Vera Paplốpna hơi buồn phiên một chút, bởi vì kế hoạch của chị bị phá vỡ, tuy vậy chị không tỏ chút gì mình không hài lòng: mặc dù chị có đầy đủ quyền phẫn nộ: có mấy đăng ký mời thăm bệnh từ khu vực mà tạm thời chưa ai được phân công phục vụ. Đó là những ngôi nhà mới còn chưa có người đến ở hết. Các bác sĩ tại phòng khám bệnh đa khoa không đủ, vì vậy các đăng ký mời thăm bệnh “ngoại đạo”, phải được chia đều giữa mọi người.

Chị nhân viên đăng ký thông báo cho Vera Paplốpna các bệnh án, nói một cách thông cảm:

– Chị thật không may.

– Không sao. - Vera Paplốpna bác lại, thở dài. - Đúng hơn là cha mẹ những đứa trẻ ốm không may.

– Giá chị đến gặp Enaterina Ghuraximốpna thì phải. - Chị nhân viên đăng ký khuyên, có ý nói đến bác sĩ trưởng. - Quả thực thế là thế nào nhỉ? Bao giờ chị cũng phải gánh thêm công việc.

– Có người nào đó cần đến, trẻ con nào có lỗi gì. - Vera Paplốpna mỉm cười, xếp các bệnh án vào túi xách.

Chị nhân viên đăng ký lặng thinh, nghĩ bụng, dù sao đi nữa Vera Paplốpna quả là một phụ nữ rất lý thú và khó hiểu. Bao giờ cũng vui vẻ, yêu đời, thích bông đùa và không bao giờ than thở về chuyện gì hết, cứ hệt như chị không hề có điều gì phải lo lắng, không hề có những chuyện gì khó chịu. Không lẽ quả thực ở chị mọi cái đều tốt đẹp cả? Các bác sĩ khác hết nói về công việc nặng nhọc của mình, lại ca thán về lương lậu ít, rồi lại chê trách cấp trên, kể lể về chuyện nhà, chuyện cửa, nhưng Vera Paplốpna không bao giờ kể lể gì hết. Bao giờ chị cũng mang một nụ cười.

Chắc hẳn chị ấy hạnh phúc, chị nhân viên đăng ký nghĩ về Vera Paplốpna như vậy, hơi chút ghen tị, như ở mỗi người đàn bà mà cuộc đời riêng không ổn, ít ra thì chị cho là như vậy: chồng nghiện rượu nặng, còn bây giờ đến con rể cũng uống và hình như, còn chơi bời ít nhiều nữa. Kể ra cái đó cũng chẳng hề gì lắm, bởi vì anh đàn ông nào lúc trẻ chẳng chơi bời, nhưng tệ hại là con gái chị không muốn điều đó và định ly hôn.

Còn ở Vera Paplốpna, hình như không có những chuyện lo phiền như vậy. Và nếu đó là sự thật, thì tại sao chị ấy lại không hạnh phúc nhỉ? Sắc sảo, xinh đẹp, học vấn cao, lại thêm tính tình quả thật đáng gọi là vàng là ngọc - dịu dàng, không biết giận lâu và không độc ác. Không nói ai một lời gay gắt bao giờ. Tất nhiên chị còn trẻ, còn chưa mệt mỏi bởi cuộc đời như những người khác, những người đã sống nhiều hơn chị và đã thấy đủ mọi chuyện trên đời. Thôi thì, cũng cầu Chúa ban phước cho chị ấy, chị nhân viên đăng ký suy nghĩ, nói chung là không phải gặp chuyện gì tồi tệ, cầu Chúa ban cho chị hạnh phúc và niềm vui thú cho đến tận tuổi già, để cả con cháu chị cũng sẽ được hạnh phúc.

– Tôi đi đây, Vera Paplốpna.

– Chúc chị nhân dịp năm mới sắp sang, Klapđia Ivanôpna! Sao cho mọi điều mong muốn của chị trong năm mới sẽ đạt được cả.

– Mong ước của tôi thì có gì. - Chị nhân viên đăng ký trả lời, hài lòng là Vera Paplốpna không quên chúc mừng mình. - Chúc chị, chị đáng yêu, mọi sự tốt đẹp.

Vera Paplốpna đã toan ra đi, nhưng lúc đó lại có chuông điện thoại, vậy là chị phải nán lại thêm. Chị nhân viên đăng ký khoát tay, ý giả, chị cứ đi đi, đăng ký mời thăm bệnh này không thuộc phận chị…

Ra tới ngoài phố, Vera Paplốpna đứng lại một lát, suy nghĩ xem có nên ghé vào quán điểm tâm ăn chút gì và uống một tách cà phê, chứ không ngày hôm nay chị hầu như chưa ăn chút gì, nhưng rồi chị lại quyết định không để mất thời gian, tốt hơn là làm sao xong công việc được sớm. Hóa ra chị khó lòng giải quyết xong công việc trước năm giờ. Vậy mà từ sớm đã tính kết thúc vào bốn giờ để kịp đến cửa hàng và có thể, còn bày biện cây thông tết, trước khi đón Irinca ở mẫu giáo về.

Vera Paplốpna đã mua cây thông từ trước, ngay tại sân nhà mình. Gặp được cây thông rất đẹp, đầy lá, xanh thẫm và không gai góc. Mùi nó tỏa ra dễ chịu, đầy vẻ rừng. Hệt như hồi bé, khi bố mẹ trang hoàng cây thông tết cho chị. Bây giờ thì chị trang hoàng cho Irinca. Cho mình thì chị hẳn chẳng tội gì bận bịu, còn cho con gái thì là cả một niêm vui.

Ngoài đường phố ấm áp không có vẻ mùa đông, lầy lội và đông đúc, như thường lệ vào những ngày trước tết. Các bà phụ nữ mang những cái túi xách nặng nê căng phồng, chạy hết cửa hàng này sang cửa hàng khác, và Vera Paplốpna bất giác nghĩ là mọi thứ mua kể ra có thể sắm sửa từ trước, không phải hối hả, chen đẩy, nhưng lại nhớ ra là chính bản thân chị chưa mua sắm được gì.

Sự thể vẫn thường như thế, những chuyện quan trọng nhất không hiểu sao cứ để nấn ná tới giây phút cuối cùng, khi không còn nấn ná được thêm nữa. Có thể, con người ta quả thực không đủ thời giờ, bởi cuộc đời hối hả như thế nào đó, mà có thể, con người ta lại lấy làm thích thú vì những lo toan vất vả trước ngày tết, bởi những cái đó lại như thể là bắt đầu của chính bản thân ngày tết.

Từ góc phố xuất hiện chiếc ô tô buýt, và Vera Paplốpna vội đi đến bến.

Khách khứa đông, chị vất vả mới len được tới chỗ đứng ở cửa trước, và anh lái xe liền lên tiếng quở mắng chị:

– Sao nhà chị lại leo cửa trước này?! Có chửa hay sao?

– Người ta trở nên càn rỡ quá thể. - Người đàn ông đứng tuổi ngồi ngay sau lưng anh lái xe cạnh buồng lái, lên tiếng ủng hộ anh ta. - Không còn trật tự nào nữa. Vậy mà là phụ nữ kia đấy.

Vera Paplốpna thấy xấu hổ, chị thậm chí muốn xuống khỏi xe nhưng từ phía sau người ta thúc tới đến mức không thể cựa quậy nổi, và bây giờ không còn cách gì khác là nghe lời càu nhàu của người đàn ông đứng tuổi.

– Còn ở xe điện ngầm ấy, - Ông ta tiếp tục nói. - bọn trẻ thì ngồi giãi thẻ ra, cứ như ở nhà không bằng, còn người già thì cứ việc đứng cho. Mà tất cả chuyện ấy là do đâu?…

Vừa lúc đó một người đàn bà cất tiếng khá to chào Vera Paplốpna:

– Chào bác sĩ. - Bà ta nói. Và quay sang người đàn ông chỉ trích. - Đây là bác sĩ của trẻ em khu vực, bác sĩ đang đi thăm bệnh, vậy mà ông càu nhàu. Ông không biết ngượng ư!

Bấy giờ mọi người cùng đột nhiên nhao nhao lên tiếng, họ cho rằng các bác sĩ đi thăm bệnh tại nhà phải được xe riêng, rằng thế này quả thực là tồi tệ…

Người ta nhìn Vera Paplốpna với lòng kính trọng, còn chị vì thế càng thấy ngượng hơn, và chị không biết nhìn đi đâu. Chị cảm thấy rất bối rối vì những lời lẽ ấy và sự chú ý chung của mọi người, làm như thầy thuốc khu vực có trời biết là gì kia không bằng.

Tuy vậy, người đàn ông ngồi bên cabin không chia sẻ sự kính trọng đối với Vera Paplốpna.

– Làm như ghê gớm lắm ấy: - Ông ta nói. - bác sĩ - thầy thuốc! Họ chỉ là bọn lang băm chữa ngựa. Họ không chữa cho người ta, mà xua đuổi người ta vào áo quan trước hạn định.

Và ông ta kể lể dài dòng, với các chi tiết, và thái độ tức tối là gần hai năm trời ông ta đã đi đến hết bác sĩ này sang bác sĩ khác và họ chẳng tìm ra bệnh gì ở ông ta, mặc dù bản thân ông ta biết rõ là ông ta ốm, chỉ còn sống ngắc ngoải…

– Chẳng có vẻ như vậy. - Người đàn bà lúc nãy nhận ra Vera Paplốpna vừa cười vừa nói.

– Bây giờ thì chẳng còn vẻ như vậy, bởi vì những con người tốt bụng đã khuyên chữa theo cách riêng. Vẫn những bác sĩ đã tìm ngay ra chứng nhức đầu thể nặng.

– Nghĩa là các bác sĩ ấy đã chữa khỏi cho ông? - Một giọng của ai đó nói nhanh, và không thể hiểu là người ta hỏi một cách nghiêm túc hay bỡn cợt.

– Cứ như làm phép xua đi ấy. - Người đàn ông trả lời với vẻ hãnh diện.

– Ông bố ạ, cái chứng nhức đầu của ông ở cái dạng đặc biệt là khi làm thì lười, còn khi khác thì hăng hái! - Vẫn cái giọng kia nói.

– Anh cứ sống như tôi, anh sẽ biết cái đó thế nào. - Người đàn ông tức tối nói. Ông ta thậm chí đỏ mặt lên vì tức tối.

Và đến đây mọi người cùng nhao nhao bắt đầu bàn tán các vấn đề y học, tranh nhau kể lại đủ mọi “ca” trong đời và về bao nhiêu trường hợp nhờ các cây cỏ và những câu thần chú mà chữa khỏi một cách mầu nhiệm những căn bệnh hiểm nghèo không thể chữa được. Vera Paplốpna nheo mắt lại, cố không nghe ai nói cả và bắt mình nghĩ về chuyện cần phải mua sắm gì cho bàn tiệc đón năm mới.

Nhưng chính bởi vì chị không nghe riêng ai nói cả, thành ra buộc phải nghe tất cả cùng một lúc, vì thế mà đầu nhức lên. Nhưng có thể đầu đau vì đói. Dù sao đi nữa, Vera Paplốpna tự bảo với mình, cũng phải chạy vào quán điểm tâm ăn lấy cái bánh rán vậy. Nếu suốt ngày không ăn gì, có thể mắc bệnh loét dạ dày. Ý nghĩ về bệnh loét dạ dày làm chị buồn cười, chị nhớ lại bác sĩ quen, bệnh tật của họ, nhưng chả có một trường hợp nào có bác sĩ mắc bệnh ấy, chị chịu không nhớ ra nổi.

Trong khi đó, mải chuyện trò, mọi người đã quên mất chị, vì thế chị yên ổn đi được tới ga xe cần thiết. Chị khó khăn mới ra khỏi được đó, hỏi một bà đi qua đường số nhà sáu mươi bảy, vội vã theo lối mòn chạy đến các dãy nhà mới màu trắng, tay giữ vạt áo măng tô để khỏi hở cái áo bờ lu trắng ra. Chị chạy và cố hình dung ra cái cô bé Alenca Sepôvalôva, trong bệnh án của cô bé ghi là bị đi ỉa chảy nặng và nôn tháo…

Vera Paplốpna mới đến làm việc ở phòng khám này, nhưng trí nhớ của chị tốt, chị biết tất cả các trẻ con trong khu vực của mình và biết cả bố mẹ chúng nữa, nhưng Sepôvalôva Alenca lại ở vào khu vực khác mà hiện nay chưa ai phục vụ thường xuyên, vì thế chị mới quyết định bắt đầu đi từ đó, để kéo dài thời gian và sự chú ý hơn dành cho đứa bé chưa quen biết.

Đến cuối ngày, dù chị có xoay xở thế nào đi nữa, bao giờ cũng phải vội vã.

Thang máy không làm việc - người ta còn chưa mở điện - vì vậy Vera Paplốpna phải đi bộ lên tầng mười một. Chị bấm chuông căn hộ bốn mươi ba, một chị phụ nữ còn trẻ tức khắc mở ngay cửa, và Vera Paplốpna nhớ ra ngay Alenca, bởi vì chị nhận ra mẹ nó: hai mẹ con đã từng đến khám bệnh ở phòng khám đa khoa. Người mẹ rất lo lắng cho con gái, còn cô con gái bé nhỏ, nói chung, khỏe khoắn bình thường, chỉ tội nũng nịu vì được quá chiều chuộng. Nhưng cái đó là chuyện thường tình, có ai, có người mẹ nào lại không chiều chuộng con cái mình, đặc biệt nếu đó là đứa con đầu lòng trong nhà hoặc là đứa đầu lòng và con một! Ai cũng nuông chiều cả. Cả chị cũng nuông chiều Irinca mặc dầu cũng biết cái đó là xấu.

Nhưng có thể, nói chung cũng chẳng phải là xấu, như các nhà sư phạm nói về điều đó. Là một bác sĩ, chị chẳng thấy trong chuyện này cái gì đáng sợ cả. Trẻ con là con trẻ, chúng phải mang lại cho người ta niềm vui, nếu không hẳn không ai muốn có con cái, mà niềm vui đòi hỏi một tình cảm đáp lại. Chẳng qua là, Vera Paplốpna thầm nghĩ, các thầy giáo, các nhà sư phạm chỉ muốn mọi đứa trẻ giống như nhau, đều hiền lành và ngoan ngoãn, để chúng hành động đúng như điều người lớn muốn…

– Chúng ta có chuyện gì thế nhỉ? - Vừa cởi áo măng tô chị vừa hỏi mẹ cháu bé.

– Xin bác sĩ thứ lỗi cho việc chúng tôi làm phiền bác sĩ vào ngày như thế này. - Người mẹ nói, giọng biết lỗi. - Tôi lo cho cháu Alenca quá. Cháu bị buồn nôn nhiều và lạnh bụng.

– Thế nhiệt độ?

Vera Paplốpna vào buồng tắm rửa tay, còn người mẹ đứng bên cửa sổ cầm sẵn chiếc khăn mặt sạch, giải thích là nhiệt độ không thấy cao, nhưng cháu bé nhất định sốt nóng, đặc biệt là vào buổi tối.

– Hôn cháu, môi cứ nóng cả lên! Nhưng cái chính là, thưa bác sĩ, cháu buồn nôn.

– Chị cứ yên tâm. - Vera Paplốpna trấn an người mẹ. - Mọi chuyện rồi sẽ tốt đẹp thôi.

– Bác sĩ cho là như vậy ạ? - Người mẹ hỏi với lòng hy vọng.

Alenca chẳng có gì đáng sợ, như chính Vera Paplốpna đã nghĩ. Đúng hơn cả là đứa trẻ ăn quá nhiều của ngọt, thế là sinh ra cái chuyện rối loạn tiêu hóa. Tuy nhiên chị không nói với người mẹ như vậy, biết rằng, dù cha mẹ có sung sướng khi con cái họ khỏe mạnh, nhưng dù sao đi nữa họ cũng vẫn cứ muốn là đứa trẻ của họ không khỏe hẳn. Đấy, ở phòng khám đa khoa các bà mẹ đến ngồi đợi lượt, thì mỗi bà đều cố công thuyết phục những người khác rằng chính đứa con của bà ta là đứa trẻ ốm yếu nhất. Tất nhiên là họ cố tìm sự thông cảm của những người xung quanh, cả sự thương hại nữa. Không phải đối với đứa bé, mà là đối với chính bản thân họ. Nhưng ở điểm này thì chẳng làm thế nào khác được, tất cả các bà mẹ đều giống nhau, và thầy thuốc phải tính đến điều ấy.

Chị kê đơn cho uống một hợp dịch, khuyên cho Alenca ăn kiêng khem trong vài ba ngày, còn hôm nay nói chung không cho ăn gì nữa, chỉ cho uống nước trà nóng, hay - tốt hơn là - uống nước vỏ sồi, nhưng nếu đi ngoài không cầm, sau tết lại cho mời bác sĩ đến.

Khi Vera Paplốpna đi ra phố, mẹ Alenca ngó ra cửa sổ thông hơi và gọi với theo chị câu gì đó lời không nghe rõ, dù sao cũng cao quá, và chị đoán biết được hơn là nghe thấy, rằng người ta chúc mừng chị nhân dịp năm mới sắp sang. Vera Paplốpna cảm thấy dễ chịu bởi sự chú ý đó, và chị đâm ra ngượng là bản thân chị quên không chúc mừng Alenca cũng như mẹ cháu…

Chị còn vào thêm hai căn hộ nữa, ở lại không bao lâu. Đến căn hộ thứ ba, kể ra chị phải ở tới nửa giờ và lập bệnh án cho người mẹ, nhưng dù sao đi nữa, ở chị cũng có một tia hy vọng là nếu không xong hết việc được vào lúc bốn giờ, thì rồi cũng chỉ đến bốn rưỡi mà thôi. Như vậy chị kịp rẽ vào cửa hàng, còn cây thông hai mẹ con chị sẽ cùng về bày biện. Tất nhiên, có lẽ tốt hơn là ngược lại, bởi vì tiện hơn cả là trên đường từ mẫu giáo về chị sẽ rẽ vào cửa hàng, nhưng Irinca rất không thích đi các cửa hàng, không kìm được nước mắt đâu…

* * *

Đến căn hộ thứ tư liền một lúc hai đứa trẻ cùng bị ốm - hai đứa bé sinh đôi nhà Meseriacốp vừa được một tuổi. Người mẹ khóc lóc, nháo nhào khắp căn hộ còn chưa thu xếp dọn dẹp sau khi mới chuyển đến ở và chửi rủa đức ông chồng bằng đủ mọi lời lẽ “mỹ miều”. Ông ta vẫn chưa về, mặc dù hôm nay chị phải làm việc tới bữa trưa.

– Lại gặp những người bạn rượu nào đấy, thế là không còn trời đất gì nữa! Còn ở đây thì có chia năm xẻ bảy người ra, thậm chí đến đi hiệu thuốc cũng không biết nhờ ai. - Chị ta than thở.

Vera Paplốpna xấu hổ phải nghe những lời than vãn ấy. Chị nói chung không thích khi người khác chửi rủa lẫn nhau, bộc lộ quan hệ của họ ra, không dè người lạ, còn đến cái mức chửi rủa chồng mình như vậy thì…

– Lạy Chúa, cầu cho ông ấy lăn vào bánh xe điện cho rồi. - Người mẹ của hai đứa bé Meseriacốp tiếp tục chửi rủa, gạt nước mắt giàn giụa đầy mặt. - Người không còn biết xấu hổ, không còn có lương tâm. Bạn rượu còn quý hơn cả con đẻ, bác sĩ cứ thử nghĩ xem…

– Có thể bác ấy phải nán lại ở chỗ làm việc? - Vera Paplốpna nói.

– Công mới việc gì cơ chứ? Ông ta chỉ có mỗi một việc đá bóng, uống rượu và rồi khúc côn cầu. Giá có người nào bảo trước, này tại sao chúng ta, cái lũ ngu ngốc, lại đi lấy chồng làm gì nhỉ?…

– Chị đi đến hiệu thuốc đi! - Thở dài, Vera Paplốpna bảo người mẹ. - Còn để tôi trông các cháu cho.

– Sao lại làm thế được, bác sĩ? Không tiện…

– Cứ đi đi, đi đi! - Vera Paplốpna nhắc lại.

– Vâng thì, xin cám ơn bác sĩ. Quả thực là bác sĩ đã giúp tôi. Hàng xóm láng giềng chúng tôi còn chưa biết ai, chúng tôi mới chuyển đến được có mỗi một tuần, đành cứ là chịu chết. Tôi sẽ ba chân bốn cẳng một thoáng là về ngay.

Vera Paplốpna biết rằng không thể đi một thoáng được - hiệu thuốc ở xa, nhưng quả thực không thể nào làm khác được. Ai đi lấy thuốc được, nếu như chẳng có ai đó mà nhờ.

Người mẹ ra đi, hai đứa trẻ sinh đôi cũng thiếp ngủ và Vera Paplốpna, cảm thấy mệt mỏi quá và cơn đau đầu lại xuất hiện, chị ngồi ngay xuống ở chỗ bếp ăn. Chị thấy muốn ăn cái gì quá, thậm chí hơi nôn nao buồn nôn vì đói bụng, và không biết đến lần thứ mấy chị lại tiếc không ghé vào quán điểm tâm. Trong bếp ăn lặng lẽ, ấm áp và mùi xúp nấm tỏa ra hấp dẫn không chịu được, và Vera Paplốpna phải cố dẹp cái ý muốn cứ liều ăn vài thìa xúp ấy, dù một vài thìa thôi, để dẹp cơn đói ngấu nghiến. Cuối cùng thì nữ chủ nhà cũng chẳng nhận ra được chuyện gì, bởi vì có thể rửa thìa và để lại chỗ cũ. Vật lộn với ý muốn đó, bất giác chị thiu thiu ngủ, gục đầu xuống bàn. Tiếng chuông dài, dai dẳng gọi cửa đánh thức chị dậy. Chị bật đứng lên hoảng hốt, ngái ngủ không hiểu ra ngay là đang ở đâu, còn tiếng chuông gọi cửa vẫn cứ tí ti ti ti. Chị dụi mắt, nhìn quanh và nhớ ra là chị đã để mẹ của hai đứa bé đi hiệu thuốc. Vera Paplốpna đi ra mở cửa, nhưng ở ổ khóa thật kỳ dị thế nào ấy, chưa bao giờ chị từng thấy, đành phải loay hoay một hồi lâu mới mở ra được.

Ở ngưỡng cửa là một người đàn ông, hai tay ôm trước ngực một bọc giấy những trái cam. Vera Paplốpna ngạc nhiên, còn ông ta bối rối.

– Tôi, hình như tôi nhầm ạ?…

– Tôi không biết… - Nhún vai, Vera Paplốpna trả lời.

Bấy giờ người đàn ông lấy chân khoèo khép cánh cửa lại, nhìn xem số căn hộ và cũng nhún vai.

– Có vẻ như đúng cả… - Ông ta làu bàu.

– Tất nhiên rồi! - Vera Paplốpna cuối cùng đoán ra rằng đây là bố của hai cháu sinh đôi. - Tôi là bác sĩ.

– Bác sĩ nào?

– Các cháu của ông bị ốm.

– Bị ốm ư? - Người đàn ông bước vào lối vào nhà chật chội, lấy vai đẩy Vera Paplốpna sang một bên. - Tại sao lại ốm như thế này kia chứ?

– Sốt nóng.

– Maria! - Người đàn ông gọi to, đưa mắt nhìn quanh.

– Chị ấy không có nhà, chị ấy đi đến hiệu thuốc rồi. - Vera Paplốpna nói. - Sắp sửa về đấy.

– Đồ ngốc! Cô ấy lại để chúng nó lạnh. Đã nói với cô ấy bao nhiêu lần rồi, là đưa trẻ đi chơi thì đừng có mà ngứa mồm ngứa miệng! Lại đi chuyện mây chuyện gió, chuyện trăng chuyện đèn còn trẻ con thì phóng sinh phóng địa, muốn làm gì thì làm.

– Cái này không phải vì cảm lạnh! - Vera Paplốpna nói tránh. - Lũ trẻ bị cúm.

– Thế cúm do đâu, do nóng ư? Bác sĩ, xin bác sĩ thứ lỗi cho. Kể ra thì thật không tiện, thành thực là…

– Chuyện vặt.

– Mà tôi cũng ngu ngốc, đi xếp hàng hàng tiếng rưỡi đồng hồ để mua mấy quả vớ vẩn này cho các cháu… Xin mời bác sĩ. - Anh ta lấy trong túi giấy ra hai quả cam rõ to và đưa cho Vera Paplốpna.

– Không, không!

– Xin bác sĩ đừng giận. Tôi thực lòng mà.

Chị hiểu là không thể từ chối, nhận hai quả cam và cất vào túi.

– Cám ơn. Còn các cháu qua hai ngày nữa là khỏe, ông cứ yên tâm.

Xuống thang gác, Vera Paplốpna gặp mẹ hai đứa trẻ sinh đôi và dặn chị để chị đừng kể ra với chồng về chuyện cảm lạnh.

– Vâng ạ. - Người mẹ nói. - Thế anh ấy về có say hay không?

– Không. Ông ấy xếp hàng mua cam.

– Chúc bác sĩ năm mới! - Người mẹ sung sướng nói.

– Cả chị nữa, - Vera Paplốpna trả lời. - chị phải chú ý sao trong nhà không có gió lùa, và cho các cháu đi chơi ra ngoài trời luôn…

Chị còn đến hai địa chỉ nữa gửi một cháu gái, cháu Kachia Privalôva, đi bệnh viện. Cháu này có vẻ là viêm phổi. Phải mất thì giờ trấn tĩnh khá lâu cho đôi vợ chồng còn trẻ măng, chứng minh cho họ là chẳng có gì đáng sợ cả, rằng con gái họ chỉ qua mươi ngày là lại về nhà, trấn an và chứng minh không phải là dễ, bởi vì cháu bé gái rất yếu, nói chung là bệnh tật, và thêm vào đó nghe ở tim lại có tiếng gì ồn ào khó hiểu.

* * *

Mãi đến gần sáu giờ Vera Paplốpna mới xong hết công việc và bấy giờ mới nhớ rằng lớp mẫu giáo hôm nay làm việc tới năm giờ thôi. Còn may là gọi được một xe tắc xi, chứ chuyển qua hai ô tô buýt thì chị tới được lớp mẫu giáo phải mất gần một tiếng.

Ở lớp học không còn ai ngoài Irinca nữa và một bảo mẫu được phân ở lại chỉ vì Irinca. Vera Paplốpna cứ như thế cũng đã xấu hổ vì sự chậm trễ của mình rồi, mặc dù hình như chị cũng chẳng có lỗi gì, nhưng bà bảo mẫu vừa mặc áo giúp cho Irinca vừa trách móc.

– Mà làm sao người ta không hiểu là mỗi người đều có công việc của mình nhỉ? Ai cũng chỉ nghĩ đến chuyện tiện lợi của mình, còn người khác mặc cho có chết cũng chẳng động gì…

– Xin bác bỏ quá cho. - Vera Paplốpna xin lỗi. - Sự thể nó là thế, hôm nay nhiều đăng ký mời đến thăm nhà quá.

– Thì tôi cũng nói, mọi người đều có chuyện gì đó, còn ở đây thì cứ ngồi như bị tội ấy, vì sáu chục đồng lương. Tôi sẽ bỏ đi thôi, mặc xác họ hết. Tốt hơn là ra quán ngồi bán hàng.

Những lời ấy đẩy Vera Paplốpna tới ý nghĩ là cần phải trả thêm tiên cho bà bảo mẫu, cảm ơn bà, bởi vì quả thực là bà ấy có buộc phải ngồi đến tối với Irinca đâu. Bà ấy liên quan gì đến chuyện nhiều hay ít đăng ký mời đến khám…

Vera Paplốpna lục lọi trong túi xách, tìm ví tiên, lấy ra ba rúp đưa cho bà bảo mẫu:

– Bác nhận cho.

– Cái gì thế này?

– Vì bác phải ngồi lại…

– Cất ngay đi và đừng có bao giờ thò ra nữa! - Bà bảo mẫu nói. - Gớm nhỉ, nghĩ ra cái trò ấy kia đấy! Có thể là tôi nhận được còn nhiêu hơn của chị kia, mà với chị thì tờ ba rúp này còn cần đến đấy. Còn ngồi với cháu là công việc ư?… Niêm vui sướng ấy chứ, có thể nói vậy. Thôi đi về đi, chúc hai mẹ con một năm mới may mắn!

Ngoài đường phố đã tối. Băng giá không gắt lắm, sương muối đổ xuống, và các ngọn đèn đường chỉ tù mù chiếu sáng những vòng tròn nhỏ quanh các cây cột điện. Irinca cứ con cỏn chạy lên trước và hỏi đi hỏi lại vì sao mẹ đến chậm và ông già tuyết đã đến nhà chưa, trong lúc nó còn ở lớp mẫu giáo.

– Ông già tuyết còn chưa đến. - Vera Paplốpna trả lời. Vì mệt và đói, chị không muốn nói nhiều.

– Thế có đến không?

– Có đến.

– Ông già đến với tất cả mọi đứa trẻ con chứ, mẹ?

– Với đứa nào biết nghe lời người lớn thôi.

– Nhưng con thì chỉ không nghe lời có một tí một tẹo thôi, mẹ ạ!

– Thế thì đến với cả con.

Hai mẹ con vào cửa hàng, mặc dù Irinca đã phụng phịu. Đành phải bảo nó là nếu có ngúng nguẩy thì ông già tuyết sẽ nghĩ lại và không đến với nó nữa. Nhưng trong cửa hiệu nói cho cùng cũng chẳng còn gì để mà mua: Người ta đã mua hết cả lúc ban ngày rồi. Vera Paplốpna mua một ít kẹo vớ vẩn, pho mát và, sau khi ngẫm nghĩ, mua thêm một chai rượu nho thuần chất. Irinca đòi mua nước chanh, nhưng nước chanh cũng không còn, và Vera Paplốpna hứa sẽ làm nước quả ép, băng mứt phúc bồn tử cho nó.

Ở cửa lớn vào nhà, theo thói quen hơn là hy vọng nhận được thư, Vera Paplốpna mở hòm thư. Ở trong đó có cái gì thật. Cố ghìm xúc động, chị lôi ra một tờ giấy gấp hẹp, trên có đề chữ: “Ban quản trị GEK-21, hội đồng nhà cửa và ban chấp hành khu nhà chúc mừng gia đình nhân dịp năm mới sắp sang và chúc thắng lợi trong lao động, học tập và cuộc sống riêng! Xin tha thiết đề nghị gia đình đóng cho tiền nhà tháng chạp năm nay”.

– Thư của ba đấy mẹ? - Irinca hỏi, nghèn cao cổ lên nhòm. Vera Paplốpna âu yếm nhìn con gái và trả lời.

– Của ba.

– Ba lại bận công việc ở nơi công tác ấy?

– Ờ, con gái yêu ạ.

– Ôi, sao ba ở đấy lâu thế!

– Nghĩa là, cần thiết như vậy. - Vera Paplốpna nói.

– Ở chỗ ba, ở châu Phi ấy, cũng có ông già tuyết ạ?

– Mẹ không biết.

– Nếu không có thì dở quá. - Irinca nói và thở dài y hệt như người lớn. - Năm mới chẳng có ai đến với ba. Thế ông già tuyết của chúng ta có thể đi công tác đến đấy được không ạ?

– Ông chẳng có thời giờ đâu. - Vera Paplốpna mỉm cười.

Hai mẹ con leo lên tầng gác ba. Trong căn hộ của hai mẹ con sực nức mùi cây rừng. Irinca nhảy lên và vỗ tay reo mừng:

– Mẹ với con sẽ cùng bày cây thông đi, cây thông nhà ta đẹp nhất tất cả! Hôm nay mười hai giờ đêm con mới đi ngủ cơ!

– Con cởi bỏ áo mũ ấm ra và mang hộp đồ chơi đến đây. - Vera Paplốpna bảo.

Irinca nhanh nhẩu cởi áo mũ ra, dịch các ghế tựa vào gần bên tủ, với lấy cái hộp đựng giày đàn ông cũ vẫn dùng để đựng các đồ chơi trang hoàng cây thông tết.

– Mẹ ơi, bắt đầu bày cây thông tết đi, không có không kịp đâu.

– Ngay bây giờ đây, con gái của mẹ.

Vera Paplốpna chẳng muốn làm gì hết. Hôm nay chị đã mệt mỏi, mệt mỏi quá. Chị ngồi và nghĩ đến chuyện, giá mà được ngả người ra ghế đi văng mà thiếp ngủ đi, và ngủ rất lâu, rõ thật lâu, chừng nào chưa chán chê mê mệt. Nhưng không thể đi nằm được. Cần phải bày cây thông tết, chuẩn bị bữa ăn mừng năm mới, rồi thức đón chào năm mới. Chị với bé Irinca sẽ ngồi bên bàn tiệc, mà vào ngày tết mọi nhà đều bày biện ra trong phòng, và chị sẽ uống cái thứ rượu nho thuần chất không lấy gì làm ngon, bởi vì rằng chị không mua được thứ rượu nào ngon hơn, còn Irinca sẽ uống nước quả ép bằng mứt phúc bồn tử. Mừng hạnh phúc trong năm mới, không hiểu vì sao mọi người đều hy vọng rằng hạnh phúc nhất định sẽ đến chính là ở trong cái năm này…

Sau đó chị sẽ cho Irinca đi nằm, còn bản thân chị sẽ vào bếp và còn ngồi ở đó, hút một điếu thuốc, bởi vì con gái nhỏ của chị không biết được là đôi khi chị vẫn hút thuốc.

– Tại sao mẹ không thay quần áo đi, mẹ? - Irinca hỏi. - Đã là năm mới hẳn rồi mà…

– Mẹ thay bây giờ đây… - Vera Paplốpna bảo con. - Con chịu khó nằm một mình năm phút nhé, mẹ đi gọi điện.

Chị nhớ tới Kachia Privalôva, cháu bé bị viêm phổi mà chị đã gửi đi bệnh viện, và chị thấy rằng cần phải gọi đến phòng tiếp nhận hỏi xem cháu bé ra sao. Dù thế nào đi nữa, tim cháu bé nghe có tiếng đập mạnh.', N'Ngày Cuối Cùng Của Một Năm', N'ngay-cuoi-cung-cua-mot-nam')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 5, N'Một cây thông khổng lồ, trọn cả một cây.

Hẳn là người ta đã chặt nó đâu đó tận trong rừng Kômi và chở về đây trên một toa tàu đặc biệt. Mùi nhựa hăng nồng từ cây thông loang ra trong nhà câu lạc bộ được đất sưởi khá ấm.

Và trong lúc Epghênhi Kadimirôvich đăm chiêu chậm rãi đi quanh cây thông nằm đó, thích thú thở hít cái mùi đầy sức sống gần như đã bị lãng quên, cái đế gỗ hai khúc gỗ to được bào nhẵn nhụi bắt chéo nhau - đã được chuẩn bị xong. Người giúp việc của ông đã làm việc ấy.

Bây giờ phải dựng cây thông lên rồi trang trí, sau đó các thủ trưởng cứ việc mà vui thú. Công việc vặt vãnh chẳng khó khăn gì, bởi vì gì thì gì đi nữa, khi còn tự do, Epghênhi Kadimirôvich vốn là một họa sĩ.

Còn trong khi ông phụ trách câu lạc bộ chưa có mặt, ta tranh thủ dự trữ thêm hơi ấm là việc không nên bỏ qua.

Epghênhi Kadimirôvich cùng với Nexte - tên anh giúp việc của ông - cùng ngồi xuống bên bếp lò nóng hổi, lấy thuốc ra hút; ông chỉ huy đã dốc cho họ cả một lô thuốc lá sợi.

– Theo điều khoản nào? - Epghênhi Kadimirôvich hỏi.

Nexte đưa mắt nhìn ông. Đôi mắt kiên nghị, bình tĩnh.

– Tớ hỏi một tí, cậu bị tù vì tội gì thế?

– Vì chính những cái này đây. - Nexte từ tốn đặt hai bàn tay mình lên đùi. Hai bàn tay mugich to lớn.

– Thế đôi búa tạ của cậu đã làm gì vậy?

– Có nghĩa là đôi tay này chứ gì. Nguy hiểm về mặt xã hội.

– Chuyện cổ tích? Cậu đã cho kẻ nào đó nếm mùi chăng?

Nexte liếc nhìn Epghênhi Kadimirôvich.

– Không lẽ trông tôi giống một tên giết người ư?

– Rõ. Thuộc giới phú nông?

– Chà, ông… Vậy mà cũng là dân trí thức, có học. Bọn kulắc phú nông thì bố tôi đã từng bóp hết ngay từ hồi nội chiến kia…

Epghênhi Kadimirôvich chẳng biết làm gì khác, ngoài một cái nhún vai.

Và im lặng một lúc, Nexte bắt đầu kể chuyện về bản thân mình.

Và đây là câu chuyện của anh mà Epghênhi ghi nhớ được.

Đầu mùa xuân năm 30, Nexte và một người bạn cùng làng ra khỏi Hồng quân trở về. Hai người lòng phấn chấn, vừa đi vừa ca hát. Họ đã phục vụ Tổ quốc một cách vinh quang. Còn trước mặt là những cuộc gặp gỡ với người thân thuộc, với người yêu thương. Nói tóm lại, đầy niêm vui sướng.

Chiều tối Nexte về tới gần căn nhà gỗ thân thuộc. Trong cửa sổ không thấy ánh đèn lửa. Không ai ra đón anh. Quỷ quái gì thế này? Anh chẳng đã viết thư cho cha anh rồi sao? Mà chó nhà đâu? Tại sao nó không sủa? Tại sao nó không bay ra nhảy chồm bám lên ngực anh?

Nhưng tất cả những điều ấy chỉ là những chuyện vặt vãnh so với những gì anh nhìn thấy trong nhà, mọi cái đều tan hoang, đổ gẫy và không một bóng người… Chỉ có một con mèo, khi anh bật que diêm lên, nó lao vút lên phía sau bếp lò một cách hoang dại.

Nexte chạy bổ sang hàng xóm. Có chuyện gì xảy ra vậy. Bố anh đâu? Mẹ anh và các em gái của anh đâu?

Bị đày đi Xibir cả rồi.

Tại sao lại đi Xibir? Bố anh bị đày đi Xibir ư? Một chiến sĩ Hồng quân. Xuất thân từ bần nông. Đã dựng lên chính quyền Xô viết trong nội chiến ở chính đây cơ mà.

– Không, cái này vớ vẩn thế nào ấy. Phải lập tức đến Xô viết xã, rồi lên tỉnh hỏi cho ra nhẽ.

– Ấy, tốt hơn là đừng có đi, người anh em ơi! - Bác hàng xóm khuyên can. - Chứ không người ta sẽ tóm cổ cả anh nữa đấy. Và nói chung, hiện thời vẫn còn chưa muộn, chuồn khỏi nơi đây là tốt nhất…

Ra khỏi nhà người hàng xóm, Nexte như người mất hồn. Không lẽ những chuyện đó lại là sự thực ư? Không lẽ anh lại phải chạy trốn khỏi làng quê thân thuộc của mình hay sao?

Gần căn nhà gỗ của mình, anh nghe có tiếng ai sụt sịt. Anh đi tới. - Timôkha. Anh ta ngồi trên hiên nhà và khóc. Hóa ra cả anh ta cũng được số phận chuẩn bị sẵn cho một món tặng vật như thế. Hóa ra là cả gia đình anh ấy cũng bị đày đi Xibir rồi.

Mà sự thể, như sau này Nexte biết được, hóa ra là như thế này… Trong làng bắt tay vào xây dựng nông trang, người ta thông qua một danh sách xem ai là kulắc phú nông để đánh đổ. Người ta nêu một tên họ, nêu tên họ thứ hai. Và bỗng nhiên bố Nexte nghe thấy người ta đọc đến cả tên họ của bố Timôkha.

– Ơi bà con, bà con làm sao vậy? Ông ấy đã chiến đấu cùng với tôi kia mà, suốt cả cuộc nội chiến chúng tôi đã cùng nhau tiêu diệt kẻ thù.

– Sao thế, anh ủng hộ tên kulắc ấy hả? Mà chính anh cũng là kulắc đấy thôi! Kia kìa, nhà anh lợp mái tôn hẳn hoi. Năm ngoái anh chở bao nhiêu lúa mì ra chợ?

– Thưa bà con, thì tôi chỉ thực hiện chỉ thị của chính quyền Xô viết mà thôi. Vlađimia Ilich Lênin đã nói gì sau cuộc nội chiến? Hãy làm gương, hãy trồng nhiều lúa mì hơn. Vì thế tôi đã vun trồng, đã nuôi chính quyền Xô viết, còn khi cần, cầm súng bảo vệ nó.

Nói chung, dù bố Nexte có chứng minh gì đi nữa, ông vẫn bị quy là phần tử kulắc và bị đày đến vùng Xibir lạnh giá. Trong những toa chở bò. Cùng một nhóm với những kẻ mà ông đã chiến đấu chống lại trong cuộc nội chiến.

– Bây giờ thì chúng ta biết làm gì đây, Nexte? Biết đi đâu bây giờ? - Timôkha nghẹn ngào, giọng đầy nước mắt.

Hai người quyết định đi Xibir. Đi tìm người thân. Giấy tờ có đủ, quân phục Hồng quân, chắc hẳn chẳng ai dám bắt giữ.

Họ đi khá lâu. Nhưng cuối cùng ở Xibir họ đã tìm ra dấu vết của đoàn tàu. Và bây giờ té ra là không phải chỉ có hai người họ ở trong tình cảnh như vậy. Những kẻ đáng thương như họ, những chiến sĩ Hồng quân mới giải ngũ, mà nhà cửa bị tan hoang kể có đến hàng chục.

Họ đã bàn bạc nhau cùng hành động.

Và rồi Nexte và Timôkha tìm thấy người trong gia đình. Đầu đội trời, chân đạp đất. Túm tụm bên nhau, như dân Digan. Cơ man nào là người. Và gần như không có lính canh gác. Đất mẹ Xibir - chạy đi đâu được?

Nhưng hóa ra là đến đây con đường khổ ải của những con người này cũng chưa phải đã chấm đứt. Họ còn bị xua đi tiếp, qua cả rừng taiga tới miền băng giá. Đào vàng. Xong việc ở đấy thì họ phăng teo. Nếu như anh không chết rấp vì đói thì bệnh hoại huyết cũng sẽ kết liễu đời anh. Chưa một người nào từ chỗ đó mà được mạnh chân khỏe tay trở về.

– Nhưng có, có những miền đất ở Xibir, - Một ông cụ người địa phương nói. - ở đó có thể sống ra con người.

Tự do, và có thể tìm đến đó, hàng đời yên ổn, không ai tìm ra nổi.

Mọi người nắm tay theo cụ. Ai là người muốn đi vào chỗ cầm chắc cái chết?

Và thế là nảy ra một ý đồ điên rồ - bỏ trốn. Đi tìm nơi có thể sống được. Người quyết định tiến hành công việc như thế tập họp được không phải là ít. Tất cả đều là những người dũng cảm nhất, dẻo dai nhất.

Trang bị thóc giống, bánh mì - trút bỏ ra mọi thứ, để có cái đem đổi lấy được. Rồi sau đó bắt đầu tìm ra bờ sông theo từng nhóm, từng nhóm một.

Mọi người đóng bè mảng, ngồi lên rồi nhổ neo.

Bơi mảng trên sông mất một hồi lâu, phần lớn là bơi trong đêm. Chung quanh rừng cây hoang vắng. Xa lạ. Cô tịch. Nhưng cũng vui tịnh không một bóng người.

Cuối cùng họ đổ bộ lên bờ. Bè mảng phải đem đốt hết để phi tang. Bây giờ thì cứ thử đi mà tìm họ. Sau đó họ còn luồn rừng đi bộ mấy ngày đường nữa. Và họ đã tìm ra một địa điểm - một con sông nhỏ với những bãi cỏ ngập nước. Cả chim. Thú rừng. Nhiều vô kể. Hạt dẻ, quả rừng đều sẵn.

Và thế là họ bắt đầu gây cuộc sống trên mảnh đất hoang dại. Họ bắt đầu chặt cây, đánh gốc, dựng lên những căn nhà gỗ đầu tiên.

Lúa mì trên những thửa ruộng đầu tiên bị băng lạnh chết mất cả. Và họ đã phải chịu đựng, đã phải nếm trải mất hai năm. Họ biết rõ - như vẫn thường nói - chỉ có Chúa với lại chính bản thân họ mà thôi. Không có lúa mì - một nửa số người bị chết vì đói. Quần áo không có. Giày dép không có. Thêm vào đó lại còn tai họa nữa của Xibir: ruồi nhặng, muỗi mòng…

Nhưng dù thế này hay thế khác, họ vẫn trụ được. Rễ đã bám được vào mảnh đất chẳng lấy gì làm ngọt ngào này.

Về đến đây thì một vấn đề mới lại được đặt ra: sống như thế nào đây?

Trước đó, khi họ phải vật lộn để mà sống sót, mọi người không ai nghĩ tới vấn đề này. Họ sống quần tụ. Và tất cả mọi người, không cần ai thúc giục, đều làm lụng gắng hết sức. Còn bây giờ, khi họ đã đứng vững được đôi chút, dục vọng con người bắt đầu nổi lên. Bắt đầu nổ ra chuyện cãi cọ, xung khắc. Thậm chí máu kulắc đã nổi lên ở người này người kia (trong số họ có cả những người thực sự là dân kulắc): liệu có thể sống dựa dẫm vào người bên cạnh được chăng?

– Chúng ta sẽ sống như cha ông chúng ta đã sống. - Một số người đã nói như thế.

Nhưng các cựu chiến sĩ Hồng quân và bọn thanh niên kiên quyết chống lại những người kia.

– Không. - Những người này tuyên bố. - Chúng ta sẽ sống theo chế độ Xô viết. Chẳng lẽ chúng ta đã đổ máu vì chính quyền Xô viết một cách phí hoài sao? Ta hãy làm như thế này: Xây dựng một chính quyền Xô viết thực sự.

Và họ đã bắt đầu xây dựng chính quyền Xô viết. Mọi việc đều thông qua con đường bầu cử. Giới lãnh đạo không có một đặc quyền đặc lợi nào. Kẻ nào không làm kẻ ấy đừng ăn. Và còn nhiều điều nữa cũng theo tinh thần như vậy.

Dần dà, họ đạt được cả quan hệ với thế giới bên ngoài. Với điểm dân cư gần nhất - điểm dân cư ấy cách chỗ họ cũng phải ba, bốn trăm cây số - họ chở tới đó các sản phẩm của mình: lông thú, cá. Còn ở đó, họ mua về cho mình mọi thứ cần thiết.

Nói chung là họ sống được, phong lưu lên. Nhà cửa khang trang. Một thôn xóm khá giả, no đủ. Họ tổ chức câu lạc bộ, thành lập trường học, và trường học mang tên Lênin. Chúng ta sẽ sống theo Lênin!

“Nhưng liệu có phải đã đúng theo Lênin chưa?” - Những người cựu chiến sĩ Hồng quân suy nghĩ.

Liệu Lênin có tán thành họ hay không? Họ đã kéo nhau vào rừng taiga, đã quay lưng lại với thế giới bên ngoài, với cuộc đấu tranh. Chẳng nhẽ đấy mà là chính quyền Xô viết ư? Cuộc đấu tranh một sống một chết diễn ra năm Mười bảy, là vì cái này ư?

Không rõ mọi chuyện này sẽ được giải quyết ra sao, nhưng giữa lúc đó xảy ra một sự việc. Một lần vào mùa hè trong khu vực xóm làng của họ đã xảy ra một tai nạn máy bay. Xử lý thế nào đối với anh phi công đây? Bởi vì nếu thả anh ta ra, thì bí mật của họ thế là chấm dứt. Và người ta sẽ bắt họ phải chịu đựng những cực nhục như thế nào?

Một số người kiên quyết hơn cả đề nghị thủ tiêu anh phi công.

– Người ta không thương xót chúng ta, thì hà cớ gì chúng ta lại phải có lòng thương xót?

– Không, - Số người khác bác lại. - không được giết người vô tội. Chính quyền Xô viết thực sự không bao giờ hành động như vậy. Tốt hơn hết là chúng ta cứ kể rõ cho anh ta biết, chúng ta là những ai và giới thiệu cuộc sống của chúng ta cho anh thấy. Rồi sau đó sẽ bàn bạc thêm với anh ta.

Họ đã làm đúng như vậy.

Anh phi công rất thích thú cuộc sống của họ. Đúng, anh ta bảo: đây là chính quyền Xô viết thực sự. Và sau đó anh ta đã thề không bao giờ, kể cả phút lâm chung, anh ta cũng không tiết lộ bí mật của họ.

Việc hỏng hóc của máy bay hóa ra không có gì đáng kế. Họ đã mau chóng sửa chữa xong. Và một hôm, xúc động chia tay, anh phi công đã bay đi.

Bây giờ, khi đã có người từ thế giới rộng lớn đặt chân đến chỗ họ, những con người ở đây càng suy nghĩ nhiều hơn về cuộc sống - sự tồn tại của mình. Không, không thể sống mãi như thế này. Cuộc sống của những kẻ ẩn dật - đó không phải là con đường do Lênin vạch ra. Phải ra đầu thú, đúng hơn, phải đến tỉnh lỵ gần nhất và kể hết mọi chuyện đang có và mọi chuyện đã qua.

Có người đề nghị về thẳng Mátxcơva. Ở đó có Kalinin. Bản thân ông cũng vốn là nông dân. Ông sẽ phân xử. Ông sẽ hiểu lòng chúng ta. Thực ra thì chúng ta có làm điều gì xấu đâu. Người ta đã xúc phạm chúng ta một cách bất công. Nhưng chúng ta ngay ở nơi lưu đày cũng đã sống theo cách sống Xô viết, sống trong một nông trang. Chúng ta đã xới đất lật cỏ. Chúng ta đã chinh phục rừng taiga. Mà ngay ở thời cũ thì chỉ vì mỗi việc ấy thôi cũng đáng được thưởng mề đay lắm rồi.

Và họ đã quyết định như thế: cử đại biểu về Mátxcơva.

Nhưng các đại biểu đã không kịp ra đi.

Đang đêm, làng của họ đã bị lính đến vây chặt. Mọi người - già, trẻ, lớn, bé - bị xua hết ra khỏi nhà, trong bộ quần áo ngủ. Lính tách riêng phụ nữ và trẻ em. Sau đó họ đốt làng.

Có một đêm như thế. Những con người đứng trước mũi súng trường, hai tay giơ lên cao, trước mắt họ, làng xóm của họ bốc cháy, chính quyền Xô viết của họ bốc cháy.

Nexte ngừng kể. Và anh lại đặt hai bàn tay mugich nặng nề lên đùi, nhìn chúng. Epghênhi Kadimirôvich cũng đưa mắt nhìn hai bàn tay ấy, rồi nhìn Nexte. Và ông không biết nên nghĩ thế nào.

Bảy năm sống trong các trại cải tạo, ông đã được nghe đủ thứ chuyện. Nhưng câu chuyện này… không lẽ tất cả những gì mà Nexte kể đều là sự thực hay sao?

Mà có thể đó chỉ là chuyện bịa đặt. Có thể đó là một di sản của câu chuyện cổ tích về hạnh phúc của người dân, một truyện cổ tích được Nexte sáng tác lại theo lối mới? Tại đây, sau hàng rào dây thép gai, anh ta không biết để đôi tay lam làm của mình vào công việc gì?

Nhưng quả là thực đau lòng: mọi điều mà Nexte đã kể cho ông nghe nó giống như câu chuyện cổ tích, một câu chuyện cổ tích khủng khiếp, trong đó cái thực, cái hư quyện chặt với nhau một cách khó tin nhất.

', N'Bến Lặng', N'ben-lang')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 6, N'Con sông Oka về mùa thu cạn nước, thân hình loang bạc gầy rộc đi của nó tưởng như sạm lại giữa đồng bãi xanh tươi rộng bao la. Từ chỗ này nhìn thấy rất rõ Kaluga, ở đó có thân hình màu bạc của quả tên lửa đang leo lên nền trời.

Nơi tận cùng dãy phố chạy ngoặt ra bờ sông có một nhà gỗ. Đã có một thời căn nhà này chỉ là căn nhà một tầng. Ông giáo Xiôncốpxki tậu lại của một chủ khác. Sau một trận lũ của con sông Oka vào đầu thế kỷ chúng ta, người ta thấy rằng giá có được thêm tầng gác hai thì tốt hơn - ở đó, trong trường hợp cần thiết, có thể tránh được những con nước xuân hung hãn.

Ngôi nhà làm bằng ván ghép mang dấu vết của nhiều lần sửa chữa và xây dựng thêm. Khi xưa nó được đăng ký bảo hiểm ở hội bảo hiểm Kaluga. (Tuy chẳng may trong nhà mà xảy ra cháy, hẳn là không một đội cứu hỏa nào thời đó cứu được nó thoát tai nạn).

Bên trong ngôi nhà cũng từng thấy nhiều chuyện: chốn này từng được nghe chán tiếng rìu và tiếng bào đưa trên mặt gỗ, tường nhà được vá đi vá lại chằng chịt, hai căn phòng nhỏ nép sát vào nhau, hai cầu thang tự đóng lấy bằng gỗ tiện lên xuống ở hai đầu. Hàng hiên cho đến nay vẫn không được sưởi ấm vì thế mà mùa đông chủ nhân của nó thường kéo dài bàn mộc và các đồ nghề thô sơ khác vào hai căn phòng trên ấm áp hơn.

Ở giữa trung tâm hình học của cái công trình đơn sơ này, giống như trái tim trong cơ thể sống, căn bếp được đặt thật tiện lợi. Trong căn bếp, cái lò sưởi Nga choán hết phần lớn diện tích. Những cái chạc sắt và những dụng cụ khác thật cần thiết trong các công việc nội trợ, càng giảm diện tích của căn bếp: ở đây bà Vacvara Epgraphôpna, nữ chủ nhà, xoay xở khá vất vả.

Nhưng, có lẽ, đối với chủ nhân, phần quan trọng nhất của ngôi nhà là xưởng thợ. Không có xưởng thợ này Xiôncốpxki không thể tưởng tượng nổi ý nghĩa cuộc đời mình, ông đã khôi phục lại xưởng thợ này ngay nếu như nó bị hủy hoại, luôn bổ sung thêm đủ các dụng cụ khác nhau. Ông đã làm việc với tư cách là một giáo viên trường trung học, cũng lại là một học giả, đồng thời là một ông thợ mộc và thợ thiếc. Số nghề nghiệp như vậy đối với một con người liệu đã coi là đủ chưa?

Tại đây, trong căn nhà gỗ Kaluga này, mọi cái vẫn giữ nguyên như sinh thời Xiôncốpxki. Mỗi vật đều trở nên thiêng liêng bởi đã được bàn tay của nhà bác học động đến. Vẫn còn nguyên vẹn cả chiếc xe đạp, chiếc xe bằng tuổi thế kỷ của chúng ta, hình thức giao thông ưa thích và duy nhất của chủ nhân nó.

Khi anh đi từ căn phòng nhỏ sang căn phòng kia. những căn phòng chật chội như những các-bin trên tàu vũ trụ, anh mường tượng rằng anh nghe thấy tiếng nói của chủ nhân trả lời các câu hỏi của những vị khách hiếu kỳ: các học giả, các kỹ thuật gia, đơn giản là các phóng viên báo chí. Có cảm giác những tiếng nói sinh thời của họ đang vang lên, anh lắng nghe như muốn nuốt lấy từng lời, và từng lời anh đều muốn ghi lại trong phòng làm việc, chẳng hạn…

– Kônxtantin Eđuacđôvits…

– Xin ông nói to lên một chút… - Xiôncốpxki chỉ lên hai tai mình, lập tức khum hai lòng bàn tay đưa lên bên tai[9].

– Kônxtantin Eđuacđôvits, trong thế kỷ của chúng ta, thế kỷ của hơi nước và điện…

– Ông nói thế nào kia? - Xiôncốpxki cau mặt.

– Của hơi nước và điện. - Anh phóng viên tin tức nhắc lại.

– Không, thưa chư huynh, - Xiôncốpxki bực mình. - ông hơi lạc hậu rồi đấy, ông năm nay bao nhiêu tuổi?

– Hai mươi sáu. - Anh phóng viên trả lời, một anh chàng tóc đen chải chuốt, mặc bộ đồng phục kẻ ô và thắt cà vạt, kiểu hiện nay Khơlextakôp vẫn thắt khi lên sân khấu địa phương.

– Thưa quý ông, đã đến lúc ông phải biết là một thế kỷ mới đã mở ra và, xin quý ông cho phép, thế kỷ mới đã được mười năm rồi. Hơi nước, theo quan niệm của tôi đang đi vào quá khứ. Kể ra thì điện lực còn tồn tại. Nhưng điều khác biệt nhất của thế kỷ chúng ta phải là bay.

– Sao kia ạ?

– Bay… Không còn bò dưới mặt đất - mà bay… Bay sẽ là một ngành chuyên môn của con người thế kỷ chúng ta. Vậy mà ông lại còn nói về hơi nước. Thật đáng xấu hổ đấy, thưa công tử.

– Nhưng xin lỗi ông, Kônxtantin Eđuacđôvits, ông vượt lên trước, lên trước quá xa.

– Thế ông thì muốn thế nào? Nhìn về quá khứ ư?

Anh phóng viên hí hoáy cây bút chì ghi lại điều gì đó vào sổ tay rồi anh nói…

– Ở góc nhà ngoài hành lang, tôi nhìn thấy máy tự trượt…

– Thì có gì là…?

– Phải chăng ông không cho rằng từ cái máy tự trượt này… - Anh phóng viên rời mắt khỏi cuốn sổ ghi chép và nhìn về mô hình một cái máy bay do Xiôncốpxki cấu tạo… - từ cái máy tự trượt này đến cái đó - một khoảng cách, nhưng ta nói lớn ghê gớm ư?

– Ông cho phép nói đùa thế, thưa công tử! Như ông đã biết tôi là thầy giáo nên tôi thích người ta ăn nói sao cho đúng văn phạm.

– Cái đó là tôi nghĩ vậy thôi. Kônxtantin Eđuacđôvits. Còn nói chung ra thì tôi có học vấn đại học. Trường đại học tổng hợp Iuziep, Kônxtantin Eđuacđôvits.

Xiôncốpxki sửa lại mục kỉnh, ông mỉm cười.

– Thưa chư huynh, còn tôi lại không thể khoe khoang vì điều đó. Đáng tiếc cho bản thân, tôi chưa tốt nghiệp đại học. Thế cái này thì sao?… Tôi đã đọc đúng hơn là đã tìm hiểu, đi sâu vào công trình của ông, cái có tên là “Việc nghiên cứu các không gian vũ trụ bằng các dụng cụ phản xạ”. Kể ra thật lý thú nếu được biết: ông đã học hỏi ở đâu, ai là người thầy - bác học đầu tiên của ông, ai đã gợi cho ông những cái… Nói thế nào đây…

– Những cái vô nghĩa? - Kônxtantin Eđuacđôvits đỡ lời.

– Không, không…

– Công tử ơi, chớ có ngại ngùng, cứ mạnh dạn mà nói…

– Vâng đây, đây, từ sau này mới thật chính xác - những tư tưởng mạnh bạo…

Kônxtantin Eđuacđôvits hít mạnh.

– Không có ai cả! - Ông ngừng một lát. - Kể ra thì như vậy cũng không đúng hẳn. Người ta đã gợi ý cho tôi. Và tôi đã học nghe được những điều gợi ý này dần dần trong một thời gian dài bắt đầu từ trên ghế nhà trường mà đi.

– Ai đã gợi ý, nếu đó không phải là bí mật?

– Xin quý ông! - Kônxtantin Eđuacđôvits, dứt khoát gập những ngón tay lại. - Ackhit[10] với con chim bồ câu của mình, ông sống trước ngày giáng thế của Giêsu Khrist. Người Hy Lạp này đã tạo ra một dụng cụ giống như con chim bồ câu. Một dụng cụ phản xạ! Và con bồ câu ấy đã bay vòng quanh một điểm nối với sợi dây giữ lại. Đó là điều gợi ý thứ nhất! Tiếp theo. Quả cầu của Herôn[11]. Quả cầu này quay dưới tác động của lực phản ứng của hơi nước. Thứ hai, ông biết gì về mũi tên lửa của “Hồ giang”?[12] Thuốc súng đã tác động cho nó bay. Cái đó có từ thời cổ Trung Quốc. Ba! Tiếp theo. Những quả pháo bông được miêu tả trong sách của Haxơ, Erônxpecgher, Suilap, Xemenôvít. Tất cả những cái đó đã có từ mấy thế kỷ trước kia. Đó là thứ tư! Tiếp theo. Còn những hội pháo bông của dân Nga chúng ta? Những hội pháo bông đã được tổ chức thường xuyên ở thế kỷ trước, trước trước nữa, thế kỷ trước trước và thế kỷ vừa qua? Cái đó là năm! Còn những quả tên lửa dưới nước của Sinđer của chúng ta đem ra thử ở nước Nga gần một trăm năm trước? Đó là sáu. Chẳng lẽ còn cần sự mách bảo gợi ý nào khác nữa ư? Phải chăng ngần ấy cũng còn là ít nữa sao?

Kônxtantin Eđuacđôvits đứng bật dậy và đưa tay chỉ vào cuốn sổ ghi của khách.

– Công tử ạ, ông viết đi, bởi vì rằng chúng ta càng nói công khai về việc bay trên không trung, về việc bay trong vũ trụ càng nhiều bao nhiêu, càng có nhiều trái tim hướng về niềm tin đúng đắn của thế kỷ hai mươi. Tôi xin nói với ông, hơn thế, cần phải nghĩ tới việc phân bổ con người tới ở trong không gian vũ trụ…

– Xin lỗi ông, nhưng cái đó thậm chí trong lãnh vực viễn tưởng cũng chưa nói đến.

– Thế ở đâu ra nhỉ? - Kônxtantin Eđuacđôvits ngồi xuống chỗ ngồi của mình và bắt đầu vẽ lên đấy những khối cầu trông giống những khúc dồi phồng to.

– Đúng hơn là trong một truyện thần thoại nào đó. - Anh chàng phóng viên rụt rè thổ lộ.

– Phải, tôi biết, - Xiôncốpxki nói, giọng khàn khàn. - nhiều người giao dịch với tôi và thậm chí cả các đồng nghiệp của tôi vẫn cứ coi tôi ít nhất là một kẻ mơ mộng. - Ông nhìn anh chàng phóng viên chằm chằm, hệt như ông vừa nảy ra một ý nghĩ lý thú nào đó: Mà có thể’ cho là kẻ điên rồ? Thế nào?

– Ông cứ nói…

– Không, không! Có lẽ là kẻ điên rồ… Mà tại sao lại không nhỉ? Đưa người đến ở các tinh cầu khác trong vũ trụ. Kỳ lạ? Không tưởng tượng nổi! Lạ lùng! Nhảm nhí! Nhưng sự thật là, - Ông đặt tay lên vai anh chàng phóng viên. - một kỷ nguyên mới sẽ tới. Thoạt đầu con người sẽ mọc cánh, sau đó mặt trăng và các tinh cầu khác sẽ gọi anh ta tới. Khi đó bằng bất cứ thứ bánh ngọt nào, bất cứ hứa hẹn mua chuộc nào cũng chẳng thể giữ nổi con người lại trái đất…

– Bằng cách nào kia chứ?

– Thế những máy bay để làm gì? Vận động phản xạ tồn tại đấy để làm gì? Tên lửa để làm gì?

– Thực ra, để làm gì kia?

– Để đưa con người vào vũ trụ. - Xiôncốpxki lên tiếng một cách dịu dàng, độ lượng! - Đó không phải là lời mê sảng, đó là những kết luận của khoa học. Tất cả đều đã được tính toán bằng những công thức chính xác…

– Những công thức của ông?

– Trong số đó có cả của tôi.

Anh chàng phóng viên lật trang sổ ghi chép của mình và hỏi:

– Nhưng ông lấy mọi cái đó từ đâu ra?

– Chỉ do việc tự học! Trước đây tôi không có điều kiện học hỏi các khoa học ở trong trường đại học. Tôi đã thi thí sinh tự do các kỳ thi lấy bằng giáo viên phổ thông[13]. Thưa quý ông, tôi có thể nói không quá khiêm tốn một điều: tôi là một giáo viên nhiệt thành. Thời giờ chủ yếu của tôi dành cho các em học sinh. Còn lại - để tự học. Sách chính là trường đại học của tôi. Cần phải làm để có tiên nuôi sống cả gia đình và chắt bóp từng đồng xu để mua dụng cụ và sách. Thiếu các dụng cụ đồ nghê và sách - đối với tôi không còn là cuộc sống.

Khi mọi người ngủ - tôi học hỏi theo sách. Khi mọi người nghỉ ngơi - tôi học hỏi trong sách. Vật lý, toán học, hóa học - đó là lãnh địa của tôi! Không có những môn đó liệu tôi đã làm được gì nào? Không có việc tự học, không hiểu tôi đã sống ra sao? Các ngài giáo sư và các ngài viện sĩ hàn lâm từ trên cao đọc các công trình của tôi một cách hạ cố, - điều này tôi biết. Thôi thì mặc họ, tôi chẳng phật lòng. Tôi không hơi đâu mà phật lòng phật dạ.

Điều quan trọng nhất trong đời là làm cái công việc yêu quý của mình. Còn việc tôi thiếu bằng đại học làm cho người nào đó bối rối, thì tôi chẳng có cách nào giúp họ. Phải, tôi là kẻ tự học. Thế ông có biết từ đó là thế nào không?… Đề nghị ông ghi vào và nhất thiết loan báo cho độc giả tờ báo của ông biết về từ đó: “Kẻ tự học” - một từ Nga. Nó chỉ có một nghĩa, anh tự học ở bản thân anh, anh tự dạy bản thân anh. Nhưng trong việc này có người lại quên một điều là: không thể tự học ở bản thân anh, tự dạy ở bản thân anh mà thiếu sự hỗ trợ của sách vở.

Trong sách vở có biết bao nhiêu là kiến thức? Cuốn sách vô giá biết chừng nào. Trong đó có biết bao nhiêu điều khôn ngoan mà loài người đã tích lũy được? Không thể phủ nhận rằng, được học ở các trường đại học là rất tốt, nhưng nếu như không có điều kiện được học? Nếu như hoàn cảnh nó như vậy? Khi đó chỉ còn một lối thoát là mau mau tìm đến sách. Và mặc cho thiên hạ gọi anh là kẻ tự học. Điều đó không có gì đáng phật lòng. Chỉ cần sao tự anh không rơi vào số những thằng ngốc… Anh chàng phóng viên lia ngọn bút chì trên mặt giấy với hết tốc độ có thể có của mình…

* * *

Cách ngôi nhà của Xiôncốpxki không bao xa, có một ngôi nhà khác - ngôi nhà này bằng kính và bê tông. Đứng ngay trên bờ cao bên sông Oka. Khi anh tiến gần tới Kaluga, từ xa anh đã thấy ngôi nhà này. Đó là nhà bảo tàng lịch sử khoa vũ trụ học. Nơi đây thu thập các kiểu mô hình phản lực và máy bay từ thời cổ xưa đến ngày nay.

Trong gian phòng lớn trang nghiêm trưng bày các máy móc vũ trụ của chúng ta mạ kền sáng loáng, bắt đầu từ quả vệ tinh quanh trái đất đầu tiên đến máy móc khổng lồ nhiều tấn, được đưa lên mặt trăng: và từ đó gởi về trái đất cho chúng ta những mẫu đất đá trên mặt trăng: Ở đây có cả các các-bin bị đốt cháy bởi cái nóng không tả được, từng bay trong vũ trụ và lại trở về trái đất. Những nhà du hành vũ trụ của chúng ta đã ngồi trong đó và cho đến nay họ vẫn đang sống khỏe mạnh.

Đi từ cỗ máy này sang cỗ máy khác, nhìn chân dung những con người đã tham gia vào việc sáng tạo ra những máy móc ấy, ngắm nghía loạt ảnh những nhà du hành vũ trụ dũng cảm, bạn sẽ luôn luôn nghĩ tới Xiôncốpxki. Bởi vì ông từng kiên trì, bền bỉ chứng minh một cách khoa học với những công thức và mô hình, truyền bá tư tưởng về những chuyến bay giữa các hành tinh, tiên đoán cho thế kỷ chúng ta là thế kỷ của việc bay trên không trung, thế kỷ của vũ trụ.

Ngày nay hầu như tưởng không phải là thật, nhưng chuyện đã có, đã xảy ra: ngay từ năm 1890, Xiôncốpxki đã viết công trình với cái tên “Về khả năng xây dựng khí cầu bằng sắt thép”! Vấn đề thực chất nói về những khí cầu lái. Rồi hai năm sau - một công trình thứ hai! “Khí cầu sắt thép, có điều khiển”. Ở đây vấn đề nói về “Lý thuyết khí cầu lái làm bằng thép hình sóng”…

Bên tai bất giác sống lại những cuộc chuyện trò trong ngôi nhà của Xiôncốpxki, những cuộc chuyện trò diễn ra ở thời đại mới sau này. Cuộc nội chiến chỉ vừa mới kết thúc. Lần ấy có một người trẻ tuổi đến Kaluga thăm ông. Anh ta nói về mình như sau:

– Cháu đã bay trên những máy bay “Farman”[14] và “Bleris”[15]. Cháu đã nhìn thấy những máy bay “Xepplin”[16] Đức. Và từ đó cháu không lúc nào quên ý nghĩ rằng ở đây, một nơi hẻo lánh thôn dã, cụ đã từng nhìn thấy trước mọi chuyện này. Và không chỉ nhìn thấy trước, mà còn chứng minh bằng toán học tất cả cái đó. Cụ chỉ cần có những người hỗ trợ và một ít sự quan tâm từ trên để có thể vượt thời đại của mình không chỉ trong lý thuyết mà cả trong thực hành.

Xiôncốpxki chăm chú nghe người khách. Cụ lên tiếng hỏi:

– Cả bây giờ anh cũng vẫn còn phục vụ trong hàng không?

– Không. Cháu đang theo học ở trường trung cấp kỹ thuật như cụ thấy đấy, có chậm đôi chút…

– Điều đó không sao. Và hoàn toàn nghiêm chỉnh: Tôi chẳng hạn, cũng chậm, thậm chí quá chậm, nhưng tôi không ca thán.

Người trẻ tuổi hóa ra đã đọc rất nhiều sách. Riêng những công trình của Xiôncốpxki thì anh biết hầu hết.

Và hết sức khen ngợi. Anh nói:

– Cháu có một số bạn bè. Ngành hàng không không còn làm chúng cháu quan tâm - đó đã là một điều hiển nhiên được thực hiện rồi.

– Tại sao? - Xiôncốpxki ngạc nhiên. - Thế máy bay nhiều chỗ ngồi? Anh đã thấy mô hình loại máy bay ấy ở hành lang chưa?

– Đã, đã thấy ạ.

– Chẳng lẽ đó là một điều đã được thực hiện?

– Hầu như vậy…

Xiôncốpxki ngạc nhiên nhún vai. Người trẻ tuổi giải thích ý kiến của mình:

– Có thể’, chúng cháu chẳng qua chỉ là những người mơ mộng. Có thể, đó là sai lầm của chúng cháu, nhưng chúng cháu đang nghĩ tới những chuyến bay lên mặt trăng và các vì sao. Cụ đã gieo vào lòng chúng cháu sự tò mò này. Và trong việc này chúng cháu không có lỗi gì.

– Cũng có thể. - Xiôncốpxki tán thành.

– Cháu đọc sách của cụ và cháu kinh ngạc. - Người khách trẻ nói tiếp. - Nhìn các mô hình của cụ và cháu lại kinh ngạc nữa… Theo chừng mực cháu hiểu thì chính quyền Sa hoàng không hạ cố để tâm đến cụ…

Xiôncốpxki bực bội lắc đầu. Cụ lấy ở ngăn kéo ra một tờ giấy và đưa cho người khách xem. Và người ta đọc to:

“… Dù các khí cầu hình dạng có thế nào đi nữa và làm bằng chất liệu gì đi nữa, tất cả những cái đó vĩnh viễn bởi sức mạnh của các vật thể, đều trở thành đồ chơi của những trận gió”.

Xiôncốpxki gõ gõ các ngón tay xuống bàn: thì, chỉ có những kẻ ngu xuẩn, những bộ óc rỗng mới có thể suy nghĩ như vậy…

* * *

Năm 1896 Xiôncốpxki làm việc đêm đêm, đôi khi cả những buổi sáng tinh mơ - trước khi đi dạy học ở trường, đã đi đến kết luận: tên lửa và chỉ có tên lửa có thể là biện pháp kỹ thuật duy nhất để bay vào vũ trụ. Cụ đã viết:

“… Để nghiên cứu khí quyển, tôi đề nghị tạo ra một bộ máy phản lực, có ý nghĩa là một loại tên lửa như loại tên lửa khổng lồ và cấu tạo một cách đặc biệt”.

Hơn thế nữa, nhà bác học còn lo trước đến cả việc các nhà du hành vũ trụ đi ra hẳn ngoài khoảng không vũ trụ. Để làm được việc đó, cần mặc cho nhà du hành vũ trụ thứ áo bay đặc biệt.

Nhà bác học còn nhìn trước cả việc đặt lên bề mặt vỏ ngoài của tên lửa những bộ ắcqui mặt trời. Bởi vì không thể không sử dụng năng lượng tuyệt vời mặt trời gởi cho. Mọi cái đó được đưa ra ở cuốn truyện “Ở bên ngoài trái đất”.

Nhiều, rất nhiều điều đã được củng cố bằng những công thức chính xác, những tính toán toán học. Điều tưởng tượng đi kèm với khoa học…

– Làm sao mà cụ đạt được tất cả mọi điều này, Kônxtantin Eđuacđôvits? Cháu biết, cụ không học qua các ban đại học.

– Tôi không giấu: tôi không được lui tới các tòa nhà đại học. Trường đại học của tôi ở đây. Dưới tầng một và trên tầng hai của ngôi nhà. Người ta không chở đến cho tôi các máy móc và các dụng cụ khác nhau. Tôi tự làm ra chúng bằng đôi bàn tay này. - Và Xiôncốpxki đưa hai bàn tay ra trước. Hai bàn tay của người thợ.

– Kỳ diệu!

– Chẳng có gì kỳ diệu cả, anh bạn của tôi! Nguyên tắc đầu tiên của tôi: không thương xót bản thân mình, làm việc, không chán nản, đi lên trước, luôn luôn tiến lên trước, thậm chí không chỉ gió, mà cả bão tố cuồng phong thổi vào mặt anh, anh cũng mặc. Nếu trong anh không có cái đó, nếu như anh thích ngồi nơi ấm áp và dễ chịu hơn, nếu sự thờ ơ của một số người này, sự ngờ vực của một số kẻ khác làm anh hoảng sợ, thì vứt bỏ những ý định của mình đi. Đừng tự hành hạ mình, đừng làm kiệt sức một cách vô bổ. Nếu như anh cho rằng anh đúng, anh có thể - không nay thì mai - chứng minh được lẽ phải của mình, thì hãy dũng cảm đi theo con đường của mình.

Người tiếp chuyện muốn lên tiếng hỏi một câu gì đó nhưng Xiôncốpxki ngăn anh lại.

– Tôi sẽ nói hết ý tôi ngay đây… Nhưng chỉ một niêm tin thôi chưa đủ. Cần phải cho mình thấy rõ, vì lẽ gì và vì ai mà anh sống và lao động thâu đêm suốt sáng, trong khi người khác thì nghỉ ngơi tĩnh dưỡng, cần phải làm sao cho mình thấy rõ rằng lao động của anh cần thiết không chỉ riêng cho anh mà cả cho nhân dân. Nhất thiết cho nhân dân. Tại sao sau cách mạng tôi lấy lại được tinh thần? Tại sao bây giờ tôi sống với một niềm tin mãnh liệt vào tương lai? Rất đơn giản: Tôi hiểu - điều này tôi thấy rõ, - rằng chỉ có những người lao động mới có khả năng hiểu tôi, các tư tưởng của tôi. Chỉ có họ mới đưa đến đích cái mà đối với nhiều kẻ chỉ cho là một điều tưởng tượng hão huyền.

– Được nghe điều đó thật thú vị, cụ Kônxtantin Eđuacđôvits, cháu và các bạn của cháu cũng nghĩ hệt như vậy.

Xiôncốpxki phấn chấn. Nhà bác học chỉ lên đống giấy tờ nằm ngổn ngang trên mặt bàn, trên các thành cửa sổ, dưới sàn nhà:

– Và anh có biết ai sẽ thực hiện tất cả cái này?

– Ai ạ, thưa cụ Kônxtantin Eđuacđôvits?

Xiôncốpxki trả lời:

– Những người Bônsêvich.

* * *

Xiôncốpxki đã chuyện trò chính bằng những lời lẽ ấy chăng? Ai là những người tiếp chuyện của cụ? Hiện nay họ còn sống chăng, những người trẻ tuổi lúc ấy? Anh đi qua các phòng ngôi nhà gỗ và anh tự hỏi mình những câu hỏi, có thể, bây giờ đã không có ý nghĩa gì lớn. Điều chủ yếu là: đã có những cuộc trò chuyện tương tự như vậy, không thể không có những lời lẽ ấy hoặc giả Xiôncốpxki lấy ra từ các công trình của mình, hoặc giả từ những cuộc trò chuyện - chúng đi vào các công trình của cụ. Bây giờ cả điều đó cũng không có ý nghĩa gì lớn. Sự thể không phải ở ngữ pháp hay phép đặt câu trong ngôn ngữ của nhà bác học, mà ở thực chất.

Mà thực chất đã được vật chất hóa một cách hiển nhiên, chính xác, không thể biến đổi được trong đài kỷ niệm ra đời từ các tư tưởng, lời lẽ và ý đồ của Xiôncốpxki: đó là quả tên lửa của chúng ta từ bờ dốc bên sông Oka bay vút lên trời cao.

Ngày nay từ khắp mọi kinh tuyến, vĩ tuyến trên trái đất đều nhìn thấy rõ quả tên lửa ấy.', N'Tại Căn Nhà Của Xioncopxki', N'tai-can-nha-cua-xioncopxki')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 7, N'Vị tướng chỉ huy đã thưởng cho bốn chiến sĩ công binh có công giật đổ cái cầu một đợt đi phép.

Mennitsue lên đường đi về đâu đó miền Pôtavsina, Xkômôrôkhốp về Vôlôgđ, Garanhin về thị trấn Pletx, nằm trên sông Vonga, còn Visnhiakốp tuyên bố sẽ đi Xmôlenxcơ.

– Chà, cậu đi đâu kia chứ? - Trung đội trưởng Tsutkô toan can ngăn Visnhiakốp. - Cậu tứ cố vô thân…

– “Tứ cố vô thân, tứ cố vô thân!” - Visnhiakốp nhại lại. - Biết đâu đấy ở Xmôlenxcơ tôi có người bà con cũng nên.

– Về chuyện người bà con thì tất nhiên cậu bịa rồi, nhưng tôi cũng chẳng can ngăn cậu làm gì nữa. Rồi tự cậu khắc ân hận.

– Người ta đi đông đi tây cả, chòm chõm một mình tôi ngồi đây ư! Một khi đã được đi phép, nghĩa là, tôi có đầy đủ quyền ra đi! - Visnhiakốp vừa càu nhàu, vừa xếp túi đựng đồ.

Về chuyện người bà con, quả là Visnhiakốp đã bịa, nhưng thật chẳng muốn ở lại đơn vị những ngày này tí chút nào: chẳng nhẽ anh thua kém những người khác sao?

Ngoài ra, Visnhiakốp cho rằng, đồng chí trung đội trưởng can ngăn anh bỏ chuyến đi là có dụng ý - đồng chí ấy không muốn thiếu một người trợ thủ, không muốn phải bận bịu thêm trách nhiệm.

– Nếu tôi không tìm thấy người bà con, lập tức sẽ trở lại đơn vị ngay. - Visnhiakốp nói, xếp khẩu phần lương khô vào túi đựng đồ, anh giải hòa đưa cho đồng chí trung đội trưởng bao thuốc “Đeli” tặng phẩm của vị tướng chỉ huy.

Mãi đến khi Visnhiakốp đã an tọa trên chiếc xe tiện đường và trung đoàn đã ở lại xa phía sau, anh mới bắt đầu thấy phân vân. Có thể, Tsutkô đúng cũng nên? Tội tình gì phải đi khổ sở mấy ngày trời rồi quay trở lại càng thêm cô đơn hơn trước.

Xe càng đi xa trung đoàn bao nhiêu, anh càng cảm thấy côi cút hơn bấy nhiêu, chống chếnh hơn bấy nhiêu trong cái thùng xe chiếc xe đi nhờ.

Xmôlenxcơ đón anh bằng đám đông chen chúc ở chỗ tránh tàu. Cả hai phía của các con đường đều đầy xe cộ nối đuôi nhau. Người nào cũng nôn nóng chờ chiếc đầu máy nhỏ yên đi, thôi không còn lăng xăng chạy đi chạy lại, như các tay lái xe nghĩ, một cách vô nghĩa và vô ích nữa.

Các tay lái xe nổi còi inh ỏi, hành khách bực bội quát tháo cô gái bẻ ghi đứng bên thanh chắn, Visnhiakốp lấy túi thuốc ra, bình thản quấn hút. Riêng anh chẳng vội đi đâu.

Sau đó anh xuống xe, lịch sự cám ơn người lái và thư thả đi vào thành phố. Anh đi theo bên hè đường, cố tránh những vũng nước xanh trắng trong đó soi rõ vòm trời tháng tư.

Nửa năm trước đây, Visnhiakốp đã có dịp đến Xmôlenxcơ, khi tiểu đoàn anh là đơn vị đầu tiên vào phần bên sông của thành phố.

Từ đó sư đoàn anh mang tên sư đoàn Xmôlenxcơ, vì thế mà Visnhiakốp khi thu xếp lên đường đã có cảm giác là chỉ vì một lý do này thôi cũng sẽ thấy ở Xmôlenxcơ sẽ như ở nhà mình.

Nhưng lúc này đây đi ngang bên anh là những người xa lạ. Người nào người nấy đều vội vội vàng vàng, đều lo tâm bận trí, đều chăm chăm nhìn xuống, sợ giẫm phải vũng nước trên vỉa hè hỏng nát, chạy dài theo những dãy nhà bị tàn phá.

Visnhiakốp tưởng rằng đi hết đường phố bị tàn phá này, sau đó là mở ra trước mắt anh thành phố thực sự. Nhưng hết dãy đổ nát này tiếp đến dãy đổ nát khác, mà thành phố nguyên vẹn đang sống vẫn chưa hiện ra - vẫn những khối nhà bị tàn phá ấy, vẫn những cái hộp gạch đá trống không, trong lòng trải lớp tuyết đen bẩn còn chưa tan.

Trong một ngày ấm áp như thế này, khách bộ hành thường đi dọc ở bên mép hàng, bởi vì từ các mái nhà nước rỏ xuống và các ống máng xối nước ra. Nhưng trong thành phố này từ trên mái không có nước rỏ và ống máng như luôn luôn khô, bởi vì làm gì còn mái nhà nữa.

Visnhiakốp ngẩng đầu. Nền trời xanh trắng nhìn xuống anh qua mảnh tường thủng. Tít cao trên tầng gác ba treo lơ lửng một chiếc giường sắt cong queo vì lửa, bên cạnh đó là cái bếp lò gạch men trắng bám vào tường. Người ta bao giờ cũng tìm đến với hơi ấm, giường ngủ bao giờ cũng ghé sát bên các vách lò, vì thế cảnh tượng chiếc giường sắt cong queo bên cái bếp lò nguội lạnh làm cho trái tim đau thắt lại.

Do chỗ cái dãy nhà bị tàn phá và bầu trời nhìn qua các ô cửa sổ, phố xá có cảm giác rộng ra.

Con đường đi lên đồi cao. Hình như trước đây, trong cái ngày trận đánh - Visnhiakốp đã qua nơi đây nhưng khi đó đường phố này anh không cảm thấy lấy gì làm dốc. Anh nhớ là, khi đó anh bước đi, mang đầy đủ trang bị - cả súng, cả máy dò mìn - và ngày hôm ấy ấm hơn bữa nay, và trong một ngày anh đã đi qua biết bao nhiêu đường đất, vậy mà anh không thấy mệt: lúc băng lên thì núi cao nào cũng chỉ là đường bằng, lối đi nào cũng thẳng tắp.

Anh đi đến ngôi nhà ở góc phố, nơi có treo cái khung rỗng và han gỉ của chiếc đồng hồ đường. Ngày trước chiếc đồng hồ từ ngã tư đường này đã nhìn ra ba mặt, trong cái ngày đó Visnhiakốp có đi qua nơi đây không nhỉ? Anh không biết chính xác, nhưng anh thấy cái khung đồng hồ rỗng quen quen. Bấy giờ anh còn nghĩ là chắc hẳn các chàng trai và các cô gái vẫn hẹn hò nhau gần bên chiếc đồng hồ này.

Visnhiakốp rẽ vào góc phố, nhìn quanh, phải chăng đây là nơi ba người bọn anh, anh cùng Tsutkô và Xkômôrôkhốp đã tháo mìn trên mặt đường? Phải, tất nhiên rồi! Đây chính là ngã tư đường mà bọn anh đã tìm thấy quả mìn nổ chậm.

Anh bước đi dọc theo một con đường nhỏ vắng vẻ nằm giữa những rặng bạch liễu tán cành trơ trụi. Đâu đó ở nơi này Visnhiakốp nhớ là anh đã cứu được một căn nhà cũ kỹ khỏi bị mìn nổ. Bọn phát xít đã gài mìn trong căn nhà này trong lúc những người chủ của nó còn đang trốn ở nhà hầm, đợi hết trận đánh. Visnhiakốp nhớ rành rọt ván sàn trong căn phòng ở: những tấm ván ấy ọp ẹp cũng như những bậc tam cấp ngoài hiên cửa. Anh đã moi từ bếp lò ra một quả mìn, quả mìn thứ hai hẳn sẽ nổ một khi những người chủ trở về động đến cái ấm đun nước, cái ấm siêu tráng men màu xanh da trời có những vết đen ở chỗ tróc men.

Nhưng đâu đường phố ấy, đâu căn nhà ấy? Và trông nó thế nào nhỉ, cái căn nhà thoát khỏi ngọn lửa ấy? Visnhiakốp đi đến ngang căn nhà nhỏ nằm ở sâu trong sân. Không lẽ căn nhà ấy xấu xí vậy ư? Còn nhớ, căn nhà ấy cũng tựa vào một cây bạch liễu lòa xòa, và cũng một hàng rào ọp ẹp như thế này chạy dưới cửa sổ.

Anh đứng phân vân một chút, sau đó khoát tay và bỏ đi tiếp. Nhưng càng đi xa khỏi căn nhà anh càng cảm thấy tò mò và muốn quay trở lại. Mong muốn này chẳng mấy chốc trở nên day dứt, không cưỡng lại nổi. “Dù sao đi nữa cũng buộc phải vào xin nghỉ trọ nhà một người nào đó”, Visnhiakốp tự động viên mình.

Anh quay trở lại, bước lên những bậc tam cấp ọp ẹp, lên hiên và gõ cửa.

Cửa do một cô gái tóc màu hạt dẻ, mặc áo săng đay mở.

– Cô chủ nhà, xin cho phép tôi ghé nghỉ trọ độ đường. - Visnhiakốp lên tiếng hỏi.

Cô gái đưa con mắt nghiêm nghị xét nét người lạ mặt và vội vàng nói không lấy gì làm niềm nở:

– Thì mời anh vào nhà.

Visnhiakốp e dè, nghiêng người, lách vào cửa, lau kỹ chân giày, sau đó ngồi xuống mép chiếc ghế tựa và bắt tay vào cởi túi đựng đồ.

– Cô hẳn là người Xmôlenxcơ? - Visnhiakốp hỏi chuyện.

– Vâng.

– Như vậy, chúng ta là đồng hương.

– Thế trước đây anh sống ở phố nào?

– Nào có sống ở phố nào! Chúng tôi đã chiến đấu ở đây. Sư đoàn chúng tôi là sư đoàn Xmôlenxcaya.

– Ra là thế. - Cô gái đáp lại hững hờ, bộ dạng của cô tỏ rõ là cô muốn nói: “Người ta cho vào nhà - thế là đủ rồi. Còn cái việc chuyện trò cho khuây khỏa bất cứ người qua đường nào thì đây không có ý định làm đâu, và ở đây đừng có mà hòng tính cái trò làm quen một cách dễ dãi”.

Visnhiakốp thỉnh thoảng lại ngó nhìn cái bếp lò, sau đó chăm chú nhìn cái ấm đun nước tráng men xanh da trời có những vết sứt đen đen quen thuộc. Cô gái bắt gặp cái nhìn của Visnhiakốp, cô cau mày, bậm môi: “Mà sao lại đi ngó ngó nghiêng nghiêng vào bếp nhà người ta kia chứ? Đã thế đây phớt lờ không mời nước nữa. Cho biết tay, lần sau đừng có giở thói càn rỡ ấy ra”.

– Thế khi trận chiến giải phóng Xmôlenxcơ diễn ra, cô sống ở đây chứ?

– Mẹ tôi với đứa em gái nhỏ tôi ở đây. Còn tôi bấy giờ trốn ở nhà bà cô ở miền quê.

– Ra thế! - Visnhiakốp buông ra một lời lửng lơ và lại chăm chú nhìn cái bếp lò.

Anh vẫn đợi cô gái bảo anh cởi áo bađờxuy lính, lúc đó cô ta sẽ thấy rõ anh là con người có công tích, thuộc gia đình nhà lính cận vệ và đầy đủ huân chương, huy chương, chứ đâu có phải một gã ấm ớ nào. Nhưng cô gái, chăm chú công việc khâu vá và mải mê theo đuổi ý riêng chẳng nói, chẳng rằng. Trong sự im lặng của cô ta lộ rõ ý chờ đợi không nói ra lời: Bao giờ thì vị khách không mời mà đến này đi cho và để cho cô được yên.

Trong phòng im ắng, chỉ có trên bếp cái ấm đun nước sắp sôi lên tiếng kêu xì xì. Visnhiakốp một lần nữa nhìn cái ấm đun nước, thở dài và thu dọn đường, bánh mì và mở cất trở lại vào túi đựng đồ, cô gái vẫn ngồi nguyên không ngẩng đầu lên. Bằng vào tất cả bộ dạng thì cô để hết tâm trí vào công việc khâu vá, nhưng Visnhiakốp nhận thấy là cô gái nhìn xuống mặt sàn. Vết giày ủng của anh in rõ trên những tấm ván sàn biết bao kỷ niệm đối với anh.

– Tôi mua việc cho cô rồi, - Visnhiakốp ân hận nói. - chùi đi chùi lại chân rồi đấy, vẫn cứ thế…

– Chuyện vặt. - Cô gái trả lời, nhưng lại cau mày khó chịu.

Visnhiakốp thu xếp và đứng dậy lên tiếng.

– Không dám phiên cô. Cám ơn cô.

Anh đã phật lòng, vì vậy mà lúc này càng tỏ ra lịch sự tợn.

– Không dám. - Cô gái đáp, giọng nhạt nhẽo.

Cô đứng lên để đồ khâu vá xuống và đi tiễn chân khách - cánh cửa vội vàng đóng lại ngay sau lưng khách.

Bước ra hiên cửa, Visnhiakốp cúi chào một cách kiểu cách rồi rảo bước đi ngang qua sân. Bên hàng rào, trẻ con đang chơi ở chỗ hè khô ráo tuyết đã được dọn sạch. Một em bé gái đội mũ kapô trắng và mặc áo bông thay cho áo lông cừu, chăm chú nhìn Visnhiakốp, bỗng kêu to lên và hối hả lao về phía anh:

– Chú ơi, chú đừng đi! Cháu biết chú!

Em bé gái cúi mặt vào tấm áo bađờxuy lính, ôm lấy chân Visnhiakốp, trong lòng Visnhiakốp lập tức cảm thấy vơi đi. Anh đưa tay gượng nhẹ vuốt mái đầu của em bé gái, sợ làm nhàu hay vấy bẩn cái mũ kapô của em.

– Cháu bé, làm sao mà cháu biết được chú nào?

– Thì chú chính là cái chú đã đi gỡ mìn. Chú quên rồi ư? Cháu với mẹ cháu cứ đứng mà đợi mãi. Sau đấy chú cho cháu đường… Chú quên rồi ư?

– Không, chú nhớ.

– Chị Luba, tìm thấy chú của chúng ta rồi! - Em bé gái kêu toáng lên, bíu những đầu ngón tay nhỏ xíu vào vạt áo bađờxuy lính: em bị vướng víu vì hai ống tay áo bông quá dài của mình. - Chú về nhà cháu đi, chú về nhà cháu! Mẹ cháu mà biết sẽ vui sướng phải biết.

Visnhiakốp ngoái lại liền nhận ra cô gái mặc áo săngđay đang đứng ở ngưỡng cửa: phải chăng suốt từ lúc ấy cô vẫn theo dõi anh hay nghe tiếng kêu mới vừa chạy ra. Anh kịp nhận ra là cô gái mặc áo săng đay rất giống em bé gái mặc áo bông này.

– Chú đã ghé nhà cháu rồi. - Visnhiakốp cố lựa giọng thật vui vẻ nói với em bé gái.

Nhưng em bé không chịu, cứ kéo anh về nhà.

– Đây chính là cái chú ấy! Chú gỡ mìn!

Anh cưỡng lại, nhưng không găng cho lắm và chẳng mấy chốc sau bối rối anh đứng mặt đối mặt với Luba, cô gái còn bối rối hơn anh. Cô gái với cái túi đựng đồ mà anh vẫn cầm tay và buồn phiền lên tiếng:

– Sao anh không nói ngay kia chứ? Bây giờ anh làm cho tôi phải đỏ mặt?

– Tôi lại làm bẩn sàn nhà mất…

– Gớm, anh nhớ dai thế. Thôi, xin anh thứ lỗi cho.

Luba kéo cái túi đựng đồ về phía mình, nhưng Visnhiakốp không chịu buông ra.

– Tôi làm sao biết được anh chính là chú ấy? - Cô gái nói dịu dàng, nhưng lập tức đến đây liền chuyển sang tấn công. - Mà cũng tại cả anh nữa kia! Phải, phải, tại anh! Anh về nhà mà cứ như gặp người xa lạ. Trẻ măng thế này mà kín đáo thế! Không tốt nhé. Anh có biết tội anh phải làm gì không nào?

– Không. - Visnhiakốp mỉm cười. - Tôi không biết. Chuyện gì kinh khủng không đấy?

– Phải phạt anh, thế đấy! Bây giờ tôi là tôi sẽ hôn anh thay cho mẹ tôi, cho Aliônuska và cho tôi. Bấy giờ anh mới biết thân! Nhưng thôi, anh đừng sợ, tôi tha! Lần đầu tôi tha cho anh…

Và Visnhiakốp còn chưa kịp đáp lại ra sao cô đã kiên quyết giằng lấy túi đựng đồ của anh, lấy cả cái mũ lông bịt tai anh bỏ ra cầm tay. Visnhiakốp đứng ngây ra giữa căn phòng và bối rối không biết xử trí ra sao, anh đưa tay vuốt chỏm tóc.

Gương mặt anh cởi mở, hơi gân guốc. Hợp với những gương mặt như vậy là cặp mắt sáng và cái mũi cong. Mũi Visnhiakốp lại thẳng hơi gồ lên, còn cặp mắt thì lại màu nâu sẫm.

Aliônuska nhanh nhảu lấy chiếc lược đưa cho chú bộ đội, rồi lát sau đã leo lên đùi chú và bắt đầu kể huyên thuyên về những sự cố gì đó xảy ra trong sân nhà. Chú bộ đội nghe em bé thật chăm chú như thể chú đến đây mục đích chỉ để biết đầy đủ mọi chi tiết về những con chó con trong sân nhà.

Aliônuska đưa ngón tay sờ vào cuống chiếc huân chương sao đỏ và nheo mắt khoái chí.

Trong chiến tranh, Visnhiakốp thường đã từng thấy những đứa trẻ có những gương mặt suy tư như mặt người lớn, với những cặp mắt nhăn nheo, những cặp môi bậm lại; những đứa trẻ ấy đã nhìn thấy trong đời nó quá nhiều điều khủng khiếp đến nỗi không còn biết khóc, khó còn có thể’ lấy gì mà dọa nạt chúng nữa. Còn Aliônuska vẫn giữ được cái ngây thơ quý giá của trẻ con, trong cặp mắt to xanh da trời của em lấp lánh vẻ tin cậy non dại.

Lát sau bà Anna Feđôrôvna ở trường học trở về. Bà nhìn thấy người khác, đứng sững lại hồi lâu bên cửa, ôm ghì bó vở học trò bên ngực.

– Đồng chí đấy ư? Trời! Thật sung sướng quá! - Anna Feđôrôvna thốt lên ngay từ ngưỡng cửa. - Nào, con người thân thương, anh lại đây cho tôi ôm hôn anh.

Visnhiakốp tiến lại, hai người ôm hôn nhau.

– Ấy vậy mà mẹ ạ, anh Vaxili Iakôvlevits không muốn chào hỏi con như vậy đấy! - Luba tươi cười nói. - May mà mẹ về kịp. Chớ con vừa làm phật ý khách.

Anna Feđôrôvna bắt đầu nhớ lại mẹ con bà bấy giờ suốt ngày trời đã ngồi trốn ở căn nhà hầm bên hàng xóm ra sao, rồi sau đó đã sung sướng như thế nào khi thấy căn nhà của mình còn nguyên vẹn. Nhưng có một người Hồng quân đã chặn hai mẹ con bà ở sân bằng một tiếng quát nghiêm khắc và thậm chí còn đưa cây gậy có gắn cái vòng sắt và một cái hộp nhỏ ở đầu ra đe nạt. Anh Hồng quân đã thận trọng vào nhà, mất hút trong đó khá lâu, đến khi bước ra hiên cửa cầm trên hai tay mỗi bên một cái đĩa sắt đen đen. Anh cẩu thả ném chúng xuống đất và nói:

– Bây giờ thì có thể vào nhà rồi. Chứ không thì hẳn là bà chủ với cháu đã uống một bữa trà no đừ cả đời…

Aliônuska khệ nệ kéo theo một cái túi đựng búp bê, gương to phải bằng người em, và chú bộ đội đã đưa giúp em cái túi vào nhà, khi ra đi lại chia cho em đường để em khỏi khóc.

– Thế mà không hiểu sao tôi cứ nghĩ là anh phải già hơn kia, Vaxili Iakôvlevits ạ. - Anna Feđôrôvna nói, đẩy đĩa khoai tây nghi ngút hơi về phía Visnhiakốp.

– Đấy là do hôm ấy mặt mày tôi ám khói với lại râu ria không cạo. - Visnhiakốp vội giải thích, như thể phân trần.

Sáng hôm sau, Visnhiakốp quyết định cùng với Aliônuska đi thăm thú thành phố. Trong thành phố chẳng có gì thay đổi kể từ ngày hôm qua, nhưng những đống đổ nát không còn đập vào mắt quá nhức nhối. Chỉ đến bây giờ Visnhiakốp mới nhận ra những dấu hiệu của một cuộc sống mới. Cuộc sống này đã trồi lên qua đổ nát, tro tàn, bụi bặm, như thể ngọn cỏ non xuyên qua mặt đá dăm.

Căn cứ vào những ngọn khói bay lên từ những ống khói thì biết là người ta đang phải sống trong các hầm chứa đồ của những nhà bị đốt cháy, đôi chỗ người ta sống trong những căn phòng của tầng một còn lại một cách thần tình của những tòa nhà bị tàn phá. Các mặt tủ hàng ở các cửa hiệu chất đầy gạch, những ô cửa sổ nhỏ bằng cửa thông hơi còn giữ được, và sau những ô cửa sổ nhỏ ấy cũng có người đang sinh sống. Ở trước một ngôi nhà không có người ở có treo một hòm thư; người đưa thư đi đến hòm thư ấy dốc thư vào túi thư.

Visnhiakốp đi ra bờ sông Đneprô và nhớ lại chuyện anh đã vượt con sông này trong cái đêm tháng chín ấy ra sao. Khi rút lui bọn phát xít đã giật tung đoạn giữa cầu và đốt cháy hai đầu cầu. Lửa lan theo các thanh gỗ, dầm cầu đến tận mặt nước ào ạt phía dưới đầu những ván hồng lay động. Khi lửa chạm đến mặt nước thì con sông dập tắt lửa ở các thanh dầm cầu, còn lúc đó có cảm giác như ai đó lao các cây đuốc ấy thẳng xuống mặt nước đen ngòm. Dầm, ván cầu bấy giờ cũng đỏ hồng, ánh hồng rung động xôn xao trên mặt nước màu đen, và cảm tưởng không phải dòng sông mà là dòng máu chảy.

Lúc này bên lối lên cầu là một cô nữ điều vận, người to béo nhưng nhanh nhẹn, hai má xanh xám. Mỗi khi xoay người, cô gái điệu bộ nện ủng trên mặt ván cầu và vung lá cờ vàng nhỏ một cách duyên dáng, làm cho Visnhiakốp nhìn ngây ra một lát.

Vaxili và Aliônuska đi qua cầu, rồi chen vào chợ. Anh mua một lọ mật ong và tình cờ mua lại được một cây bút chì xanh đỏ to tướng. Các thứ ấy tiêu mất cả ba tháng sinh hoạt phí của người lính, nhưng điều đó không làm Visnhiakốp băn khoăn vì anh chẳng cần gì tiền: thậm chí anh đã mất cả thói quen tiêu tiền, vì vậy anh thích thú tiêu hết số tiền tiết kiệm cho Aliônuska.

Khi đi sang qua đường, Visnhiakốp dắt tay em bé gái. Xe cộ qua lại thưa thớt nhưng anh thích thú được nắm những ngón tay nhỏ tin cậy và dịu dàng của bé Aliônuska, những ngón tay của bé tụt sâu trong ống tay áo bông. Bốn ngày sau Visnhiakốp mới lên đường trở lại đơn vị. Luba đi tiễn khách cho đến trạm kiểm soát ở ngoại ô, nơi anh em bộ đội chờ xe tiện đường.

Aliônuska cũng muốn đi tiễn chú bộ đội.

– Xa lắm, em sẽ mỏi chân. - Luba bảo.

Cuốc bộ đến tận trạm kiểm soát quả là xa thật nhưng ngoài ra, Luba còn muốn được chia tay với Visnhiakốp, riêng chỉ có hai người.

Ở trạm kiểm soát, hai người đứng với nhau khá lâu, cùng chờ xe, và mỗi người trong thâm tâm đều rất hài lòng là mãi vẫn không có xe.

– Thế anh đã ghi lại địa chỉ của nhà chưa? - Luba hỏi.

Visnhiakốp giật mình vỗ trán đánh bép.

– Tôi quên khuấy mất. Tìm thì tôi tìm ra, còn địa chỉ lại không ghi lại. Lần trước thì vẫn còn treo những cái biển chỉ dẫn của Đức, còn lần này thì tôi lại không để ý.

Luba sợ hãi vung hai tay lên và tự cô gái ghi địa chỉ nhà vào một mẩu giấy.

– Thôi bây giờ thì ta chia tay. - Luba lên tiếng, khi cuối cùng một chiếc xe tiện đường đã đến. - Thay cho mẹ em, cho Aliônuska còn đây là thay em.

Và hai người ôm hôn nhau ba lần.

Visnhiakốp nhảy lên bánh xe, nhẹ nhàng vượt qua thành xe, chiếc xe lập tức chuyển bánh, nhưng Luba còn kịp trao cho anh một bọc giấy. Visnhiakốp đã biết đó là bọc bánh rán nhân bắp cải.

Anh để ra hai chiếc bánh khi về đến đơn vị chia cho Tsutkô.

– Kiếm đâu ra món quà này thế?

– Người nhà tôi ở Xmôlenxcơ cho.

– Vậy mà cái thằng tôi tội lỗi lại cứ nghĩ quả thực là cậu chẳng còn ai thân thích. Mình nghĩ bụng là chẳng qua cậu hứng lên đi nên bịa ra.

– Từ cha sinh mẹ đẻ tôi có bịa bao giờ, vậy mà lần này bỗng nhiên…

– Thôi, cậu bỏ qua cho, nếu mình có làm cậu phật ý. - Tsutkô nói, nhai nốt miếng bánh rán.

– Ấy đấy. - Visnhiakốp xuê xoa nói.

Từ bữa ấy anh bắt đầu chờ đợi chiến sĩ đưa thư, cái điều mà trước đây anh không hê bận tâm, chẳng bao lâu thư của Luba gởi tới. Cũng trong phong thư ấy Aliônuska gởi vào cả một bức vẽ của mình - căn nhà màu đỏ với những cửa sổ xiêu vẹo cao lên tận mái nhà, một làn khói xanh kỳ dị bay lên từ cái ống khói màu đỏ.

– Còn đây là công trình của ai thế này? - Tsutkô tò mò hỏi ngó qua vai Visnhiakốp.

– Con gái tôi, Aliônuska gởi đến đấy. - Visnhiakốp nói bịa, mủm mỉm cười.

– Thế mà mình không biết là cậu lại có cả con gái nhỏ đấy. Cháu mấy tuổi rồi?

– Bảy.

– Thế kia ư! Sắp có rể rồi. Vậy mà mình không nghĩ là cậu lại có con gái lớn đến thế. Mặc dù cái thằng tội nợ như mình cũng lấy vợ sớm.

Visnhiakốp cẩn thận giữ gìn tờ giấy mà Luba đã ghi địa chỉ. Thật ra thì, tờ giấy ấy đã nhòe phai hết đến mức không còn đọc ra tên phố cũng như số nhà. Nhưng điều ấy chẳng có ý nghĩa gì, bởi vì Visnhiakốp đã nhớ thuộc lòng địa chỉ ấy và biết rõ đường phố ấy ở đâu, ở đâu căn nhà nhỏ bên cây liễu ấy, căn nhà thân yêu, ở đó bây giờ là niềm mơ ước của người lính về gia đình, về hạnh phúc khi được đưa những bước chân nhẹ bổng lâng lâng dạo trên những tấm ván sàn ọp ẹp…', N'Đâu Đường Phố Ấy, Đâu Căn Nhà Ấy', N'dau-duong-pho-ay-dau-can-nha-ay')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 8, N'Tôi có thể cam đoan rằng chưa bao giờ được nghe nói đến phi công Prexnhiakốp. Nhưng gương mặt của anh trên tấm ảnh này tôi lại thấy rất quen thuộc.

Anh chụp ngay sau chuyến bay. Anh đội mũ chụp kính trong đó có thể thở được ở nơi không còn không khí. Mặc bộ trang phục này, trông anh giống người thợ lặn hơn là phi công.

Đại úy Prexnhiakốp người tầm thước. Nhưng điều này khó nhận ra ngay trên ảnh, bởi vì ảnh chụp có nửa người. Nhưng lại có thể nhận thấy ngay đôi gò má rộng, cả cặp mắt đen, hai hàng lông mày không đều đặn, cả đường trũng phía trên môi trên, cả vết sẹo trên trán. Mà có thể đó không phải là vết sẹo, mà là một món tóc, dính bết xuống trán trong chuyến bay gian khổ?

Bức ảnh là sở hữu của Vôlốtka Prexnhiakốp và được treo trên đầu giường của chú bé. Mỗi khi có khách mới đến nhà, Vôlốtka thường dẫn người đó đến dưới tấm ảnh và bảo:

– Ba cháu.

Chú nói điều đó như thể quả thực chú giới thiệu khách với người cha của mình.

Vôlốtka hiện sống ở Mátxcơva, ở phố nhỏ, chòi gác rơm rạ. Tất nhiên ở đường phố của Vôlốtka chẳng có chòi gác nào, hơn thế nữa lại là chòi gác rơm rạ. Chung quanh chỉ là những dãy nhà mới đồ sộ. Chòi gác rơm rạ ở vào thời vua Piôtr đệ nhất kia, ở đây quả có một chòi gác. Không hiểu bấy giờ các chòi gác ấy đặt ở chỗ nào nhỉ. Gần “cửa hàng thực phẩm” hay ở góc phố bên cạnh quỹ tiết kiệm ngày nay. Và tên người gác ấy là gì nhỉ, bác người gác mà trong đêm mưa gió, bão tuyết thỉnh thoảng chạy về căn chòi ấm áp một lúc để lấy lại hơi sức và sưởi bên ngọn lửa đôi bàn tay lạnh cứng vì băng giá? Chỉ chạy về nán lại lấy một chút thôi. Người gác trong khi thừa hành phận sự không được quẩn quanh trong căn chòi ấm áp.

Dưới cửa sổ ngôi nhà Vôlốtka suốt ngày đêm xình xịch tiếng xe tải tự động… Ở gần đây có công trường xây dựng nhưng Vôlốtka quen với tiếng động cơ ầm ĩ rồi, vì thế chú không để ý gì tới tiếng động ấy. Thế nhưng không chiếc máy bay nào bay qua trên đầu chú mà chú lại bỏ qua. Nghe tiếng động cơ ở trên cao, chú thảng thốt rồi chăm chú nghe ngóng, cặp mắt xáo động của chú vội nhìn lên tìm kiếm đôi cánh bạc nhỏ xíu của chiếc máy bay trên bầu trời. Cũng phải nói thêm là, thậm chí không nhìn lên trời, chú cũng có thể xác định được chiếc máy bay đang bay đó là máy bay gì: máy bay bình thường hay máy bay phản lực - và chiếc máy bay ấy có bao nhiêu “con trượt”. Được như vậy là bởi vì từ bé chú đã quen với đủ loại máy bay.

Khi Vôlốtka còn bé tí, chú sống ở rất xa, rất xa Mátxcơva. Trong một thị trấn thành phố, cũng như con người ta có cả những thị trấn thành phố quân sự mà.

Vôlốtka ra đời ở thị trấn này và chú đã sống ở đó hẳn nửa số năm đã sống của mình. Con người không có thể nhớ được anh ta đã biết đi như thế nào và biết nói được từ đầu tiên ra sao, ấy vậy nhưng nếu anh ta đã ngã và giập đầu gối, thì anh ta ghi nhớ. Nhưng thuở nhỏ Vôlốtka không bị ngã và cũng không giập đầu gối và trên lông mày của chú không để lại vết sẹo, bởi vì cả lông mày chú cũng không bao giờ để ngã sứt. Và nói chung là chú chẳng nhớ gì hết.

Chú không nhớ chuyện, mỗi khi nghe tiếng động cơ, chú lại mở to cặp mắt xanh lam hơi lồi ra tìm kiếm cái gì đó trên bầu trời. Và chuyện chú đưa tay với: chú muốn tóm bắt chiếc máy bay. Cánh tay chú bấy giờ mập mạp, có ngấn ở cổ tay. Cứ như thể có người nào đó đã lấy bút chì đen khoanh dấu ở chỗ ấy.

Khi Vôlốtka còn bé tí tèo teo, chú chỉ biết đòi không thôi. Rồi đến khi lớn hơn một chút - chừng ba bốn tuổi - chú bắt đầu hỏi. Chú hỏi mẹ chú những câu hỏi bất ngờ nhất, và có cả những câu hỏi mà mẹ chú không thể trả lời được.

– Tại sao máy bay ở trên bầu trời không bị rơi xuống? Tại sao bên ta dấu hiệu là ngôi sao, mà bên phát xít lại là dấu thập ngoặc?

Vôlốtka sống với mẹ. Chú không có bố và thoạt đầu chú cho rằng chính như vậy mới phải. Và nói chung chú chẳng hề lo nghĩ gì về chuyện không có bố. Chú cũng chẳng hề hỏi han về bố, bởi vì chú không biết rằng lệ thường chú phải có bố. Nhưng một lần chú đã hỏi mẹ chú:

– Ba con đâu?

Chú nghĩ rằng mẹ chú có thể trả lời một cách dễ dàng và đơn giản câu hỏi ấy. Nhưng mẹ chú lặng im. “Cứ để cho mẹ nghĩ đã”, Vôlốtka quyết định như vậy và chờ đợi. Nhưng mẹ chú thế là không trả lời gì cho câu hỏi của chú.

Điều đó không làm cho Vôlốtka buồn rầu cho lắm, bởi vì nhiều câu hỏi khác mẹ cũng không trả lời mà.

Vôlốtka không hỏi mẹ thêm về câu hỏi này nữa. Một khi mẹ đã không thể’ trả lời được, thì hỏi làm gì, nhưng bản thân chú không dễ dàng quên câu hỏi này như đã dễ dàng quên liền nhiều câu hỏi khác. Chú cần phải có bố, vì thế cứ đợi chờ khi nào đó bố chú tự xuất hiện.

Kể cũng lạ, Vôlốtka đã biết đợi chờ. Chú không đi lung tung mọi chỗ để tìm bố và không đòi mẹ phải đi tìm ra người bố không thể nào tìm ra được ấy cho chú. Chú chỉ đợi chờ, nếu như một đứa trẻ phải có bố thì sớm hay muộn cũng tìm ra bố.

“Không hiểu ba sẽ xuất hiện như thế nào nhỉ? - Vôlốtka thầm nghĩ. - Đi bộ đến hay đi ô tô buýt đến?

Không, ba sẽ đi máy bay đến bởi vì ba là phi công cơ mà? Trong thị trấn quân sự, bố của những đứa trẻ khác đều là phi công cả”.

Mỗi khi đi dạo chơi với mẹ, chú chăm chú quan sát những người đàn ông gặp trên đường. Chú cố đoán xem trong số họ ai giống bố mình.

“Bác này người dài quá, - Chú nghĩ khi nhìn một thiếu úy cao dỏng. - ba mà như thế này thì khó mà leo được lên lưng. Và tại sao bác ấy không có ria? Ba thì thế nào cũng phải để ria. Chỉ có điều không giống như ria của bác bán hàng ở cửa hàng bánh mì. Ria bác ấy màu hung. Mà ria của ba phải là màu đen kia…”.

Càng ngày Vôlốtka càng sốt ruột chờ đợi việc bố về hơn. Nhưng bố chú không ở đâu về cả. Hóa ra bố chú sống ngay bên cạnh.

– Mẹ ơi, mẹ làm cho con một con tàu. - Một hôm Vôlốtka bảo mẹ chú và đưa cho mẹ một mảnh gỗ.

Mẹ chú nhìn con một cách bất lực, tựa hồ đứa trẻ vừa hỏi chị một trong những câu hỏi mà chị không sao trả lời nổi. Nhưng sau đó ánh mắt chị lóe lên niêm quyết tâm. Chị nhận lấy mảnh gỗ ở tay đứa con, lấy con dao to làm thức ăn và bắt đầu gọt đẽo gỗ. Con dao không tuân theo sự điều khiển của mẹ Vôlốtka: nó lạng đi không như ý mẹ chú muốn, mà tùy theo hứng của nó - hết xiên rồi lại vẹo. Sau đó con dao trượt đi và cắt vào ngón tay mẹ. Máu chảy ra. Mẹ ném mảnh gỗ gọt đẽo dở dang sang bên cạnh và bảo con:

– Tốt hơn là mẹ sẽ mua cho con một con tàu nhỏ.

Nhưng Vôlốtka lắc đầu.

– Con “ứ” thích tàu thủy mẹ mua. - Nó nói và nhặt mảnh gỗ ở sàn lên.

Bạn bè của nó có những con tàu nhỏ rất đẹp. Có cả ống khói, cả cánh buồm. Còn Vôlốtka chỉ có một mảnh gỗ nham nhở đẽo gọt dở dang.

Nhưng chính cái mảnh gỗ kỳ cục được gọi là con tàu ấy lại đã đóng một vai trò rất quan trọng trong số phận của Vôlốtka. Nó đã giúp cho Vôlốtka tìm ra người bố.

Một lần Vôlốtka đi lại thơ thẩn ở hành lang trước căn hộ, tay cầm con tàu - mảnh gỗ, và chạm trán với bác hàng xóm Xécgây Ivanôvits. Bác hàng xóm là phi công. Suốt ngày này sang ngày khác, bác ấy bận công việc ngoài sân bay. Còn Vôlốtka thì “bận” ở trường mẫu giáo. Vì thế mà chú bé và người phi công không gặp nhau và hầu như không biết nhau.

– A, chào người anh em! - Xécgây Ivanôvits thấy Vôlốtka ở hành lang, liền lên tiếng chào.

Vôlốtka ngẩng đầu lên và chăm chú nhìn người hàng xóm. Bác ta mặc sơ mi trắng, còn quần dài và giày ủng của bác ta là quần dài và giày ủng của quân đội. Chiếc khăn mặt vắt vai.

– Xin chào! - Vôlốtka đáp lại.

Đối với mọi người, cả người lớn lẫn trẻ con, Vôlốtka đều xưng hô cộc lốc như vậy.

– Tại sao người anh em thơ thẩn một mình ở hành lang thế này? - Bác hàng xóm hỏi.

– Chơi!

– Sao người anh em không ra ngoài trời?

– Không được phép. Bị ho.

– Hẳn là tại đi giày không có bọc cao su sục vào vũng nước chứ gì?

– Không. Cháu ăn tuyết.

– Rõ.

Đến cuối câu chuyện xảy ra ở hành lang mờ mờ tối, bác hàng xóm nhận thấy mảnh gỗ trên tay Vôlốtka.

– Người anh em có cái gì ở tay thế?

– Con tàu nhỏ.

– Đây mà là con tàu ư? Đây là mảnh gỗ chứ đâu phải tàu bè gì. - Bác hàng xóm nói và đưa ra một ý kiến. - Để đây làm cho người anh em một con tàu nhỏ bé.

– Nhưng đừng có làm hỏng gỗ đấy. - Vôlốtka đe trước và đưa cho bác hàng xóm mảnh gỗ.

– Thế tên người anh em là gì nhỉ? - Vừa xem xét mảnh gỗ, bác hàng xóm vừa nhân tiện hỏi chú bé.

– Vôlôđia.

– Vôlốtka hả?

Vôlốtka hay đấy. Mẹ vẫn gọi chú là Vôlôdenka, vậy mà ở đây lại là Vôlốtka. Hay lắm.

Trong lúc Vôlốtka ngẫm nghĩ về cái tên gọi mới của mình, thì bác hàng xóm đã lấy ở túi ra một con dao gấp và khéo léo bắt đầu gọt mảnh gỗ.

Đấy mới là một con tàu - một chiến hạm tuyệt vời làm sao! Cân đối, nhẵn nhụi, có ống khói ở giữa, có súng đại bác ở mũi. Đặt xuống sàn, tàu không đứng được mà đổ ềnh sang bên. Nhưng ở ngoài các vũng nước nó lại cảm thấy thật vững vàng, không có sóng nước nào lật đổ được nó. Bạn bè của Vôlốtka ngồi xổm háo hức nhìn xem con tàu. Đứa nào cũng muốn sờ mó một tí. Giật sợi dây kéo một lần, Vôlốtka hoan hỉ.

– Đừng có làm bắn nước! - Chú quát một thằng bạn, làm như thể con tàu phải kỵ nước không bằng.

– Đừng có kéo thế, lật tàu mất! - Chú nghiêm nghị đe một đứa bạn khác, mặc dù con tàu của chú là một con tàu vững chãi bậc nhất của hạm đội khu nhà.

– Ai làm cho cậu con tàu này thế? - Một đứa bạn hỏi Vôlốtka.

Vôlốtka ắng lặng. Sau đó hít thật nhiều không khí và mạnh bạo tuyên bố:

– Ba tớ!

– Nói láo! - Thằng bạn bảo nó. - Mày làm gì có ba!

– Không, có chứ! Có chứ! - Vôlốtka trả lời một cách kiên quyết. - Ba tớ không chỉ làm cho tớ cái này thôi đâu.

* * *

Tối hôm ấy mẹ nhận ra đồ chơi mới của Vôlốtka. Chị cầm con tàu nhỏ dưới sàn lên, chăm chú xem xét và hỏi:

– Con lấy ở đâu ra thế này?

– Ba làm cho con. - Vôlốtka trả lời.

– Ba nào? - Mẹ chú ngạc nhiên nhíu cặp lông mày. - Ba nào kia? Con không có ba…

Những lời cuối cùng người mẹ khó khăn lắm mới nói ra được, nhưng câu nói của mẹ không làm cho Vôlốtka buồn rầu chút nào hết. Chú bé cãi lộn:

– Sao lại không có ba nhỉ. Có! Thì đến bọn con gái cũng có ba nữa là con là con trai.

Mẹ chú đành thôi không tranh cãi. Cặp mắt to bướng bỉnh của đứa con trai đang nhìn chị. Trong đó chứa chất bao nhiêu quyết tâm và nỗi tuyệt vọng làm cho chị phải nín lặng. Chị hiểu rằng trong đứa con trai nhỏ đã xuất hiện tính cách, rằng nó không chịu dễ dàng rút lui khỏi cái mà đáng là phần của nó, cái mà được chính bản chất thiên nhiên xác định.

Người mẹ cụp mắt nhìn xuống và bỏ đi. Còn nó vẫn không rời khỏi chỗ đứng, con người bé nhỏ ấy, con người đang sẵn sàng tự vệ. Nó ôm chặt con tàu nhỏ của mình vào ngực, như thể có kẻ nào đó định cướp mất của nó báu vật này.

Xécgây Ivanôvits không hề ngờ rằng con tàu thủy nhỏ bé lại có thể làm được chuyện gì đó với người hàng xóm bé nhỏ. Và tất nhiên là anh không thể lại nghĩ rằng trong cuộc đi tìm bố mình, Vôlốtka lại chọn chính anh.

Ở trường mẫu giáo về, Vôlốtka hỏi mẹ:

– Ba có nhà không?

Người mẹ không trả lời gì hết. Khi đó, lựa thời cơ chú lẻn ra hành lang và đi đến trước cửa phòng bác hàng xóm. Chú lấy vai đẩy cửa. Cửa không mở, bố không có nhà.

Vôlốtka không nản lòng. Bố không có nhà thì có gì ghê gớm chứ! Quan trọng là có bố.

Dần dần ở Vôlốtka hình thành một quan niệm của mình về “ba”. “Ba” của chú sống ở căn phòng khác, ăn ở nhà ăn công cộng và tự mình đặt nước trà cho mình uống. Và nếu như “ba” bị đứt cúc áo thì “ba” tự khâu lấy. Và “ba” không phải xin phép ai khi “ba” ra đi cũng như khi “ba” trở về, Vôlốtka cho rằng “ba” phải đúng như vậy.

Tình cờ một lần Vôlốtka bị ốm khá nặng. Lần ấy chú ăn quá nhiều tuyết và thế là chú bị sốt nóng. Chú nằm trên giường và người nóng rừng rực. Chú có cảm giác rằng giường chú đang đặt trên lửa và lửa đang cháy gối, chăn, áo chú. Và người ta phải luôn luôn cặp nhiệt độ cho chú bởi vì sợ rằng không khéo thì cả chú cũng bị cháy sạch mất. Vôlốtka không rên rỉ, không than thở, không đòi mẹ. Chú can đảm chịu đựng cơn bệnh. Chú hít mạnh. Đôi lúc chú phát ho, và khi ấy, trong ngực chú có một quả cầu òng ọc xù xì lăn qua lăn lại.

Suốt ngày bà cụ ở căn hộ bên cạnh sang ngồi bên giường Vôlốtka. Bà cụ muốn cho Vôlốtka ngủ, vì thế bà cụ kể chuyện cổ tích. Cuối cùng thì Vôlốtka không ngủ mà chính bà cụ lại ngủ thiếp đi.

Buổi tối khi mẹ đi làm về, bà cụ sẵn sàng đứng dậy và bỏ về phòng của mình.

Có mẹ ở nhà vui hơn nhiều. Mẹ đi lại, mang cái gì đó vào, đưa cái gì đó ra, đánh rơi xuống sàn nhà. Làm cho Vôlốtka phát ngán, hết cho chú uống thuốc, lại uống thuốc, lại uống nước quả ép chua chua. Mẹ đặt bàn tay mát lạnh lên trán Vôlốtka. Việc đó thì thích đấy. Mẹ lật “mặt lạnh” của gối lên - việc đó cũng thích. Chỉ có điều đáng tiếc là mặt gối chẳng mấy lúc lại nóng ran lên.

Mẹ cứ luôn luôn hỏi:

– Con có đau đầu không? Con muốn ăn gì? Con thích gì?

Nhưng Vôlốtka chẳng muốn gì cả. Chú không biết rằng do tuyết lạnh mà lại nóng như thế này và nôn nao quá. Chú im lặng.

Nhưng đột nhiên chú bé bảo:

– Mẹ ơi, mẹ gọi ba cho con.

Người mẹ quay ra cửa sổ. Chị làm ra bộ không nghe thấy lời đề nghị của đứa con. Chị hy vọng rằng nó sẽ quên điều đề nghị ấy.

Nhưng, chờ đợi một lát Vôlốtka nhắc lại:

– Mẹ gọi ba cho con.

Người mẹ đứng ngây ra bất động. Chị đứng xoay lưng về phía con, và đứa bé không nhận thấy bộ mặt của chị trở nên bất lực như thế nào, còn đôi mắt chị ứa tràn lệ. Chị có thể làm nhiều việc cho đứa con trai. Tặng cho nó thứ đồ chơi đắt tiền, mua cho nó món quà thật ngon. Có thể vì nó mà làm lụng suốt từ sáng đến tối khuya. Có thể’ truyền cho nó máu của mình, cuộc đời mình. Nhưng chị biết lấy đâu ra người bố cho nó? Lấy đâu ra, một khi Vôlốtka quả thực không có bố?

Nhưng Vôlốtka chờ đợi chị đi gọi “ba” và chị đã bước đi. Chị đi ra hành lang và chậm chạp đi đến cửa phòng người hàng xóm. Chị đến gặp một người xa lạ để đề nghị người ấy trở thành “ba” của đứa con chị trong chốc lát.

Nén hết nỗi sỉ nhục và hổ thẹn, chị gõ cửa phòng người hàng xóm.

– Xin mời! - Có tiếng đáp lại ở bên trong.

Người mẹ có cảm giác giọng trả lời gay gắt và thiếu niềm nở. Và vì thế mà chị thấy càng khó khăn hơn. Nhưng dù sao đi nữa chị vẫn đẩy cửa vào.

Người hàng xóm đang ngồi sau bàn và uống nước trà. Chắc hẳn là anh vừa trở về, bởi vì anh vẫn còn đi giày ủng và mặc áo sơ mi màu xanh ngụy trang, cổ thắt cà vạt màu đen. Anh vừa uống nước trà vừa đọc báo. Khi người mẹ mở cửa, anh ngước mắt ngạc nhiên nhìn và đứng dậy, tay vẫn không rời tờ báo và cốc nước. Anh không đưa ghế ra mời khách và thậm chí cũng không mời khách vào phòng. Người đàn bà đứng sững lại bên ngưỡng cửa.

– Xécgây Ivanôvits, - Người mẹ lên tiếng và giọng của chị run lên, dường như có gì đó bị tan vỡ. - Xécgây Ivanôvits, cháu nó gọi đồng chí là bố. Tôi cũng không biết tại sao đầu óc cháu lại nảy ra cái chuyện đó… Cháu nó còn nhỏ lại ngốc nghếch…

Người mẹ nói, còn người hàng xóm bối rối nhìn chị và gật đầu. Có cảm giác chuyện đang nói không phải về anh mà về một người nào khác. Anh vẫn chưa hiểu người ta cần gì ở anh.

– Mà hiện nay, - Người mẹ nói tiếp. - cháu đang ốm. Và cháu gọi đồng chí.

Người mẹ im lặng cúi đầu. Chị chờ đợi xem người hàng xóm sẽ trả lời chị thế nào. Còn người hàng xóm chẳng nói chẳng rằng. Nhưng anh bỗng cuống quýt tất bật: đặt cái cốc nước trà xuống bàn, ném tờ báo xuống chiếc đi văng, và không hiểu tại sao lại khoác lên người chiếc áo quân phục.

– Tôi sang ngay đây. - Anh lúng búng nói.

Tại sao anh cần phải mặc thêm chiếc áo quân phục có quân hàm chỉnh tề, có phải cấp trên gọi đâu kia chứ.

Anh đi theo người mẹ.

Thận trọng, dường như sợ làm kinh động, anh đi đến bên chiếc giường con của Vôlốtka và cúi xuống, sẽ hỏi:

– Người anh em ốm đấy à?

Vôlốtka gật đầu. Cặp mắt đau ốm của chú sung sướng sáng lên. Chú chống khuỷu tay nhổm dậy và hỏi:

– Ba bay cao chứ?

– Cao, người anh em ạ. - “Ba” trả lời.

– Cao hơn cả Xaprunốp ư?

Người hàng xóm nhếch miệng cười:

– A, hóa ra người anh em biết Xaprunốp ư? Quen anh ta hả?

Vôlốtka lắc đầu. Chú không quen biết người phi công lừng danh của thị trấn quân sự. Chú mới chỉ được nghe về người ấy.

– Đây hiện còn chưa bay cao hơn Xaprunốp, - Người hàng xóm thú nhận. - nhưng cũng ít nhiều cào gãy bầu trời.

Vôlốtka tưởng tượng ra “ba” lấy móng tay cào gãy bầu trời. Và chú bé liếc nhìn bàn tay người phi công, móng tay của người phi công cắt ngắn. “Móng tay thế này thì khó mà cào gãy bầu trời được”, - Vôlốtka nghĩ thầm.

Từ lúc Xécgây Ivanôvits tới, chú bé tỉnh táo hẳn ra. Hẳn là, khi có bố bên cạnh thì chẳng có bệnh tình nào đáng sợ hết. Người mẹ đi sang căn bếp. Và còn lại có hai người: đứa con trai và “bố” nó.

Xécgây Ivanôvits vốn là người độc thân, anh chưa bao giờ có gia đình riêng, chưa bao giờ có con cái. Và anh đối với trẻ con không phải với thái độ khó chịu của một kẻ độc thân mải mê công việc, mà như thể người ta đối với một vật quý của người khác mỏng manh rất dễ vỡ: bao giờ họ cũng cầm lên tay thật nhẹ, cố gắng sao để không vô ý đánh rơi. Nhưng với Vôlốtka, anh đối xử một cách mạnh bạo. Anh đặt tay lên trán rồi xoay người chú bé đặt nằm sang phía khác, thậm chí anh còn định kể chuyện cổ tích.

Chuyện cổ tích của anh thành ra chuyện truyền thuyết: về máy bay, người thợ máy và vị tướng…

Một tình cảm mới mẻ, chưa từng biết rụt rè len vào trái tim nghiêm khắc của một con người chỉ quen tiếp xúc với binh sĩ và máy móc.

Nhìn chú bé Vôlốtka bé bỏng đang hừng hực trong cơn sốt nóng, anh bỗng nhận ra mình sẵn sàng ốm thay cho chú bé: đối với anh thì có gì đáng kể, nhưng với chú bé thì cực quá.

Lúc đó đã muộn rồi, người hàng xóm sửa soạn ra về. Nhưng Vôlốtka chộp lấy tay anh:

– Ba, ba đừng đi!

Chú bé nắm lấy tay Xécgây Ivanôvits, tựa hồ bàn tay đàn ông khỏe mạnh này chính là cuộc sống của chú, và nếu thiếu nó thì chung quanh sẽ mất hết ý nghĩa.

– Ờ, đây không bỏ đi đâu, - Xécgây Ivanôvits bối rối nói. - nhưng người anh em ngủ đi.

Nhưng Vôlốtka lại sợ ngủ thiếp đi mất, mặc dù mắt chú đã ríu lại. “Mình mà ngủ là ba đi mất” - chú bé nghĩ vậy và gắng sức mở to đôi mắt. Còn môi chú se sẽ thì thào:

– Ba đừng đi… Con sẽ không ăn tuyết nữa. Cả hàng rào con cũng sẽ không bao giờ trèo lên nữa… Cả xúp con cũng sẽ ăn hết… Ba không đi chứ? Hả ba?

Và mơ mơ màng màng chú nghe thấy giọng nói bình tĩnh của Xécgây Ivanôvits:

– ừ, không đi, không đi đâu.

Cuối cùng Vôlốtka thiếp ngủ mất. Chú thiếp ngủ, tay vẫn không rời bàn tay của “ba”.

Vào những ngày hiếm hoi khi Vôlốtka bắt gặp “bố” ở nhà, chú cố gắng làm sao được ở bên “bố” thật lâu. Và Xécgây Ivanôvits với một sự chịu đựng kiên nhẫn đã thỏa mãn mọi điều ước muốn của đứa “con trai” mới xuất hiện của mình.

– Này. - Vôlốtka bảo (bao giờ chú cũng nói với Xécgây Ivanôvits: “này”). - Này, cho con nhong nhong đi.

– Gì kia?

– Cho con nhong nhong. - Vôlốtka thản nhiên nhắc lại và bắt đầu leo lên vai Xécgây Ivanôvits.

Và người hàng xóm ngoan ngoãn để chú bé ngồi lên hai vai. Sau đó, cảm thấy “kỵ sĩ” đã ngồi chắc chắn, anh bắt đầu đi quanh phòng.

– Phi nhanh! - “Kỵ sĩ” ra lệnh và đưa hai tay ôm chặt lấy cổ “con ngựa” của mình.

Sau đó Vôlốtka đề nghị:

– Ba đến đón con ở mẫu giáo. Thứ bảy các ba đều đón bạn con.

Xécgây Ivanôvits đưa tay gãi đầu, tuy nhiên anh cũng hứa sẽ đến đón Vôlốtka và anh đã giữ lời hứa.

Một chiều cô bảo mẫu vào căn phòng nơi Vôlốtka đang chơi với các bạn và gọi to:

– Prenhiakốp, bố đến đón cháu kìa.

Vôlốtka đỏ mặt lên vì sung sướng và lao ra cửa như một đường đạn. Ở đây “bố” đang ngồi trên ghế đi văng. “Bố” mặc áo capốt, còn chiếc mũ kêpi có hình “cái bắp cải” mạ vàng đặt trên đùi. Dáng điệu của “bố” rất trang trọng và hoan hỉ. Vôlốtka chạy đến và kéo tay “bố”, còn “bố” thì co lại. “Bố” cảm thấy lúng túng vụng về giữa những chiếc bàn ghế con con và những cái mắc áo treo những chiếc áo măng tô ngắn ngủn.

Rồi sau đó hai người đi bên nhau trên đường phố của thị trấn quân sự, và Vôlốtka bíu chặt tay “bố”. Chú bé cố bước những bước thật dài để không tụt lại sau “bố”. Và luôn luôn chú nhìn ngang nhìn ngửa. Chú muốn sao các bạn và người quen của chú nhìn thấy: chú đang đi với “bố”. Sau đó thì sẽ không thể còn một kẻ nào dám bảo: “Nói láo, mày không có bố”!

Nhiều người quen biết Xécgây Ivanôvits, và khi gặp nhau trên đường họ đều gật đầu hoặc đưa tay lên mũ chào anh. Điều đó cũng làm cho Vôlốtka thích thú.

Một phi công quen biết hỏi sau khi chào Xécgây Ivanôvits:

– Con trai hả?

Xécgây Ivanôvits im lặng, nhưng sau đó từ trên cao ngó nhìn Vôlốtka, anh trả lời:

– Con trai.

Anh nói câu đó như thách thức, làm như thể người phi công quen vừa hỏi anh có ý châm chọc, còn anh thì trả miếng lại vậy.

Nhưng Vôlốtka không chú ý đến thái độ “bố” trả lời thế nào. Hai người bước đi tiếp, và Vôlốtka thấy thật sung sướng.

* * *

Trường mẫu giáo nằm sát rìa thị trấn quân sự. Sau hàng rào thấp đủ màu sắc bắt đầu là thảo nguyên. Mùa đông tuyết phủ kín và không trông thấy hàng rào đâu. Mùa hè cỏ thảo nguyên mọc lút các cọc rào.

Còn ở giữa thảo nguyên là sân bay. Cái sân bay thức suốt ngày đêm, náo động, sống cuộc sống quyến rũ nhưng nguy hiểm của mình.

Từ đó những chiếc máy bay màu bạc với những đôi cánh xuôi về phía sau như hai cánh tay để ở tư thế sắp nhảy lao lên bầu trời. Có cảm giác ở dưới mặt đất những chiếc máy bay đó không có gì để thở, vì thế chúng sung sướng gầm rít lao vào bầu trời xanh thăm thẳm, nơi có thể hít thở căng lồng ngực vậy. Rồi khi những bàn tay dũng cảm của người phi công đưa máy bay lên rất cao, trên trời chỉ còn in một vệt màu trắng, tươi mát, ở dưới đất chỗ nào cũng nhìn thấy rõ.

Có lần cao tít trên đầu bỗng vang lên một tiếng nổ chói chát. Người mới ở nơi khác đến giật mình, đưa mắt tìm kiếm dấu vết vụ nổ ở trên không… Nhưng dân của thị trấn quân sự vẫn bình thản như thường. Họ biết rằng chẳng có vụ nổ nào hết. Chẳng qua ở tầng cao tít tắp mắt người không nhìn thấu, một trong những máy bay màu bạc vừa vượt qua cái giới hạn thanh âm và tăng tốc nhanh hơn tiếng động. Đó không phải là vụ nổ, mà là một cú giáng của đôi cánh hùng mạnh.

Các máy bay đi và lại trở về sân bay tiễn đưa và chờ đón.

Và ngày lại ngày cứ như vậy.

Khi xảy ra chuyện kia thì tại trường mẫu giáo đang giờ nghỉ trưa, các cháu đang ngủ. Và Vôlốtka cũng đang ngủ ngon lành, bởi vì tiếng rít của các máy bay chiến đấu không cản trở giấc ngủ của con trai người phi công.

Vôlốtka ngủ, còn lúc đó Xécgây Ivanôvits ở trên trời.

Anh đã lên tới tầng cao thẳm, nơi bầu trời đã không còn là màu xanh lam, mà tối mù, và người ta bảo, ngay ban ngày cũng nhìn thấy rõ các vì sao. Ở đó bầu trời không còn thuộc trái đất, và ở đó con người của trái đất không có gì để thở. Anh phải thở bằng ôxi mang theo. Và cả máy móc ở đấy cũng hoạt động không dễ dàng gì, nó cũng thiếu không khí: đôi cánh của nó mất điểm tựa.

Khi anh thực hiện những động tác điều khiển máy bay, thân thể’ của anh trở nên nặng nề. Khó có thể’ nhắc tay lên được. Hai mắt trĩu xuống như bị đổ chì. Anh có cảm giác máy bay bắt người lái tuân theo ý nó và nó quyết định không trở về mặt đất nữa.

Những tiếng nói mặt đất hạ lệnh:

– Hạ thấp!

Và bầu trời đã trả lời mặt đất:

– Tôi đã hiểu mệnh lệnh.

Quỷ thật, máy bay chỉ huy người lái!

Bằng những động tác không vội vàng, người phi công đẩy cần điều khiển ra xa và giảm vòng động cơ, và chiếc máy bay như đã bị chế ngự, ngoan ngoãn quay khỏi các vì sao trở về trái đất.

Một giọt mồ hôi nhỏ ra trên trán anh và anh không thể nào lấy bàn tay mà lau đi bởi vì rằng gương mặt anh ẩn sau mặt kính trong của chiếc mũ bảo hiểm trùm kín. Anh nghĩ bụng khi nào xuống tới đất, thế nào anh cũng phải lau ngay giọt nước khó chịu này. Những chiếc kim đồng hồ máy móc sẽ rung rinh, muốn bảo rằng chúng đâu có ngủ im. Trái đất gần lại.

Và đến đây đột nhiên đèn đỏ báo động lóe lên - Tín hiệu cháy.

Anh lập tức quên khuấy ngay về giọt mồ hôi. Anh bắt đầu kiểm tra, liệu cái “gã thần kinh” (anh em phi công thường gọi đùa cái tín hiệu cháy, thường hay báo động hão) có láo lếu không đấy. Nhưng lần này “gã thần kinh” không nhầm. Người phi công tắt động cơ đang cháy và báo cáo cho mặt đất:

– Động cơ phải bị cháy.

– Đồng chí thử dập lửa! - Mặt đất hạ lệnh.

Bây giờ chiếc máy bay vun vút hạ xuống thấp. Có cảm giác nó bị rơi. Anh dập đám cháy. Anh muốn dứt bỏ khỏi mình ngọn lửa đang như một mảnh vải đỏ dính nhớp lật phật cạnh vòi phun bên phải. Nhưng cả dòng không khí bay ngược lại, cả ống chữa cháy tự động đều không chế ngự được ngọn lửa, nó bám vào máy bay mới chặt làm sao. Ngọn lửa đốt cháy động cơ thấy còn ít, và nó lan ra thân máy bay.

Chiếc máy bay cháy mất độ cao.

Và đột nhiên anh phi công cảm thấy cần điều khiển bị mất độ đàn hồi của nó. Nó lúc lắc một cách bất lực, và chiếc máy bay không thi hành các mệnh lệnh dành cho nó.

Anh phi công hiểu rằng đã xảy ra cái điều khủng khiếp nhất: các dây kéo tay lái đã bị cháy cả. Tay lái không còn điều khiển được nữa. Còn chiếc máy bay đang rơi xuống rìa thị trấn quân sự.

Khi anh báo cáo tình hình cho mặt đất, từ đó mệnh lệnh đưa tới:

– Xaprunốp! Rời máy bay. Nhảy dù!

Nhưng anh đáp lại:

– Tôi không thể nhảy dù.

– Quỷ thật! Xaprunốp!

Tiếng nói của người chỉ huy oang oang trong ống nghe. Nhưng anh phi công im lặng. Anh không có thời giờ nói chuyện! Chiếc máy bay rơi xuống khu ô vuông nhỏ bằng phẳng, nơi giữa những nhà cửa khác có cái trường mẫu giáo.

Cái khu ô vuông ấy với một sức mạnh không lay chuyển tiến gần đến anh mỗi lúc một to ra, một rõ thêm. Nó như một hòn nam châm cứ hút miết chiếc máy bay bị hỏng hết cần lái.

– Xaprunốp, - Mặt đất gào lên. - Xaprunốp!

Anh lặng thinh. Anh không trả lời và mặt đất cho rằng anh đã chết nhưng Xaprunốp đang vật lộn.

Còn Vôlốtka trong lúc đó vẫn ngủ say.

Không ai biết rằng con người ấy nghĩ gì khi nhìn thẳng vào mắt thần chết, anh có những suy nghĩ gì trong những giây phút cuối cùng mà cuộc sống còn cho anh. Không ai có thể bảo đảm rằng người “bố” của Vôlốtka trong chiếc máy bay cháy nghĩ tới đứa con trai của anh. Nhưng có những cử động của trái tim con người mạnh hơn ý nghĩ và nồng nhiệt hơn tình cảm. Trong những cử động ấy là tình yêu và lý trí, sự quyến rũ và âu yếm đột nhiên chuyển thành sức mạnh, và trước mắt sức mạnh ấy, tất cả sự sợ hãi, ngờ vực, lòng ích kỷ đều bất lực.

Anh vẫn lái được chiếc máy bay cháy tránh khu nhà trường mẫu giáo. Điều đó xảy ra ở gần sát mặt đất. Anh đã thả hết các vòng quay của động cơ còn lành lặn, và máy bay đã bị lái tránh sang bên. Dường như anh lái chiếc máy bay tránh đi được không phải bằng sức mạnh của chiếc động cơ mà bằng ngực mình, hai tay, những nhịp đập cuối cùng của trái tim mình.

Anh không kịp nhảy dù nữa: độ cao không còn đủ.

* * *

Ký ức của con người không giống một bà già mà bạ cái gì vớ được cũng nhét cả vào cái giỏ của mình. Nó là một bậc thông thái biết chọn lọc, trước khi lấy mang đi một cái gì đó của đời anh, nó còn ngắm nghía chán chê, cân lượng trên lòng bàn tay, suy đi tính lại: lấy hay không lấy.

Vì thế Vôlốtka Prexnhiakốp, sống ở phố nhỏ chòi gác rơm rạ biết rất ít về Vôlốtka ở thị trấn quân sự xa xưa. Dường như chúng không chỉ là một bộ mặt mà là hai kẻ khác biệt nhau.

Chỉ có một lần “ba” làm cho Vôlốtka bé nhỏ chiếc tàu thủy con con, nhưng Vôlốtka lớn lại tin rằng “ba” đã làm cho chú cả một hạm đội nhiều con tàu. Chỉ có một lần Vôlốtka thiếp ngủ tay không rời bàn tay lớn của “ba”, mà ký ức lại khẳng định rằng gần như ngày ngày chú ngủ, tay nắm tay ba. Chỉ có một lần người phi công ấy đến trường mẫu giáo đón cậu con trai, mà ký ức thầm thì bảo rằng việc đó đã diễn ra hàng ngày.

Có thể, ký ức con người thêm thắt chút ít chăng? Mà có thể nó chọn ra điều chủ yếu và phóng đại điều đó lên đến mức suốt đời có thể nhìn thấy rõ?

Khi anh hy sinh, Vôlốtka còn bé tí. Thậm chí chú không được biết ngay về cái chết của “ba”. Một chiếc máy bay nào đó bị tan xác. Một phi công nào đó bị hy sinh. Thị trấn quân sự để tang: Ở đây trong mỗi nhà đều có phi công, và với mỗi người trong số đó có thể xảy ra chuyện tương tự… Nhưng ở trường mẫu giáo cuộc sống vẫn diễn ra như lệ thường, như không hê có chuyện gì xảy ra cả.

Đi mẫu giáo về, Vôlốtka đến gõ cửa phòng “ba”. Nhưng không ai trả lời. Vôlốtka không ngạc nhiên về điều ấy. “Ba” thường vắng nhà: công việc của “ba” là như vậy.

Nhưng việc “ba” vắng thật lâu ngày cuối cùng cũng bắt đầu làm chú bé lo lắng. Và một lần chú đã hỏi mẹ:

– Ba đi đâu nhỉ?

Người mẹ chú không trả lời câu hỏi đó.

Hoặc giả chị quay đi chỗ khác, hoặc giả chị bỏ vào bếp. Nhưng lần này mẹ chú không quay đi và cũng không bỏ đi. Chị nắm lấy hai vai Vôlốtka kéo chú lại bên mình và chăm chú nhìn vào cặp mắt chú. Sau đó ôm chặt con vào lòng và bảo:

– “Ba” con đã hy sinh trong khi thi hành nhiệm vụ.

Vôlốtka không hiểu “hy sinh” là thế nào và sao lại “trong khi thi hành nhiệm vụ” nữa? Chú hỏi:

– Thế bao giờ ba về?

– Không bao giờ cả. - Mẹ chú nói và ôm chặt chú vào lòng.

Vôlốtka tuột khỏi vòng tay ôm của mẹ và nghi ngờ nhìn vào mắt mẹ: “không bao giờ” là thế nào kia chứ?

– Ba lên xe ô tô đi hay bay đi? - Vôlốtka hỏi.

– “Ba” hy sinh, - Mẹ chú nhắc lại. - chết. Con hiểu không? Không bao giờ con có “ba” nữa.

– Thế còn con thì sao? - Vôlốtka lắp bắp và đã định òa khóc, nhưng mẹ chú liền nói:

– Ba con là anh hùng.

Cái từ “anh hùng” đã làm cho chú bé yếu lòng. Cái từ đó không thể gắn với nước mắt. Rồi sau đó thì mẹ chú và chú rời khỏi thị trấn quân sự về Mátxcơva sống với bà.

Bây giờ Vôlốtka đã là một cậu chàng lớn tự lập. Chú đã hiểu mọi chuyện: cả thế nào là “hy sinh”, thế nào là “trong khi thi hành nhiệm vụ”. Và chú yêu bố mình, mặc dù biết người ấy một thời gian không bao lâu. Và chú không thấy buồn nhớ bố, chỉ luôn nhìn lên bức ảnh treo trên đầu giường. Chú ngắm nghía cặp lông mày không đều và đường trũng trên hàng môi trên, và cái sẹo trên trán. Mà có thể đó không phải là cái sẹo mà là một món tóc dính bết xuống trán trong chuyến bay gian khó?

Kể ra thì Vôlốtka hoàn toàn chẳng giống gì bố chú. Hai gò má của chú không rộng và cặp mắt không hẹp. Cặp mắt của Vôlốtka to tướng. Nhưng có thể nheo bớt cho bé lại mà. Còn đôi gò má có thể xuất hiện khi chú lớn lên. Chúng sẽ to ra. Vì con người còn lớn cho đến tuổi hai mươi kia mà.

Vả lại hoàn toàn không nhất thiết là mặt mũi con trai phải giống bố mình. Chú có thể giống mẹ. Điều chủ yếu là tính tình phải là tính tình bố.

* * *

Không, không phải ngẫu nhiên mà tấm ảnh treo trên giường Vôlốtka tôi lại thấy quen thuộc, đó chính là phi công Xaprunốp. Điều đó không thể có gì nghi ngờ. Đó chính là anh phi công Xaprunốp nổi tiếng đã bay tới tận trời tối đen và hy sinh trong khi thi hành nhiệm vụ. Chính anh đã cứu sống hằng trăm trẻ em bằng cái giá cuộc đời của mình.

Tôi chuyển cái nhìn từ bức ảnh sang Vôlốtka và hỏi:

– Thế họ của ba chú là gì nhỉ?

Vôlốtka nhìn tôi bằng cặp mắt lạnh lùng.

– Prexnhiakốp. - Chú nói và trong giọng của chú đầy vẻ tự tin. - Đại úy Prexnhiakốp. Thì cha với con bao giờ chẳng cùng một họ.', N'Con Trai Người Phi Công', N'con-trai-nguoi-phi-cong')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 9, N'Sumâycô, phóng viên nhiếp ảnh một tờ báo thủ đô, bước xuống ga xép “Vùng mỏ” vào lúc trời đã chạng vạng tối. Anh lục tìm cuốn sổ tay trong tất cả túi áo nhưng đáng tiếc là không thấy đâu. “Chắc là mình quên không bỏ vào túi bộ quần áo đi đường mất rồi!” - anh nghĩ bụng. “Làm sao bây giờ? Đành phải liệu cách xoay xở vậy”.

Sumâycô nhận nhiệm vụ về một mỏ than, hình như mỏ “Trung tâm” thì phải. Mà cũng có thể là mỏ “Trung ương” cũng nên? Nhưng vấn đề đó kể ra cũng chẳng quan trọng lắm, vì anh biết rằng đây là một mỏ than tiên tiến của cả vùng, có nghĩa là bất kỳ một người dân địa phương nào cũng có thể’ chỉ cho anh được. Sumâycô có nhiệm vụ chụp một số ảnh cho bài phóng sự “Mùa xuân trên vùng mỏ Đônnhét”. Bài này đã viết xong, trên khuôn báo ra ngày mồng một tháng năm đã dành sẵn chỗ để đăng và còn dành cả chỗ cho những bức ảnh minh họa nữa.

Sumâycô làm theo đúng lời dặn của tác giả bài phóng sự mấy hôm trước đã đến đây. Anh rẽ ra một bãi trống bên cạnh nhà ga và tìm ngay được xe đi nhờ.

– Thế anh muốn về mỏ nào? - Người đánh xe ngựa ngồi trên ghế quay lại hỏi anh. Đó là một ông lão mặc áo mưa, đi đôi ủng nỉ mùa đông, phần dưới bọc một lớp cao su đỏ trông tựa giày mưa, mặc dù bây giờ đã là tiết tháng tư.

– Dạ, cháu muốn về mỏ “Trung tâm” ạ! - Sumâycô nói hú họa.

– Thật vừa dịp, lão là người ở đấy ra đây. - Ông lão đánh xe ngựa cầm roi chỉ về phía chân trời mờ mờ khói tỏa.

Ông lão quất ngựa và chiếc xe lao xuống bên rệ đường, rồi phóng băng băng trên con đường chạy qua thảo nguyên, đây đó rắc lốm đốm bụi than.

Ông lão đánh xe tỏ ra một người rất hay chuyện và hiểu biết nhiều. Ông liền kể rằng ông vừa mới chở “ông chủ” ra ga, tức là chở ông thủ trưởng của mỏ ra tàu để đi an dưỡng. Còn ông thì tên là Anicây Gavơrilôvích trước kia đã từng bốn chục năm liền làm thợ ở mỏ này, nhưng nay thì “được cử biệt phái ra coi ngựa”. Sau khi nói một vài nét ngắn gọn về bản thân mình, ông còn bày tỏ sự thông thái của mình về những vấn đề rộng hơn như: bàn về khối Bắc Đại Tây Dương, về năng lượng nguyên tử, về cuộc sống trên những hành tinh khác…

Sumâycô cũng trổ hết tài năng ra tiếp chuyện, sau đó anh lái câu chuyện sang chủ đề khác, bởi vì anh vẫn chưa vững tin là mình đang trên đường đi đến đúng cái mỏ than mà anh được cử tới. Anh khéo léo vận dụng một vài hiểu biết ít ỏi mà anh còn nhớ được, như một người hành hương lần mò đường đi của mình theo các vì sao để tiến dần tới đích.

– Bố ơi, - Anh hỏi. - gia đình ông Mácchiukhin hay là Alêkhin gì đó hiện nay sống thế nào? Bố có biết không, cái tổ đội lao động… của những thợ lò ấy mà… Ông bố là một công nhân mỏ tiên tiến, tổ trưởng đội lao động và hai người con trai cũng cùng làm việc với ông ấy mà.

– À, à… - Ông Anicây trả lời, phấn khởi vì cho mình đã đoán ra gia đình Pakhômốp. - Vẫn công tác bình thường, vẫn hăng hái. Hình như cậu con út mới tìm được người yêu thì phải. Có lẽ dịp nghỉ lễ này họ tổ chức đấy. Nghe nói người yêu là một cô gái có văn hóa… Gớm! Cái con ngựa chết tiệt này! Lại nhảy lên chồm chồm! - Ông Anicây càu nhàu và quất cho con ngựa một roi.

– Bố ơi, thanh niên ở mỏ ta hoạt động thế nào hả bố, họ tham gia câu lạc bộ và chuẩn bị cho ngày lễ đấy chứ?

– Gớm, cái con ranh này! - Ông lão càu nhàu mắng, khi nhận thấy con ngựa đi bên có ý khang khác. - Anh nói gì cơ? - Ông quay sang hỏi.

Sumâycô nhắc lại câu hỏi của mình.

– Bọn thanh niên họ còn phải làm gì nữa cơ chứ? - Anicây triết lý. - Họ chỉ múa và hát thôi. Giờ đây thì họ có điều kiện rồi. - Ngừng một lát, ông nói tiếp. - Đâu có phải như trước kia: có khi phải kéo xe than suốt mười hai tiếng đồng hồ liền hoặc đứng bổ cuốc chim mỏi rời cả chân. Còn bây giờ thử coi xem, họ đi lại đường hoàng chững chạc như thế đó. Tại sao vậy? - Anicây hỏi rồi quay lại phía Sumâycô để tin chắc là anh vẫn nghe ông nói. - Vấn đề hết sức đơn giản: nhờ có máy móc nên người thợ mỏ đã đứng thẳng.

– Ở mỏ ta có máy khai thác than liên hợp không hả bố? - Sumâycô hồ hởi hỏi, bắt đầu dần dần tin là mình đi đúng hướng.

– Sao lại không? Có chứ, mà không phải chỉ một chiếc đâu. Con ranh này, quay đi đâu thế?! Tôi nói là không phải chỉ có một. Chỗ nào cũng sục tới được cả. Loại máy lợi hại lắm.

– Thế còn sân vận động đã đến đâu rồi? - Anh phóng viên hỏi, muốn tỏ cho ông lão đánh xe biết sự am hiểu tường tận của mình về cuộc sống ở địa phương.

– Chẳng nói giấu làm gì. - Anicây buông một câu trong bóng tối. - Tôi là tôi không thích cái môn thể dục thể thao cho lắm. Chỉ thấy là người ta chở gỗ về và bà con cùng với anh em thanh niên vác cuốc xẻng đi làm, còn như ở đấy ra làm sao rồi thì tôi không có để’ ý.

Ông già lặng thinh, kéo căng dây cương và bắt đầu nhìn chăm chú xuống dưới bánh xe. Vó ngựa đập lộp cộp trên ván lát mặt chiếc cầu nhỏ bắc qua con suối hoặc một vực nước gì đó vì trời tối nên không thấy rõ.

Những đóm đèn xóm thợ ban đầu nhấp nháy mờ ảo ở phía xa, rồi mỗi lúc một tiến lại gần thêm và sáng hơn.

Thoang thoảng mùi chua chua của than xỉ. Sumâycô thấy ngôi sao năm cánh màu đỏ sáng rực trên đỉnh tháp cao và nó đã có tác động mãnh liệt đối với anh: giờ đây anh tin tưởng chắc chắn rằng đây chính là mỏ than mà anh cần phải tới.

Công nhân mỏ đón tiếp vị khách từ thủ đô về thăm với thái độ hết sức nhiệt tình. Sau khi được biết rằng khách chỉ lưu lại có một ngày, họ hết sức cố gắng giúp đỡ anh. Họ giới thiệu với anh những danh lam thắng cảnh của vùng quê họ, theo yêu cầu của anh, họ diện bộ quần áo đại lễ của công nhân mỏ vào, rồi lại thay quần áo lao động, cầm cuốc chim đứng trước đống than lù lù như trái núi để chụp ảnh, mặc dù biết rõ rằng người thợ mỏ chưa bao giờ phải dùng tới cuốc chim trên mặt đất này cả, họ để cho anh chụp cảnh họ đoàn tụ gia đình và làm việc ở dưới đất nữa… Ai cũng ngạc nhiên vì thái độ hối hả của khách.

Sumâycô lanh lẹn như một cậu bé trèo tót lên đỉnh một đống than ngắm nhìn quang cảnh chung quanh xóm thợ.

– Không, không được: từ góc độ này mây và vườn cây không ăn ảnh lắm! - Anh thất vọng nói với đồng chí bí thư đảng ủy mỏ đi hộ tống mà đồng chí này hoàn toàn không hiểu tí gì trong câu nói đó. Quả vậy: “Mây không ăn ảnh” nghĩa là gì cơ chứ?

Không hỏi ý kiến ai và coi thường cả những cơn gió đầu xuân thổi giật từng hồi, nhà phóng viên nhiếp ảnh lại trèo lên ống khói theo những bậc thang bằng móc sắt để ngắm nhìn quang cảnh chung quanh. Mọi người có mặt trong sân lúc đó đều lo lắng cho tính mạng của anh.

Sau khi tụt xuống đất, Sumâycô thất vọng nói với người bạn đường:

– Không có gì đáng chụp cả: cảnh hoang vu quá.

Sau đó anh lần từng bậc theo chiếc thang sắt nhỏ dẫn lên một cái tháp cao của mỏ. Lên tới chỗ những chiếc vành đai của cầu vận chính đang quay, Sumâycô ra hiệu ngừng hoạt động. Anh đưa máy ảnh về phía xóm thợ và chụp lia lịa.

Trước khi trời tối anh còn kịp chụp thêm quang cảnh sinh hoạt ở trường công nghiệp mỏ lại vườn, tại trại thăm dò địa chất nằm giữa thảo nguyên và cuối cùng, để lưu niệm lại cho trần thế, anh chụp ông lão đánh xe Anicây đầy vẻ hãnh diện và là người đưa anh ra ga đi chuyến tàu đêm.

* * *

Sumâycô về tới tòa soạn vào đúng lúc số báo kỷ niệm mồng một tháng năm vừa mới xếp chữ xong. Các bạn cho anh biết đồng chí tổng biên tập đang mỏi mắt chờ những tấm ảnh của anh. Trong lòng phấn khởi vì tin đó, anh giật mạnh cánh cửa phòng làm việc của đồng chí thư ký tòa soạn và cũng với một vẻ trịnh trọng như vậy báo cáo:

– Báo cáo, mỏ “Trung tâm” đã về.

– Không phải “Trung tâm”, mà là “Trung ương” kia. - Đồng chí thư ký thản nhiên đáp lại rồi vội vàng chìa một tay ra bắt, tay kia đưa lên sửa lại đôi kính đang tụt xuống.

– Tại sao lại “Trung ương”? - Sumâycô bối rối hỏi lại và vẻ mặt trịnh trọng của anh vụt biến mất.

– Bởi vì bài phóng sự của chúng tôi viết về mỏ “Trung ương”!

– Thế mà tôi lại đến mỏ “Trung tâm”. - Sumâycô nói với giọng của một cậu bé phạm lỗi.

– Anh bạn thân mến ơi! - Đồng chí thư ký kéo dài giọng đến nỗi Sumâycô cảm thấy sởn cả gai ốc. - Số báo của chúng tôi đã lên khuôn rồi! Lại còn chừa chỗ để in ảnh nữa kia chứ!

Ông nổi nóng, chạy đến chỗ đồng chí tổng biên tập. Sumâycô không biết làm gì hơn là ngồi xuống chiếc ghế bành và ngoan ngoãn chờ quyết định cho số phận của mình.

Khoảng mười phút sau đồng chí thư ký quay trở lại, cầm trong tay tờ báo in thử còn đượm mùi mực in hăng hắc.

– Chúng tôi sẽ nhét cái gì vào đây? - Ông giận dữ hỏi và bực tức xỉa ngón tay vào phần dưới của trang báo. - Chúng tôi cần bức ảnh chụp toàn cảnh hầm mỏ đang được phục hồi, anh lại mang về cho một tấm ảnh chụp cảnh mùa xuân vớ vẩn nào đó chứ gì?

– Ảnh cảnh để làm gì kia chứ? - Sumâycô tự ái đáp lại. - Tôi có ảnh chụp toàn cảnh không đến nỗi tồi.

– Chỗ này cần phải đăng ảnh của đội lao động Alêkhin. Có ảnh của đội lao động Pakhômốp, cả ba người đều là những thợ mỏ tiên tiến. Còn đây đã dành chỗ cho sân vận động đang xây dựng.

– Sân vận động đã xây dựng xong rồi. - Sumâycô đáp, trong lòng thấy yên tâm hơn. - Đội thể thao đã luyện tập ở đấy rồi kia mà.

– Trong bài phóng sự có nói về một xóm thợ mới và cũng chừa chỗ cho ảnh kèm theo, ở đây này, ảnh hình bầu dục chạy suốt cả hai cột báo.

– Tôi cũng có cả ảnh chụp xóm thợ.

– Thế còn cái gì đưa vào đây nữa? Vào đây này? Ở đây phải là ngọn tháp với ngôi sao đỏ: mỏ này chả là đơn vị tiên tiến mà.

– Tháp cũng có! - Sumâycô đáp lớn.

– Thế thì đấy là mỏ nào? - Ông thư ký tòa soạn ngạc nhiên hỏi. Theo dấu hiệu thì đích là mỏ “Trung ương” rồi còn gì!

– Tôi cũng đã nghĩ như vậy, - Sumâycô phấn khởi tự thú. - nhưng hóa ra lại lầm đồng chí ạ.

– Thôi được! - Ông thư ký nói, giọng có phần dịu hơn. - Anh đi làm ảnh đi, hạ hồi ta phân giải. Đành phải tùy cơ ứng biến vậy. Có gì dùng nấy thôi. Nhưng chắc rằng anh sẽ không tránh khỏi bị khiển trách về tội thiếu trách nhiệm như vậy đâu đấy nhé.

Ngày hôm sau, lúc trời chưa sáng, người ta mang lại cho đồng chí tổng biên tập bản báo in thử để duyệt. Ông ngồi đặt cả hai ống tay áo đeo lần bao bằng vải xa tanh lên bàn, chăm chú đọc những cột báo in bài phóng sự “Mùa xuân trên vùng mỏ Đônnhét”. Bài này đăng kín mấy cột liền, không có ảnh kèm theo. Nhưng ở hai trang ruột báo, ở phần dưới có đăng thành một dãy dài một loạt ảnh có nội dung phong phú và nghệ thuật chụp khá đẹp: ảnh chụp toàn cảnh vùng mỏ, chiếc máy đào than liên hợp “Đônbát” đang làm việc dưới mỏ, dưới lò chợ, ảnh các em nhỏ đang vui chơi trong vườn trẻ, các nam nữ thanh niên cầm đàn đi dạo chơi… Và cái chính là dưới mỗi bức ảnh đều có lời chú thích ngắn gọn, sinh động và dí dỏm của chính tác giả những bức ảnh đó. Đây cũng là tùy cơ ứng biến, bắt một người từ thuở cha sinh mẹ đẻ chưa hề viết văn sáng tác thuyết minh cho những bức ảnh. Đồng chí tổng biên tập nghiền ngẫm cả tác phẩm văn học của Sumâycô.

Thư ký tòa soạn đứng bên bàn, nín thở lo lắng: Liệu ông ấy có bắt phải vứt bỏ những bức ảnh này đi và in lại trang ấy không?

Nhưng ông tổng biên tập lại đột nhiên hoan hỉ.

– Này, đồng chí có biết không. - Ông nói, rồi ngẩng bộ mặt quá mệt mỏi lên khỏi tờ báo. - Thật là tuyệt! Chúng ta chỉ mới biết được có một mỏ than tiên tiến, nhưng ở đó hóa ra còn có một mỏ nữa chẳng thua kém chút nào. Theo tôi, rất là đạt. Chính cuộc sống đã kịp thời bổ khuyết thêm. Còn đối với nhà nhiếp ảnh của chúng ta, - Ông nói thêm khi chợt nhớ tới Sumâycô. - nên biểu dương. Ai biết là đồng chí ấy có biệt tài như vậy? - Ông hỏi và đập đập bàn tay vào tờ báo. - Ông bạn ạ, anh ấy còn đóng góp cho chúng ta nhiều nữa. Ảnh của anh ấy khá lắm, khá lắm!

Nói xong, tổng biên tập đẩy lùi tờ báo ra xa một chút và lại ngồi ngắm nhìn bức ảnh chụp toàn cảnh khu mỏ.', N'Cuộc Sống Đã Kịp Thời Bổ Khuyết ', N'cuoc-song-da-kip-thoi-bo-khuyet')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 11, N'Một cây thông khổng lồ, trọn cả một cây.

Hẳn là người ta đã chặt nó đâu đó tận trong rừng Kômi và chở về đây trên một toa tàu đặc biệt. Mùi nhựa hăng nồng từ cây thông loang ra trong nhà câu lạc bộ được đất sưởi khá ấm.

Và trong lúc Epghênhi Kadimirôvich đăm chiêu chậm rãi đi quanh cây thông nằm đó, thích thú thở hít cái mùi đầy sức sống gần như đã bị lãng quên, cái đế gỗ hai khúc gỗ to được bào nhẵn nhụi bắt chéo nhau - đã được chuẩn bị xong. Người giúp việc của ông đã làm việc ấy.

Bây giờ phải dựng cây thông lên rồi trang trí, sau đó các thủ trưởng cứ việc mà vui thú. Công việc vặt vãnh chẳng khó khăn gì, bởi vì gì thì gì đi nữa, khi còn tự do, Epghênhi Kadimirôvich vốn là một họa sĩ.

Còn trong khi ông phụ trách câu lạc bộ chưa có mặt, ta tranh thủ dự trữ thêm hơi ấm là việc không nên bỏ qua.

Epghênhi Kadimirôvich cùng với Nexte - tên anh giúp việc của ông - cùng ngồi xuống bên bếp lò nóng hổi, lấy thuốc ra hút; ông chỉ huy đã dốc cho họ cả một lô thuốc lá sợi.

– Theo điều khoản nào? - Epghênhi Kadimirôvich hỏi.

Nexte đưa mắt nhìn ông. Đôi mắt kiên nghị, bình tĩnh.

– Tớ hỏi một tí, cậu bị tù vì tội gì thế?

– Vì chính những cái này đây. - Nexte từ tốn đặt hai bàn tay mình lên đùi. Hai bàn tay mugich to lớn.

– Thế đôi búa tạ của cậu đã làm gì vậy?

– Có nghĩa là đôi tay này chứ gì. Nguy hiểm về mặt xã hội.

– Chuyện cổ tích? Cậu đã cho kẻ nào đó nếm mùi chăng?

Nexte liếc nhìn Epghênhi Kadimirôvich.

– Không lẽ trông tôi giống một tên giết người ư?

– Rõ. Thuộc giới phú nông?

– Chà, ông… Vậy mà cũng là dân trí thức, có học. Bọn kulắc phú nông thì bố tôi đã từng bóp hết ngay từ hồi nội chiến kia…

Epghênhi Kadimirôvich chẳng biết làm gì khác, ngoài một cái nhún vai.

Và im lặng một lúc, Nexte bắt đầu kể chuyện về bản thân mình.

Và đây là câu chuyện của anh mà Epghênhi ghi nhớ được.

Đầu mùa xuân năm 30, Nexte và một người bạn cùng làng ra khỏi Hồng quân trở về. Hai người lòng phấn chấn, vừa đi vừa ca hát. Họ đã phục vụ Tổ quốc một cách vinh quang. Còn trước mặt là những cuộc gặp gỡ với người thân thuộc, với người yêu thương. Nói tóm lại, đầy niêm vui sướng.

Chiều tối Nexte về tới gần căn nhà gỗ thân thuộc. Trong cửa sổ không thấy ánh đèn lửa. Không ai ra đón anh. Quỷ quái gì thế này? Anh chẳng đã viết thư cho cha anh rồi sao? Mà chó nhà đâu? Tại sao nó không sủa? Tại sao nó không bay ra nhảy chồm bám lên ngực anh?

Nhưng tất cả những điều ấy chỉ là những chuyện vặt vãnh so với những gì anh nhìn thấy trong nhà, mọi cái đều tan hoang, đổ gẫy và không một bóng người… Chỉ có một con mèo, khi anh bật que diêm lên, nó lao vút lên phía sau bếp lò một cách hoang dại.

Nexte chạy bổ sang hàng xóm. Có chuyện gì xảy ra vậy. Bố anh đâu? Mẹ anh và các em gái của anh đâu?

Bị đày đi Xibir cả rồi.

Tại sao lại đi Xibir? Bố anh bị đày đi Xibir ư? Một chiến sĩ Hồng quân. Xuất thân từ bần nông. Đã dựng lên chính quyền Xô viết trong nội chiến ở chính đây cơ mà.

– Không, cái này vớ vẩn thế nào ấy. Phải lập tức đến Xô viết xã, rồi lên tỉnh hỏi cho ra nhẽ.

– Ấy, tốt hơn là đừng có đi, người anh em ơi! - Bác hàng xóm khuyên can. - Chứ không người ta sẽ tóm cổ cả anh nữa đấy. Và nói chung, hiện thời vẫn còn chưa muộn, chuồn khỏi nơi đây là tốt nhất…

Ra khỏi nhà người hàng xóm, Nexte như người mất hồn. Không lẽ những chuyện đó lại là sự thực ư? Không lẽ anh lại phải chạy trốn khỏi làng quê thân thuộc của mình hay sao?

Gần căn nhà gỗ của mình, anh nghe có tiếng ai sụt sịt. Anh đi tới. - Timôkha. Anh ta ngồi trên hiên nhà và khóc. Hóa ra cả anh ta cũng được số phận chuẩn bị sẵn cho một món tặng vật như thế. Hóa ra là cả gia đình anh ấy cũng bị đày đi Xibir rồi.

Mà sự thể, như sau này Nexte biết được, hóa ra là như thế này… Trong làng bắt tay vào xây dựng nông trang, người ta thông qua một danh sách xem ai là kulắc phú nông để đánh đổ. Người ta nêu một tên họ, nêu tên họ thứ hai. Và bỗng nhiên bố Nexte nghe thấy người ta đọc đến cả tên họ của bố Timôkha.

– Ơi bà con, bà con làm sao vậy? Ông ấy đã chiến đấu cùng với tôi kia mà, suốt cả cuộc nội chiến chúng tôi đã cùng nhau tiêu diệt kẻ thù.

– Sao thế, anh ủng hộ tên kulắc ấy hả? Mà chính anh cũng là kulắc đấy thôi! Kia kìa, nhà anh lợp mái tôn hẳn hoi. Năm ngoái anh chở bao nhiêu lúa mì ra chợ?

– Thưa bà con, thì tôi chỉ thực hiện chỉ thị của chính quyền Xô viết mà thôi. Vlađimia Ilich Lênin đã nói gì sau cuộc nội chiến? Hãy làm gương, hãy trồng nhiều lúa mì hơn. Vì thế tôi đã vun trồng, đã nuôi chính quyền Xô viết, còn khi cần, cầm súng bảo vệ nó.

Nói chung, dù bố Nexte có chứng minh gì đi nữa, ông vẫn bị quy là phần tử kulắc và bị đày đến vùng Xibir lạnh giá. Trong những toa chở bò. Cùng một nhóm với những kẻ mà ông đã chiến đấu chống lại trong cuộc nội chiến.

– Bây giờ thì chúng ta biết làm gì đây, Nexte? Biết đi đâu bây giờ? - Timôkha nghẹn ngào, giọng đầy nước mắt.

Hai người quyết định đi Xibir. Đi tìm người thân. Giấy tờ có đủ, quân phục Hồng quân, chắc hẳn chẳng ai dám bắt giữ.

Họ đi khá lâu. Nhưng cuối cùng ở Xibir họ đã tìm ra dấu vết của đoàn tàu. Và bây giờ té ra là không phải chỉ có hai người họ ở trong tình cảnh như vậy. Những kẻ đáng thương như họ, những chiến sĩ Hồng quân mới giải ngũ, mà nhà cửa bị tan hoang kể có đến hàng chục.

Họ đã bàn bạc nhau cùng hành động.

Và rồi Nexte và Timôkha tìm thấy người trong gia đình. Đầu đội trời, chân đạp đất. Túm tụm bên nhau, như dân Digan. Cơ man nào là người. Và gần như không có lính canh gác. Đất mẹ Xibir - chạy đi đâu được?

Nhưng hóa ra là đến đây con đường khổ ải của những con người này cũng chưa phải đã chấm đứt. Họ còn bị xua đi tiếp, qua cả rừng taiga tới miền băng giá. Đào vàng. Xong việc ở đấy thì họ phăng teo. Nếu như anh không chết rấp vì đói thì bệnh hoại huyết cũng sẽ kết liễu đời anh. Chưa một người nào từ chỗ đó mà được mạnh chân khỏe tay trở về.

– Nhưng có, có những miền đất ở Xibir, - Một ông cụ người địa phương nói. - ở đó có thể sống ra con người.

Tự do, và có thể tìm đến đó, hàng đời yên ổn, không ai tìm ra nổi.

Mọi người nắm tay theo cụ. Ai là người muốn đi vào chỗ cầm chắc cái chết?

Và thế là nảy ra một ý đồ điên rồ - bỏ trốn. Đi tìm nơi có thể sống được. Người quyết định tiến hành công việc như thế tập họp được không phải là ít. Tất cả đều là những người dũng cảm nhất, dẻo dai nhất.

Trang bị thóc giống, bánh mì - trút bỏ ra mọi thứ, để có cái đem đổi lấy được. Rồi sau đó bắt đầu tìm ra bờ sông theo từng nhóm, từng nhóm một.

Mọi người đóng bè mảng, ngồi lên rồi nhổ neo.

Bơi mảng trên sông mất một hồi lâu, phần lớn là bơi trong đêm. Chung quanh rừng cây hoang vắng. Xa lạ. Cô tịch. Nhưng cũng vui tịnh không một bóng người.

Cuối cùng họ đổ bộ lên bờ. Bè mảng phải đem đốt hết để phi tang. Bây giờ thì cứ thử đi mà tìm họ. Sau đó họ còn luồn rừng đi bộ mấy ngày đường nữa. Và họ đã tìm ra một địa điểm - một con sông nhỏ với những bãi cỏ ngập nước. Cả chim. Thú rừng. Nhiều vô kể. Hạt dẻ, quả rừng đều sẵn.

Và thế là họ bắt đầu gây cuộc sống trên mảnh đất hoang dại. Họ bắt đầu chặt cây, đánh gốc, dựng lên những căn nhà gỗ đầu tiên.

Lúa mì trên những thửa ruộng đầu tiên bị băng lạnh chết mất cả. Và họ đã phải chịu đựng, đã phải nếm trải mất hai năm. Họ biết rõ - như vẫn thường nói - chỉ có Chúa với lại chính bản thân họ mà thôi. Không có lúa mì - một nửa số người bị chết vì đói. Quần áo không có. Giày dép không có. Thêm vào đó lại còn tai họa nữa của Xibir: ruồi nhặng, muỗi mòng…

Nhưng dù thế này hay thế khác, họ vẫn trụ được. Rễ đã bám được vào mảnh đất chẳng lấy gì làm ngọt ngào này.

Về đến đây thì một vấn đề mới lại được đặt ra: sống như thế nào đây?

Trước đó, khi họ phải vật lộn để mà sống sót, mọi người không ai nghĩ tới vấn đề này. Họ sống quần tụ. Và tất cả mọi người, không cần ai thúc giục, đều làm lụng gắng hết sức. Còn bây giờ, khi họ đã đứng vững được đôi chút, dục vọng con người bắt đầu nổi lên. Bắt đầu nổ ra chuyện cãi cọ, xung khắc. Thậm chí máu kulắc đã nổi lên ở người này người kia (trong số họ có cả những người thực sự là dân kulắc): liệu có thể sống dựa dẫm vào người bên cạnh được chăng?

– Chúng ta sẽ sống như cha ông chúng ta đã sống. - Một số người đã nói như thế.

Nhưng các cựu chiến sĩ Hồng quân và bọn thanh niên kiên quyết chống lại những người kia.

– Không. - Những người này tuyên bố. - Chúng ta sẽ sống theo chế độ Xô viết. Chẳng lẽ chúng ta đã đổ máu vì chính quyền Xô viết một cách phí hoài sao? Ta hãy làm như thế này: Xây dựng một chính quyền Xô viết thực sự.

Và họ đã bắt đầu xây dựng chính quyền Xô viết. Mọi việc đều thông qua con đường bầu cử. Giới lãnh đạo không có một đặc quyền đặc lợi nào. Kẻ nào không làm kẻ ấy đừng ăn. Và còn nhiều điều nữa cũng theo tinh thần như vậy.

Dần dà, họ đạt được cả quan hệ với thế giới bên ngoài. Với điểm dân cư gần nhất - điểm dân cư ấy cách chỗ họ cũng phải ba, bốn trăm cây số - họ chở tới đó các sản phẩm của mình: lông thú, cá. Còn ở đó, họ mua về cho mình mọi thứ cần thiết.

Nói chung là họ sống được, phong lưu lên. Nhà cửa khang trang. Một thôn xóm khá giả, no đủ. Họ tổ chức câu lạc bộ, thành lập trường học, và trường học mang tên Lênin. Chúng ta sẽ sống theo Lênin!

“Nhưng liệu có phải đã đúng theo Lênin chưa?” - Những người cựu chiến sĩ Hồng quân suy nghĩ.

Liệu Lênin có tán thành họ hay không? Họ đã kéo nhau vào rừng taiga, đã quay lưng lại với thế giới bên ngoài, với cuộc đấu tranh. Chẳng nhẽ đấy mà là chính quyền Xô viết ư? Cuộc đấu tranh một sống một chết diễn ra năm Mười bảy, là vì cái này ư?

Không rõ mọi chuyện này sẽ được giải quyết ra sao, nhưng giữa lúc đó xảy ra một sự việc. Một lần vào mùa hè trong khu vực xóm làng của họ đã xảy ra một tai nạn máy bay. Xử lý thế nào đối với anh phi công đây? Bởi vì nếu thả anh ta ra, thì bí mật của họ thế là chấm dứt. Và người ta sẽ bắt họ phải chịu đựng những cực nhục như thế nào?

Một số người kiên quyết hơn cả đề nghị thủ tiêu anh phi công.

– Người ta không thương xót chúng ta, thì hà cớ gì chúng ta lại phải có lòng thương xót?

– Không, - Số người khác bác lại. - không được giết người vô tội. Chính quyền Xô viết thực sự không bao giờ hành động như vậy. Tốt hơn hết là chúng ta cứ kể rõ cho anh ta biết, chúng ta là những ai và giới thiệu cuộc sống của chúng ta cho anh thấy. Rồi sau đó sẽ bàn bạc thêm với anh ta.

Họ đã làm đúng như vậy.

Anh phi công rất thích thú cuộc sống của họ. Đúng, anh ta bảo: đây là chính quyền Xô viết thực sự. Và sau đó anh ta đã thề không bao giờ, kể cả phút lâm chung, anh ta cũng không tiết lộ bí mật của họ.

Việc hỏng hóc của máy bay hóa ra không có gì đáng kế. Họ đã mau chóng sửa chữa xong. Và một hôm, xúc động chia tay, anh phi công đã bay đi.

Bây giờ, khi đã có người từ thế giới rộng lớn đặt chân đến chỗ họ, những con người ở đây càng suy nghĩ nhiều hơn về cuộc sống - sự tồn tại của mình. Không, không thể sống mãi như thế này. Cuộc sống của những kẻ ẩn dật - đó không phải là con đường do Lênin vạch ra. Phải ra đầu thú, đúng hơn, phải đến tỉnh lỵ gần nhất và kể hết mọi chuyện đang có và mọi chuyện đã qua.

Có người đề nghị về thẳng Mátxcơva. Ở đó có Kalinin. Bản thân ông cũng vốn là nông dân. Ông sẽ phân xử. Ông sẽ hiểu lòng chúng ta. Thực ra thì chúng ta có làm điều gì xấu đâu. Người ta đã xúc phạm chúng ta một cách bất công. Nhưng chúng ta ngay ở nơi lưu đày cũng đã sống theo cách sống Xô viết, sống trong một nông trang. Chúng ta đã xới đất lật cỏ. Chúng ta đã chinh phục rừng taiga. Mà ngay ở thời cũ thì chỉ vì mỗi việc ấy thôi cũng đáng được thưởng mề đay lắm rồi.

Và họ đã quyết định như thế: cử đại biểu về Mátxcơva.

Nhưng các đại biểu đã không kịp ra đi.

Đang đêm, làng của họ đã bị lính đến vây chặt. Mọi người - già, trẻ, lớn, bé - bị xua hết ra khỏi nhà, trong bộ quần áo ngủ. Lính tách riêng phụ nữ và trẻ em. Sau đó họ đốt làng.

Có một đêm như thế. Những con người đứng trước mũi súng trường, hai tay giơ lên cao, trước mắt họ, làng xóm của họ bốc cháy, chính quyền Xô viết của họ bốc cháy.

Nexte ngừng kể. Và anh lại đặt hai bàn tay mugich nặng nề lên đùi, nhìn chúng. Epghênhi Kadimirôvich cũng đưa mắt nhìn hai bàn tay ấy, rồi nhìn Nexte. Và ông không biết nên nghĩ thế nào.

Bảy năm sống trong các trại cải tạo, ông đã được nghe đủ thứ chuyện. Nhưng câu chuyện này… không lẽ tất cả những gì mà Nexte kể đều là sự thực hay sao?

Mà có thể đó chỉ là chuyện bịa đặt. Có thể đó là một di sản của câu chuyện cổ tích về hạnh phúc của người dân, một truyện cổ tích được Nexte sáng tác lại theo lối mới? Tại đây, sau hàng rào dây thép gai, anh ta không biết để đôi tay lam làm của mình vào công việc gì?

Nhưng quả là thực đau lòng: mọi điều mà Nexte đã kể cho ông nghe nó giống như câu chuyện cổ tích, một câu chuyện cổ tích khủng khiếp, trong đó cái thực, cái hư quyện chặt với nhau một cách khó tin nhất.

', N'Xôê', N'xoe')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 12, N'Sự kiên trì kiêu ngạo của anh chàng kỹ sư trẻ vừa khiến Minaiev bực bội, vừa hấp dẫn ông một cách lạ lùng, Olkhovxki không tán thành bất cứ một đòi hỏi nào. Dùng những ngón tay thanh tú, lấm bẩn, chốc chốc anh ta lại chộp lấy cái nắp lọ mực trên bàn Minaiev rồi để nó trên mặt kính phủ bàn. Tiếng kin kít khó chịu hòa với ý nghĩ khó chịu của các từ ngữ do Olkhovxki phát ra, cùng ấn tượng do bài báo của anh ta gây nên, cái bài cũng gay gắt một cách khó chịu như vậy. Thực ra, điều làm ông bực bội hơn cả là sự thật không phản bác được của bài báo; Olkhovxki đã chứng minh một cách đầy thuyết phục tính chất không kinh tế của loại động cơ mới do viện sĩ Stroiev thiết kế. Minaiev không thể cho phép in một bài như vậy: Giải thích cho cậu bé này hiểu rằng việc phê phán viện sĩ Stroiev sẽ gây nên đủ thứ chuyện lôi thôi cả cho công tác của viện nghiên cứu, lẫn cho chính Minaiev, một viện trưởng chưa có quyết định chính thức đề bạt.

– Tôi đề nghị một cách thân tình là hãy bỏ hết những gì có dính dáng đến Stroiev đi. - Minaiev nói một cách nhẹ nhàng. - Và trong phần phê phán cũng nên bớt cái giọng gay gắt đi: được như vậy tôi sẽ cho đăng ngay.

Olkhovxki bật dậy, người cúi gập, khuôn mặt nhợt nhạt của anh ta ửng đỏ lên, tay thu lại thành hai nắm đấm.

– Vậy thì bài báo của tôi sẽ nói về điều gì? Chẳng về gì cả nữa! - Anh thốt lên, giọng lanh lảnh. - Đồng chí hiểu cho, những cái động cơ ấy sẽ dẫn tới việc tiêu phí hàng nghìn tấn nhiên liệu. Làm sao đồng chí có thể… - Đôi lông mày thẳng của anh ngạc nhiên rướn cao lên. - Không, không, không có một sự thay đổi nào hết. Không vì một lý do nào hết. Đồng chí Vlađimir Pakhomovich, như vậy sẽ là một chuyện vô nguyên tắc!

“Cừ lắm”, Minaiev thầm nghĩ. Trong tư thế của Olkhovxki có cái gì đó quen thuộc một cách lạ lùng… Và đột nhiên trước mắt Minaiev hiện lên cái cảnh xa xưa đã bị quên lãng, khi ông cũng như thế này, cong người, hai tay nắm lại, quát tháo bằng cái giọng đứt quãng… khi đó tóc ông cũng rối bù và trên ve áo khoác cũ sờn cũng là tấm huy hiệu đoàn viên thanh niên Kômxômol như thế này. Hồi ức thật cảm động, nhưng nó không hề được phản ánh trong ánh mắt đã tắt của ông, hai mi mắt nặng nề mệt mỏi nửa khép lại. Bộ mặt gồ ghề, đầy nghị lực của ông giữ một cách vững chắc ở khóe miệng nét biểu hiện không rõ ràng, có thể phỏng đoán theo các hướng khác nhau.

– Anh cứ thích khua cái từ ấy - tính nguyên tắc. - Minaiev lạnh lùng nói. - Nhưng anh cứ thử thể hiện nó ra xem. Xin anh hãy làm việc để có lấy được cái quyền và các phương tiện thực hiện nó. Phải, đồng chí Olkhovxki ạ, - Ông nhắc lại với một sự thích thú độc địa. - hãy thực hiện đi, chứ đừng có tuyên bố vì điều đó buộc phải hy sinh cái gì đó.

Olkhovxki cúi xuống bàn. Mái tóc rậm của anh xõa xuống. Từ dưới mái tóc, đôi mắt long lanh sáng tức tối nhìn Minaiev.

– Đồng chí Vlađimir Pakhomovich, thế đồng chí đã giành được cái quyền trở thành có nguyên tắc như thế nào ạ?

Câu hỏi đã làm Minaiev bực mình bởi sự bộc trực hình như của chính bản thân mình, đã có lần vang lên trong chính căn phòng làm việc này. Nở chính cái nụ cười cởi mở thân thiện, cái nụ cười đã từng cứu ông trong những phút khó khăn, ông nói một cách hạ cố:

– Cẩn thận hơn một chút, anh làm đổ lọ mực mất đấy.

Olkhovxki đỏ mặt lên, vội dịch ra xa.

– Thế đấy, anh thấy không, - Minaiev nói tiếp. - quan trọng là biết dịch ra xa đúng lúc.

Cuộc chuyện trò này để lại cho Minaiev một cảm giác nặng nề. Thôi được, bây giờ điều quan trọng duy nhất là quyết định bổ nhiệm chính thức, khi ấy có thể giúp đỡ Olkhovxki, khi ấy ta sẽ chẳng còn sợ gì, ngay cả Stroiev nữa, có thể cứ giữ vững ý kiến của mình trước bất cứ một ai. Có chính kiến ấy chưa đủ, mà đi với nó còn cần phải có địa vị phù hợp… Những ý nghĩ đó làm ông yên lòng lại một cách quen thuộc, mỗi lần sau một bước ngoắt ngoéo khó chịu, chúng lại tận tụy hiện ra.

Ít lâu sau từ Thành ủy có công văn gửi xuống hỏi về bài báo của Olkhovxki. Công văn do một cán bộ chỉ đạo của Thành ủy là Loktev ký, kèm theo công văn có đính cả bức thư của Olkhovxki. Đọc xong thư, Minaiev nổi giận… Chính sách hèn nhát của Minaiev đã củng cố thêm đường lối độc tài của Stroiev… Ở cương vị như vậy đã đến lúc cho phép mình được “hưởng sự xa hoa” là bảo vệ ý kiến của riêng của mình. - xem kìa, anh chàng thông minh đã tự nới thắt lưng cho mình đến mức ấy đấy.

Minaiev đích thân viết công văn trả lời, ngắn gọn, cô đọng và đồng thời cũng chết người, sử dụng hết mức tính đa nghi của Loktev mà ông biết rõ. Olkhovxki được hình dung ra là một kẻ đáng ngờ, khó chịu, bằng những trò eo xẹo của mình hay làm mất thời giờ của mọi người, việc anh ta nêu ra còn chưa rõ ràng, khiếm nhã. Đôi chỗ trong thư hơi nhiều lời. Nhưng Minaiev biết rõ: càng nhiều lời càng có sức thuyết phục. Đặt chữ ký lên mặt giấy, ông lóng ngóng cào ngòi bút và tiếng ngòi bút kẹt rít trên giấy làm ông cau mặt… Thì biết làm sao được kia chứ, ngay trước việc hoàn tất mọi niêm hy vọng của mình, ông không thể nào lại mạo hiểm vì sự bướng bỉnh của cậu bé con này. Tự Olkhovxki buộc ông phải viết như thế. Không sao, không sao, sau này ông sẽ sửa chữa lại mọi chuyện. Và ông ném sự việc của Olkhovxki vào loạt “tạm hoãn cho đến khi được đề bạt chính thức”.

Thứ trưởng Petrishchev được Minaiev hết sức kính trọng, và có lẽ chính vì vậy mà việc ông về thăm viện không làm Minaiev vui mừng. Khi có mặt Petrishchev, bao giờ Minaiev cũng có một cảm giác khó hiểu và bị dồn ép vì một nguy cơ nào đó. Kể ra thì, cảm giác hoàn toàn không cần thiết ấy không hề cản trở Minaiev mỉm cười, bông đùa, đôi khi thậm chí còn làm bản thân ông phải kinh ngạc, bởi những đường gân thớ thịt trên mặt, giọng nói, đôi tay của chính ông hành động với một thái độ tự chủ hồn nhiên như thế nào.

Minaiev đưa Petrishchev đi thăm các phòng thí nghiệm, giới thiệu đề tài các công việc đang tiến hành ở đây, lắng nghe ý kiến nhận xét và, mặc dù cũng vẫn chính những ý kiến nhận xét mà bản thân Minaiev, đã nói với các cấp dưới của mình, ông vẫn cứ đề nghị người trợ lý ghi lại, tính toán rằng sự chú ý như thế sẽ làm Petrishchev hài lòng.

Trong một phòng thí nghiệm, khi đang giới thiệu cái máy dao động, Minaiev nhìn thấy Olkhovxki lên đến gần đồng chí thứ trưởng. Anh ta trông nhợt nhạt khác thường. Cái cằm nhọn giật giật. Đôi mắt đen mở to nhìn với một niềm hy vọng và cả nỗi sợ hãi. Mỗi phút chờ đợi lại làm vợi bớt quyết tâm của Olkhovxki, và hiểu rõ điều đó, Minaiev cho máy hoạt động. Tiếng máy rồ lên như luồng nước bật lên trần và tỏa ra, nhận chìm căn phòng vào tiếng ầm ầm đều đặn. Minaiev đe dọa đưa mắt nhìn Olkhovxki, cố ngăn anh ta lại, tỏ cho anh ta thấy rằng anh ta vội vã với chuyện đề nghị của mình lúc này là quá sớm. Bởi vì chỉ còn phải chờ đợi vẻn vẹn độ một tuần lễ gì đó mà thôi. Thái độ ích kỷ của Olkhovxki làm ông bực mình, nhưng khi Olkhovxki cuối cùng lên tiếng thì Minaiev lại bình tĩnh lại.

Đáng ra nên trình bày ngay thực chất của sự việc thì Olkhovxki lại lúng túng trong những câu chữ dài dòng chuẩn bị sẵn, bắt đầu nói về ngọn nguồn của chủ nghĩa bảo thủ, hệ thống trách nhiệm - không ai có thể hiểu anh ta muốn gì. Trong ánh mắt đồng chí thứ trưởng, Minaiev nhận thấy sự chăm chú cảm thông và ông bỗng cảm thấy xấu hổ thay cho Olkhovxki. “Làm sao mà cứ kéo dài thế mãi, cái anh chàng lý thuyết gia hỉ mũi chưa sạch, đồ thộn. - Minaiev rủa thầm trong bụng. - Thật là đồ vô dụng! Người ta sẽ ngắt lời anh ta bây giờ cho mà xem”.

– Xin lỗi đồng chí, - Petrishchev lên tiếng, - thực ra thì đồng chí muốn gì kia?

Olkhovxki bối rối lặng thinh, tiếp tục mấp máy đôi môi khô khốc không thành tiếng. Minaiev cụp mắt nhìn xuống. Lạy Chúa, cậu bé mới vụng về làm sao? Olkhovxki cho tay vào túi, giựt mạnh tập bản thảo quăn nếp gấp ra và dúi cho Petrishchev. Đồng chí thứ trưởng mở tập bản thảo gập nếp ra: bên trong có một đồng rúp nhàu nát nằm gọn giữa đống vụn thuốc lá. Có người phì cười, đồng chí thứ trưởng không kìm được đưa trả đồng rúp cho Olkhovxki, và cùng bật cười. Và lập tức chung quanh mọi người đều cười. Chẳng có gì đáng phật lòng trong tiếng cười ấy, trong những trường hợp như thế cần phải lên tiếng cười cùng với mọi người, cùng mọi người bông đùa nhưng Olkhovxki lại đỏ dừ mặt lên, một nụ cười thẹn thùng đần độn làm méo mó bộ mặt anh ta: có cảm giác, anh ta òa khóc bây giờ mất.

– Tôi đề nghị đồng chí, đích thân đồng chí tìm hiểu cho, - Olkhovxki vội cất lời với một sự tuyệt vọng, khi muốn gì đi nữa chỉ còn giây phút cuối cùng và có thể nói tất cả. - chứ không đồng chí lại gửi… cho đồng chí Vlađimir Pakhomovich…

– Nhất định chúng tôi phải tìm hiểu. - Đồng chí thứ trưởng nói một cách hết sức bình tĩnh và thư thái.

Khi mọi người trở về phòng làm việc của Minaiev, Petrishchev hỏi xem anh chàng kỹ sư trẻ ấy đưa bản thảo gì cho ông vậy.

Phơi bày những lo ngại của mình có liên quan đến Stroiev hẳn là không có lợi, vì thế Minaiev đã bắt đầu:

– Bản thảo… - Sau đó ông ngừng lại. - Có lẽ đồng chí phụ trách bộ phận của Olkhovxki sẽ có thể đánh giá nó tốt hơn tôi.

“Mình không thể nói khác”, tự bào chữa, ông thầm nghĩ, hình dung ra trước mọi cái sẽ xảy ra.

Phụ trách bộ phận nhận xét về những phương pháp tính toán lý thú do Olkhovxki đề ra, và ngay đấy lại nói thêm - cần phải có sự kiểm tra kỹ lưỡng gạt bỏ mọi trò tung bắn đối khứ như thế, mọi sự ồn ào, thưa kiện, thư từ. Ông ta cố không chút gì làm nguy hại đến Minaiev và đồng thời giữ tính khách quan đối với Olkhovxki:

– Tôi không thể ngờ cậu ta lại là tay gây sự đến như vậy. - Petrishchev ngạc nhiên.

– Tôi trước cùng học với cậu ấy ở trường tổng hợp. - Trợ lý của Minaiev nói. - Cậu ta bao giờ cũng thế nào ấy. - Trợ lý ngoáy ngoáy ngón tay bên cạnh thái dương.

Minaiev biết rằng anh chàng trợ lý nói như vậy bởi vì anh ta cho rằng Minaiev muốn anh ta nói vậy, nhưng dù sao nữa cái đó hơi quá…

– Tất nhiên, trong chúng ta có loại người như vậy. - Đồng chí thứ trưởng nói. - Họ nghiêm khắc, đòi hỏi lập ban thanh tra, gây gổ. Nhưng sau đó hóa ra chỉ là một chuyện gây gổ hình thức. Nhưng có những người bị cố tình gán ghép vào loại những kẻ gây gổ… - Ông cau mày, có lẽ sực nhớ tới một chuyện gì đó của bản thân mình.

– Dù thế nào đi nữa, bản thân vấn đề cũng cần phải quan tâm đến. - Minaiev vội vã nói với thái độ tự chủ thô lỗ mà Petrishchev ưa thích.

Petrishchev tán thành, dường như giao phó số phận của bản thảo cho Minaiev… Và mặc dù Minaiev thấy thích thú được sự tin cậy này, nó vẫn gây cho ông một cảm giác có lỗi mơ hồ. Minaiev tự trấn an mình: ông không có một trách nhiệm đạo đức nào hết trước Petrishchev. Petrishchev đã phải miễn cưỡng đồng ý, ông không thể tỏ ra thiếu tin cậy vào con người mà ông sắp đề bạt làm viện trưởng. Không làm sao khác được, anh bắt buộc người ta, nhưng người ta cũng bắt buộc anh, hiện thời đang còn có những hoàn cảnh như vậy.

Bây giờ, khi vấn đề đã được giải quyết, Minaiev bỗng thấy thương hại Olkhovxki. Thực ra thì Petrishchev đã bị thuyết phục rằng Olkhovxki là một tay gây gổ và một anh chàng kỳ quặc có hại. Điều đó thật không hay. Chúng ta giết chết chàng trai chỉ vì anh ta không biết cách bảo vệ lẽ phải của mình. Như vậy không được.

Ông hẳn sẵn sàng thích thú đến chừng nào kia chứ: gạt phắt mọi tính toán và cân nhắc của mình và sẵn sàng nói tất cả những gì ông suy nghĩ về sự cản ì mà Stroiev thổi bùng lên. Nhưng đôi môi của ông vẫn mím chặt như trước: ngồi trên ghế bành, ông nghe cái ý kiến của đồng chí thứ trưởng và bộ mặt nặng nề của ông giữ một vẻ chăm chú không gì lung lay được.

* * *

Trở thành viện trưởng, do hàng đống công việc nổi cộm lên, Minaiev quên bẵng Olkhovxki đi, và chỉ đến khi có công văn từ tổng cục gửi về, ông mới sực nhớ đến chuyện ấy. Kèm theo công văn hỏi lại, còn có thêm một lá thư nữa của Olkhovxki - anh ta tiếp tục một cách quyết liệt và vụng về cuộc đấu tranh không hy vọng. Do sự ngây thơ vụng dại, Olkhovxki coi thường máy chữ, và vì thế thậm chí cả vẻ ngoài của bức thư này được viết trên những tờ giấy vở học trò bằng nét chữ to tướng trẻ con, cũng đã làm cho người đọc có cảm giác không nghiêm túc.

Những đoạn đầu tiên Olkhovxki viết cẩn thận, sau đó chữ viết càng ngày càng xiên xẹo, các dòng chữ vội vã cong queo và Minaiev tin chắc rằng không có ai, ngoài ông ra, có thể đọc hết bức thư này.

Với một sự ngây thơ hùng hổ, Olkhovxki đả kích cả hệ thống công bố các công trình khoa học. “Ở ta thịnh hành kiểu trách nhiệm nguy hại từ một phía sườn, - Anh ta viết. - in một bài báo khoa học sâu sắc hay có điểm gì tranh cãi thì có nghĩa lý gì, vì bài báo ấy anh có thể bị bỏng, anh phải trả lời, còn gạt bài báo ấy đi - chẳng ai truy đến trách nhiệm của anh…”.

“Cuối cùng thì anh chàng cũng đã hiểu ra”. - Minaiev thầm nghĩ. Xét qua mọi điều thì chàng trai, sau những cú bị thâm tím và sưng vù của mình đã sáng mắt ra đôi chút. Không chỉ còn là số phận công trình của riêng mình mà là bản chất của các vật án ngữ nhớp nháp không thể xuyên qua nổi, là anh ta lần đầu tiên đụng phải trong đời, đã làm Olkhovxki phẫn nộ. Sự căm tức đã làm cho ý nghĩ của anh ta chín chắn hơn và sâu sắc hơn. Với một sự ân hận, Minaiev nhận ra trong đó những bốt điện giận dữ và đôi khi tuyệt vọng. Ông chậm trễ trả lời tổng cục, dự tính lúc rỗi rãi sẽ suy nghĩ ra một biện pháp nào đó để giúp Olkhovxki. Cái thính nhạy hình thành được qua năm tháng đã ghìm ông lại không vội vã chống Stroiev. Cần phải tự củng cố, chờ đợi thời cơ… Những kết luận ấy làm Minaiev ngạc nhiên: cuối cùng ông đã trở thành viện trưởng đấy thôi, nhưng tình thế sao chẳng có gì thay đổi cả…

Ở cuộc họp đảng: Olkhovxki xin phát biểu ý kiến và lên tiếng chỉ trích cán bộ chỉ đạo của Thành ủy Loktev vì sự hoàn toàn không hiểu biết tính chất của công trình khoa học, vì “thái độ bàng quan cứng đờ đối với suy nghĩ sống động,… “Thái độ thiếu cân nhắc của Olkhovxki làm Minaiev lo ngại - mọi điều Olkhovxki phát biểu quả là sự thật, tuy nhiên Olkhovxki không tính rằng chính vì sự bất tài của mình mà Loktev sẽ không bỏ qua bất cứ một phát biểu nào chống lại mình mà không trừng phạt. Sớm hay muộn ông ta sẽ tìm ra cơ hội thuận tiện để ngáng chân, rỉ tai loan truyền tin đồn, không từ bỏ một biện pháp nào hết.

Nghe Olkhovxki tấn công một cách không sợ hãi đối thủ rõ ràng cực kỳ mạnh, Minaiev cảm thấy mệt mỏi, thương xót và cảm thông. Thậm chí ông còn húng hắng giọng một cách hậm hực: đáng thương thì đáng thương đấy. Nhưng mà giúp thì hình như chẳng biết cách nào. Trong cuộc đấu tranh của mình, Olkhovxki đã đi quá xa; công khai ủng hộ anh ta - có nghĩa là đi vào mâu thuẫn với nhiều nhân vật có ảnh hưởng. Trong thâm tâm Minaiev ganh tị mạnh mẽ với sự tự do không cần đắn đo của Olkhovxki - mất, anh ta chẳng mất gì, sự tính toán, có lẽ, đối với anh ta là sự hèn nhát, còn sự chịu đựng - là sự yếu đuối.

Sang ngày hôm sau, sau cuộc họp, Minaiev để công văn hỏi và bức thư của Olkhovxki vào cặp hồ sơ “giao cho trợ lý trả lời”. Buổi tối, viên trợ lý, một chàng trai tóc chải mượt với bộ mặt vàng nhợt, đeo mục kỉnh có bộ gọng cũng vàng nhợt như vậy, lẹ làng không tiếng động bước trên đôi giày đế cao su dày, đi vào phòng làm việc và đưa cho ông ký tờ giấy được đánh máy trên tờ mẫu có dấu đỏ của viện. Giọng văn có thiện chí một cách mơ hồ của bức thư trả lời tước bỏ mọi lý do phản bác và giữ quyền kéo dài việc quyết định lâu vô thời hạn.

Minaiev tò mò từ dưới cặp mi mệt mỏi nửa khép nửa mở đưa mắt nhìn bộ mặt trơ trơ của viên trợ lý.

– Ý kiến của anh về Olkhovxki thế nào? Dù sao đi nữa anh ta cũng là một anh chàng có khả năng đấy chứ?

– Vâng, - Viên trợ lý đáp, cúi mái đầu chải mượt mà. - cậu ta có khả năng.

“Thế liệu anh, anh bạn quý mến, anh sẽ viết gì nếu anh cũng ngồi ở ghế của tôi?” - Minaiev muốn cất tiếng hỏi. Nhưng ông đã biết cách đánh giá con người ta và vì thế, giữ nguyên âm điệu câu hỏi, ông nói:

– Bây giờ thì đối với anh chuyện đó rất đơn giản, nhưng nếu như anh ở vào địa vị viện sĩ Stroiev…

Lần đầu tiên Minaiev nhìn thấy viên trợ lý của ông đã trở nên sinh động ra sao và đưa tay chải mái đầu một cách đặc biệt hăng hái, vỗ vỗ vào làn tóc bóng lộn.

– Đồng chí Vlađimir Pakhomovich, tôi hẳn cho đăng không cần đắn đo… Bởi vì một sự tiết kiệm như vậy.

– Thế đấy, vậy tại sao anh lại chuẩn bị cho tôi những câu trả lời như thế này. - Minaiev hỏi nhanh. - Bởi vì cái đó khác với ý kiến của anh kia mà? Tại sao anh lại hành động như nhân vật ngậm miệng thế?

Viên trợ lý chậm rãi, vuốt mạnh mái tóc:

– Tôi viết như đồng chí muốn, để đến một lúc nào đó sẽ viết như tôi cho là cần thiết. - Và anh ta cứng rắn nhìn thẳng vào mắt Minaiev.

– Ô hô! Và anh hy vọng rằng chuyện đó rồi có lúc sẽ xảy ra? - Minaiev mỉm cười một cách tư lự. Rút từ cái cốc nhỏ đựng bút ra cây bút chì to, màu xanh, ông đặt một chữ ký rõ to lên tờ giấy.

Olkhovxki không tìm đến Minaiev một lần nữa. Mấy lần Minaiev gặp anh ta ở hành lang viện. Olkhovxki đi qua, cau có cúi đầu, hai cánh tay dài buông thõng như hai cánh tay người khác. Minaiev cứ có ý muốn giữ anh ta lại, chuyện trò thân mật, khuyên giải đôi điều rằng cần phải biết chịu đựng: sắp tới đây Minaiev sẽ lên dự họp ban cán sự trên bộ, ở đấy sẽ có cơ hội trao đổi với ai đó. Nhưng ông cảm thấy ngay Olkhovxki sẽ không hiểu ông và điều đó thật đáng phiên lòng: Minaiev rất muốn chứng minh rằng ông không có lỗi, rằng quyền hạn của ông rất nhỏ nhoi.

Trước khi lên đường dự cuộc họp ban cán sự trên bộ, Minaiev được gọi lên Thành ủy. Ông biết rằng Loktev đang tìm cách sa thải Olkhovxki. Cuối cùng thì Loktev là ai? Chẳng qua chỉ là một cán bộ chỉ đạo của Thành ủy.

Anh ta lấy quyền gì mà can thiệp vào công việc của ta? Nếu như cần phải sa thải Olkhovxki thì chính tự ta đã làm việc đó. Do đâu mà ta phải dung túng cho cái lòng tự ái độc địa nhỏ mọn của nhân vật này nhỉ? Không đủ rồi, Loktev không phải là thủ trưởng của ta và không phải anh ta được quyền chỉ huy ta. Nếu như bí thư Thành ủy, đó lại là chuyện khác, còn đây chẳng qua chỉ là một cán bộ chỉ đạo! Ta đã qua khỏi cái lứa tuổi ấy rồi, đồng chí Loktev ạ, mà cả hoàn cảnh cũng không phải như trước nữa… Ông sẽ nói như vậy, và hoàn cảnh không phải như trước nữa - rõ hơn bao giờ hết. Ông thầm nhắc lại câu nói cuối cùng - một cách nhiều ngụ ý, với nụ cười khẩy thoảng nhẹ. Xe tiến tới gần tòa nhà của Thành ủy, ông máy móc đưa tay xoa cái cằm cạo nhẵn, sửa lại cà vạt, và lập tức sực nhớ ra, ông bực với chính bản thân mình vì cái cử chỉ quen thuộc ấy. Đủ rồi, đã đến lúc ông có thể cho phép mình giữ nguyên là bản thân mình, ông không thua kém gì các viện trưởng khác. Đặc biệt trong trường hợp này, ông có thể, ông phải đưa Loktev ra ánh sáng. Đặt chân lên lối cầu thang rộng rãi của Thành ủy, đi theo đường hành lang khoáng đạt chạy dài, Minaiev ngửng cao đầu, trong những đường nét bộ mặt nặng nề của ông, thay vào thái độ e dè quen thuộc, xuất hiện vẻ kiên quyết cứng rắn.

* * *

Một giờ sau ông ra khỏi Thành ủy. Mưa bắt đầu lắc rắc rơi. Những hạt nước li ti đây đó rải lên mặt đường nhựa. Minaiev đứng lại hồi lâu bên cạnh xe ô tô. Muôn vàn những vệt ướt hiện lên trên mặt đường nhựa xám. Những hạt nước rơi xuống áo bành tô mùa hè của Minaiev, ông cảm thấy ở đôi vai một cái rùng mình nhẹ.

– Đồng chí Vlađimir Pakhomovich, mời đồng chí vào xe. - Người lái nói.

Minaiev ngửng đầu lên ngạc nhiên nhìn anh ta.

– Anh cứ cho xe đi đi. - Ông nói và đóng sập cửa xe lại.

Chiếc xe ZIL bỏ đi, chỗ nó dừng hiện rõ trên mặt

đường. Minaiev nhìn những hạt mưa bắt đầu in dấu lên cái khung hình chữ nhật khô ráo, sáng sủa.

– Anh cứ cho xe đi đi. - Ông nhắc lại, lắng nghe giọng nói của chính mình.

Ông đi lên phía trước. Ông có đi đâu chăng nữa thì vẫn được coi là tiến lên trước. Ông có thể đi đến quảng trường, có thể rẽ sang đường bờ sông. Điều duy nhất ông không thể làm, đó là quay trở lại Thành ủy. Dù ông có tự thuyết phục mình thế nào đi nữa… Trong đời ông hiếm hoi xảy ra trường hợp khi ông có dịp ngoái nhìn lại chính bản thân mình. Không, không phải điều đó: Về bản thân mình, ông suy nghĩ khá đủ, ông cố nhìn trước mỗi động tác của mình, kiểm tra lời lẽ của mình, nhưng suy nghĩ về chuyện tại sao ông nghĩ thế này, mà không nghĩ thế khác, ông lại không có lúc nào. Bắt đầu câu chuyện tâm lý nặng nề… Cái tháo vát đã được rèn luyện mà cả lúc này đây ông dùng để thu hút bản thân mình thoát khỏi những suy tư nguy hiểm, làm ông thấy dễ chịu.

“Nhưng điều gì đã xảy ra ở Thành ủy kia chứ?” - đột nhiên ông sợ hỏi Loktev thô lỗ và trắng trợn đề nghị chuyển Olkhovxki đến trạm thí nghiệm ở Nicolaiev. Nghe Loktev, ông tự hỏi mình, rằng cái thằng cha học không đến đầu đến đũa, cau có, với bộ mặt chết trôi, vẻ như từ năm cũ này, không bao giờ sáng tạo ra được bất cứ một cái gì và không có khả năng sáng tạo, có quyền gì ngồi ở đây và điều khiển số phận những con người như Olkhovxki? Thậm chí để lấy lệ thôi hắn cũng không thèm hỏi gì về loại động cơ của Stroiev. Điều mấu chốt ở đây là gì? Hắn tin tưởng một cách chắc chắn rằng Minaiev sẽ làm như chính hắn muốn. Hắn lấy ở đâu ra cái đức tự tin tồi tệ ấy? Ở Thành ủy người ta mệnh danh hắn là “cau có - phá” và sợ dây với hắn.

Trên sông, lớp băng cuối cùng đang trôi đi. Đôi chỗ con sông còn trắng xóa, dường như lại đóng băng trở lại. Các tảng băng xô vào hàng cột đá ở chân cầu và nhẹ nhàng tan vỡ, những mảnh băng sắc cạnh, quay tròn, biến đi giữa những trụ cầu. Gập người qua thành cầu, Minaiev nhìn xuống bên dưới. Có cảm giác các tảng băng đứng nguyên tại chỗ, mà chính cái cầu thì chuyển động. Từ mặt nước tối đen, hơi lạnh phả lên, những tảng băng lấp lánh như pha lê, réo lên, tan vỡ biến thành đá và lấp lóa, chìm xuống dòng nước. Cố sức ép mình, Minaiev dứt khỏi thành cầu. Trong ngực ông nổi lên tiếng đập thình thịch, và lập tức ông cảm thấy nóng rực. Bỏ mũ ra, ông đưa ống tay áo quệt mồ hôi. Những hạt nước mưa lạnh thiêu đốt làn da nóng hôi hổi.

Ông cảm thấy mình già nua và vĩnh viễn mệt mỏi rồi. Ông đột nhiên nhìn thấy bản thân mình như từ phía ngoài một người đàn ông héo hon, hói đầu, lọm khọm, lần bước trên cầu, nắm trong tay cái mũ đội đầu. Trời ơi làm sao mà ông nhanh chóng già đi làm vậy? - Điều đó xảy ra từ bao giờ thế? Ông Volođya Minaiev, cây lĩnh xướng của đội đồng ca trường phổ thông, bí thư chi bộ khoa… Ông bỗng thấy kinh hãi: không lẽ ông đã trở thành một ông già?!

Với một sự hiển hiện đáng sợ, Volođya Minaiev hiện ra trước mắt ông. Volođya Minaiev - cặp mắt rực rỡ với cái cổ gà con nảy nảy, dáng hệt như anh ta khi đến cơ sở “Máy móc nông nghiệp”. Anh còn nhớ câu chuyện dính đến hệ thống trục của máy nổ? Có lẽ là bắt đầu từ đó? Ông nhớ. Phụ trách phân xưởng bảo ông: “Minaiev, cậu thò mũi vào còn sớm đấy. Cậu len lỏi đi đâu với những sức lực cỏn con của cậu, nếu chống lại tổng công trình sư kia chứ? Ông ta sẽ chặn mọi đường trong tương lai của cậu. Cậu là cái gì nào? Một anh thợ cả, loại như cậu, người ta nuốt chửng không cần nhai đâu”.

Ông nhớ đến sự bất lực nhục nhã của mình, khi tổng công trình sư, vừa nhắp nhắp cốc trà, vừa nghe những lời đầy hăng hái của ông, rồi nói, gọi trệch họ ông một cách có chủ ý: “Này Linyaiev, anh nghe đây, nếu như anh một lần nữa còn thọc vào với các trò ngu xuẩn này, tôi sẽ ném anh ra khỏi nhà máy. Thôi, đi đi”. Cùng với bạn bè ông còn thử kháng cự nữa, còn đi, còn chứng minh. Mọi chuyện đều vô ích.

Họ có thể tiêu phí vào cuộc đấu tranh vô hy vọng này ba năm… mười năm và chẳng đạt được gì hết. Họ có cả thảy ba người. Thoạt tiên người ta đuổi khỏi nhà máy một, rồi sau đó người thứ hai. Sắp đến lượt Minaiev. Bấy giờ ông làm ra vẻ chịu lép. Ông tự an ủi mình: chuyện này là tạm thời thôi. Đành phải đi đường vòng, trước hết phải đạt được sự tự chủ, được uy tín, rồi sau đó sẽ đánh tan nát bọn quan liêu kia. Nghiến răng chịu đựng, ông đã nhích dần tới đích của mình. Ông được cử làm phó phân xưởng. Ông đã huấn luyện mình biết chịu đựng và im lặng.

Vì cái tương lai kia ông có thể làm cái cần làm. Ông thề với chính mình - chịu đựng mọi chuyện. Ông xu phụ những kẻ ngu dốt đần độn. Ông biểu quyết “ủng hộ” khi lương tâm ông đòi hỏi chống lại. Ông nói những lời mà ông không tin. Ông khen ngợi cái đáng ra phải chửi rủa. Khi trở nên thực sự kinh tởm, ông im lặng. Im lặng - là hình thức tiện lợi nhất của lừa dối. Nó có thể dàn xếp được đối với lương tâm, nó dành cho mình cái quyền khôn khéo được giữ ý kiến riêng và có thể, khi nào đó sẽ nói ra ý kiến ấy. Chỉ có điều không phải ngay bây giờ.

Không phải ở cương vị phân xưởng trưởng và cũng không dành cho phụ trách bộ phận kỹ thuật và càng không dành cho kỹ sư chính của nhà máy. Và càng không phải dành cho anh nghiên cứu sinh đang sắp bảo vệ luận án. Hãy còn sớm, lần nào cũng còn sớm mà! Và danh mục các món nợ của ông cứ dài ra. Cuộc sống sinh ra những tư tưởng mới, đẩy đến trước ông những trở ngại mới. Còn có biết bao nhiêu Olkhovxki như vậy ở lại phía sau!…

Không mệt mỏi, tựa hồ như tổ kiến, ông đã tạo lập tòa nhà địa vị của mình, cố gắng làm cho nó càng bền chắc hơn. Để làm gì? Ông đã đạt được gì? Càng leo lên cao, ông càng còn lại là bản thân mình ít hơn. Ông càng khó khăn hơn trong việc dám liều lĩnh. Cái gì đã cản trở ông? Tại sao những người khác lại có thể làm được?… Tại sao Petrishchev có thể - người ta đã xử trí một cách bất công ông ấy, đã hạ chức, cắt chức, vậy mà ông ấy vẫn luôn luôn đi bừa lên theo con đường của mình và đã chiến thắng?

Không, với ông, với Minaiev, chẳng có gì cản trở cả, chẳng qua chỉ vì ông nhẹ xác hơn. Ông cho là như vậy: nhẹ xác hơn. Vì thế, khi Loktev, vung vẩy bản sao tờ công văn trả lời của ông gửi cho Thành ủy, chê trách ông hai mặt - “anh viết một đàng, anh nghĩ một nẻo, thế nào, anh ra lệnh báo cáo thế nào cho bí thư đây?” - Ông hiểu rằng Loktev chẳng kiêng nể gì cả, hắn có quyền công khai và bây giờ khi cần nhượng bộ, hắn có quyền nhượng bộ, nhẹ như không.

Mọi chuyện Loktev đề nghị, đều đểu giả, đểu giả hết chỗ nói, nhưng Minaiev sửng sốt vì một điều khác - Loktev ít ra đã dám nói thẳng hết những gì hắn muốn.

Loktev và Olkhovxki. Còn tất cả những người khác, có dính dáng đến sự việc này - tất cả đều nghĩ một đàng, mà làm một nẻo. Tất cả, kể từ chính bản thân Minaiev cho đến viên trợ lý của ông. Mỗi người đều đạo đức giả theo một cách, dối trá theo một cách, và có lẽ vì thế mà Loktev có quyền không cần phải dối trá nữa.

“Đê tiện đến thế là cùng!”- Ông căm tức nghĩ thầm, nhìn vào đôi mắt trống rỗng của Loktev. - Phải tống cổ hắn ra khỏi Thành ủy và đưa tất cả những kẻ như hắn ra khỏi Đảng. Một lũ vô lại độc ác. Nếu hắn mà bị tống ra khỏi nơi này thì thậm chí cho đi bán hàng giải khát người ta cũng không thèm nhận”, ông càng căm ghét và khinh bỉ Loktev bao nhiêu, ông khước từ hắn càng ôn hòa hơn bấy nhiêu. Rồi khi Loktev bắt đầu khăng khăng và dọa dẫm, thì ông xin hoãn vấn đề thêm vài ngày. Tỉnh táo đánh giá toàn bộ những điều khó chịu mà Loktev có khả năng gây ra cho ông, ông hy vọng sẽ tìm được sự ủng hộ ở Mátxcơva.

– Có điều anh đừng dây dưa đấy. - Loktev nói khi chia tay. - Chính anh biết rằng Olkhovxki là một gã phá bĩnh. Cần phải làm trong sạch viện, cho bầu không khí thêm lành mạnh.

“Chà, chó đểu thế là cùng” - Minaiev nghĩ bụng và bắt chặt tay Loktev.

Tại Mátxcơva, ở cuộc họp ban cán sự, viện bị khiển trách vì không hoàn thành kế hoạch và mặc dù phần lớn những điều phàn nàn nêu ra lại là lỗi ở bản thân bộ, nhưng không cần thiết phản bác lại, bởi vì người ta coi Minaiev là người mới và mọi điều trách cứ tức thì bị trút lên đầu ban lãnh đạo cũ. Nhưng nhờ vào chiến thuật như vậy, Minaiev lại xin được ngoại tệ để mua thiết bị.

Trong vấn đề lắt léo này, viện sĩ Stroiev lại ủng hộ đề nghị của viện và sau việc đó, Minaiev thấy sẽ bất tiện nếu lại đưa chuyện Olkhovxki ra đây. Sự bề bộn của chuyến công tác Mátxcơva đẩy lùi sự việc này, một sự việc mà ở đây, tại Mátxcơva trở nên nhỏ bé, chẳng đáng kể và chỉ lóe ra trong ký ức ông khi ông đã ở trên tàu, khi Minaiev chỉ còn lại một mình trong toa có giường ngủ gần như trống trải.

Có lẽ lỗi là tại trận mưa. Trận mưa bắt đầu lúc nào không hay, nó phủ lên mặt kính cửa sổ những vệt chéo lấp lánh. Những hạt nước li ti chảy ngoằn ngoèo, thu nạp thêm những hạt nước khác, rồi hòa vào nhau và càng trượt nhanh xuống. Sực nhớ đến lời hứa Loktev, Minaiev thở dài - có lẽ hắn đang gầm gào và lồng lộn ở nhà. Không làm thế nào khác được, đành phải chuyển Olkhovxki đến Nicolaiev vậy. Tạm thời, cho đến lúc bầu máu nóng của hắn nguội đi vậy.

Trên cái nền tối dày đặc của buổi đêm, mặt kính hai lần phản chiếu thân hình nặng nề, mặc bộ quần áo ngủ kẻ sọc màu hồng, bộ mặt húp híp với điếu thuốc lá ở khóe miệng mím chặt cương nghị và còn một bóng khác, mơ hồ hơn tất cả, lẫn trong cái vạch sáng của nước mưa. Khói thuốc lá chạm vào mặt kính lạnh, lan trải ra thành nhiều đường vằn vèo xoắn xuýt, nam nám, dính nháp. Xuyên qua những đường xoắn xuýt ấy, từ trong bóng tối sâu thẳm của cửa sổ, ở bên ngoài toa xe, một anh chàng trẻ tuổi, đội mũ kêpi bị thấm ướt, mặc tấm áo khoác ngoài sờn cũ của thời sinh viên đang nhìn vào Minaiev. Những dòng nước lăn dài trên hai gò má nhợt nhạt, trên cái cổ gà con gầy nhẳng của anh ta.

“Này bố già, vì sao bố già cứ nấn ná mãi thế, còn phải chờ đến bao giờ nữa mới được kia chứ, không lẽ bố già hoàn toàn không phải là một nhân cách nữa sao?”.

– ”À, mà kể ra thì đối với mọi người, bố vẫn là một nhân cách khá chi là quan trọng kia đấy. Tôi có tính đến những bối cảnh hiện thực, dễ dàng đòi hỏi khi còn ở bên dưới”.

– “Bố già hứa sẽ hành động theo ý mình, khi được chuẩn y làm viện trưởng. Sau đó là khi bố già củng cố vững vàng, còn bây giờ…” - “Cứ làm như thể viện trưởng là thượng đế không bằng. Tôi bị trói buộc chân tay. Nếu như tôi làm ở bộ, khi ấy hẳn tôi không bị phụ thuộc vào Loktev, tôi đã có thể…” - Gớm chửa, Loktev, những lời đe dọa của hắn là cái gì kia chứ, cần phải gặp thẳng bí thư thành ủy, cuối cùng thì có thể lên cả trung ương, thì bố già cũng đã có mặt ở đấy kia mà”. - “Và tôi đã làm và đang làm một cách trung thực với hết sức mình. Và với Olkhovxki, mọi chuyện rồi cũng sẽ đâu vào đấy, tôi sẽ đưa anh ta trở về”. - “Bố sẽ không đưa anh ấy về đâu và bố sẽ không bao giờ đưa anh ấy, cái anh chàng Olkhovxki ấy về, nếu anh ta không phải là một Minaiev, không tự biến mình thành một Minaiev, bố đã phản bội cả hai chúng tôi… làm sao tôi có thể tin bố kia chứ?”. - “Mị dân. Ba hoa vô trách nhiệm. Nếu như tôi nhượng bộ lúc này thì việc đó chẳng qua cũng chỉ vì tôi muốn có được cơ hội để ủng hộ không phải chỉ một mình Olkhovxki. Trên vai tôi là cả một viện nghiên cứu lớn, ở đó có hàng chục người như Olkhovxki, những người mà tôi có thể bảo vệ, vì thế tôi không có quyền…”.

Ngoài ra, có thể có một Minaiev thứ ba nữa, một Minaiev vô hình, đang tò mò lắng nghe ông viện trưởng, từ tốn bẻ gãy một cách đầy thuyết phục lý lẽ của chàng trai kia, chứng minh bằng sự kiện hẳn hoi sự tất yếu của những gì đã diễn ra và tựa hồ như để trấn áp anh chàng kia, ông đã hứa hẹn là đứng ra che chở cho Olkhovxki, đưa cậu ta trở về viện, một khi hoàn cảnh cho phép. Ông đã hoàn toàn chân thành, không quanh co, nhưng chàng Minaiev thứ ba vô hình này, thừa biết rằng hoàn cảnh tự nó sẽ chẳng bao giờ đến cả, và trò chơi này sẽ chẳng bao giờ kết thúc.

Từ mai trở đi ông sẽ luôn luôn cố giữ cho được bản sắc của chính mình. Tuy nhiên anh chàng thứ ba, chàng Minaiev vô hình ấy không hề tham gia vào cuộc tranh cãi, không lật tẩy một ai trong hai Minaiev kia, không nói lên một ý kiến nào, vì chàng Minaiev thứ ba này thừa biết rằng ông viện trưởng đã dám hành động đúng như mình muốn và chàng Minaiev vô hình này chính là một Minaiev mà thiên hạ chẳng một ai được hay biết cả. Thôi được, miễn là còn có hắn và hắn không lụi tắt đi là may mắn lắm rồi, ông tự an ủi mình như vậy. Mặc cho thiên hạ ai muốn bóp chết hắn thế nào, tùy thích. Họa có trời biết là trong ông có tới bao nhiêu Minaiev và tại sao họ lại không thể’ hợp nhất lại làm một được.

Những mảng khói uốn éo, lềnh bềnh, bay che khuất gương mặt ướt át ở đằng sau tấm kính và gương mặt đó đã lẩn trốn vào bóng đêm tối mò cùng với quá khứ. Cái quá khứ ấy trốn đi đâu? Điều duy nhất còn lại chỉ là cảm giác chờ đợi, không phải công việc mà chỉ là những niềm mong đợi và hóa ra là tất cả những năm tháng ấy chung quy đều là kết tinh của những chờ đợi triền miên. - Sự chờ đợi triền miên - nhưng chờ đợi cái gì mới được kia chứ? Ông cười khẩy và dụi điếu thuốc lá đi.

Sáng ra, viên trợ lý đón Minaiev trên sân ga. Cẩn thận quấn kỹ lại khăn quàng cổ, Minaiev lắng nghe những tin tức trong viện.

– À này. - Ông hỏi. - Loktev có gọi điện xuống không?

– Có ạ, gọi hai lần.

– Sự thể nó là thế đấy. - Minaiev buông thõng một câu.

Hai người chậm rãi bước đi trong đám đông trên sân ga ẩm ướt, họ đi qua toa tàu mà Minaiev vừa rời đó xuống. Những tấm kính bụi bặm của toa xe không phản chiếu một hình ảnh nào hết. Qua tấm kính tối mò chỉ nhìn thấy tấm vải trải giường nhàu nhờ, cái gạt tàn bẩn thỉu, đầy những mẩu thuốc vứt đi.', N'Ý Kiến Riêng', N'y-kien-rieng')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 13, N'Tổng thống nước Cộng hòa có chủ quyền Pôgôrelôvô nguyên là Chủ tịch Xô viết xã Gôrôlôxki gọi viên quản trị đến để anh ta tường trình về tình hình trong đất nước theo thường lệ mỗi sáng.

Tổng thống thực hiện sự nghiêm túc muốn biết:

– Có những vấn đề gì nào?

– Vê nguyên tắc, mọi chuyện đều ổn cả, thưa đồng… à thưa ngài Tổng thống. Kể ra thì cũng có hai đơn thỉnh nguyện không quan trọng gì của dân chúng gửi đến… Cô thợ vắt sữa Pixtôletôva muốn đòi tiên trợ cấp của chồng. Nhưng chồng cô, thằng đểu, tháng trước đã chuồn sang nước Cộng hòa Nêelôpxki, mà giữa chúng ta và họ còn chưa có hiệp định.

– Anh đã giải thích cho cô ta về tình huống chính trị chưa? - Tổng thống hỏi.

– Tôi cũng đã thử, - Xiđôrốp thở dài. - nhưng đàn bà vẫn chỉ là đàn bà, không chịu hiểu thế nào là tình huống chính trị. Cô ta chỉ biết có khóc rống lên và lải nhải đòi tiên trợ cấp.

– Anh đưa tờ thỉnh nguyện ấy đây. - Tổng thống nói. - Để tôi đích thân nói chuyện với cô ấy. Còn gì nữa?

– Bác gác rừng Mitka Trepunốp phản đối việc xây dựng nhà vệ sinh công cộng trên bãi cỏ. Bác ta bảo chỗ ấy là nơi ong mật đi lấy mật hoa.

– Quân kém giác ngộ. - Tổng thống nói. - Ngày hôm nay tôi sẽ ra lệnh cho Bộ trưởng an ninh Kôpchenlức tiến hành công tác giải tỏa. Cần phải xua đuổi lũ ong ra khỏi nơi ấy, và không được chậm trễ. Vì cái lũ ong của anh ta mà công tước Neurôgiaikinxki vừa gửi công hàm phản đối tới tôi. Ong của chúng ta, anh biết không, thường xuyên đốt phu nhân yêu quý của ông ta… Quân đểu, hắn dọa sẽ tuyên chiến với chúng ta.

– Hắn là hắn làm thật đấy. - Xiđôrốp khẳng định. - Tuần trước hắn đã tập kích vương quốc Đưrkôvô Bublikôpxkaia, mà lại vào đêm khuya. Hắn đã cướp đi hai xe tải chở tấm lợp fibrô xi măng. Bây giờ hắn đem lợp nhà tắm hơi của hắn…

– Còn dân chúng, vẫn cứ khổ sở như mọi khi à?- Tổng thống quan tâm hỏi.

– Vẫn khổ sở. - Người điều hành khẳng định. - Công tước vừa ban bố phiếu mua giày “Snika” và máy vi tính Hàn Quốc. Nhân tiện, phải nói là chính ông ta bí mật buôn bán thứ hàng đó. Hoặc là lại đem đổi lấy ủng dạ với nước Cộng hòa Razuvaepxki..

– Phải, dân Razuvaepxki có thừa thãi cái của quý ấy mà. - Tổng thống bật cười hề hề.

– Bọn độc quyền, quỷ tha ma bắt chúng… Tôi nghĩ, ta cần cử đoàn đại biểu sang đó. Mùa đông đã sắp đến rồi, mà công dân của chúng ta chân chỉ xỏ mỗi loại giày “Lemônchi”.

– Ngày mai một vị khách sẽ đến thăm ta. Một cuộc thăm viếng hữu nghị chính thức. - Viên quản trị nói.

– Ai nữa thế?

– Petrôvits, người hàng xóm của chúng ta… Hoàng thân xứ Zaplatinxki.

– Hắn đã là hoàng thân ư? - Tổng thống ngạc nhiên đến mức bật ra một tiếng huýt sáo. - Thế kia đấy. Vậy mà hồi trẻ thì đã cùng nhau nốc vốtca mới lại đi săn đuổi cánh đàn bà!… Biết làm sao được, đành phải tiếp đón thôi. Theo đúng mọi thể thức quốc tế. Mà thế nào nhỉ, đã khâu xong cờ chưa?

– Khâu xong rồi…

– Thật phúc đức, cầu Thượng đế! - Tổng thống đưa tay làm dấu thánh. - Chứ không thì thật xấu hổ: một cường quốc, vậy mà đến giờ vẫn không có cờ. Còn quốc thiều đã viết xong chưa?

– Về chuyện quốc thiều có rắc rối đấy. Ôpuskin khăng khăng từ chối viết, ông ta bảo, niềm cảm hứng bay biến mất cả rồi. Ôxenhin thì vừa bỏ về Tổ quốc cố cựu của mình mất rồi.

– Anh ta là người như thế nào, Do Thái ư? - Tổng thống ngạc nhiên.

– Không đâu… Dân Nga gốc. Sinh ra ở vương quốc Tver.

– Đáng ra không nên cho xuất ngoại. - Tổng thống nói, nhíu cặp lông mày. - Ngay hôm nay hãy thay mặt tôi nhắc chủ tịch Nghị viện rằng không được trì hoãn việc thông qua luật cấm xuất ngoại. Chứ không rồi dân chúng bỏ chạy tán loạn hết. Nhân tiện cho hỏi, ngoài hai nhà thơ kia, chẳng lẽ chúng ta không còn ai làm thơ ư?

Viên quản trị buồn bã lắc đầu.

– Thôi được. - Tổng thống gật gù. - Cử hành quốc thiêu không lời. Petrôvits sẽ cho qua, hắn cũng chẳng phải ghê gớm gì cho lắm. Hơn thế nữa, năm ngoái, dựa vào tình bạn cũ hắn còn mượn chiếc máy kéo và cho đến nay chưa trả đấy.

– Cần phải nhắc cho ông ta nhớ trả, nếu không chúng ta phải tuyên chiến thôi!…

– Không được. - Tổng thống thở dài. - Dù sao đi nữa cũng là chỗ bạn cũ, đã từng một thời cùng chạy theo gái với nhau… Ngoài ra, chúng ta lại đang nhập khẩu cá trích của anh ta.

– Nhưng dân Zaplatinxki lấy đâu ra cá trích?

– Họ đã ký hiệp định biệt đãi với người Thụy Điển.

– Thế thì sao? - Viên quản trị không hiểu nổi. - Thì ngài cứ bảo với ông ta là nếu không trả lại chiếc máy kéo, thì ông ta sẽ không nhận được chuối.

– Nhưng chúng ta lấy đâu ra chuối? - Tổng thống ngạc nhiên, để rớt mất điếu “Kemel” từ miệng.

– Chà, phải, tôi quên báo cáo… - Viên quản trị ôm đầu. - Bộ trưởng thương mại của chúng ta vừa ở Cuba về, ở đấy ông ta đã ký hiệp định với Fiđen!…

Vậy thì hiểu rồi, vì sao mà bỗng nhiên Petrôvits lại tìm đường sang thăm ta… Quân đểu, tình báo của hắn làm việc khá đấy chứ! Thôi được, anh Xiđôrốp thân mến, cần chuẩn bị cho buổi đón tiếp ngày mai. Một cuộc thăm viếng nghiêm túc, quan trọng. Anh ngồi ở đây một lát làm nhiệm vụ phó tổng thống, còn tôi đến kho kiểm tra xem có kẻ nào xoáy mất cờ không. Cái bọn đàn bà ấy là bao giờ chả thiếu vải.', N'Buổi Sáng Của Ngài Tổng Thống', N'buoi-sang-cua-ngai-tong-thong')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 14, N'Đôi khi quá khứ đan kết với hiện tại hay, nếu các bạn muốn nói khác, hiện tại đan kết với quá khứ một cách thật hết sức lạ lùng. Có khi chúng ta buộc phải chia ly với những con người mà ta không muốn chia ly, nhưng có khi… có khi ta phải gặp lại những kẻ thù mà ta không thể chịu nổi và thậm chí gặp lại những kẻ mà ta coi như đã chết. Chuyện ấy thêm một lần nữa khẳng định chân lý rằng không phải mọi cái trong cuộc sống đều theo quy luật và sự ngẫu nhiên đóng một vai trò không nhỏ trong đó.

Chẳng hạn, do sự ngẫu nhiên như vậy mà tôi đã phải nhiều lần gặp lại một kẻ khó chịu nhất trần đời. Dốc mọi sức lực tôi cố gắng tránh hắn, nhưng hắn vẫn cứ xuất hiện lại trên con đường đời của tôi. Một lần tôi thậm chí đã nhìn thấy xác hắn, nhưng gần một phần tư thế kỷ sau tôi lại chạm trán, mặt giáp mặt với con người ấy và trong những hoàn cảnh khá là lý thú. Tuy nhiên, tôi xin kể chuyện cho có đầu có đuôi…

Hồi thanh niên tôi bị mắc một chứng bệnh gì bí hiểm. Nói thật ra thì cho đến bây giờ tôi cũng vẫn chưa biết cái bệnh ấy là bệnh gì. Một trong các bác sĩ đã tìm ra là tôi viêm ruột thừa, có nghĩa là viêm mấu hình giun của manh tràng và người ta đã mổ cho tôi. Nhưng tôi vẫn đau đớn như cũ. Ông thầy thuốc khác cho rằng tôi có sỏi trong thận, ông đã lấy ra được một hòn trong số đó. Nhưng tôi vẫn ốm.

Ông đốc tờ thứ ba, gọi hai vị trước là những tên lái ngựa, chẩn đoán là tôi loét tá tràng. Người ta cắt chỗ ấy đi mất một nửa, và tôi vẫn lại chẳng thấy hơn gì. Tôi gầy mòn vì những cuộc mổ xẻ, vì vậy người ta gửi tôi đến nhà an dưỡng để phục hồi cái sức khỏe đã bị rệu rạo.

Và… sự thể trở nên ổn. Ở đấy người ta không dọa dẫm tôi phải cắt bỏ, lấy ra, làm ngắn bộ phận nào đó trong cơ thể. Tôi sống lặng lẽ, bình yên, lấy lại được niềm tin vào cuộc sống. Nhưng đến lúc ấy thì thật là bất hạnh, lại xảy ra một việc phá đi mất tình trạng cân bằng về tinh thần của tôi.

Vào một ngày đẹp trời, một người đàn ông trẻ trung, mặc bộ lễ phục cấp đại tá đến nhà nghỉ. Người ta xếp ông ấy bên cạnh tôi. Qua bức vách ngăn mỏng manh tôi nghe rành rọt mọi chuyện ông ta đùa giỡn với cô y tá của chúng tôi như thế nào, tuôn ra những câu bông đùa nhà binh tục tĩu và cười bằng cái cười nghe khó chịu. Còn khi một mình, ông ta đi đi lại lại từ góc này đến góc kia bằng những bước chân người lính chắc nịch, rống lên hát đi hát lại một bài.

Chẳng bao lâu sau tôi đã thuộc lòng cả lời bài hát ấy và thậm chí bây giờ tôi còn có thể nhắc lại không hề vấp.

Nếu như trái tim tràn đầy dũng cảm

Nếu như anh không sợ hãi kẻ thù

Nếu như bao giờ cũng sẵn sàng lưỡi kiếm

Nếu như bao giờ cũng sẵn sàng xung trận

Nếu như trung thành vô hạn với quê hương

Và bao giờ cũng kịp đến xả thân

Có nghĩa là anh là con người đáng tin và chung thủy

Có nghĩa là, anh là người Látvia chân chính

Có nghĩa là, anh là người Látvia chân chính…

Và chính vì “người Látvia chân chính” ấy mà tôi phải trải qua không phải chỉ một phút buồn rầu. Sự thể ở đây không chỉ vì bài hát và những cuộc hành binh náo động của ông ta. Tôi hẳn trốn tránh được những điều đó một cách khá là đơn giản: tôi chỉ việc lấy bông thút nút chặt hai lỗ tai. Điều khủng khiếp nhất bắt đầu vào ban đêm, khi người hàng xóm của tôi ở nhà ăn trở về, tuôn ra những thanh huyền của mình đến tột độ và rền vang một thứ giống như chiếc côngtrơbát sai điệu. Trong những trường hợp như thế ông ta thường quên cả lời lẫn giai điệu, mà vì thế chỉ đơn giản rống lên ư ử, cuối cùng dốc toàn lực nhấn mạnh vào câu kết thúc: “Có nghĩa là anh là người Látvia chân chính, có nghĩa là anh là người Látvia chân chính”.

Nhưng vì lẽ công bằng cũng phải nói là ông đại tá của tôi mau chóng mệt, hoàn toàn như một người trần tục bình thường và khi ấy ông ta nằm vật ra giường, cái giường rên lên thảm thiết dưới sức nặng của ông ta. Còn tôi, thở phào nhẹ nhõm, chìm đắm vào những cơn ác mộng.

Nhưng ngay cả thời gian tạm nghỉ như vậy kéo dài cũng không được lâu. Tôi bị đánh thức dậy bởi những âm thanh lạ lùng, rất mạnh, vang từ bên kia vách ngăn mỏng sang: ở bên đó có gì đó gầm gừ thở phì phì, rít lên. Có cảm giác vừa có một cái máy bay bị tai nạn bay lạc vào buồng của người hàng xóm hay một chiếc ô tô thời thượng cổ lăn bánh vào đấy chăng.

Tôi nhét bông vào lỗ tai và trùm kín đầu. Nhưng đều vô ích. Tiếng phì phì và tiếng rống mỗi lúc một thêm to. Tôi còn đang tìm một cách hiệu quả thoát khỏi cái tình trạng vừa nảy sinh ấy thì đột nhiên viên đại tá bị tiếng ngáy của chính mình đánh thức, bắt đầu trăn trở trên giường. Sau đó những quả đấm của ông ta thụi vào bức vách ngăn rung lên.

– Ông cần gì vậy? - Tôi vội lên tiếng đáp.

– Ông đừng có mà ngáy thế nữa! - Viên đại tá rống lên bên kia bức vách. - Và đừng có làm tôi thức dậy.

– Không thể như thế được, - Tôi rụt rè bác lại. - tôi không có thói quen ngáy trong khi ngủ.

Người hàng xóm của tôi bập môi bực bội:

– Thế có ai lại nghe tiếng ngáy của chính mình kia chứ? - Ông ta thốt lên và ngay tức khắc chuyển sang “anh”, bắt đầu nghiêm khắc quát mắng tôi, hệt như đối với một người lính dưới quyền. - Anh phải bỏ cái thói quen ngu ngốc ấy đi. Với cái thói quen ấy làm sao anh đánh nhau được? Ngay từ xa kẻ thù đã nghe tiếng trung đoàn của anh bố trí ngủ đêm ở đâu, sẽ cho bao vây và tiêu diệt. Ghi nhớ cho kỹ. Người lính có thói ngáy, khi đi ngủ ở nơi sát nách địch nhất thiết phải nằm nghiêng bên phải để không đè lên tim. Còn mũ sắt và túi dết cấm không được đem gối đầu. Những thứ đó phải ở ngay dưới tay để người bên cạnh bất cứ lúc nào cũng có thể dùng chúng mà bịt họng anh lại khi anh ngáy quá to.

– Nhưng tôi không có mũ. - Tôi nói chêm vào.

– Sao lại không có? Để mất đâu rồi? - Viên đại tá quát to. - Ngay ngày mai lập tức phải báo cáo với đại đội trưởng rằng vì đánh mất mũ sắt, đại tá Giagata phạt tống giam anh hai ngày hai đêm. Anh sẽ ngồi tù khi hết hạn tập luyện. Rõ không?

– Rõ, thưa ngài đại tá. - Tôi trả lời theo kiểu quân sự, hy vọng như vậy sẽ làm yên lòng ông ta. - Hai ngày hai đêm ngồi nhà cải hối khi hết hạn luyện tập.

– Như vậy, như vậy đó. - Từ bên kia vách ngăn vọng sang. - Và cấm không một âm thanh nào nữa. Tôi là tống vào xà lim biệt lập đấy!

Ở buồng bên ấy mọi cái đã lắng im, nhưng chỉ lát sau ở đấy đã nổi lên tiếng chiếc máy bay bị tai nạn. Còn tôi run rẩy vì sợ, chờ đợi phải nhận những lời quở mắng mới và nóng lòng nóng ruột mong cho trời sáng để sau bữa ăn sáng sẽ đi vào cánh rừng nhỏ đánh một giấc ngủ cho đã.

Sáng hôm sau, viên đại tá ở khách sạn trở về và sau khi trình diễn tiết mục độc tấu thường lệ của mình, liền đi nằm ngủ, mọi cái lại bắt đầu từ đầu. Sự khác biệt chỉ ở chỗ bấy giờ ông ta không đấm vào vách ngăn mà đấm vào cửa ra vào. Khi tôi ra mở cửa, viên đại tá mặc bộ quần áo ngủ nhàu nhịt tức tối xộc vào buồng tôi. Đưa mắt nhìn bao quát đôi chân trần run rẩy của tôi, ông ta ra lệnh:

– Che cái của nợ ấy lại!

Tôi vật vã mặc quần dài và đứng theo tư thế nghiêm.

– Lại không cho người ta ngủ? - Ông ta nói nhanh ẩn giấu sự đe dọa. - Lại ngáy hả? Thế nào, anh định báo cho quân địch chỗ đóng quân của bên ta hả?

– Nhưng tôi đâu có ngáy thưa ngài đại tá. - Tôi cãi lại.

– Thế kia đấy! - Ông ta quát ầm lên. - Người ta bắt quả tang, mà còn chối cãi. Anh làm sao, muốn kẻ thù tiêu diệt nát trung đoàn của ta hả? Ta mà biết trước thì ta đưa anh về đội nhạc hơi của trung đoàn. Ở đó thì cứ việc ngáy suốt từ sáng đến tối. Nhưng một khi anh là lính, anh phải phục tùng kỷ luật, hiểu chưa? Nếu không ta sẽ đưa anh như một tên phản bội ra tòa án binh. Ngáy ở trong quân đội cũng chính là phản bội.

– Nhưng thưa ngài đại tá… - Tôi lại toan cãi lại.

Nhưng Giagata rút khẩu súng ngắn trong túi áo ngủ ra và gí vào dưới mũi tôi.

– Câm miệng!… - Ông ta quát. - Chứ không ta sẽ gửi anh sang thế giới bên kia không cần tòa án binh gì nữa. Khi người lính không thi hành mệnh lệnh, chỉ huy có quyền bắn tại chỗ, hiểu không? Thấy ngay là anh coi thường kỷ luật mà. Tìm thấy mũ sắt chưa?

– Nhưng mà tôi làm gì có kia chứ! - Tôi lắp bắp.

– Sao lại không có? - Đại tá Giagata ngạc nhiên, vẫn cầm súng nhằm vào tôi. - Anh hãy chuyển lệnh ta sáng mai đại đội trưởng phải lên gặp ta mang theo sổ quân trang. Ta sẽ đích thân kiểm tra và liệu đó, nếu mà nói láo thì… - Ông ta vừa nói vừa huơ huơ khẩu súng ngắn. - Còn bây giờ đi đến buồng đầu nhà và sao cho không có một tiếng động nào nữa! Rõ chưa? Không một tiếng động…

Cất khẩu súng ngắn vào túi áo ngủ, ông ta bỏ đi, sập mạnh cửa lại. Còn tôi, thở không ra hơi, vội mặc quần áo, thu nhặt đồ đạc và rón rén trên đầu ngón chân đi ra ngoài đường. Khi đi được tới nhà ga, tôi có cảm giác như tôi vừa thoát được khỏi giá treo cổ.

Đến đây có thể đã kết thúc câu chuyện nếu như chúng tôi không gặp lại nhau và không phải chỉ một lần. Lần đầu tiên xảy ra sau chuyện nhà nghỉ tại các khóa tập trung quân sự mùa hè mà tôi bị gọi đi. Chỉ huy trại hóa ra là đại tá Giagata. Tôi cố tránh mặt ông ta nhưng ông ta vẫn nhận ra tôi. Một lần vào buổi tối, ông ta gọi tôi tới gặp và lần này gọi tôi bằng “ông”, hỏi tôi:

– Hình như chúng ta có quen nhau thì phải?

– Đúng như vậy ạ, thưa ngài đại tá.

– Như vậy là, ông đào ngũ?

– Thưa, sự thể nó là thế, thưa ngài đại tá? - Tôi trả lời, cho rằng viên chỉ huy đùa. Nhưng đôi mắt ông ta lóe lên ánh sáng hung dữ.

– Thế ông có biết vì tội ấy sẽ bị sao không?

Tôi cố giữ sao cho đây vẫn là chuyện đùa, và vì thế mỉm cười nhận xét:

– Thưa ngài đại tá, nhưng tôi đã đào ngũ không phải từ quân đội, mà từ nhà nghỉ.

– Không có gì khác nhau cả! - Ông ta quát. - Kẻ đào ngũ có khả năng bỏ chạy bất cứ từ đâu. Tối hôm qua đã có ba tên đào ngũ khỏi trại và tôi cho rằng, đó là theo gương ông.

– Xin thề có Chúa, tôi chẳng dính dáng gì ở đây, thưa ngài đại tá.

– Thôi được, lần này thì tôi tin. - Viên đại tá nói một cách ảm đạm. - Còn chuyện ngáy của ông thế nào?

Thái độ hồn hậu của viên đại tá khuyến khích tôi, thế là tôi mạnh dạn kể lại chuyện như trên thực tế có thật, viên đại tá tím mặt lại tức tối.

– Anh nói láo! - Ông quát to. - Trong đời ta chưa hề ngáy. Nếu không từ lâu ta đã bay khỏi hàng ngũ sĩ quan. Ngáy - đó là đồ lợn, là phản bội. Vì tội thóa mạ chỉ huy - phạt ba ngày nhà cải hối! Đằng sau… quay!

Ông ta hô khẩu lệnh:

– Đến nhà cải hối… bước!

Nện rõ từng bước chân, tôi đi tới phòng giam. Hết hạn ba ngày, như một kẻ có vết chính trị, tôi bị chuyển tới đại đội phạt và vì thế không còn liên quan đến đại tá Giagata nữa, tuy nhiên về sau đường chúng tôi đi lại gặp nhau.

Khi bọn phát xít tiến công vào nước Látvia Xô viết, tôi chỉ huy một đơn vị những người tình nguyện tiến hành cuộc đấu tranh chống bọn thổ phỉ và biệt kích ở hậu phương của chúng ta. Và sau một lần đụng độ ở gần biên giới Extônia, trên lề rừng còn lại xác mấy tên thổ phỉ bị quân ta bắn chết. Một người trong bọn chúng khiến tôi nhận ra: đó là đại tá Giagata. Bên cạnh xác của hắn lăn lóc đôi ủng láng bóng: rõ ràng là viên đại tá đã tháo ra trước đó để chạy được gọn hơn.

Chúng tôi không có thời gian bận tâm tới hắn, phải lao đi tóm bắt những tên thổ phỉ còn lại đang còn trốn trong rừng. Tưởng là đến đây thì tôi có thể tin chắc mà xóa bỏ tên Giagata ra khỏi đầu óc nếu như trong thời gian đi thăm miền Nam nước Pháp mới đây, chính xác hơn là ở Nixơ, hắn lại không hiện ra trước tôi. Và chuyện ấy xảy ra như thế này.

Tôi dừng chân lại khách sạn Anbéc, cửa sổ của khách sạn nhìn ra quang cảnh tuyệt vời, chỗ dạo chơi tràn ngập ánh sáng. Tuy nhiên tối hôm ấy tôi không màng gì đến vẻ đẹp và quang cảnh. Đi đường mệt mỏi, tôi đi ngủ sớm. Nhưng tôi chỉ vừa chìm vào giấc ngủ lơ mơ thì bên kia tường vang lên tiếng ngáy ầm ầm, dường như có ai đó cố công một cách vô hiệu quả nổ máy chiếc máy bay. Đột nhiên tiếng ngáy chấm dứt, tiếng giường cọt kẹt, và qua một phút người ta gõ cửa buồng tôi. Tôi trở dậy ra mở cửa và thấy bên ngưỡng cửa là một lão già khô khẳng mặc áo véttông. Tay trái lão không còn, con mắt phải của lão được che bằng mảnh băng đen, với cái cúi chào lịch sự, lão xin lỗi vì đã đến làm phiền, rồi nói:

– Mơxiơ, ông có thể se sẽ một chút ít được không?…

– Không lẽ tôi làm ồn? - Tôi hỏi, nhún vai.

– Biết nói thế nào với ông. - Lão già nói nhanh, luôn vấp. - Ông ngáy, và cứ ngáy to đến mức tôi phải tỉnh lại. Xin lỗi ông, nhưng điều đó đúng như vậy.

Tôi nổi nóng. “Lại một tên mất trí nữa” - tôi nghĩ bụng. Nếu như chính mắt tôi không nhìn thấy xác tên Giagata thì có lẽ tôi quyết định ngay là đứng trước tôi đây phải là hắn. Nhưng ngược lại với những hy vọng của chúng ta, những người chết đâu có sống lại. Và vì thế tôi cố trấn tĩnh và với khả năng có thè,, tôi trả lời người lạ này một cách lịch thiệp:

– Mơxiơ thân mến, nếu như có người nào đó ngáy thì đấy hẳn chỉ là ông.

– Nhưng chính tôi đến phàn nàn ông chứ không phải ông đến tôi.

– Cái đó chẳng có nghĩa là gì hết, - Tôi nói, bất giác cười khẩy. - trước đây tôi có biết viên đại tá Giagata.

Người khách lạ mở to con mắt độc nhỡn của mình.

– Ông biết tôi ư?

– Không - ông, - Tôi nói một cách thiếu tự tin. - không lẽ…

– Đúng. Tôi là Giagata mà. Trước kia tôi là đại tá trong thời gian chiến tranh, phục vụ trong các đơn vị SS, chỉ huy trung đoàn. Đã được tặng thưởng chữ thập sắt và các huân chương khác. Và vì thế tôi hết sức yêu cầu ông…

– Nhưng sao lại như vậy nhỉ! - Tôi thốt lên. - Bởi vì ông đã chết ngay trong những ngày đầu chiến tranh kia mà.

– À, ra chuyện ấy! - Lão dài giọng. - Đấy chẳng qua chỉ là cái mẹo thôi. - Và bật ra tiếng cười khí khí đểu giả, lão tiếp. - Mẹo quân sự mà! Còn ông có biết kẻ nào phản bội chúng tôi khi đó không. Một trong những tên ngáy đêm đấy. Cũng như ông ấy. Vì thế, tôi đã trừ khử cả bọn chúng như những tên phản bội.

– Nhưng dù sao đi nữa ông vẫn là xác chết. - Tôi bình tĩnh nói với lão. - Chuyện gì mà ông lại ngủ ở khách sạn nhỉ. Ông đi ra nghĩa địa đi! Chỗ của ông là ở đấy.

Và không còn lịch sự gì thêm nữa, tôi đuổi lão ra khỏi cửa. Nhưng viên chỉ huy đội SS cũng chẳng nghĩ tới chuyện đi ra nghĩa địa nào. Lão bỏ về buồng mình, và lát sau từ đó lại vọng sang tiếng ngáy.', N'Đại Tá Giagata', N'dai-ta-giagata')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 15, N'Dakiya đã lấy đầy hai xô nước lạnh, nhưng vẫn dùng dằng chưa muốn rời khỏi mạch nước mát rợi. Cô gái vừa đi làm đồng về, người còn hừng hực vì cái oi bức ngoài đồng ruộng và công việc vất vả mà ở đây thì lại mát mẻ dễ chịu làm sao.

Rửa ráy xong, Dakiya lấy gương ra soi. Đến khi cô sửa soạn ra về, đã toan nhấc đòn gánh lên vai, thì đột nhiên như thể từ dưới đất chui lên, một chàng trai hiện ra trước mặt cô.

– Xe tôi và tôi đều khát cả. Có thể xin cô một ngụm nước không đây? - Chẳng đợi cô gái có bằng lòng hay không, anh ta kề ngay miệng vào thành xô mà uống ừng ực.

– Không chuẩn bị cho đủ nước mà cũng gọi là lái xe kia đấy. - Dakiya làm ra bộ nghiêm nghị cự nự!

Khi đã uống thỏa thuê, anh chàng lái xe mới ngẩng lên nhìn cô gái. Anh ta to lớn, vạm vỡ, trên người mặc quần áo may liền bạc màu. Trông người mới khỏe mạnh và dồi dào nghị lực làm sao!

– Đâu rồi sẽ có đó! Uống một ngụm xin trả cô cả một xô! - Chàng trai nói đùa lại, phô hai hàm răng trắng đều đặn.

Anh hất đầu về phía đường cái, cách mạch nước chừng bốn năm chục thước, chiếc xe ô tô tải của anh vẫn nổ máy đứng ở đó.

– Đã là chuyến thứ hai trong ngày rồi đấy. Cô bạn yêu quý, cho xe đi đến lử người thì khát là phải chứ. - Anh ta nói tiếp như để tự bào chữa.

Kể ra thì chẳng có gì còn đáng nói nữa: nước đã uống rồi - thế là xong. Chẳng qua anh chàng muốn bắt chuyện với cô gái mà thôi.

Đến lúc đó có thêm hai chiếc xe tải nữa chạy tới chỗ chiếc xe vẫn đứng nổ máy. Dakiya nhấc đòn gánh với đôi xô nước trên vai và ra về. Đi được mấy bước cô ngoái lại:

– Các anh có thể cho xe đi đường thẳng, không phải vòng qua làng chúng tôi kia mà.

Không biết có phải vì cô gái vội bỏ đi hay vì ngày hôm nay quá nóng, mà anh chàng lái xe đột nhiên cáu kỉnh.

– Thì trước hết nông trường cô hãy sửa sang lại cây cầu qua khe Gấu của mình đi đã, rồi hãy đi dạy bảo người khác! Hiểu chứ? Thế mà cũng gọi là nông trường “con đường thẳng tiến” kia đấy. Vì “thẳng tiến” của cô mà trời nóng nực thế này phải đánh xe đi vòng tới hai cây số đường!

Dakiya leo lên dốc núi với vẻ mặt thản nhiên như thể những lời của chàng trai vừa nói không hê đụng chạm tới cô. Nhưng lên hết dốc, Dakiya không ghìm được mà phải ngoái lại. Và cô thầm tự hỏi: “Ờ mà những lời ấy can hệ gì đến ta không nhỉ?”

Ở dưới kia những người lái xe xách xô đi đi lại lại giữa chỗ xe đỗ và mạch nước. Dakiya nhận ra được anh chàng lái xe đầu tiên, cao lớn, có cặp mắt đen láy như anh đào chín và mái tóc bồng, người mà xét về mọi dấu hiệu thì lúc đó muốn nói điều gì đẹp đẽ với cô, nhưng lại ném ra những lời chẳng lấy gì làm dễ nghe cho lắm về nông trường “con đường thẳng tiến” của cô.

* * *

Cây cầu.

Nói cho đúng thì đó nào phải là cầu, mà chỉ là một bè gỗ gồm bảy tám thân cây ghép lại dựa trên bốn thân cột bắc ngang qua khe Gấu cách làng Kaenxa độ một cây số. Cho đến gần đây nó vẫn phục vụ đắc lực cho người ta: xe ngựa và xe ô tô tải chở thóc từ các nông trường quanh vùng lên kho của khu vẫn đi theo con đường thẳng, không phải qua làng Kaenxa. Một mặt như vậy rút ngắn được đường đi, mặt khác xe cộ lại tránh không phải leo cái dốc “chết tiệt” ở giữa làng. Nhưng cách đây một tuần, trời đổ mưa rào tầm tã và nước lũ dồn về đã cuốn trôi mất mặt cầu. Từ đó xe cộ phải đi đường vòng qua làng Kaenxa.

Đúng là anh chàng lái xe có đầy đủ lý do để’ bực bội: đã một tuần nay đội sản xuất của Dakiya làm ở gần cầu, hàng ngày mấy lần qua lại bên cầu vậy mà không hiểu tại sao trong đội sản xuất của cô lại không có ai nghĩ đến chuyện phải lên tiếng đề nghị sửa chữa cầu. Vì thế những người hoàn toàn xa lạ kia mới buông ra được những lời chê trách cái nông trường vốn bấy nay vẫn là một nông trường tiên tiến.

Tối hôm ấy Dakiya đến ngay ban quản trị để đề đạt ý kiến về cây cầu qua khe Gấu. Nhưng vừa nghe Dakiya nói chưa dứt, ông chủ tịch ban quản trị nông trường đã gạt đi. Ông cho đó là chuyện không đáng kể.

– Mà đấy cũng có phải là việc của các cô phải lo đâu kia chứ!

Tất nhiên Dakiya không chịu:

– Thì cháu cũng có đi xin việc của người khác đâu, thưa bác Giarif. Không có việc ấy chúng cháu cũng đã bận túi bụi rồi!

– Ừ, nếu công việc túi bụi rồi thì đi mà làm cho xong đi, vậy thôi nhé. - Ông chủ tịch buông một câu, một lần nữa cho biết rằng vấn đề thế là chấm dứt. Nhưng để cho thêm quan trọng ông còn nói. - Mà cô bé xinh đẹp ơi, thêm nữa tìm đến tôi là cô đã gõ cửa nhầm rồi đấy. Tại sao cô quên Xô viết thôn, quên ông chủ tịch Xô viết Galimgiamốp? Mọi chuyện cầu cống hay bờ rào bờ dậu, nếu như cô muốn biết thì đều nằm trong dự trù chi tiêu của Xô viết thôn kia.

Những điều tinh tế như vậy quả thực Dakiya nào có rõ, cô cảm thấy ít nhiều bối rối. Tuy nhiên cô vẫn không chịu, cô bắt đầu thấy bực - cái ông chủ tịch nông trường này lại muốn đem cất việc cô nêu ra vào trong tủ kín đây!

– Bác Giarif, vấn đề không phải liên can đến riêng cháu hay riêng bác, mà đến cả nông trường của chúng ta. Bọn các anh lái xe đang chửi bới cả làng chúng ta, nông trường chúng ta đấy. Nếu việc cần phải đến nói với bác Galimgiamốp, cháu sẽ đi nói chứ có gì đáng ngại!

– Ái chà chà! - Ông chủ tịch thốt lên, cảm thấy rằng cô gái tuổi mười bảy này không chịu buông tha ông chừng nào chửa đạt được ý mình.

– Thì cháu thử nghĩ mà xem, chúng ta nào có ai ngồi rỗi, ai cũng công việc ngập đầu, ngoài đồng ruộng cần thu hoạch gấp, mà thu hoạch về còn phải chế biến. Lại phải làm nghĩa vụ lương thực. Chứ ngần ấy việc cũng đã chậm trễ rồi. Mà chậm trễ có xứng với một nông trường tiên tiến không? Cháu thử nói bác nghe, có xứng không nào?

– Tất nhiên là không rồi ạ! - Dakiya đồng ý, nhưng liên đó lại nói tiếp. - Nhưng thưa bác Giarif, dù sao cũng phải nghĩ về những lời họ nói: “Chỉ vì cái khe Gấu của các người mà phải đi vòng hàng mấy cây số”!…

“Ai cần thì kẻ ấy đi mà sửa chữa cầu. Điều quan trọng đối với tôi là làm sao hoàn thành cho được kế hoạch lúa của chúng tôi đã” - ông chủ tịch thoáng nghĩ nhưng ông không nói ra: cái nhìn chòng chọc của Dakiya làm ông phải tự ghìm lại. Nhưng đọc được ý nghĩ của ông, cặp mắt cô gái muốn bảo ông: “Ta không nên theo cái lối đèn nhà ai rạng nhà nấy bác ạ”.

– Thôi được, tôi sẽ bàn việc này với ông chủ tịch Xô viết thôn. - Ông Giarif vội vã hứa, rồi đột nhiên lại nói thêm. - Cho gọi ngay đội trưởng đội mộc đến gặp tôi nhé.

Liền sau đó ông Giarif giật mình nghĩ lại: ông giải quyết như vậy liệu có vội vã hay chăng? Ông sợ cô gái quấy rầy lâu nên phải “gật” cho xong hẳn. Nhưng muộn rồi, Dakiya đã hối hả chạy biến đi thi hành chỉ thị của ông.

* * *

Ngay sáng hôm sau, bên khe Gấu đã rộn rã vang lên bản hòa tấu của tiếng cưa tiếng rìu. Sau khi xây dựng chuồng ngựa của nông trường còn dư khá nhiều gỗ tốt, người ta đưa cả đến đây. Tìm ra được cả những tay thợ cần thiết, mà công việc thu hoạch đồng áng cũng vẫn không bị ảnh hưởng. Và chẳng bao lâu xe cộ lại đi lại bình thường qua khe Gấu, tránh được cái dốc “chết tiệt” ở Kaenxa.

Mọi người đều hết lòng cảm ơn nông trường “con đường thẳng tiến”. Tuy nhiên có một người lại bâng khuâng suy nghĩ: chính là cái anh lái xe lực lưỡng có cặp mắt anh đào chín, đã gặp Dakiya bên mạch nước hôm ấy, uống đã khát từ xô nước của cô gái và muốn nói điều gì đó với cô, nhưng lại đi chê trách nông trường “con đường thẳng tiến”. Không hiểu vì sao nhưng anh ta cứ cho rằng nhất định cô gái kia có dính dáng đến công việc sửa chữa cây cầu. Và nghĩ như vậy anh ta thấy lòng khấp khởi. Anh ta thấy cô gái càng đáng yêu hơn, và càng ngày anh ta càng mong muốn được thấy lại cô.

Thế rồi, các bạn thử nghĩ xem thế nào? Anh chàng lái xe nọ lại cho xe đi vòng qua làng Kaenxa, cố tình đi đoạn đường vất vả ấy với lý do: phải lấy nước cho bộ phận sưởi điện của xe.

Nhưng lý do đó rồi cũng không đứng vững được lâu. Ở khu vực khe Gấu, cách cầu không bao xa có một mạch nước nhỏ ri rỉ từ lòng đất lên. Vào một ngày đẹp trời, có người nào đó đã khơi sâu mạch nước, phá to miệng ra và đặt cả một khuôn thành bằng gỗ vào đấy. Nước cần cho “bộ phận sưởi điện của xe” đã chảy ra sát bên lề đường rồi!

Tuy nhiên hạnh phúc vẫn cứ mỉm cười với anh chàng lái xe.

Một lần, khi cánh đồng lúa chín rộ tỏa hương thơm ngào ngạt, anh ta đã gặp lại Dakiya. Mà gặp thế nào kia chứ? Dakiya đến mạch nước mới để quẩy nước còn anh chàng lái xe lại dừng xe để cho xe “uống nước”. Lần này họ trò chuyện với nhau như những người quen biết cũ.

– Nào, anh còn bực bội gì về nông trường chúng tôi nữa không? Cần cầu, chúng tôi đã làm lại cầu mới, cần nước, chúng tôi đưa nước đến tận bên đường. - Và Dakiya nheo mắt cười lém lỉnh.

– Điều tôi vẫn còn bực là cô hoàn toàn không ló mặt ra nữa. Cô khuấy động trái tim người khác, rồi bản thân cô lại biến đi đâu mất tăm mất tích. - Anh chàng lái xe đỏ mặt bối rối, không hiểu làm sao mà mình lại buột mồm nói ra những lời đó chứ?!

Cả hai cùng im lặng và e dè nhìn nhau. Bầu trời xanh, xanh thăm thẳm, nắng chói chang, còn sau mấy lời trao đổi ngắn ngủi kia, sự im lặng tiếp theo mới dễ chịu làm sao, nhẹ nhàng làm sao và lại nói được biết bao nhiêu điều muốn nói.', N'Mạch Nước', N'mach-nuoc')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 16, N'Thượng sĩ cận vệ Irkabai Mirzaép ngồi bên cửa sổ trong căn phòng của bệnh viện quân y và tư lự nhìn ra phố. Có một người xách chiếc giỏ đầy những trái đào đi ngang qua ngoài cửa sổ… Những quả đào con, chín, phủ ngoài bằng lớp lông tơ vàng óng lên màu hồng. Irkabai thấy sao mà thèm được nếm cái thứ quả ngon lành kia đến thế, và anh tiếc rẻ nhìn theo người xách giỏ đào. “Chà giá được nếm lấy vài bốn quả nhỉ!” Anh lập tức hình dung ra cái cảnh anh đang cẩn thận gọt làn vỏ mềm mại có lớp lông tơ mượt như nhung kia thế nào, rồi anh đưa lên miệng những miếng đào mọng nước dày cùi và anh ừng ực uống cái dòng nước quả ngọt ngào ấy ra sao.

Sáng hôm sau Irkabai lại ra ngồi bên cái cửa sổ cũ, và lại vẫn người bữa trước xách giỏ đào đi qua. Suốt ngày hôm ấy Irkabai cứ mường tượng mãi đến những trái đào và những thửa vườn đào. Thậm chí đêm ngủ anh cũng nằm mơ thấy như mình đang dạo chơi với một cô gái trong vườn cây lộng lẫy, và cô gái nói với anh: “Anh xem kìa, những trái đào thật là tuyệt! Sao anh còn lưỡng lự, hái nhanh đi thôi chứ!…”

Irkabai nằm ở quân y viện đã năm tháng rưỡi. Thời gian gần đây anh bắt đầu cảm thấy chán ngán, anh đâm ra buồn. Với những đồng chí cùng nằm trong một phòng thì mọi chuyện từ lâu đã nói với nhau hết rồi, người ngoài chẳng ai đến, còn tự mình đi thì biết đi đâu kia chứ. Ở thành phố này chẳng có ai là người quen. Chỉ mong sao cho chóng lại trở ra mặt trận. Ở đấy vui hơn, có nhiều đồng đội, mỗi ngày đem đến những chuyện mới. Ngoài ra, từ khắp nơi trên đất nước những con người hoàn toàn không quen biết tới tấp gởi thư, gởi quà cho các chiến sĩ. Chỉ riêng trong một tháng trước khi bị thương, V. Mirzaép Irkabai đã nhận được ba lá thư và hai gói quà.

Một lần ở mặt trận phía Tây, khi anh mới chỉ là binh nhì, đồng chí tiểu đội trưởng đã mang một gói quà nhỏ đến tìm anh và bảo: “Này, gởi cho anh đấy, chàng trai có đôi mày đen và đôi mắt đen!” Irkabai lấy làm ngạc nhiên về lời lẽ của đồng chí tiểu đội trưởng, nhưng nhìn vào gói quà anh chợt nhận ra đấy là những lời trên mặt gói thay cho địa chỉ! Lời gởi đến mặt trận miên Tây. “Trao cho chàng trai có đôi mày đen và đôi mắt đen đạt được nhiều thành tích trong những trận giao chiến với quân phát xít”.

Trong gói quà có khoảng hai trăm gờram thuốc lá thơm, một chiếc khăn tay nhỏ, vải mịn thêu hoa lá rất đẹp và trong chiếc phong bì màu xanh lam có mảnh giấy đề mấy dòng vắn tắt: “Đồng chí Hồng quân! Thuốc lá thì đồng chí đem chia cùng hút với anh em, còn chiếc khăn tay thì giữ lấy - sau chiến tranh tôi sẽ hỏi tới nó đấy. Latifa Guliamôva”.

Những hàng chữ ấy làm cho Irkabai xúc động đến mức ngay trong ngày hôm đó anh viết cho Latifa liền hai lá thơ. Một lá gồm những lời chào và lời cảm ơn hết sức cầu kỳ, còn trong lá thư thứ hai thì anh bóng gió nói đến những tình cảm mà chỉ có thể nói thầm thì vào hai tai những người con gái. Hai tháng trôi qua, không thấy có thư trả lời, trong khi đó thì những trận chiến đấu lớn đã diễn ra, đơn vị, trong đó có Irkabai Mirzaép, trở thành đơn vị cận vệ, và bản thân anh cũng lên cấp thượng sĩ cận vệ. Anh lại viết thơ cho Latifa, nhưng cả lá thư này cũng không được cô gái trả lời. Chỉ còn có thể nghĩ rằng những lời bóng gió của anh đã chạm mạnh đến lòng tự trọng của cô gái.

Sau đó ít lâu Irkabai bị thương nặng và phải nằm ở trạm quân y tiền phương hơn một tháng. Để chữa cho khỏi hẳn vết thương anh đã được sơ tán về vùng hậu phương an toàn, và anh đã rơi vào chính cái thành phố quê hương của Latifa. Nhớ đến cô gái, Irkabai quyết định: “Khỏi một cái là thế nào ta cũng phải đến thăm cô ấy”. Nhưng khi anh đã có thể dậy, có thể không nạng để đi lại được thì cái quyết định ấy lại rời bỏ anh: Ta hy vọng cái gì ở đây kia chứ? - Anh nghĩ. - Những bức thư của ta cô ấy không trả lời, khăn tay thì cô ấy hứa chỉ sau chiến tranh mới hỏi đến, mà như vậy có nghĩa là cô ấy đã giao hẹn trước: “Nếu như anh còn chưa thanh toán xong với cái bọn phát xít ấy, thì đừng có mà đến gặp tôi.”.

Thời gian gần đây Irkabai đã thôi cả việc nghĩ ngợi tới Latifa, nhưng cái giấc mơ lạ lùng kia với cô gái trong vườn đào có gì như gợi nhớ tới Latifa, thế là ý nghĩ về cô ấy lại bùng lên. Chẳng lẽ cứ bắt buộc khi gặp lại là phải nói: “Thưa, tôi chính là Irkabai Mirzaép” hay sao, có thể nhận là bạn của Mirzaép, đến chuyển cho cô lời chào chiến đấu của anh ta lắm chứ. Hình như, cô ấy là một cô gái thông minh, tốt bụng, được nói chuyện với cô ấy chắc hẳn rất lý thú, có thể lại rủ được cô ấy ra công viên thành phố dạo chơi hay đi xem xinê - cái đó thì quả đã là phù phiếm rồi đấy.

Chàng thượng sĩ cận vệ Irkabai Mirzaép nghĩ như vậy và quyết định phải ngay lập tức thực hiện ý định của mình. Vào ngày chủ nhật kế sau đấy, sau khi đã ăn mặc chỉnh tề, anh ngắm nhìn vào trong gương, và lấy làm vừa ý về bản thân bộ quân phục lĩnh ở nhà kho quân y viện rất hợp với thân hình cân đối của anh, gương mặt có phần xanh đi sau thời gian dài nằm trong phòng bệnh nay lại ửng lên cái ánh hồng của thời niên thiếu, và mảnh băng đánh dấu hai lần bị thương gắn vào áo quân phục làm cho cả bước đi hơi lệch về chân trái, cả cái nạng tiêu chuẩn bằng gỗ mộc cắp ở nách tay phải đều trở thành điều vinh dự.

Sau khi tìm ra ngôi nhà của Latifa, Irkabai hồi hộp gõ vào cánh cổng. Chợt một ý nghĩ hơi khó chịu thoáng qua trong óc anh: “Nhỡ ra mà cái cô Latifa này lại đã là một bà già giống như một cây nho cằn cỗi không còn nhựa sống và đã trở thành một thứ nho chua loét rồi thì sao?” Khi ở cổng một bà cụ mặt răn reo hiện ra trước mặt anh thì anh bối rối đến mức không nói được một lời nào.

Bà cụ hấp háy cặp mắt sắp lòa lặng đi mấy giây nhìn ngắm chàng thượng sĩ và đột nhiên, ôm choàng lấy cổ anh, hôn vào hai má:

– Ôi, con bồ câu nhỏ của mẹ, con trai xinh đẹp của mẹ! - Bà cụ thốt lên như với một người thân yêu nhất. - Kìa chân con làm sao thế? Vào đây, vào đây con! Lên đây con yêu quý. - Bà cụ lê đôi dép hấp tấp bước lên khoảng hiên nhà thâm thấp. - Này con gái nhỏ của ta đâu rồi nhỉ, đặt ấm trà đi con, ra đây, ra đây mà xem anh con từ mặt trận về đây.

Trái tim Irkabai bỗng giật thót khi anh nghĩ rằng mình ngay bây giờ sẽ được nhìn thấy Latifa. Trên hiên nhà hiện ra một cô gái tuổi chừng mười bảy mặc chiếc váy liền áo bằng thứ lụa màu hồng với đôi bím tóc đen dài quấn quanh đầu mấy vòng liên. Cô chào người chiến sĩ từ mặt trận về rồi trở vào nhà.

Đưa mắt nhìn theo cô gái, Irkabai đầy ân hận: “Cô gái xinh đẹp thế kia mà mình đã làm cho phải sợ hãi vì cái bức thư ngu ngốc của mình”. Cùng lúc ấy bà cụ vừa chuẩn bị chỗ ngồi cho Irkabai trên mô đất cao trong vườn, lại lên tiếng.

– Những đứa con trai như con từ chiến tranh đến nay vẫn chưa được xây dựng nơi chốn của mình, chưa được thực hiện những điều mình mong ước, ôi, cái thời buổi mà mọi sự là chỉ tại cái thằng Hítle rồ dại đáng nguyên rủa ấy thôi, ngữ ấy thì cứ đem mà thiêu ra tro cả khi còn sống lẫn khi đã chết! Mà này có phải Latifa nó cũng ở đơn vị với con không?

Cô gái từ trong nhà đi ra cầm tấm khăn trải bàn nghe thấy những lời cuối cùng của mẹ, cô mỉm cười:

– Đấy, chính là phải bắt đầu từ đó đấy mẹ ạ. Anh ở mặt trận nào về thế ạ? - Cô gái hỏi Irkabai. - Chị của em ở mặt trận trung tâm.

– Sao? - Irkabai thốt lên ngạc nhiên. - Latifa đang ở mặt trận ư? Tại sao cô ấy lại ở đó?

– Chị ấy làm hộ lý. Chị đi vào tháng năm năm ngoái.

– Ra là thế đấy!

– Thế đấy con ạ. - Bà cụ lại lên tiếng. - Mẹ đã nói với nó bao nhiêu lần: “Con không biết cưỡi ngựa, không biết bắn súng, con sẽ làm gì ở ngoài mặt trận kia chứ?” Mặc, nó chẳng chịu nghe lời. Nó là gan lắm kia. Lúc nào cũng chỉ nghĩ đến chiến trường thôi. Nó đã bao nhiêu lần viết thư cho các chiến sĩ Hồng quân, cán bộ chỉ huy và gởi cho họ những gói quà nhỏ, ấy có nhẽ đã hơn một năm kể từ ngày nó ra đi, vậy mà thư từ các mặt trận vẫn cứ tới tấp gởi về. Con ơi, con đã gởi chuyển đi cho chị con bao nhiêu thư rồi nhỉ? Mẹ nhớ đâu như: một trăm hai lá thì phải.

Irkabai phát hoảng lên: “Ba lá là của mình. Còn chín mươi chín lá!”

– Tất cả các lá ấy đều là từ mặt trận gởi về. Đối với cái bọn ở lại hậu phương thì đến làm quen nó, nó cũng chẳng muốn. Tính nó như thế. Con ơi, con đem cái ảnh của chị con ra cho khách của nhà ta xem nào. Con gái mẹ có đọc cho mẹ nghe tất cả mọi lá thư. Các chiến sĩ Hồng quân và cán bộ chỉ huy tỏ ra phấn khởi lắm và rất cảm ơn em nó. Có hai lá thư do một anh chàng nghịch ngợm nào đó viết. ừ mà cũng được thôi, chỉ cốt sao cho chú chàng cứ sống mãi.

Irkabai đỏ bừng mặt lên.

Từ trong nhà, cô gái đem ra mấy tấm ảnh của Latifa.

– Ảnh chị em chụp khi còn ở nhà. - Cô gái đưa cho Irkabai xem một trong những tấm ảnh và nói.

Trên tấm ảnh một cô thiếu nữ hơi nghiêng đầu ngượng nghịu nhìn ra: “Thôi xin các anh, đừng có nói gì!”. Nụ cười e lệ của cô như muốn nói lên điều ấy để’ ngăn ngừa tất cả những lời ca ngợi nhan sắc của cô. Irkabai không thể hiểu nổi một cô bé e lệ thế này mà lại dám ra mặt trận!

– Con xem cái ảnh này. - Bà cụ chỉ sang một tấm ảnh khác. - Đây là em nó chụp ở Mátxcơva.

“Bộ quân phục mới hợp với cô ấy làm sao!”. - Irkabai hoa cả mắt lên. Ở đây Latifa hoàn toàn khác hẳn. Cô đứng, đầu ngẩng cao kiêu hãnh, cặp mắt long lanh tinh nghịch, và tất cả dáng vẻ như nói rằng: “Này chàng trai, hãy cẩn thận!”.

Irkabai lặng đi. Tự nhiên anh lật phía sau tấm ảnh lên và chợt nhìn thấy địa chỉ hòm thư của Latifa.

– Con nhận ra em nó ư? - Bà cụ hỏi.

– Mẹ! - Bằng một giọng run run Irkabai nói với bà cụ. - Mẹ cho con tấm ảnh này. Một trong những gói quà của Latifa đã đến tay anh bạn thân của con. Anh ta bị thương nằm ở quân y viện, mà anh ta lại rất muốn được làm quen.

– Anh ấy tên là.?

Irkabai lúng túng.

– Trong số những lá thư gởi về đây, - Irkabai bắt đầu giải thích, như muốn tự bào chữa. - có ba lá của anh ta. Nhưng anh ta không phải là cái đứa nghịch ngợm mà mẹ nói đâu. Anh ta. - Irkabai hoàn toàn bối rối và im lặng.

– Thôi được, đồng chí cầm lấy. - Em gái của Latifa nói và mỉm cười hồ như đoán ra “anh ta” là ai rồi!

Irkabai cất tấm ảnh vào túi ngực và đứng dậy. Dù chủ nhà có nài nỉ thế nào mời anh ở lại uống trà, anh cũng thoái thác và ra về, sợ tự lộ chân tướng.

Trở về quân y viện, Irkabai ngồi để thảo bức thư mãi cho tới tối. Chép lại ra giấy sạch, anh lấy cái phong bì màu xanh lam giống hệt như phong bì thư Latifa đã gởi cho anh và ghi trên đó rõ ràng mấy dòng chữ:

“Đơn vị chiến đấu. PPM 19640-B. Nếu như cô Latifa Guliamôva mắt đen cứu được hơn mười chiến sĩ bị thương ra khỏi trận địa thì hãy trao thư này cho cô”.

Lần này Irkabai đã nói được nhiều điều trong thư gởi cho cô gái, nhưng nội dung bức thư đó kể ra ở đây e không tiện.', N'Chiếc Phong Bì Màu Xanh Lam', N'chiec-phong-bi-mau-xanh-lam')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (16, 17, N'[1] Đơn vị đo lường Nga, bằng 0.711m.

[2] Đơn vị đo lường Nga, khoảng 4.4 cm.

[3] Đơn vị đo lường Nga, bằng 409.5gr.

[4] Đơn vị đo lường Nga, bằng 2.134m.

[5] Nhân vật chính trong các vở múa rối dân gian Nga. Những buổi trình diễn có nhân vật này rất phổ biến ở Nga vào thế kỷ XIX và đầu thế kỷ XX.

[6] Chi tiết trong tiểu thuyết Mùa hè kỳ lạ của Komxt Fêđin: cô gái Anôtska bị hỏng đế giày, anh chàng nghệ sĩ Xuetulin đã quỳ xuống hì hục chữa cho cô.

[7] Tên một vị nữ thánh của chính giáo Nga.

[8] Tiếng Nga: Riabinhin - Thanh hương trà, đồng âm với tên họ.

[9] Sau trận ốm nặng thuở nhỏ, Xiôncốpxki bị nghễnh ngãng.

[10] Ackhit (Archytas, khoảng 428-347 trước Công nguyên): Nhà toán học và thiên văn học, nhà hoạt động quốc gia và thống soái. Người ta cho rằng Ackhit là người sáng tạo ra những nguyên lý đầu tiên của cổ học.

[11] Herôn (Heronus Alexandriuna, năm sinh và năm mất không rõ, đoán chừng vào thế kỷ thứ I) Nhà bác học cổ Hy Lạp. Trong tác phẩm của mình, Herôn đã miêu tả các máy móc khác nhau chuyển động bằng hơi khí đốt nóng hay nén, cũng như chạy bằng hơi nước, trong đó có quả cầu quay dưới tác động của hơi nước.

[12] Ở Trung Quốc cũ ng như Ấn Độ vào thế k ỷ 10-12, khi công đồn, người ta đã dùng tên bắn bằng ống giấy đựng thuốc pháo buộc ở đuôi.

[13] Năm 1879, Xiôncốpxki dự kỳ thi lấy bằng giáo viên và từ năm 1880 dạy toán học, và vật lý ở trường chuyên nghiệp quận Pôrôpxki thuộc tỉnh Kaluga, …

[14] Tên loại máy bay của hãng sản xuất máy bay “Farman” của hai anh em nhà hàng không Pháp: Farman Henri (1874-1958), Farman Moris (1877-1964).

[15] Tên loại máy bay của nhà hàng không Pháp Blêriot Luy (1872-1936).

[16] Tên loại máy bay của nhà hàng không Đức Xepplin Fecđinăng (1838-1917).', N'Chú Thích', N'chu-thich')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (28, 1, N'Có lẽ từ hôm bước lên xóm chợ này, mình đã bắt đầu cuộc sống lưu lạc rồi chăng Những đêm giật mình thức giấc nằm nghe tiếng gió rít thê lương từ các cánh đồng xa mông quạnh và lắng nghe tiếng nước chảy ào ào dưới chân cầu nước(Bậc thang bắc ra sông để giặt giũ hay lấy nước) bắc ra con kênh thẳng tắp chạy dài vô tận trước ngôi chợ này, tôi vẫn thường vơ vẩn nghĩ như vậy

Tôi lạc tới xóm chợ này, tính ra đã có hơn nửa tháng.

Một buổi tối, đoàn thuyền vận tải quân lương của Uy ban kháng chiến Nam BỘ đỗ lại đây. Anh học sinh trường côle người trong ban tiếp tế đã cho tôi theo thuyền từ Hậu Giang đến đây bảo tôi: “Chỉ ghé lại độ nửa giờ cho các chú lên chợ mua thức ăn. CÓ muốn lên bờ không?.

Tôi lắc đầu. Anh bèn vỗ vai tôi cười lớn: “Vậy thì tốt quá, ngồi lên mui ngó lên bờ chơi cũng được. Trông chừng đồ đạc em nhé!” Anh lần theo cây đòn dài bắc sang một chiếc thuyền khác, và lẹ làng như con sóc, co người trèo qua be mấy chiếc tam bản, mấy chiếc xuồng nhỏ của những người đi chợ đậu ken dọc theo bến rồi nhảy phóc lên bờ.

– Đừng đi đâu nhé Uống cà phê xong anh sẽ xuống cho chú mày cái bánh! – anh xốc khẩu súng mô-de đeo bên hông, vẫy vẫy tôi và rướn hai chân, cố nói thật to để cho tôi nghe thấy.

– Rồi! Nghe rồi… Anh cứ đi đi! – tôi bắc tay lên mồm đáp lại.

Tôi ngồi đong đưa hai chân trên mui chiếc thuyền chở gạo ngóng lên chợ. Đèn măng-sông trong các hiệu buôn, các tiệm ăn của người Hoa kiều thắp lên sáng rực. Chỗ khoảng sân rộng, những ngươi đàn bà nông dân mặc quần áo bà ba đen, khăn rằn đen vắt chéo qua vai ngồi xếp từng dãy dài sau những chiếc cần xé to tướng, những chiếc thúng đựng đầy ắp không trông rõ và không biết đó là thứ gì mà họ mang ra chợ bán. Mỗi người bán hàng đều thắp một ngọn đèn con Ơû chỗ mình ngồi. Và những người đi chợ, cũng có nhiều ngươi cầm theo trên tay một ngọn đèn.

Đèn người mua, đèn người bán cứ như sao sa.

Từ trong đám người ồn ào và những ánh lửa đèn luôn luôn cử động Ơû tít chỗ cuối chợ, bỗng nổi lên bốn đầu ngọn đuốc cháy đỏ rực cùng với tiếng trống, tiếng thanh la khua rung dồn dập.

– Hát Sơn Đông, chúng mày ơi?

– Lại coi con bé nhào vòng lửa đi! Mau lên, chúng mày ơi!

Bọn con nít từ khắp các ngõ ngách, từ trong các chỗ tối, từ dưới thuyền dưới xuồng chèo lên, ba chân bốn cẳng reo hò chạy về chỗ đám hát rong. Tự nhiên hai chân tôi cũng ngứa ngáy muốn tuôn theo. Đã bắt đầu nghe tiếng loa của người Khách mãi võ giới thiệu các môn trình diễn, và tiếng vỗ tay hoan hô cua đám người xem vây quanh.

Tôi kiễng chân lên coi họ làm gì đằng ấy. Xa quá, chỉ thấy đầu ngươi lô nhô và mỗi lúc lại nghe tiếng cười khoái trá dậy lên. lâu nay mình xem chán rồi. Còn lạ gì cái thứ trò ấy?” Tôi tự nhủ thầm như vậy và khinh khỉnh nhìn về đám người huyên náo để nén sự thôi thúc cứ dồn trống trong ngực.

– Thằng An còn ngồi đấy không? – bác tài công già cầm xâu thịt và một mớ rau cải vừa bước lên đòn dài vừa hỏi, giọng ồm ồm.

Cháu còn đây, bác ơi ! – tôi vội đáp, bụng hơi rạo rực.

– Nè, mà mày muốn coi hát Sơn Đông không – bác lại hỏi.

– Các anh bảo cháu Ơû đây coi chừng thuyền.

Bác tài công vứt sâu thịt vào cái rổ, vặn lưng uốn xương sống nghe rắc rắc, hơi thở nặc nồng mùi rượu:

Ê ! mày đã ăn thịt nai xào cải rổ chưa? Sáng mai tao cho mày ních một trận, phải biết nhá! – rồi bác cười lớn:

Tao đã đi khắp ngọn nguồn sông lạch mà chưa thấy ai mập như con mẹ chủ quán này. NÓ rót luôn cho tao năm ly rượu tấm bồng mắt thỏ mà không nhậu ra ngoài một giọt chớ

– Bác có lên chợ uống cà phê không? – Tôi hỏi.

– Tao mà cà phê cà pháo gì mậy? ờ, mà các chả đang làm cà phê trong cái quán chỗ đám hát Sơn Đông đó?

Thôi, có tao Ơù đây rồi. Cho mày lên chợ chơi một lát. Nhớ đường trở xuống bến không Đừng có đi đâu xa , coi chừng lạc

Trời ơi, một thằng bé từ lọt lòng mẹ đến giờ sống ở thành phố như tôi mà có thể lạc trong cái chợ nhỏ xứ quê này? Tôi cười thầm trong tối, từ trên mui gieo người nhảy độp xuống sạp thuyền.

– Cười gì đó mậy, An? – bác chướng mắt hỏi tôi.

– Không. Cháu có cười gì đâu

– BỘ mày tưởng tao say hả? ê, tao còn thấy cái bông bần( một loại cây mọc ven mé sông còn gọi là thuỷ liễu ) trôi giữa kênh kia nhá ! . . . Chà, nước giật ròng rồi .

Cháu lên đây, bác ạ!

Không chờ nghe bác ừ, thoáng cái, tôi đã đặt chân tới bờ. Chao ôi Chợ gì mà lạ lùng thế này? BỘ Tây sắp đánh tới nơi, nên người ta đem vườn bách thú ra phát mãi hay sao! Một con ba ba to gần bằng cái nong, đặt lật ngửa, cứ ngọ nguậy bơi bơi bốn chân trước ông cụ già ngồi lim dim đôi mắt. Những con rùa vàng to gần bằng cái tô, đều tăm tắp như đổ Ơû cùng một khuôn ra, nằm rụt cổ trong mấy chiếc giỏ cần xé. Đây là một con nai người ta vừa xẻ thịt ra bán, cái thủ còn nguyên chưa lột da bày giữa đống thịt đỏ hỏn trên một tấm lá chầm. Cua biển cũng có, ếch cũng có nghêu sò cũng có. Còn cá tôm thì nhiều lắm, đủ các loại tôm, không kể xiết. Tôi bước thêm mấy bước, qua những đống trái khóm chín vàng tỏa thơm mùi mật, thấy hai con trút nằm khoanh, vảy xếp lại như những đồng hào lấp lánh. CÓ tiếng chim gì mổ nhau kêu quang quác trong chiếc lồng kẽm chỗ tối tối: ngọn đèn vừa bị cánh chim đánh nhau quạt tắt, và người chủ bán chưa kịp thắp lên. Một chú khỉ con cứ nhảy qua nhảy lại lia lịa, chờn vờn trèo lên đống bí ngô. Thấy tôi đi qua, nó nhe răng khẹc khẹc, ngó tôi rồi quay lại nhòm người chủ, dường như muốn bảo tôi hỏi giùm tại sao cái lão rậm râu kia không thả mối dây xích cổ ra để nó được tự do đi chơi như tôi . . . Đằng chỗ đám hát rong, một tràng pháo nổi lên vang dậy. Tôi chẳng còn tâm trí đâu mà nhìn ngó chung quanh nữa. Tôi lại ba chân bốn cẳng nhắm mắt nhắm mũi lao về phía tiếng ồn ào đang có một sức cuốn hút không cưỡng được.

“Mình chỉ coi một chút thôi!” Tôi nghĩ bụng và đưa mắt nhìn vào trong ngôi quán cà phê nhỏ núp dưới tán cây bã đậu chôm chôm những gai. Cái lưng gù gù anh học sinh trường côle lấp ló qua vai những người dân quân tự vệ đội nón bàng rộng vành thả trễ sau gáy. Tôi muốn vào báo cho anh biết tới đã lên đây, nhưng bụng phân vân:

,Lỡ ảnh bảo xuống thuyền thì sao?.. . ừ, mà mình chỉ cần coi qua một chút thôi mà?”

Chen đâu mà chen dữ vậy hả? – một thằng bé lùn lùn, béo ục ịch, trợn mắt hích khuỷu tay vào hông tôi.

– Cho tao coi một chút mà!

Nghe tôi nói bằng một giọng nhường nhịn, thằng bé tức thời nép người qua để cho tôi lách vào, rồi nó nhe răng cườl làm như tôi với nó đã quen từ hồi nào.

– Mày mới tới à? Hồi nãy vừa diễn trò hai con khỉ kéo xe mê lắm? ừ, mình mới tới! – tôi đáp cho có đáp, không còn chú ý nghe nó kể những gì bên tai nữa.

Người khách mãi võ mặc quần áo chẽn màu đen đã bán qua một lượt thuốc cao, bắt đầu giới thiệu tiết mục “Em bé mười tuổi nhào qua vòng lửa

– Trò này đêm qua nó diễn rồi. Không thể tả được mà!

– thằng bé lùn lùn béo ục ịch lại rỉ tai tôi, giọng đầy tự hào về cái chuyện nó đã được xem trước tôi.

Một em bé vận bộ quần áo bằng xa tanh màu đỏ, tóc tết quả đào, mang đôi hài vải đen bước ra, cúi chào khán giả Chiếc vòng sắt quấn giẻ tẩm dầu lồng giữa một khung gỗ hình chữ nhật, dựng đứng cỡ ngang tầm mắt tôi, bày giữa hiện trường. Dứt loạt vỗ tay chung quanh, người Khách già cầm ngọn đuốc châm vào chiếc vòng quấn dẻ. Tức thời một vầng lửa hình trong như chiếc bánh xe lửa của Na-tra(Một nhân vật trong truyện “phong thần” trung quốc) phực cháy vù vù. Em bé lại nghiêng đầu chào mọi người rồi dún chân một cái, chạy tới ba bước gieo mình như một con thoi bay qua vòng lửa.

Mắt tôi hoa lên, chỉ còn thấy cái bóng đỏ lao qua lao lại xuyên ngang vầng lửa, và hai tai tôi ù đi vì tiếng reo hò, tiếng vỗ tay vang dậy-

– Đêm qua, nó nhào sáu lần mà bữa nay nó tăng lên tới tám lần! Mày thấy ghê chưa? – thằng bé lùn lùn béo ục ịch hích tôi, vênh mặt nói.

Trong lúc người Khách cầm mấy chai rượu thuốc đi vòng quanh chào hàng thì em bé vừa đứng thở vừa đưa hai bàn tay nhỏ phủi phủi những sợi tóc cháy trước trán.

Dáng như đêm nay số thuốc bán được ít ỏi quá. Người Khách mặt buồn buồn, đặt mấy chai rượu thuốc lên cái rương lớn màu đen, cố làm ra vẻ tươi tỉnh:

– ông bà cô bác xem xong trò này, rồi hẵng mua giùm sau cũng dược. Hầy? Tả lồ lên(đánh thanh la lên)”

Tiếng trống, tiếng thanh la lại khua rung dồn dập.

Ông ta cầm một nắm dao con sáng loáng tung lên bắt từng chiếc một, rồi lần lượt cắm tất cả mười hai con dao ấy vào những khe hở đục trong cái vòng sắt còn dang rừng rục lửa. Những mũi dao nhọn hình lá trúc đào lấp lánh ánh thép trắng xanh tua tủa chĩa ngược vào trong, càng làm thu hẹp cái khoảng tròn ban nãy vừa đủ một thân mình ngươi chui qua. Ngươi Khách xiếc nhìn mấy người đánh trống đánh thanh la, ra hiệu ngừng tay. ông ta nhường mắt hét lên một tiếng, rùng mình thu người lại và lập tức dún chân bay qua giữa nhũng mũi dao tua tủa. Tôi nhắm mắt lại. Trời ơi! Chỉ nhích ra một phân, bất cứ Ơû phía nào thì những mũi dao sắc nhọn như gươm kia cũng đâm xóc lút vào da thịt. ông ta lao đi lao lại ba lần như vậy mà trông sắc mặt và hơi thở không chút biến đổi.

– Người lớn làm không hay. Em bé làm mới hay? – người Khách vung tay giới thiệu.

Em bé gái bước ra, nghiêng đầu chào mọi người. Hai bàn chân đi đôi hài vái đen nhỏ xíu khơi động giẫm lên giẫm xuống một chỗ trên mặt đất lởm chởm những hòn cuội Tôi hồi hộp qua. Đôi môi em bé run run. RÕ ràng là nó đang cố trấn tĩnh trước phút biểu diễn cái trò vô vùng nguy hiểm này.

CÓ ba Ơû đây, con? – người Khách nói bằng giọng khuyến khích vui vẻ, nhưng cặp mắt ông ta trông nghiêm nghị đáng sợ.

Em bé tức thời hét lên một tiếng như bố, dún chân bay xuyên qua giữa vòng dao rực cháy. Chung quang im phăng phắc. Mọi ngươi không kịp vỗ tay. CÓ lẽ vì sự thán phục cùng với nỗi lo sợ thay cho em bé cùng một lúc ập vào làm choáng ngợp mọi trái tim người. Em bé lao qua vòng dao lần thứ nhất, rất dễ dàng. Em lại mím môi lao qua lần thứ hai . Đến lần thứ ba, thì một tiếng thét kinh hoàng của những người xem nổi lên chung quanh tai tôi.

Em bé đã ngã bổ xuống bàn chân phải mắc vào một mũi dao.

Người xem chạy ùa vào. ông Khách già ôm ngang lưng con gỡ chiếc hài đen ra khỏi mũi dao. Một dòng máu đỏ từ trong vết thương bàn chân em bé tuôn ra như suối .

Không hề gì mà! Dán một lá thuốc cao, khỏi ngay thôi? – ông Khách vùa nói vừa rắc một ít thuốc cầm máu màu đen để hàn miệng vết thương, và trao đứa con gái cho một bà xẩm vác đưa xuống chiếc thuyền đậu trong một con kênh gần đấy.

Bọn trẻ nhỏ ùn ùn chen lấn chạy theo coi. Mặc dầu đám hát vẫn tiếp tục biểu diễn, nhưng tôi không còn lòng đã nào xem nữa. Tôi cũng chạy theo đám trẻ, lần xuống mé sông đứng ngó vào thuyền.

Em bé ngồi tựa lưng vào mui, đôi mắt to đen láy nhìn xuống vết thương trên mu bàn chân đã được bó một lá thuốc cao. Không thấy máu chảy nữa. Nhưng bàn chân cứ run run, lâu lâu lại giật một cái, khiến em nhắm mắt lại Bà xẩm cầm ngọn đèn soi vào chân con, tròng mắt đỏ hoe.

– Con có đau lắm không, con?

Em bé nhắm nghiền mắt, hai tay bóp chặt trên ống chân, lắc lắc đầu. Một giọt nhóc mắt người mẹ rơi xuống bàn chân nhỏ của đứa con đau. Em bé mở choàng mắt ra, hốt hoảng nhìn mẹ, như vừa bị một giọt nước sôi rơi trúng vào chân.

– Ơ không có làm sao đâu, má à? Buốt buốt một tí thôi!

Vừa nói, cô bé vừa quờ tay ôm ngang lưng mẹ và cố nhoẻn cười cho mẹ yên lòng. Nhưng sau đó một chốc, em lại nhắm mắt lại. Mấy giọt mồ hôi rịn rịn ra trên vầng trán nhỏ. Tôi biết chắc chắn rằng em bé đau lắm. Tôi không dám đứng nhìn nữa, bèn trở lên chợ.

Bấy giờ đám hát cũng vừa tan. Tôi sực nhớ ra là mình đã di lâu quá. Tôi liền chạy vào quán cà-phê. Không thấy anh học sinh côle dâu. Tôi nhằm hướng đầu ngọn cây bàng khô, chạy một mạch về . Đoàn thuyền vận tải quân lương không còn chiếc nào đậu Ơû đó nữa. Tôi chạy dọc theo bến chợ một quãng, hi vọng họ vừa rời di, mình còn có thể đuổi theo kịp.

Trời tối quá. Lửa đèn trên sông dần dần thưa thớt. Chợ cũng đã tan rồi. Tôi trèo lên một đống gạch, đứng ngóng theo làn nước lấp loáng ánh sao xuôi xuôi trên dòng kênh không biết chảy về đâu. Một người đàn bà quảy đôi thùng xuống bến lấy nước, đứng lại nhìn tôi hồi lâu rồi hỏi:

Có Phải mày Ơû trong đoàn thuyền vận tải không?

– Dạ phải! – tôi vội đáp, bụng hơi mừng – HỌ đi dâu rồi dì?

– Trời ơi? Mày đi đâu mà họ tìm mày khắp cả chợ? HỌ đi rồi. Đi từ tám hoánh nào rồi ! Nhổ sào từ hồi nước mới ròng. Và người đàn bà chép miệng: – Chà, chừng như họ được lệnh đi ngay hay sao ấy. Gấp lắm thì phải!

– Dì có nghe họ nói đi đâu không – tôi hỏi lại.

– Chuyện quân sự mà, biết sao lọt! Thế mày cũng không biết à? HỌ không nói với mày à?

– Không , dì ạ!

– Mày có ba má, anh em gì trên thuyền không?

– Không. Cháu đi quá giang thôi. Người đàn bà chành môi ra dài giọng:
Thảo nào? … Người ta có việc của người ta chứ. Ai bảo cứ ham chơi, đi những đâu? .

Người đàn bà không nói gì nữa, lẳng lặng xuống sông gánh nước lên chợ. Tự nhiên tôi thấy trong lòng mình rưng muốn khóc…

Ban ngày tôi thẩn tha đi dọc theo bến, mong có gặp người nào quen trong đoàn thuyền vận tải quân lương trở lại đây không. Ban đêm tôi, tôi vào ngủ trong chợ, chui dưới gầm một thớt bán thịt lợn của người Hoa kiều.

Nhũng người đàn bà trong chợ gọi tôi là thằng bé tản cư. Nghe đâu hồi tháng trước, chợ này chỉ họp buổi sáng. Hơn tháng nay, chợ nhóm suốt ngày, có đêm mãi chín mười giờ khuya mới tan. Người tản cư Ơû các vùng trên đổ xuống ùn ùn như nước. Mặt nước dòng kênh không mấy lúc ngớt tiếng khua động mái chèo. Cái chợ con nằm trên ngã ba kênh của xứ làng quê hẻo lánh này trở nên đông vui nhộn nhịp như một trấn nhỏ. Người từ Sài Gòn chạy xuống tới đây cũng có. Người vùng Tiền Giang, Hậu Giang cũng có. Nhiều con mụ đàn bà mặc áo lụa trắng rô-dê(tiếng pháp có nghĩa là thêu ), che dù đầm, núng na núng nính rén bước đi lên chợ, mắt cứ ngó xuống chân dép xăng-đan, sợ bùn đất vấy gấu quần. Tiền bạc đựng nứt ví, nhưng mua gì cũng chê ỏng chê eo, trả giá rẻ mạt. Tôi chỉ nghe họ than phiền với nhau rằng: Cánh mình dở quá, không chặn nổi Tây”, rằng “chạy vào đây không có nước đá uống, không có nước ngọt tắm”. Thấy tôi lảng vảng đến gần chỗ thuyền họ, họ nhìn chòng chọc vào tôi, bộ như muốn ăn thịt: ê đi đi, thằng nhỏ. MÒ mẫm toan an cắp hả?” Tôi ức đến muốn khóc. CÓ ai quen, gặp tôi bây giờ cũng không nhận ra tôi nữa đâu. Ngồi bó gối trên cầu nhìn xuống nước, chính tôi cũng khó nhận ra mình trong cái hình thù quái dị này. Tóc tôi mọc dài gần phủ gáy, hai quầng mắt hõm sâu, cổ gầy nhom như cổ cò ma. Chiếc áo vét tông bằng ka ki trắng của anh học sinh côle cho tôi, giờ đây đã biến thành màu cháo lòng, vạt áo phủ xuống tận gối, cứ kêu loạt xoạt theo mỗi bước đi.

Còn chiếc quần đùi bằng vải len của tôi thì bạc phếch ra, hai ống rách te tua như bị cá chốt rỉa.

Ai nhờ việc gì, tôi cũng giúp. Mấy thím bán cá nhờ tôi khiêng thúng mủng, xách nước cho họ thay nước rộng cá.

Em bé? Vác cho qua ( tiếng xưng tôi thân mật của người có tuổi ) bó mía đi!

– Em bé? Đội thúng tôm lên chợ giúp dì đi.

Nhỏ? Nhỏ! Chạy xuống mé kênh cắm lại cây sào của dì sắp trôi kia!

Kẻ cho tôi nắm xôi, người cho tôi gói bắp. Không ai biết tôi từ đâu trôi dạt tới .

Ngày nào tôi cũng tạt qua trước ngôi quán rượu một lần. Biết đâu bác tài công già hôm nọ chẳng qua ngang mà ghé lại đây?

Những ngày đầu mùa mưa năm 1946 cứ ì ạch nặng nề lê đi từng bước khó khăn như ngươi đàn bà sắp Ơû cữ cứ trở dạ mãi mà vẫn chưa đẻ được. Ở cái vùng nước mặn miền tây Nam bộ này, người ta mong mưa như bọn trẻ con chúng tôi mong mẹ về chợ. Mưa có nước ngọt uống, có nước cầy bừa, nhưng điều quan trọng nhất trước mắt, là mưa có thể làm chậm bước của địch trong các cuộc tiến công, gây trở ngại cho chúng trên các nẻo đường hành quân vì trơn tuột, sình lầy.

Trời càng sắp mưa thì càng oi bức khó chịu, ban ngày mặt trời đổ nắng chang chang, nóng như giội lửa. Chỉ khi đêm đến mới có đôi chút gió lao xao từ vùng vịnh Thái

Lan thổi tới. Thường thường, đêm nào người trong chợ cũng xách chiếu ra ngồi dọc bờ kênh hóng mát, coi thuyền tản cư và thuyền chở Cộng hòa vệ binh( tổ chức chính quy của quân đội sau ngày nam bộ cướp chính quyền 1 trong 4 sư đoàn dân quân cách mạng nam bộ ) từ mạn trên trẩy xuống. Quán rượu của dì Tư Béo là nơi tụ họp của những người thức khuya nhất, có khi đến một hai giờ sáng hãy còn đỏ đèn và ran tiếng nói cười.', N'Xóm Chợ Nhỏ Một Vùng Quê Xa Lạ', N'xom-cho-nho-mot-vung-que-xa-la')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (28, 2, N'Tôi thường lân la đến quán dì Tư Béo, bởi lý do mong gặp người quen. Nhưng còn một lẽ khác nữa, là Ơû đó, tôi có thể nghe đủ mọi thứ chuyện trên đời. Việc gì vừa xảy ra Ơû bất cứ xó hẻm nào quanh chợ, lập tức trong quán dì Tư Béo mọi ngươi đã biết ngay. Từ những tin nóng hổi Ơû mặt trận Vàm Xáng như … một chiến sĩ ta bị thương, khúc ruột lòi ra, anh lấy tay nhét vào, không rên một tiếng” , cho đến chuyện “ông TỔ sư BỒ đề truyền dạy phép màu cho Tề Thiên Đại Thánh như thế nào. . . ” tôi đều có thể nghe được Ơû đây.

ĐÓ là một ngôi quán nhỏ xệch xạc, trống trước trống sau, cất dựa bên bờ kênh dưới bóng một cây gáo cổ thụ.

Mái lá rách thủng lô chỗ, ban ngày nắng soi xuống mặt chiếc bàn dài, thả những bóng trứng vịt xuống bên mâm người ngồi nhậu, và ban đêm, người ta có thể uống cả một vì sao xanh rơi trong lòng cốc.

Quán rượu dì Tư Béo nối tiếng về thứ rượu tăm ngọt giọng, phảng phất mùi cháy khê nồi mà không nhà nào cất được, về tài xào nấu các món thịt rừng mà các lão già cũng hay bông phèng đã nức nở khen rằng “nhắm xong một miếng, thấy người phấn hứng, trẻ tráng ra ngay” .

Nhiều người tin như vậy. Chứ như tôi, tôi nghĩ rằng những người lui tới nơi đây là bởi tự thói quen cố hữu của họ. Mà bà chủ quán vốn là một người đãi bôi xởi lởi, không bao giờ để phật lòng bất cứ một ông khách nào dù khó tính đến đâu. Duy chỉ có một điều mà ai cũng biết nhưng cũng chẳng ai nói ra, là trong sự dễ dãi hào phóng của bà ta , dù thế nào thì thế, một đồng xu cũng không lọt được qua cánh tay nhờn nhầy bóng mỡ của bà, vì bà không để mình chịu thiệt với ai bao giờ. Chẳng vậy mà một hôm, bà ta đã bảo tôi: “Tao thấy mày sống hổm rày ở chợ này như con chó hoang. Tội quá! về đây mà ở, tiếp giúp tao việc vặt trong quán. Mày sẽ tha hồ ăn, tha hồ uống. Còn như công xá. Bà ta im lặng một lúc, sụt sịt mũi ; “Nói chuyện công xá, hóa ra cháu ở đợ cho dì sao? Dì có một thân một mình. Dì coi cháu như con thôi. Mẹ con mà tính chuyện tiền bạc thì còn ra cái nghĩa gì

Tôi đứng lặng đi một lúc lâu, bàng hoàng không biết đáp ra sao. Trước mắt tôi, dòng kênh xanh ngắt lặng lẽ chạy hút vào chân trời . Một cánh buồm nhỏ xíu bồng bềnh trên khói nước, ở một nơi nào xa lắm, đôi khi không trông rõ, dường nửa thực nửa hư. Quay nhìn về hướng quê nhà, chỉ thấy mây trời đùn cao như núi. Ngày mai tôi sẽ đi về đâu sống ra sao, tôi chưa biết. Tôi chẳng ở đây thì còn đi đâu nữa? Tôi gật đầu, chẳng nghĩ ngợi gì.

– Vâng. Cháu sẽ ở đây với dì!

Tôi trở thành thằng nhỏ hầu rượu trong quán dì Tư Béo bắt đầu từ hôm đó.

– Cầm hào bạc đây, ra chợ mà cắt tóc ngay đi – bà ta vừa truyền lệnh cho tôi, vừa tháo mấy cây kim băng cài miệng túi áo chích đưa lên ngậm ngang mồm, và móc từ trong miệng túi thâm đen vì bẩn mỡ ra một nắm giấy bạc, nhặt một tờ hào dúi vào tay tôi.

Khi tôi cắt tóc xong, trở về quán thì thấy bà ta lúi húi ngồi khâu bên rổ may.

Lại ướm thử cái quần đùi coi nào. Dì khâu cho mày đấy

Bà ta đứng dậy, cầm mảnh lụa đen vừa cắt từ ống quần dài cũ của bà chỉ cần khâu một đường lưng và một đường khoét đáy là thành một chiếc quần đùi. Tôi mặc thử, thấy hãy còn quá rộng.

Cầm bánh xà phòng thơm của dì, xuống bến tắm đi.

Rồi lên mà mặc quần mới, con? – bà ta ngọt ngào bảo tôi.

Bà ta nói với tôi rất ít, ?lời lẽ dịu dàng, nhưng mỗi câu là một mệnh lệnh. Sau khi tắm rửa xong, tôi vội mặc chiếc quần lụa đen ngắn vào. Bà ta ngồi nheo mắt, cười . làm rung rung hai tảng mỡ của đôi gò má bóng nhẫy, ngắm tôi hồi lâu.

– Tươm da! Sạch sẽ thơm tho nhưvậy mới có thể hầu khách được. Chứ đứng gần người ta mà hôi như cú thì họ gõ chai lên đầu biết không” Mà trông mày mặt mũi cũng sáng láng đấy. CÓ chữ nghĩa gì bỏ túi không?

Dạ, cháu đã đỗ xép-phi-ca(Tiểu học) tháng sáu năm ngoái.

– Thiệt chứ? Trời, thằng này giỏi đa? Mới mười bốn mười lăm tuổi mà đã dỗ phi-ca thì giỏi lắm. ờ, hồi tao còn con gái, có một ông giáo phica chú ý đến tao, nhưng duyên trời không định: Chà, ngày xưa đỗ phi-ca là đã nên ông nọ ông kia rồi . Khổ cho mày, gặp thời buổi loạn ly! . . .

Thế ba má cháu đâu?

– Dạ, ở xa lắm! – tôi đáp một cách miễn cưỡng. .

Thấy tôi không muốn nói, bà ta cũng thôi không hỏi. Bà ta vốn là người khôn ngoan, lịch thiệp và từng trải, luôn luôn đoán trước ý mọi người, biết lúc nào nên nói, lúc nào nên không và nên chấm dút câu chuyện ở chỗ nào. Điều này, tôi nhận ra trong những đặc tính của bà ta chỉ qua vài ngày sau thôi.

Kể ra thì khách rượu của quán rượn dì Tư Béo không thiếu hạng nào. Những tay vô công rồi nghề, la cà ngồi tán dóc suốt ngày cũng có. Những người tản cư, cắm thuyền tạt lên uống chén rượu rồi quảy qua đi ngay cũng có. Bọn con buôn vào ngồi chỉ cốt lấy chỗ gặp gỡ, trao đổi luồng hàng đương khan hiếm và để kiếm món xào nướng khoái khẩu hơn là vì cần nên đôi khi, một vài người lính Cộng hòa vệ binh có tuổi lén rời chỗ trú quân vào làm một cốc rượu khan, trước khi ra khỏi quán cứ đưa ống tay áo chùi ria mép và dặn đi dặn lại tôi: “Này, chú em, hễ có ban chỉ huy đến hỏi thì nói không có ai tới uống rượn đây cả nhé ! Nhớ nhé ” .

Chỉ trong vài hôm, tôi đã quen mặt hầu hết những đệ tử Lưu Linh của xóm chợ này .

Nhưng trong đám người thường lui tới đây, tôi chỉ đặc biệt chú ý có hai người.

Một là lão Ba Ngù. Dường như lúc nào cũng có lão túc trực trong quán. Nói cho đúng thì lão ta cũng không phải là tay mạnh rượu. Nhưng lão có thể lai rai uống được suốt ngày. Những chuyện tiếu lâm, những chuyện giang hồ mã thượng lão kể đi kể lại với mọi người, tôi nghe đến thuộc làu những vẫn thích nghe. Bởi mỗi lần kể, lão thường hay thắt thêm vào những chi tiết bất ngờ khiến tôi phải cười bò ra; hoặc cũng có một đôi chỗ mà lần trước kể dài dòng, lão đã biết khéo léo thu vén bỏ đi cho câu chuyện thêm tròn trĩnh, dễ nghe hơn. Những lúc đông khách, lão đứng dậy nhường chỗ cho người mới tới. Đôi khi lão còn bưng hộ bát thừa giúp bà chủ quán. Dì Tư béo mến lão vì cái tài đưa chuyện và giữ khách không công của lão, nên thỉnh thoảng bà ta cũng đãi lão cút rượu kèm theo một con khô cá lạt nướng. Ai mời rượu. lão đều uống, không từ chối. Nhưng chỉ uống một chén con cho vui bụng ngươi ta thôi. Không bao giờ lão uống đến chén thứ hai. “Mình là người biết tự trọng. Mình có phải là thằng già nát rượn đâu? ” Lão thường lè nhè nói một mình như vậy Cứ mỗi người một chén rượu mời, mỗi ngày đêm lão Ba Ngù có thể uống tính ra đến một, hai lít? Lão luôn luôn cởi trần, áo chỉ dể vắt hờ bên vai, bảo: “Để vầy cho nó mát”. Lão chỉ mặc độc chiếc quần đùi: da mặt, da lưng đỏ như cua luộc. Dường như bấm vào bất cứ chỗ nào trong thân hình lão cũng có thể chảy rượu ra ngay được . . .

ĐÓ là người thứ nhất.

Người thứ hai là Tư Mắm. Không biết y ở đâu, tên thật là gì . Chỉ biết rằng y thường chở mắm lóc, mắm trê đôi khi chở cả dừa khô và bí rợ trong một chiếc ghe lườn bán dọc theo các xóm bờ kênh, nên đồng bào gọi y là Tư Mắm. Còn người đàn bà chạc ba mươi tuổi mà Tư Mắm bảo là vợ y không mấy khi bước lên bờ. có lần, tôi nghe thấy lão Ba Ngù che tay lên miệng bảo với dì Tư Béo: “Chà, bộ thằng Tư Mắm có ngải hay sao mà nó chài được con nỡm đẹp quá. Không phải vợ hắn đâu. Dứt khoát là không phải bà chị ạ “Tư Mắm ngươi dong dỏng cao nước xanh mét, tóc cắt bom-bê, mái tóc trước trán rủ xuống tận gò má bên phải . Đôi mắt y rất bé và sắc lạ lùng, tròng mắt đảo đi đảo lại rất nhanh và không hề nhìn thẳng vào ai bao giờ.

Một buổi sáng, lúc tôi đang bưng rổ tôm càng xanh từ chợ về thì nghe tiếng tàu bay vè vè từ hướng Sóc Trăng lượn đến. Người trong chợ xô nhau nhạy toán loạn.

Chiếc tàu bay đảo hai vòng trên xóm Ngã Ba Kênh, bay rất chậm nhưng thật cao, nghiêng qua nghiêng lại quan sát rồi thả xuống một đống truyền đơn . Những tờ truyền đơn tủa ra, bị gió cuốn đi bay về mạn rừng tràm cách chợ có đến vài ngàn thước. Không biết bọn giặc nói gì trong ấy Nhưng khi tôi về đến quán thì gặp ngay lão Ba Ngù đứng chửi oang oang: .

– TỔ cha thằng Tây. Mày đánh thì xuống đây Chứ bay trên trời thả giấy xuống thì cũng chưa gọi là bảnh

Lão níu rổ tôm của tôi lại, hỏi:

Mày có nhặt được tờ nào đút trong này không

Không – tôi dáp.

Truyền đơn nó kêu gọi Việt Minh đầu hàng đấy!

Sao bác biết? Bác nhặt được à?

Nhặt đâu mà nhặt. Thằng Tư Mắm nó vừa bảo đấy . Cái thằng coi vậy mà nhát. NÓ mới nghe hơi tàu bay một chút, đã xuống ghe chèo đi tuốt rồi!

Từ đó đến chiều, gặp ai lão Ba Ngù cũng nói đi nói lại có bao nhiêu chuyện đó Và chuyện giữa người trong quán cứ xoay quanh vấn đề : “Tây sắp tiến công vào đây?

Liệu chúng ta có chặn nổi không””

Vào lúc chạng vạng, trời bỗng nổi gió to. Tiếng sấm nổ chát chúa trên những vầng mây đen sì mỗi lúc như muốn xà thấp xuống ngọn cây. Mưa bắt đầu rơi lộp độp những hạt to và nặng trên mái lá. Nhưng chỉ ào qua một loạt rồi tạnh ngay. Lão Ba Ngù đứng trước quán, nhìn theo những làn chớp kêu: .

– Mưa đi ông! Muốn mưa thì cứ mưa đi. Sao cứ làm khó khăn cho người ta vậy?

– Nếu mưa to thì Tây còn chưa dám vào đâu, phải không anh Ba?

Dì Tư Béo lạch bà- lạch bạch như con vịt mái xiêm, ra đứng bên cạnh lão, vừa thở dài vừa hỏi phụ họa:

– Dút khoát là mưa thì nó không dám tiến công. NÓ toàn đi giầy, gặp đất trơn trượt ngã bỏ mẹ đi. Hồi đằng cựu(thời cần vương, văn thân khởi nghĩa) các ông rải quả mù trên lộ, Tây đi ngã lạch bạch . Thế là dao, mác, mã tấu mình cứ xông ra chém nó như chém chuối!

Tôi dọn rửa bát đĩa xong, không còn việc gì làm cũng ra đứng hóng chuyện bên lão.

Bỗng nghe dưới kênh có người hỏi:

– Quán dì Tư có gì nhậu không?

– À thằng Sáu tuyên truyền – lão Ba Ngù kêu khẽ. Dì Tư Béo tức thời quát tôi:

Vào nhóm bếp lên. Con nít mà biết cái gì, lúc nào cũng chực nghe.- Và bà ta đáp vọng ra kênh:- VÔ khối! Còn vô khối?

Tôi ngồi trong bếp vừa nhóm lửa, vừa đưa mắt nhìn ra. Nghe tiếng xuồng cập bến, khua lộp cộp. Dì Tư Béo chạy vào cầm cây phất trần bằng cuống quài dừa nước quét lạch xạch trên bàn rượu. Chắc là có khách sộp đây Tôi nghĩ thầm như vậy, vì nghe lão Ba Ngù dạ dạ hai ba tiếng, bộ kính cẩn lắm. Rồi thấy anh Sáu tuyên truyền mồ hôi mồ kê nhễ nhại, tay xách một bao cà rồng công văn giấy tờ, khom người bước qua mái giọt, vào đặt phịch cái bao lên bàn. Lão Ba Ngù khệ nệ ôm một chiếc ba-lô to tướng rằng rịt những dây da, lấm lem bùn đất, thận trọng đi từng bước vào và sẽ sàng đặt lên chiếc chõng tre, cạnh cửa ra vào bếp.

Một người đàn ông chạc hăm sáu hăm bảy tuổi, cao lêu nghêu, mặc bộ quân phục ka-ki màu rêu, thắt lưng da rộng bản, khẩu súng poọc-hoọc đeo trễ bên hông, tay xách đôi giày vải, tay cầm chiếc mũ vải kiểu hướng đạo bước vào đưa mắt ngắm nghía một vòng trong quán rồi thong thả kéo ghế ngồi xuống.

Anh Sáu tuyên truyền giới thiệu với dì Tư Béo:

– Đây là ông Huỳnh Tấn, đặc phái viên của Tổng hành dinh Ủy ban kháng chiến Nam Bộ, ở miền Đông mới tới!

Dì Tư Béo chắp hai tay trước bụng cúi đầu chào, nói gì lí nhí trong mồm không nghe rõ , chỉ thấy dôi môi run run một cách cảm động. ông khách đứng dậy, toét miệng cười, khẽ nghiêng đầu chào đáp lễ rồi nói cách thân mật tự nhiên:

Kiến cắn bụng dữ rồi đây? Dì có gì cho chúng tòi làm ba hột cho đỡ đói cái đã . . .

Lão Ba Ngù buột miệng đáp ngay:

Còn nửa rá bún tươi . CÓ thể ăn với thịt bò xào lá cách. Còn nhậu thì . .. đâu như nhà còn mấy con tôm càng nướng, phải không bà chị? Mà rượu hôm nay không đặng ngon?

Dì Tư Béo gật đầu lia lịa:

– Muốn ăn cơm cũng được. Tôi chịu khó nấu. Chẳng mấy thuở mà! Bắt gà làm xé phay ăn thôi.

Anh Sáu tuyên truyền vừa lau mồ hôi vừa nuốt nước bọt, giọng sốt ruột: . .

– Dì muốn cho ăn thức gì cũng được. CÓ bao nhiêu cứ dọn hết ra đây. Nhưng phải gấp lên!

Lão Ba Ngù lăng xăng giúp bà chủ quán pha ấm trà, đặt lên bàn mời khách.Anh Sáu tuyên truyền bảo tôi đem cho ảnh một ít bún tươi, rồi ảnh rút trong bao cà- ràng ra một cuộn giấy nhặt lấy hai tờ rộng khổ nhất úp lên bàn, bảo tôi xếp bún vào.

– Chà, có khẩu hiệu gì mới hả chú Sáu? – lão Ba Ngù tò mò hỏi .

Phải Vừa lĩnh trên quận về đây. Bác kê giúp cái ghế cho tôi dán lên vách đi.

Anh Sáu tuyên truyền đứng lên ghế ,đưa tờ khẩu hiệu ngắm nghía cho cân bằng hai đầu rồi từ từ dán vô vách lá Dán xong một tờ, anh thong thả dán nốt tờ thứ hai.

Tôi cầm đèn soi lên, nhìn trân trân vào những dòng chữ khắc gỗ in mộc bản mà tôi đã đọc nhiều lần trên các tờ khẩu hiệu dán đầy ở những nẻo đường tôi đã vượt qua.

Độc lập hay là chết

Nước Việt Nam clta ngồi Việt Nam!

Anh Sáu tuyên truyền lại lôi ra một tờ giấy khổ nhỏ in chữ chì, còn thơm phức mùi mực ty-phô, dán vào vách ngang tầm mắt người ngồi ở bàn. Lão Ba Ngù lẩm nhẩm đánh vần:

– Khờ. . . ông . . . không, đờ. . i đi . . . Khô.ng đi lính chờ. . . o cho… Không đi lính cho giặc!

Đôi mắt tròn ra, nét mặt trang nghiêm, lão Ba Ngù lần lượt vừa đánh vần vừa đọc hết những khẩu hiệu như những lời thề viết lên bằng máu:

Không di lính cho giặc!

Không bán lương thực cho giặc

Không đưa đường chỉ lối cho giặc

Ai có dao dùng dao, có mác dùng mác, mỗi người dân là một người lính, mỗi thước đất là một chiến hào, sẵn sàng hi sinh bảo vệ nền độc lập cho TỔ quốc!

Đọc xong rồi, lão Ba Ngù lẳng lặng bước đến chỗ móc áo lấy cái áo bà ba đen của lão giũ giũ mấy cái. Đoạn lão mặc vào, cài cả cúc cổ cẩn thận. Lão cứ đứng nhìn lên những dòng chữ đỏ chói như máu kia, hai bàn tay vuốt đi vuốt lại những nếp áo nhăn nheo đã lâu không mặc tới.

Không biết có phải vì cơn gió to lúc nãy khiến lão bị lạnh, hay bởi lẽ nào khác tôi không được rõ. Chỉ trông nét mặt im lặng và cử chỉ trang nghiêm của lão thì tôi thấy giống như lão đang đứng bên giường một ngươi bệnh thập tử nhất sinh. Kinh nghiệm ở những nơi khác thì với tình hình này, chắc chắn là chỉ trong vòng một tuần lễ nữa thôi, giặc Pháp sẽ tiến tới đây…

Trời ơi, mày có bưng đĩa thịt bò ra giùm tao một chút không. Làm gì mà đứng chết gí ngoài đó vậy? – đì Tư Béo trong bếp eo éo gọi vọng ra .

Tôi giật mình chạy vào, suýt nữa ngã bổ xuống ngạch cửa. Lão Ba Ngù không vào giúp tôi một tay như mọi khi, lão lặng lẽ ra đứng trước bến hút thuốc lá một lúc rồi bỏ đi đâu mất. ông Huỳnh Tấn và anh Sáu tuyên truyền đói dữ. Chẳng mấy chốc mà hai người đã làm sạch rá bún và hai đĩa thịt bò xào to tướng. ông Huỳnh Tấn vươn vai đứng dậy, co chân duỗi tay, cười hì hì:

– Từ sáng đến giờ, hai anh em thay nhau chèo một mạch, chẳng có hột cơm bỏ bụng ăn bữa bún ngon quá. Ước chừng còn một rá nữa, chúng tới cũng ních hết?

Anh Sáu tuyên truyền quay sang hỏi dì Tư Béo đang chấp hai tay trước bụng, đứng bên góc bàn hầu khách:

ĐỘ mấy giờ thì liên lạc ở Thới Bình lên tới?

– Sớm thì cùng chín mười giờ. Trời đất này, ngược nước ngược gió , họ có thể lên khuya hơn . . . Các ông cứ ở lại nghỉ cho đỡ mệt – dì Tư Béo dáng thong thả, có ý muốn cầm khách.

CÓ gì nhậu, dì mang ra vứt đó cho chúng tôi! ông Huỳnh Tấn nói cách vui vẻ – Dằn bụng rồi , bây giờ có thể lai rai được chứ hả, đồng chí Sáu?

Tôi quạt than hơ lại mấy con tôm càng nướng sẵn, to cỡ cổ tay người lớn mà dì Tư Béo còn cất. trong chạn.

Trong khi đó, anh Sáu tuyên truyền cầm đèn ra sau quán ngắt mấy ngọn rau răm, còn ông Huỳnh Tấn thì giành với dì Tư để tự ông ta giã bát muối ớt cho vui .

– Bác Ba Ngù đi đâu rồi hả dì Tư? Anh Sáu tuyên truyền chợt hỏi.

– ối có trời biết ổng đi đâu? Muốn đến thì đến, muốn đi thì đi .

– Nhậu mà thiếu bác thì không vui?

– CÓ tôi đây, chú Sáu lão Ba Ngù từ ngoài nói vọng vào May quá, chỉ lo về không kịp? _

Lão Ba Ngù bước vào, đặt một lít rượu trong như mắt mèo lên bàn, xoa xoa hai bàn tay rồi đan mười ngón tay vào nhau, nghiêng đầu ngắm chai rượu:

– Tôi chạy vào tận xóm Tràm, nài lại của họ đây. Không mấy thuở… Để khách xa uống không đặng ngon sẽ mang tiếng đất Rạch Giá, Bạc Liêu mình!

Khi ba người đã ngồi vào bàn,sắp sửa rót rượu thì có bóng một người mặc quân phục màu den, khoác ca- pốt, lom khom bước theo ánh sáng đèn, đi vào quán. Tôi nhận ra ngay đó là anh phân đội trưởng Cộng hòa vệ binh vừa về đóng quân Ở xóm trên đã mấy hôm nay.

ông Huỳnh Tấn bỗng xô ghế đứng dậy, đôi mắt tròn thao láo nhìn anh phân đội trưởng, còn anh phân đội trưởng thì đứng sững lại ở chỗ ngạch cửa mồm há hốc ra.

Hai người im lặng nhìn nhau, rồi cả hai cùng lao tới ôm lấy nhau, tay đấm đấm vào lưng nhau thùm thụp:

Trời ơi, tao tưởng mày chết rồi?

– Tao cũng tưởng mày chết rồi?

– Vậy ra không thằng nào chết cả.. .

Hai người cùng tranh nhau nói. Không còn nghe câu nào là của người nào. Những tiếng nói bằng giọng cường tráng sôi nổi vồ vập tuôn ra cùng với những tiếng cười vui vẻ mừng rỡ của đôi bạn tình cờ gặp lại, cứ xoắn lấy nhau.

– Sao nghe mày chết ở mặt trận Gò Công rồi? Ngồi xuống đây? – ông Huỳnh Tấn kéo ghế mời anh phân đội trưởng

Chết thế nào được? Ờ mình có bị thương ở Vàm láng, GÒ Công anh phân đội trưởng lột áo ca-pốt ném lên chõng, mở cúc áo trỏ vào vết sẹo trên ngực. – Xuyên trước trổ ra sau lưng, thủng một lỗ phổi cầm chiếc đũa thọc qua được. Bọt cứ tuôn ra phì phì. Cả máu cả bọt. Vậy mà chỉ hơn tháng sau mình đã dậy, ra chỉ huy chiến đấu

Sức mày canông bắn cũng không chết – ông Huỳnh Tấn cười hì hì .

Anh phân đội trưởng bấy giờ mới ngắm nhìn ông Huỳnh Tấn từ đầu đến chân:

– Mày vừa tới đây à? Bây giờ chắc làm to lắm hả? Nhưng chưa quân sự lắm! Hãy còn cái mã của anh sinh viên

Anh phân dội trưởng bỗng nhếch mép không nhìn vào ông Huỳnh Tấn nữa mà chỉ ngó ra ngoài trời tối đen một lúc rồi từ từ quay lại, giọng trầm hẳn xuống, hơi buồn, pha đượm ít nhiều chua chát:

Nghe anh em báo là cậu có theo phái đoàn anh Giàu đi hội kiến với Gờ-ra-xây Thằng Gờ-ra-xây bắt bỏ cậu vào bao bố nhận xuống cống Sài Gòn – chợ lớn chết rã thây từ cuối tháng mười năm ngoái mà ?

ối Anh em ghét mình, họ bịa ra họ nói vậy, chứ mình có đi hội kiến hội mối bao giờ Mà họ ghét mình cũng phải thôi. ông Huỳnh Tấn nói chậm rãi. – Chuyện còn dài, hẵng uống một cốc rượu mừng cái đã .

Lão Ba Ngù đứng dậy, tay phải ngửa ra, tay trái cầm chai rượu nút lá chuối cắn vào mỏm, đặt chai rượu nằm xuôi trên lòng bàn tay phải, từ từ xoay bàn tay úp xuống rót rượu ra cốc; khi cốc vừa đầy, lão nhẹ nhàng uốn ngửa bàn tay đưa cổ chai rượu xốc nghiêng lên. Dòng rượu nhỏ và thanh như bị sợi chỉ cắt đứt khỏi miệng chai, tụt xuống mặt cốc đầy, làm sủi bồng mấy cái tăm nhỏ chạy .vòng quanh.. . .

Lão rót luôn bốn cốc, đều tăm tắp như vậy, không hề nhểu ra bàn một giọt rượu nào.

Trờí.. ời. ông già róc rượu đẹp quá! Như nghệ sĩ biểu diễn ấy – ông Huỳnh Tấn kêu lên.

.LÃO Ba Ngù vuốt cặp ria, đặt chai rượu xuống bàn:

– Nói các đồng chí tha lỗi, chứ tôi khổ sở và hết nghiệp vì rượu mới chỉ học được cái trò này. Đã uống rượu thì phải biết rót rượu, sao đừng cho giọt phí giọt phạm nào rơi vãi xuống bàn. Cũng như người lính cầm súng, phải bắn bách phát bách trúng, bắn sao cho đừng trật một viên Chớ để một thằng Tây nào chạy thoát! anh Sáu tuyên truyền cười ha hả:

Bác Ba bữa nay xuất khẩu thành văn. VÔ ban tuyên truyền công tác với tôi đi, cha nội! . . . Các đồng chí thấy chưa , ngán dân đất Chắc-băng này chưa? Rượu chưa vào mà lời châu ngọc đã tuôn ra rồi!

Dì Tư Béo vừa cười múm mím vừa cắt chanh ra vắt rưới lên mấy con tôm càng nướng bóc vỏ.

– Bà chủ uống với chúng tôi một ly cho vui ông huỳnh Tấn hai tay bưng cốc rượu lên đưa sang mời dì Tư Béo.

Dì Tư Béo lắc đầu quầy quậy:

Tôi xin vô phép các ông. Tôi không uống được mà Để tôi đi lo cho các ông nồi cháo gà dằn bụng(ăn lót dạ) . để buổi khuya đi đường.

Bốn người chạm cốc, uống cạn. HỌ hút thuốc lá và thổi khói ra um nhà. Rượu được vài tuần, ông Huỳnh tấn bắt đầu dặng hắng nói :

– Đây toàn đồng chí anh em cả thôi. Chẳng ai xa lạ gì mà phải giấu. Anh em họ không rõ, họ ghét mình là chuyện tất nhiên thôi. Mình chẳng có đi hội klến với thằng ra-xây đâu , mình là cái thá gì! Vả lại , nói cho đến cùng, nếu cần bảo vệ các anh lớn . thì dẫu vào hang cọp mình cũng chẳng từ nan. .. Mình có đi làm cận vệ, người cận vệ độc nhất, đưa anh Giàu đi gặp thằng đại tá Nhật ở đình An Lạc để bàn về các thể thức chuẩn bị gặp thằng ra-xây. Thằng giặc già này nó lập kế hoãn binh để chờ tiếp viện, trong khi các sư đoàn quân cách mạng của ta vẫn còn vây đặc chung quanh Sài Gòn-

Chợ Lớn.

Tất nhiên là sau đó cuộc hội đàm ở khu nhà Huibonhoa trong Chợ Lớn chẳng đem lại kết quả nào. Có thể nói anh em còn thật thà, chứ không phải ngán gì nó đâu

Anh phân đội trưởng chành môi ra, không biết anh cười hay không cười, chỉ thấy đôi cầu vai rung rung .

Không ngán mà lại toan đình chiến với chúng nó?

Anh em nhiều người đã nói và nghi như cậu ông Huỳnh Tấn nói chậm rãi,giọng ôn tồn. – Trong lúc toàn thể dân chúng quyết xông ra bóp chết bọn giặt xâm lược mà nói đình chiến thì ai mà không ức? Có thể nói các tướng lãnh của mặt trận Sài Gòn – Chợ Lớn không ai chủ trương vậy đâu!

Không chủ trương, không tán thành mà có cuộc hội kiến ấy? – anh phân đội trưởng nhỏm dậy, nói cắt ngang :

ông Huỳnh Tấn lặng thinh, tự rót rượu cho mình, cầm cốc lên uống từng ngụm nhỏ. Nét mặt của ông trở nên đăm chiêu, rắn rỏi lạ. Dường như ông không phải là con người liến thoắng vui tính như khi mới bước vào quán lúc chập tối. ông nói:

Nóng làm gì. Thong thả mình kể cho cậu nghe. Một lần nữa, mình khẳng định không ai chủ trương đình chiến. Bằng cớ là trong hội nghị các tổng lãnh của mặt trận SÀI Gòn – Chợ Lớn tại Tổng hành dinh của Uỷ ban kháng chiến Nam BỘ tại chợ Đệm…

CÓ những ai nào – anh phân đội trưởng bấy giờ mới ngồi xuống ghế, chăm chú nghe.

Đông lắm? Mình không nhớ hết… Tất nhiên là có anh Trần Văn Giàu, anh Huỳnh Văn Tiếng, anh Từ Văn Ri, anh Hai Râu, anh Nguyễn Lưu, anh Mười Trí, anh Tư Tỵ và anh Ba Dương. Cậu nhớ Tư Tỵ không? Trời ơi , có thể nói cha ấy là . một ác-xơ nan(kho vũ khí), khắp người đeo đầy vũ khí. Nào dao găm, súng lục, nào gươm Nhật. . . lại đeo ống nhòm, đội nón sắt, mang ghệt , đi giày đinh. Tư Ty giữ mặt trận Bàn Cờ

– Chợ Đủi ấy mà !

– Nhớ rồi Khi mình rút xuống Mỹ Tho, còn nghe nói anh Nguyễn Lưu lãnh đạo công đoàn nội thành Sài Gòn – Chợ Lớn đánh nhiều trận sướng lắm, phải không

Ừ Nguyễn Lưu nói làm gì nữa? Dân Côn Đảo về mà! – Nói ngay chỗ cuộc hội nghị ấy nghe nào?

– Lúc đang họp anh Ba Dương đi một chiếc tàu sắt từ Bình Xuyên đi tới . Cậu biết Ba Dương chứ ? xưa nay vẫn vậy Thủ lãnh Bình xuyên, dần anh chị mà lúc nào cũng khiêm tốn, ôn hòa, ít nói . Trong cuộc họp, Ba Dương chỉ lặng lẽ ngồi nghe, hai tay tì vào thành chiếc bàn tròn vòng gõ, mặt cẩm thạch, thứ mặt bàn lúc nào cũng lạnh như nước đá ấy. Mọi người bàn cãi lung tung việc nên ngừng bắn hay không ngưng bắn. Đợi cho mọi người ngớt tiếng, bấy giờ anh Ba Dương mới đứng dậy, thong thả rút trong túi áo bành tô ra một chai, đặt cộp xuống giữa mặt bàn. Biết gì không? Trời ơi, chai toàn là những ngón tay ngâm rượu. Anh nói: “Đây là ý kiến của anh em Bình Xuyên phát biểu với hội nghị, khi nghe nói có lệnh đình chiến. Rồi anh nghiêm giọng, tiếp: “Họ chặt ngón tay thề trước bàn thờ TỔ quốc, trước ảnh Cụ HỒ là nhất định đánh đến cùng… Các anh ra ngoài kia mà coi chiếc tàu của tôi. Tụi Tây ở Rạch Kiến nó bắn tôi như vậy đó

– Thế còn đi hội nghị với Gờ-ra-xây làm chó gì nữa? –

Anh phân đội trưởng vung tay, nói như quát.

Đi thì đi, còn đánh là đánh Hai vấn đề khác nhau. Vấn đề chủ yếu là đánh. Mình kể cho cậu nghe vừa rồi đó Anh em có ai rút lui đâu? ông huỳnh tấn còn định nói điều gì nữa đó, chừng như sắp nói một câu quyết liệt lắm thì phải, nhưng ông lại thôi, mặt lầm lầm, móc thuốc lá ra đốt một cách bực dọc. Anh phân đội trưởng chấm đầu ngón tay trỏ vào rượu vẽ vẽ lên mặt bàn. Còn anh Sáu tuyên truyền và lão Ba Ngù thì ngồi đưa mắt nhìn nhau. Tôi thấy mọi người im lặng, tự nhiên mình cũng đứng ngây ra, không dám động cựa. Trong quán chỉ còn nghe tiếng củi nổ lép bép và tiếng nước sôi reo đều đều sau bếp. Lâu lâu, trời lại chớp lên một cái. Mặt nước dòng kênh sáng rực trong ánh chớp. Những đầu ngọn cây tràm và chiếc xuồng không đang buộc bên kia bờ hiện lên xanh biếc, dường như trời đất cỏ cây và những ngọn sóng lăn tăn không ngớt vỗ nhẹ đôi bờ kia thảy đều rung rung trong sắc xanh kỳ ảo, mắt người chưa kịp trông rõ đã biến mất vào bóng tối.

Một giọng hát buồn của anh thanh niên nào đó, đang thả thuyền trôi theo dòng kênh, nghe mỗi lúc một gần.

Ngoài hiên giọt mưa thu thánh thót rơi . . . Phòng vắng…

Lão Ba Ngù tức thời đứng dậy, bước thình thịnh ra ngoài.

– Ê ghe ai chèo lạc xạc đó – lão hỏi. Dưới thuyền có tiếng đáp.

– Đi chở củi về đây, ông nội. Xét giấy hả?

– Dưới ghe có ai bệnh sắp chết phải không? – lão Ba Ngù lại hỏi, giọng cay độc có ai bệnh gì đâu! đừng có trù mạt

Hừ vậy mà tưởng thằng nào đang mắc dịch mắc gió gì dưới ghe đó chớ. Bộ sắp chết sao mà rên khừ khừ vậy? bây giờ không phái là lúc hát cái giọng mèo ướt đó nữa a, nghe chưa?

Không có tiếng trả lời. Tiếng chèo khua mỗi lúc một xa. Lão Ba Ngù thở phì phì, bước vào quán cởi áo ra ném bên chõng cái xoạch. Anh Sáu tuyên truyền liếc sang ông huỳnh Tấn và anh phân đội trưởng, cố nín cười. Khi thấy hai người này cũng đang nhịn cười như mình, anh Sáu tuyên tuyền không nín nổi nữa, bèn phì một tiếng và một tràng cười ha hả vụt nổ ran Chú Sáu, chú cười tôi cái gì? – lão Ba Ngù toan ngồi xuống ghế lại thôi, mắt lão dán vào đôi môi dang cười rung rung trong ánh đèn đỏ khé của anh Sáu.

– Ha ha ha… Ai cười gì bác đâu?

– BỘ lão già này nói bậy à? Hừ, chú làm tuyên truyền chú há chẳng biết “Quốc gia hưng vong, thất phu hữu trách” sao? Nước nhà còn mất, dện một thằng mẹ rượt(đồ bỏ đi) như lão đây cũng còn có trách nhiệm mà.

Bây giờ thì ông Huỳnh Tấn, anh phân đội trưởng và dì Tư Béo vừa ở bếp quệt mồ hôi trán bước ra cũng đều cười lên thành tiếng. Khi lão Ba Ngù hiểu ra rằng đó là những tràng cười tán thưởng, lão bèn vuốt ria quay mặt vào trong tối lảm nhảm một mình: ờ có hơi lố bịch một chút! Nhung tôi già rồi, thấy đâu thì nói đó vậy thôi. Nào, bà chị đã cắt tiết gà chưa? Tôi giúp một tay.

Thôi, cám ơn. Cháo sắp dọn ra được rồi đấy!

Dì Tư Béo nói bằng giọng thanh thanh kéo dài làm duyên kiểu như còn trẻ. Bà ta sễ sàng xắn tay áo lên, bàn tay béo núc cầm chai rượu róc liên tiếp ra bốn chiếc cốc. bốn cốc rượu róc bồng mắt thỏ đều tăm tắp, xếp một hàng ngay ngắn dưới ánh đèn lung linh, tưởng như rượu sắp tràn cả ra ngoài nhưng tuyệt nhiên không hề thấy có một giọt ướt nào rơi xuống mặt bàn…

Đêm hôm đó,. mãi đến mười hai giờ khuya vẫn không thấy xuồng liên lạc dưới Thới Bình lên. ông Huỳnh Tấn sốt ruột không chờ được nữa, bèn cậy anh Sáu tuyên truyền tìm người đưa ông đi. Lão Ba Ngù xung phong nhận lãnh chiếc tam bản của anh Sáu tuyên truyền chèo đưa ông Huỳnh Tấn. Anh phân đội trưởng lâu ngày gặp bạn cũ, vẫn còn nấn ná ở lại hàn huyên mãi cho đến lúc chia tay. Còn dì Tư Béo thì chẳng những dứt khoát không nhận món tiền bữa rượu, lại còn biếu ông Huỳnh Tấn và lão Ba Ngù mỗi người một đòn bánh tét nhân tôm thịt mang theo lót dạ dọc đường.

Tôi thu dọn bát đĩa xong, vừa hạ cánh liếp xuống thì nghe tiếng Tư Mắm hỏi vọng từ dưới bến :

– Quán còn thức hả, chị Tư?

– Còn thức . Nhưng mà chẳng có gì ăn đâu . – dì Tư Béo đáp cách miễn cưỡng.

– Không sao? Không sao! Rồi khắc có thôi mà

Tư Mắm đã lên bờ, tự tay chống cánh liếp cửa, vào quán cầm đèn ra soi xuống bến cho mụ vợ hắn bước lên.

– Chào dì Tư? Khuya rồi mà chúng tôi còn làm phiền dì quá -vợ Tư Mắm chúm chím cười , nói một câu lấy lòng bà chủ quán, đoạn từ tốn nhấc ghế ra, rón rén ngồi xuống.

Đúng như lão Ba Ngù nói, cứ trông hai người này, khó ai tin rằng họ là một cặp vợ chồng. Tư Mắm thì vừa hôi vừa bẩn, vừa hà tiện lại vừa vũ phu. Còn mụ vợ hắn tuy ăn vận mộc mạc ra vẻ một người lam lũ, nhưng từ cách nói năng cho đến dáng đi, cách đứng thì rõ là người hạng phong lưu đài các. Thấy tôi che tay lên miệng ngáp, mụ ta vỗ vỗ nhẹ vào lưng tôi: .

Chịu khó thức một chút. Rồi qua cho tiền sáng mai ăn bánh.

Tư Mắm xuống thuyền xách lên một chai cột nhà vuông(Một loại rượu mạnh của pháp) và một xâu cua biển . Hắn đi thẳng vào nhà bếp, vất xâu cua xuống cạnh lò, mắt đảo một vòng ra tận sân sau. Tôi đi sau lưng hắn, thấy vậy bèn hỏi:

Chú kiếm rổ hay cái gì, bảo tôi lấy cho.

– À Không – Tư Mắm giật mình quay lại – Qua coi nhà còn gì nhậu được nữa không thôi mà – Rồi hắn cầm chai rượu ra, rủ rỉ với dì Tư Béo đang loay hoay cầm khăn lau cốc bên bàn: – Nấu nồi cháo cua ăn chơi đi, dì Tư

– Cháo cua làm gì Nhà vừa nấu nồi cháo gà cho mấy ông khách. HỌ chỉ húp mấy người vài muỗng, vì trước đó đã ních hết rá bún rồi, còn ăn uống gì nữa. Trời, nồi cháo gà nấu đậu xanh, ngọt lắm. Để hâm nóng lại thôi dì Tư Béo miệng nói, tay khoát ra hiệu bảo tôi vào nhóm bếp lò – vậy thì nướng vài con cua nhá chơi còn bao nhiêu biếu dì – Tư Mắm đảo mắt nói. Rồi hắn hỏi trống không:

– Chà khẩu hiệu ai mới dán đây nhỉ?

Dì Tư Béo không đáp. Tính bà ta vốn như vậy, ai hỏi riêng bà thì bà nói , không thì thôi . Mụ vợ tên lái buôn cau mắt nhìn hắn một cái, từ hai trong con ngươi phát ra những tia sáng quắc, nhọn như những mũi kim. Nếu tôi không chú ý mụ từ trước, thì không thể nào bắt gặp cái lườm dữ dội trong thoáng chớp ấy. Tư Mắm tức thời cười hề hề, nói lảng:

Chèo rã cả tay mà bữa nay chẳng bán được mấy. Chỉ toàn bán chịu cho vài người mới quen.

Mụ vợ hắn hỏi xin quả chanh và một thìa đường trắng, rồi tự tay rót thứ rượu tây của mụ ra cốc, cho đường vào, hâm nóng cốc rượu trong bát nước Rồi sau khi đã thả vào cốc một lát chanh rồi cầm cái đĩa đậy lên.

– Cháu không biết uống rượn đâu? mụ cười chúm chím ngó dì Tư- Thuốc giải cảm đấy. Đi nhiều, mệt, uống một cốc này nó ra mồ hôi, khỏe người lại ngay

Tư Mắm ngồi hút thuốc phì phèo. hắn lại hỏi dì Tư – Ờ lúc nãy thấy bác Ba Ngù chèo tam bản đưa ông nào đi đâu vậy, hả dì?

Dì Tư Béo nhướng lông này, làm mặt quan trọng. Bà ta không nhìn Tư Mắm, nghiêng người xuống gần bên con mụ vợ hắn, ngón tay trỏ đặt ngang mồm:

Đừng có lộ bí mật nhá. ông ấy lớn lắm đấy. Cấp Nam BỘ mà! Chà, ông khỉ gì, quên rồi.

Đoạn bà ta quay vào cửa bếp hỏi tôi: ông hồi nãy làm chức gì, mày nhớ không?

Tôi không muốn trả lời, nhưng buộc lòng phải đáp cho có đáp: Cháu không nghe nói ối! NÓ con nít, biết cái gì mà gì hỏi nó – Tư Mắm cười hề hề, nhịp chân rung đùi.

Mụ vợ Tư Mắm ngó ra bến, liếc hắn một cái, thong thả đưa bàn tay ngón búp mang vén mớ tóc mai :

– Bán mấy chỗ mà không ghi chép cả. Mai mốt đây quên đi, làm sao đòi được. Khó quá?

Mụ móc trong túi ra quyển sổ con và cây bút máy, đặt lên bàn. Tư Mắm rời ghế đứng dậy, bước ra ngoài tối.

Nghe hắn nói vọng vào: “Khuya rồi mà không mưa được oi bức quá. Đứng đây một chốc cho mát. Dì Tư, hễ được cháo thì dì nhấc ra, nướng luôn vài con cua, nghe dì!

Thấy tôi lại ngáp, dì Tư Béo bèn bảo tôi xuống chiếc thuyền mui ống của dì vẫn đậu trong mương, đi ngủ trước đi. Mụ vợ Tư Mắm vẫy tôi đến, giúi vào tay tôi tờ giấy bạc năm hào. Tôi không lấy, đặt trả lên bàn…

Cầm đi mà? – con mụ cười cười, nhìn tôi có hơi ngạc nhiên.

– ối! NÓ không lấy thì thôi, kệ nó? Thằng này có phải như người ta đâu? – dì Tư Béo nói có ý bực tức vì tiếc hộ cho tôi .

Tôi bước ra ngoài, không nghe bà ta nói gì về mình nữa bèn đi thẳng ra mương chui xuống thuyền, rúc vào nóp(Một loại bao đan bằng cỏ bàng, một loại cỏ có nhiều ở đồng tháp dùng tránh muỗi thay màn). Muỗi vo ve kêu dậy trong những lùm cỏ rũ ngọn xuống hai bờ mương. Tôi tưởng nằm xuống là đánh một giấc thẳng cẳng, hóa ra lại không ngủ được.

Không hiểu sao cái lườm của mụ vợ Tư Mắm cứ như xoáy vào óc tôi , khiến tôi sờ sợ. Chưa bao giờ tôi thấy một người đàn bà nói năng mềm mỏng, nhỏ nhẹ mà lại có đôi mắt lạ lùng, vừa đẹp, vừa đáng sợ như vậy. Các bà bán cá trong chợ cãi nhau nhưng lúc giận dữ, mắt long lên sòng SỌC vẫn không có nét gì đáng sợ như mắt con mụ này. . . .

Độc lập hay là chết!

Nước Việt Nam của người Việt Nam

Những dòng chữ rắn rỏi khắc gỗ in mộc bản trên các tờ khẩu hiệu mà anh Sáu tuyên truyền vừa dán vào vách từ chập tối bỗng lại hiện ra, nhảy múa trước mắt tôi.

Trong tai tôi nghe mơ hồ nhạc điệu buồn buồn của tiếng gió phẩy động ngọn dừa nơi một làng quê xa nào đó ở tận Tiền Giang mà tôi không còn nhớ rõ… Tôi lại thấy ông Huỳnh Tấn toét miệng ra cười. Gương mặt ông đang cười bỗng tối sầm lại. “Anh em có ai rút lui đâu? Tiếng muỗi vo ve mỗi lúc một xa dần. Tôi thiếp đi lúc nào cũng không hay biết nữa.', N'Trong Tửu Quán', N'trong-tuu-quan')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (28, 3, N'Hai đêm sau đó, trời mưa liên tiếp. Phần vì trời mưa, không mấy người đi chợ, phần vì có lệnh của thôn bộ Việt Minh cấm họp chợ đêm, đề phòng bọn Việt gian trà trộn vào xã không kiểm tra được, nên xóm chợ Ngã Ba kênh vào lúc vừa quá đỏ đèn đã trở nên buồn thỉu buồn thiu.

Chỉ còn quán cà phê dưới tàn cây bã đậu, mấy tiệm hủ tiếu của người Hoa Kiều ở chỗ dãy phố ngói nằm bên trong chợ ngó ra kênh và quán dì Tư Béo là có ánh đèn, lác dác bóng người lui tới.

Chợ chỉ đông ban ngày, nhưng người cũng chỉ nhóm họp lưa thưa Nhiều gia đình đã rục nịch tản cư xuống Thới Bình. Mấy hôm trước, những lúc trời im gió, dừng ở bờ kênh có thể nghe tiếng trầm trầm của súng đại bác bắn từ xa. Sáng nay, nhiều người còn nghe cả tiếng súng đại liên của tàu giặc ở hướng Ngã Năm. Dì Tư Béo đóng cửa quán, nghỉ một ngày để thu vén công nợ, đi đòi các món tiền rượn chịu của người quanh xóm.

Buổi trưa rảnh rỗi, tôi cũng mò vào chợ chơi, nghe ngóng tình hình. Phòng thông tin trước kia là nơi tụ họp đông người nhất. Vậy mà hôm nay cũng chẳng có mấy người vào xem tin tức, bởi vì toàn những in tức cũ. Một đôi dòng tin mới, viết tay dán vội lên đó thì cũng chẳng hơn gì sự hiểu biết của mọi người , chẳng đáng lưu ý và hấp dẫn bằng những tin đồn nhảm vô căn cứ, thậm chí nhiều khi còn vô lý nữa kia. Lực lượng phòng thủ của ta thế nào? Ngày mai rồi sẽ ra sao? Phần đông người ta đến đó để tự đặt ra những câu hỏi và tự nghĩ ra những câu trả lời. Bọn con gái bưng cả những rổ quả mãng cầu xiêm, vác cả những bó mía vào đựng trong phòng thông tin để ngồi bán. Chúng nó chơi đánh chuyền chuyền hoặc róc mía xả bừa bãi, la hét, cãi nhau om tỏi mà cũng chẳng ai rầy la gì. Tôi ngán ngẩm quá, bỏ phòng thông tin lững thững đi dọc ra bờ kênh . chợt thấy lão Ba Ngù đứng dưới gốc cây bã đậu to nhất Ở gần mé nước , tôi bèn men đến.

Bác về từ bao giờ đó? – tôi hỏi cho có hỏi, chứ đã nghe dì Tư Béo nói đêm qua với con mụ vợ Tư mắm rằng lão về từ chiều

– Về từ lúc về ấy! lão cười khà khà đáp giọng đã có chén. – Còn mày, bà chủ của mày bữa nay đi đâu mày sút xiềng(xiềng = dây xích, ý nói thoát khỏi ) dạo chơi đó

Bà đi đòi nợ. Đâu như tối mới về . . .

VÔ nhà lão đi ăn thịt rắn một bữa chơi đi!

– Rắn đâu mà ăn Bác bắt được rắn à? – tôi hỏi vậy, chứ nghe nói thịt rắn là tôi đã lạnh xương sống rồi.

– Rắn kia chứ đâu, mậy – Lão vỗ một cái vào lưng tôi, trỏ ra kênh: – Ghe chở rắn dưới U Minh vừa lên đấy?

Tôi trông theo ngón tay lão chỉ. Một chiếc thuyền nhỏ, mui lá, đang đè sóng rẽ vào bờ. Trước mũi thuyền, một thằng bé trạc mười bốn mười lăm tuổi, mặc quần đùi, cởi trần đứng dún hai chân, hai tay cầm cây sào dài chống xuống nước. Bên chân thằng bé có con chó săn, sắc lông màu tro, đang chồm lên chồm xuống, đuôi ngoắt qua ngoắt lại, hóng mõm lên bờ. Đằng sau lái, một ông cụ già cao to, vạm vỡ, chít khăn đầu rìu màu đỏ, áo bà ba đen thả cúc, vạt áo bay phần phật, đang nghiêng người quạt mái chèo đưa thuyền cập bến.

– Rắn ăn được sao? – tôi hỏi lão Ba Ngù.

– Trời ơi, thằng này ná quá (khờ quá) ! Chưa ăn bao giờ à? Thịt rắn ngon và bổ số một đấy. Con nít ở đây đều nếm mùi thịt rắn từ hồi còn trong bụng mẹ. –

– Cháu chưa ăn lần nào?

Ngon tuyệt Ngon tuyệt! Rắn hổ đất nấu cháo đậu xanh nước cốt dừa thì biết nhá? Già bảy mươi tuổi ăn món ấy thấy trẻ tráng ra như con trai mười bảy. Sơ sài thì rắn nhóc rắn bông súng uớp xì dầu, cặp gắp nguyên cả con mà nướng, bẻ từng khúc cầm tay xé ra chấm muối ớt nhậu. Thịt ngọt không gì bằng. Cầu kỳ thì rắn hổ đất, mèo mun chưng thuốc bắc, gọi là “long hổ hội”. Thường thường thì hoặc băm xào sả ớt, hoặc nấu ca- ri nước dừa. . . Khối cách ăn. Nhưng gì thì gì, cũng không bằng nấu cháo. Món phổ thông nhất mà Vừa bổ lại vừa mát

Nướng thì còn thơm, chứ nấu cháo không tanh sao, bác? ăn rồi mới biết, thịt rắn thơm như thịt gà, lại giòn dai, không bở như thịt gà: CÓ phải nấu suông đâu mà tanh? Này nhé, làm lông(lột da) xong, chặt khúc thả vào nồi cháo luộc lấy nước ngọt. Rồi mình gắp ra chứ. rồi mình xé nhỏ ra, băm nhỏ ướp hành tỏi, hạt tiêu, nước mắm. Rồi mình bắc chảo mỡ cho sôi. lên, thả tỏi vào. ấy, bấy giờ mình mới xào hắn ta! Xong, mình mới múc cháo ra bát, rồi mình xúc hắn ra, mình cho vào cháo khoắng khoắng mấy cái . . . Rồi mình rắc lên một ít hạt tiêu. . . E hèm! E hèm… Thôi, mày sẽ khắc biết thôi. Ghe đã cập bờ rồi kia! .

Ra xem rắn, chúng mày ơi? – một giọng trẻ con bỗng hô hoán lên. . .

Tôi nghe tiếng quen quen, quay lại đã thấy thằng bé lùn lùn béo ục ịch đang dắt một đám trẻ con chạy băng qua sân chợ, lao xuống bến.

Chào ông bạn già? Có con rắn hổ nào không? Lão Ba Ngù vẫy tay hỏi.

Ông cụ già chít khăn đầu rìu màu đỏ đã đứng trước mũi thuyền. Nghe hỏi, ông liền đáp, giọng sang sảng:

Kỳ này không có. Toàn rắn rằn ri cóc, rằn ri cá không thôi. Nhưng được cái rắn béo lắm? – đáp xong, ông bảo thằng bé cầm sào ban nãy: – CÒ ơi! Lấy cái giỏ bự ra cho tía(cha, ba, bố ) đi con.

Thằng bé chui vô mui, đẩy hai cái giỏ tre ra khoang trước ông già dặng hắng một tiếng, xắn tay áo, hé sạp thuyền bỏ tay trần vào khoắng. Bọn trẻ nhỏ tức thời kêu lên: “Eo ôi?” và xô nhau lùi lại, vừa lùi vừa tranh nhau ngỏng cổ nhòm tới .

Ông cụ già thong thả lôi từ trong khoang ra từng con rắn một, bỏ vào giỏ. Con nào con nấy to cỡ bắp tay ông. CÓ một con rắn gì to như bắp chân người lớn nó cứ rúc vào khoang, khiến ông phải khom lưng thò tay vào, nắm cổ nó trì một lúc mới kéo ra được .

– ông già có bùa, tụi bay ơi

– ối có con rắn quấn cánh tay ổng kia kìa !

– Khéo nó cắn, ông ơi? .

Rắn người ta khâu miệng cả rồi. Cắn quái gì!

Bọn trẻ nhỏ chồm lên chồm xuống theo từng động tác cánh tay lôi của ông cụ già. CÓ đứa bì bõm lội xuống nước ngập ngang đầu gối, đứng ngó vào trong. CÓ đứa mặt tái xanh tái xám vì sợ, nhưng vẫn thích xem, cứ nhấp nha nhấp nhổm giẫm bùn sùng sục ở chỗ mé nước.

Khi ông già bậm môi nâng cái giỏ nặng trịch vác lên vai thì con chó săn lập tức phóng một cái, nhảy lên bờ.

Bọn trẻ con chạy dạt ra hai bên, làm nước bắn tung tóe. ông già lần lượt vác cả hai cái giỏ to tướng lên bến, đặt xuống gốc một cây bã đậu.

Những người mua đã trực sẵn chung quanh . Ai trỏ con rắn nào, ông già thò tay vào giỏ bắt ra con rắn ấy. Nói bao nhiêu tiền, họ trả bấy nhiêu, không kì kèo ngã giá như kiểu người ở các chợ tỉnh. Mỗi con rắn bán xong được siết chặt cổ bằng một sợi lạt và trao cho người mua xách về Lão Ba Ngù chọn mãi mới mua được một con ưng ý. Chao ôi, nom con rắn mà kinh? Bụng dẹt to cỡ bắp vế, không dài lắm,non mét ruỡi thôi, mà cái đầu thì bé như một quả bàng khô. Lão hất con rắn nằm vắt ra sau gáy, một tay bóp ngang cổ, một tay nắm gần chót đuôi đưa tới trước . Con rắn gồng mình nổi vảy lên chơm chớm như gai mít, sống lung uốn qua uốn lại trên vai lão Ba Ngù, khiến tôi phát khiếp…

Đi? Theo lão về nhà làm bữa cháo cho biết! – lão nhướng mắt bảo tôi.

Để lúc khác bác ạ? Bữa nay cháu bận trông quán cho dì Tư. . . tôi kiếm cớ thoái thác.

– Hê Hê! mày trông cái chợ thì có, chứ trông gì quán!

Thôi, không thích ăn thì thôi. Không ai ép mày? – lão bước đi mấy bước còn quay lại nhìn tôi, cười khà khà: – chỉ lo chừng mày quen mùi rồi, không đợi mời, mày cũng xách bát xách đũa chạy tới thôi!

Tôi trở về quán nuốt vội ba hột cơm nguội, xem chừng cốc bát đĩa có suy suyển món nào không, rồi quơ cái áo vét tông khoác vào người, đóng cửa quay ra chợ.

Tròi đã xế. Mặt trời đã xuống ngang ngọn cây tràm bên kia bờ kênh. ông cụ già bán rắn vẫn còn ngồi dưới gốc cây bã đậu, tán lá xanh um ngả bóng đen trên mặt đất Bọn con nít ban sáng bây giờ cũng không thiếu mặt đứa nào, đâu như còn có thêm mấy thằng mới tới . Chúng chen nhau ngồi trước hai giỏ rắn, mặt mày nhem nhuốc, đỏ lơ đỏ lửng vì bêu nắng, vì mồ hôi và bụi bặm. Đứa thì khoanh tay lên gối, dán mắt vào những con vật bò sát kinh tởm đang ló đầu ra mắt giỏ, đứa thì cãi nhau, tiếng nói tiếng cười chí chóe.

Ông cụ già vẫn ngồi dó, tay chậm rãi nhồi thuốc lá vào nỏ tẩu: cán tẩu vừa dài vừa quăn queo trông rất lạ.

Gương mặt ông khoáng đạt, rất dễ mến. Làn da rám nắng hun hun màu đất thó vẫn còn căng ra như da mặt người trẻ, chỉ đôi khóe mắt và trên vầng trán cao là có xếp mấy đường nhăn. Râu ông không dày lắm, nhưng chắc như rễ tre và đen nhánh. Đôi mắt to, sáng quắc, núp dưới cặp chân mày rậm đen. Khi ông cắn tẩu thuốc vào mồm, môi dưới hơi trễ ra, méo xệch một bên vì khối nặng của cái tẩu hình thù kỳ dị và hơi to quá cỡ, thì trông ông như có vẻ dữ tợn.

Tôi ngồi sát vào gốc cây, bên ông cụ già lực lượng ấy. BỘ quần áo bà ba đen đã bạc thếch vì dãi dầu nắng mưa sương gió của ông còn mang nguyên mùi hăng hăng của lá cỏ cây rừng tận những vùng đất hoang sơ, và mùi khói nồng lửa bếp trong chiếc thuyền con lưu động.

Thấy tôi mới tới, thằng bé lùn lùn béo ục ịch hất hàm nháy mắt tôi, rồi ngó vào giỏ rắn:

– Sợ không?

Tôi cười, không đáp. Nói sợ thì nó chê mình nhát, mà nói không thì không đúng.

– ê, nó sợ rồi tụi bay ơi! – một đứa lập tức kêu lên.

Hình như ông cụ già không biết có đám trẻ nhỏ ngồi chung quanh. Đôi mắt to, den nhánh đăm đăm nhìn vào khoảng không trước mặt. Không biết ông đang nghĩ gì.

Bọn trẻ nhỏ thấy ông dễ dãi, không rầy la gì, và nhân có tôi mới tới, chúng muốn tỏ ra bạo dạn hơn nên càng nghịch tợn. Chúng nheo mắt, thè lưỡi, có đứa con giả vờ toan thò tay vào giỏ lôi rắn ra để ném vào tôi. Mỗi lần có đứa trẻ nào nhích lại gần giờ rắn thì con chó săn nằm bên chân chủ lại nhổm dậy, vươn cổ ra nhe răng gừ gừ . mấy tiếng. Rắn quấn nhau trong giỏ nằm im nhưng Nghe tiếng chó gừ, những con rắn đang ló đầu ra mắt giỏ vội giật mình rụt vào, uốn éo cựa quậy làm cho rắn lớn, rắn bé trong giỏ chuyển lung tung. Mấy đứa lì lợm nhất, cởi trần truồng ngồi chầu hẫu gần bên giỏ rắn, liền co chân bật ngửa ra sau. Chúng nó cười hí hí một cách khoái trá . Nhưng cũng có đứa ngồi ở xa hơn lại mếu máo muốn khóc. Thằng bé lùn lùn béo ục ịch cầm cái que nhổm tới nhổm lui, quơ quơ ra bộ sắp chọc vào giỏ. Con chó săn lại vươn cổ ra gừ…gừ… mấy tiếng.

Lác dác có vài chiếc xuồng cập bến, họp buổi chợ chiều . Năm ba người đàn ông cởi trần, áo vắt vai từ trong dãy tiệm đi men ra, dừng lại dưới bóng cây bóng mát.

Trời oi quá! Chiều rồi mà nắng vẫn chói chang. Không một làn gió động. Những chiếc lá bã đậu như dán chặt lên nền trời, tôi ngửa cổ nhìn lên đến mờ mắt vẫn không tìm ra một chót lá nào nhúc nhích.

– Tàu bay bà con ơi – một người đàn ông bỗng hốt hoảng kêu lên, nhón nhắc ngóng chung quanh.

– Im? Để nghe coi nào! Im nghe chứ.

Mọi người nín lặng. ông cụ già bán rắn nhấc cái tẩu thuốc ra khỏi miệng, ngó xuống chân, cười mủm mỉm.

Tiếng vu vu của một con ong bầu đít vàng bay trong vòm nhánh lá rậm rịt, nghe hệt tiếng máy bay.

MỒ tổ con ong: Làm người ta giật mình – người đàn ông kêu lên ban nãy nhăn nhó nói một câu chữa thẹn.

Từ hướng biển Đông dậy lên những tiếng ầm… ầm… nối nhau, nghe rung rinh cả chân trời .

Chắc là tàu giặc, bà con ơi!

In như máy bay ném bom chứ!

Mình nghe giống tiếng sấm.. .

– Để nghe mà . . . Làm gì mà oà lên như giặc tới vậy?

Mấy người đàn ông cãi nhau một chốc rồi kẻ ngồi xuống gốc cây cầm áo quạt phe phẩy, người đi tới đi lui trong bóng râm hừng hực hơi bóng từ mặt đất xông lên, lặng lẽ không nói gì nữa. Thằng bé lùn béo ục ịch bỗng nhổm dậy.

Tàu giặc, các chú ơi? Nghe ì… ì… đấy

– Thằng con nít, đừng có nói. bậy BỘ mày ở ngoải vô sao mà nói đó là tàu? – người đàn ông tóc chơm chởm như gai trừng mắt quát.

RAà… ầ ầm? Rầm…? Rầm.:: Rầm… ầ… ầm! Bốn tiếng nổ bất thần nghe điếc tai. Những tiếng nổ chát óc, rền rền như tiếng súng đại bác, gần làm. Đám con nít thét lên, cắm cổ chạy túa đi. Mấy người đàn ông kia, có người cũng quýnh quáng toan chạy, nhưng cũng có ngừơl vẫn đứng yên nghe ngóng. Tôi quen tiếng súng tiếng bom từ mấy tháng nay, nên chỉ co người thụp xuống; khi dứt tiếng nổ, tôi liền đứng lên quan sát chung quanh. Nếu đó là súng giặc bắn vào thì cũng phải trầm tĩnh xem chúng tới từ hướng nào rồi hẵng chạy tránh chứ

Dưới kênh, thuyền xuồng tranh nhau tách bến, giầm chèo va khua lộp cộp. Một vài chiếc tam bản nhẹ hai chèo đã rời đi xa lắc.

Ông cụ già bán rắn Yẫn ngồi đó, phì phèo tẩu thuốc lá mặt bình thản như không. ông đưa mắt nhìn lên nền trời rồi hỏi tôi:

Cháu không về nhà à?

– Cháu ở gần đây thôi. Đấy, chỗ cái quán đấy!

Tôi đáp, giọng vui vui,bụng có hơi rạo rực một chút vì thấy ông già chú ý tới mình. ông cụ già thong thả đứng dậy, búng tay bóc. .. boóc mấy cái. Con chó săn ve vẩy đuôi, chồm hai chân trước lên sủa oang oang, vụt lao đi như một mũi tên. Một lúc sau, con chó quay về dắt theo thằng bé cầm sào chống trước mũi thuyền ban sáng.

– Tìm được chú VÕ Tòng không? ông già hỏi.

Người ra bảo chú đi rồi. Đêm qua trời mưa, có con beo vào bắt gà dưới xóm Sậy, chú VÕ Tòng rình bắn được.

Đâu như chú chở con beo ra bán ngoài Ngã Bảy.

Tôi đã toan về, nhưng nghe thằng bé nói vậy bèn dừng nán lại, nghe hai cha con trò chuyện.

– CÒ à, khiêng giỏ xuống ghe đi con

– Không bán nữa sao, tía?

-thôi Khiêng đi . . .

Tây tới gần rồi sao, tía?

– Tây đâu mà Tây. Dông sắp tới rồi. Dông lớn lắm đây con!

– Lúc này có tiếng sét nổ trên không, kinh quá hở tía.

– Ừ thôi nhanh nhanh lên, con .

Lúc bấy giờ, gió bắt đầu thổi rao rao nghe mát mát.

Con chó săn đã phóng xuống thuyền, đứng sau lái ngóc mõm lên nhìn trời. Cha con ông cụ bán rắn vừa kịp khiêng hai chiếc giỏ xuống thuyền thì cơn giông ùn ùn thốc tới. Mây ở đây từ dưới rừng xa, lúc nãy còn không trông thấy, giờ đã đùn lên đen sì như núi, bao trùm gần kín khắp bầu trời. Từng cuộn mây khói đen là là hạ thấp xuống mặt kênh làm tối sầm những ngọn sóng đang bắt đầu gào thét, chồm chồm tung bọt trắng xóa. Từng đàn cò bay vùn vụt theo mây, ngửa mặt trông theo gần như không trông kịp. Xóm chợ Ngã Ba Kênh dường như bé lại thu mình cúi rạp xuống mặt đất. Mấy chiếc xuồng ba lá, mấy chiếc tam bản của ngườl trên phố buộc dưới chân cầu nước trồi lên hụp xuống theo lượn sóng nhào, dựng mũi ngóc lên như ngựa muốn bứt dây cương.

Chiếc thuyền chở rắn của cha con ông già đã chèo giạt sang bên kia bờ, xuôi xuống một quãng xa, lắc lư chui vào một con kênh nhỏ, hai bên bờ mọc chen chúc những cây tràm vỏ trắng, cành lá rậm rạp.

Tôi toan chạy đi thì chợt thấy dưới gốc cây bã đậu có một chiếc túi da beo. Thôi, đúng là của ông già bỏ quên đây rồi. Tôi chộp lấy, cắm cổ phóng theo bờ kênh, vừa hú vừa ngoắt sang bên bờ bên kia. Không ai nghe tiếng tôi hú gọi cả. Gió thổi ầm ầm ù ù như có hàng nghìn chiếc cối xay lúa khổng lồ đang quay thẳng cánh trên trời. Bờ kênh chỗ tôi đứng trống huếch trống hoác không một lùm cây bụi cỏ. Nhiều lúc, tôi có cảm giác như gió sắp nhấc bổng tôi lên, thổi tung đi. Dãy phố ngó ra mặt kênh chuyển mình nghe răng rắc, cột gỗ hàng hiên lay lay như đưa theo một chiếc võng vô hình. Ngói bị cuốn tung lên, bay khua lảng cảng trên nóc nhà nhiều nghe đến phát sợ.

Không về đến quán kịp nữa rồi. Tôi vừa thở vừa khom người chạy vào cái miếu cô hồn nằm xê xế phía dưới chợ, chỗ cây đa cổ thụ cành lá rậm xùm xòa đang quằn lên vật xuống như sóng. Trời đất mỗi lúc một tối sầm lại. Vũ trụ quay cuồng trong cơn gió mãnh hệt. Những tia chớp xé rạch bầu trời đen kịt phát ra những tiếng nổ kinh thiên động địa chung quanh ngôi miếu. Tôi thu người lại như một con trút, ngồi sát vào chân bệ thờ. Tường miếu xây bằng đá tổ ong, mái lợp ngói trát vữa rất chắc nhưng tôi bắt đầu cảm thấy không an toàn chút nào. Chà, giữa lúc trời sét mà lại dại dột tìm chỗ trú ẩn ngay dưới một gốc cây to Tôi vốn ghét những chuyện hoang đường quái đản, không bao giờ tin rằng có ma qủy, nhưng không hiểu sao trong giờ phút này bỗng thấy trong người rờn rợn. Pho tượng “ông Tiêu”(Thần quản lý ma quỷ) mặt vằn vện, đầu mọc ba cái sừng, chiếc lưỡi thè dài quá rốn, đứng ngay trên đầu tôi Mỗi lần trời chớp, tôi đều ngửa mặt nhìn lên pho tượng với một nỗi lo sợ và tò mò không cưỡng được.

Tôi dặng hắng một tiếng rõ to, phủi đít đứng dậy bước ra ngồi ngay ở cửa miếu. Một vài hạt mưa bay chéo hắt vào mặt tôi lạnh buốt như nước đá. Bầy kiến đất bò ra bò vào cạnh chân tôi chúng quơ râu trò chuyện với nhau một cách bình thản, lại còn rủ nhau lũ lượt bò ra ngoài thềm miếu nữa chứ không cuống cuồng chạy rúc vào tôi như những khi trời sắp mưa to.

Cái túi da beo đựng vật gì hơi nặng thì phải. Hình như một con dao, bởi cái sừng ló ra ngoài cồm cộm thúc vào hông tôi. “Thử mở ra coi cái gì trong này?” Tôi vừa nghĩ thế, bỗng nghe từ trong lòng mình văng vẳng có tiếng bảo: “Đừng động chạm đến của cải của người ta. TÒ mò vậy không tốt đâu!” Tôi ngồi im một lúc, bàn tay ngứa ngáy không chịu yên lại nắn nắn cái túi. Bây giờ tôi lại nghe tiếng văng vẳng ban nãy cùng phụ họa theo ý nghĩ của tôi: “Xem chút thôi mà! Vả chăng, mình có ý định lấy gì trong túi này đâu!” Thế là cái túi da beo mà tôi đã nhét nửa trong nửa ngoài vào túi áo vét-tông, tự nãy giờ còn nằm yên đã bị bàn tay tôi lôi phăng ra tức khắc.

A! Cái dao găm!

Tôi chợt kêu khe khẽ và từ từ rút lưỡi dao ra khỏi chiếc da bao láng bóng vì đẫm mồ hôi người lâu năm ánh thép xanh xanh của lưỡi dao sắc như nước lóa lên mỗi lần trời chớp. Cán dao bằng sừng, nạm khâu đồng dỏ có chạm hoa văn rất đẹp. Cán bằng sừng gì như sừng nai.

Còn những gì khác nữa trong cái túi bí ẩn này? đằng nào mình cũng đã mở ra rồi.

Xem một chút thì có làm sao!”

Sự tò mò náo nức càng thôi thúc tôi hăm hở lật ra. Đây là một gói lưỡi câu đủ cỡ, mươi hai chiếc cả thảy, gói trong một mảnh giấy đầu cỡ bàn tay. Một cục đá và một miếng thép dèn dẹt to và dài, hơn mặt bao diêm. Đây nữa là một gói thuốc. Thuốc gì mà dẻo quánh, xin xỉn vàng, mùi hăng hắc, đưa lên mũi ngửi thấy buồn nôn . Tôi bỏ lại vào túi da beo tất cả các thứ linh tinh ấy, chỉ trừ cái dao găm, rồi thắt miệng túi thật chặt bằng sợi dây gân khô quắt và trơn tuột.

Cầm chặt cán dao trong tay, tôi bỗng thấy người mình như cao lớn hắn lên; dường như sức khỏe tăng lên vạn bội, tôi nghe mạch máu chạy râm ran trong những đầu ngón tay. Trời chớp nhoáng nhoáng. Tôi thong thả đứng dậy rồi bất thần quảy phắt lại, trừng trừng nhìn vào ngôi miếu. Pho tượng kinh khủng vẫn lặng lẽ đứng trên bệ thờ, lè chiếc lưỡi dài màu máu xuống rốn, bốn chiếc răng nanh trắng lòa nhe ra như cười.

Một lúc sau, gió dụi dần, rồi tắt hẳn. Trên ngọn đa tối sầm mà cơn gió cuồng vừa gào rú ghê người ban nãy, mấy con chim chào mào xôn xao chuyền cành nhảy nhót, hót líu lo. Nắng vàng màu da chanh phủ lên cây cỏ một thứ ánh sáng dịu mắt, trong suốt và lung linh dương như có thể sờ được

Tôi trở ra bờ kênh, đi dọc dài theo bến một lúc, hy.vọng sẽ gặp lại chiếc thuyền con của ông cụ giá bán rắn. nhưng ngóng hoài mà vẫn không thấy tăm dạng chiếc thuyền và cha con ông già đâu cả . Nhìn về nơi tít tắp, chỉ thấy ánh phản quang của ráng chiều sắp tắt từ mặt nước dòng kênh hắt lên những lùm bụi ven bờ. Sực nhớ rằng dì Tư Béo sắp về, tôi bèn gấp buộc trở lại quán dể lo bữa cơm chiều.', N'Ông Lão Bán Rắn', N'ong-lao-ban-ran')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (28, 4, N'Từ ngoài góc sân sau, tôi đã thấy trong hơi khói bếp bay tỏa ra xa mùi cháy của cá kho khô ướp nước màu dừa(nước hàng làm bằng nước dừa cô đặc), rưới mỡ béo ngậy và có rắc hạt tiêu thơm phức ông con ơi? Cơm đã dọn sẵn rồi đấy? – dì Tư Béo mát mẻ nói vọng ra.

Đáng lẽ phải đi nhanh vào và sẵn sàng chịu đựng những câu quát mắng của bà chủ đôi khi cũng bất thần nổi nóng với mình, thì tôi lại bước từng bước một cách hết sức chậm chạp .

Mùi cá kho khô thơm lừng mà ban nãy nghe thấy đã thèm rõ rãi khiến tôi cảm thấy bụng đói cồn cào, bây giờ bỗng bay đâu mất. Tôi không sợ những lời quát mắng.

Thậm chí những câu chửi rủa tục tằn cũng không làm tôi bực túc hay run sợ nữa. Bởi vì, đối với một thằng bé lưu lạc một thân một mình như tôi, thì bất cứ người nào cũng có thể hoạnh họe, bắt nạt, trút giận dữ lên đầu tôi một cách hết sức vô lý được. Điều đó, tôi chẳng coi ra mùi gì Thực tình thì. ban đầu tôi cũng khổ sở đau đớn vì phải hứng chịu những câu mắng mỏ thô lỗ cục cằn kiểu bọn đầu đường xó chợ mà từ tấm bé, vốn sống được nuông chiều trong một gia đình nề nếp, tai tôi chưa hề quen nghe. Tôi đã nghĩ rằng ngày nào cũng ngửa tai ra mà hứng lấy những lời xấu xa như vậy, thì mình đến vỡ óc ra mà chết thôi. Tôi tự nhủ: “Dại gì mình làm tờ giấy thấm để có giọt mực nào rơi xuống cũng hút lấy? hãy ném trả lại cho họ”. Thế là tôi đã nhanh chóng tìm ra phương pháp chống trả tiêu cực một cách có hiệu quả.

Một là tôi cứ lờ đi, sự phản ứng ngấm ngầm bên trong đã tạo thành một thứ vỏ thép mà những lời cay độc đến mấy bắn vào cũng sẽ lập tức bật ra quay về trúng lại họ.

Chẳng vậy mà những người đã há vành cung miệng, dùng lưỡi bắn tôi đã lồng lộn lên trước thái độ thản nhiên như không của tôi đó sao? Nhưng trái lại, tôi rất sợ – vừa sợ vừa căm ghét – những câu mát mẻ, nói bóng nói gió xa xôi Thái độ ấy thường gây cho tôi nhiều đau đớn, và những vết thương trong tâm hồn thơ bé của tôi cứ tấy lên mỗi lúc nhớ đến giọng nói mát mẻ, ngọt như mía lùi nhưng lại có xát ớt mà một người lớn đã ném cho một đứa trẻ con . . .

Thấy tôi lặng lẽ bước vào, dì Tư Béo càng bực tức:

– Bữa nay mày câm rồi à? Thụt lưỡi rồi hay sao_

Tôi chẳng nói chẳng rằng, cứ lẳng lặng đi lau đũa lau bát, dọn mâm ra bàn. Bà ta nhấc nồi cơm, múc cá kho, xới cơm ra bát xong đâu đấy, bèn hứ một tiếng:

Không ngồi vào mà ăn, còn đợi mời đợi thỉnh nữa sao?

Chưa có lệnh bà chủ, lẽ nào tôi dám tùy tiện, ngồi vào mâm trước? Mà đợi bà phải bảo thì tôi lại mắc vào cái tội chờ mời chờ thỉnh? Đằng nào, tôi cũng có lỗi cả? Mà nào tôi có tội gì cho cam Bà ta bảo tôi rằng bà ta đi đòi nợ đến tận đỏ đèn mới về. Quái qủy gì đã bắt bà về sớm từ chiều, tôi làm sao rõ được?

Bà ngó nghiêng vào mặt tôi, có lẽ dò xem thái độ hơn là chờ câu trả lời .

– Cháu không đói! – tôi đáp bằng cái giọng không phải của chính mình.

– Mặc mày thôi. Cơm nhà tao cũng chẳng thừa?

Bà ta nói lúng túng, giọng khê đặc như nén lại giữa cổ, bàn tay run run vờ cầm đôi đũa, dôi mắt trừng trừng nhìn tôi . Từ bộ mặt giận dữ, chiếc cằn nung núc lúc nào cũng ướt đầm mồ hôi của bà ta, đến mọi vật quen thuộc trong quán, tất cả cứ mờ dần trước mắt tôi. . . Tít đằng xa kia, dưới gốc cáy bã đậu ở chỗ ông cụ già bán rắn đã rời đi, một vệt ánh sáng nhờ nhờ phủ dài trên mặt đất bắt đầu sẫm lại. Vẳng trong tai tôi, giọng nói ấm áp đầy trìu mến của ông già xa lạ : “cháu không về nhà à?” Từ trong ngực tôi như có một cục gì cứ dâng lên, tôi cố nuốt xuống mà nó vẫn cứ trào lên nghẹn ngang giữa cổ. Tôi không nén xuống được nữa, đành để cho nó thoát bật ra thành tiếng nấc và tôi đã khóc.

Hình như dì Tư Béo chỉ chờ đợi có bao nhiêu đó. Nụ cười hả hê, chiến thắng của bà ta lập tức nở ra như miếng bánh phồng tôm thả vào chảo mỡ đang sôi reo. Có lẽ bà ta tưởng rằng thái độ lạnh nhạt và những lời mát mẻ của bà ta đã có hiệu quả trông thấy. Mà như thế là đủ rồi.

Thường thường, những người lớn sau khi thấy mình chiến thắng dược một đứa trẻ con, hành hạ cho nó khổ sở đến điều, lại hay muốn tỏ ra rộng lượng, nhân hậu một cách hết sức buồn cười.

Chà, hôm nay dì.. . nhưcon mụ điên ấy? Đừng có chấp nê tao làm gì? Mày mà oán dì thì mày phải tội đó. Chẳng qua là dì giận các lão già, rượu chịu thì cứ uống phứa đi như nước, mà tiền thì một đồng cũng không chịu nhả ra! bà chủ quán vừa nhăn nhó làm lành vừa gật gà gật gù thú nhận như vậy.

Bà ta lăng xăng đi thắp đèn, cười nói bả lả, làm như không có chuyện gì vừa xảy ra, một hay bảo tôi ăn cơm đi kẻo nguội.

Tất nhiên là tôi phải ngồi vào bàn cùng ăn với bà ta thôi. Suốt bữa cơm, dì Tư Béo không ngớt phàn nàn cho số phận hẩm hiu của mình. Rằng bọn đàn ông vô sỉ, thấy bà ta một thân một mình giở trò lừa đảo, có đứa còn lợi dụng tình thế gay go giặc sắp đánh vào đến nơi, cứ ỳ ra không trả nợ, thậm chí còn toan bắt nạt bà… Cơn giận làm bà ta phát no, hay vì mải nói quên ăn không biết, bà ta cứ luôn gắp bỏ vào bát tôi, cho đến khi tôi ăn xong rồi mà bát cơm trước mắt bà ta chưa vơi được quá nửa.

– Chúng nó đừng hòng bắt nạt bà ! – dì Tư Béo kết thúc tràng kể lể của mình bằng câu quyết liệt ấy, trước khi cầm bát đưa lên miệng để và nốt lưng cơm còn lại.

Đúng như vậy thôi? – tôi buột miệng nói.

Mà mày thấy có phải không? Đừng có đứa nào hòng…

Dạ. Người oai tín như dì thì cháng ai dám động tới chéo áo chứ trông gì bắt nạt

Bà ta dặng hắng một tiếng, bộ mặt nom rất hả hê. Bây giờ tôi mới nghiệm ra rằng chẳng riêng gì bọn lau nhau chúng tôi , mà người lớn người già lại càng rất thích được khen cho dù đó là lời khen xỏ của một đứa trẻ con. Của đáng tội, nói rộng ra thì chưa biết thế nào, chứ trong cái xóm chợ này, những tay sừng sỏ nhất cũng chẳng dám động đến cái móng chân bà chủ quán rượu cô độc lắm phù phép này. Không có mấy người là không nợ tiền bà. Cứ một đồng thì một ngày năm xu lãi. Cần lúc nào, hỏi lúc nào cũng có. Ai gặp bà ta ngoài đường cũng chào. Bà ta lại là người chắt bóp, tiện cặn, không đánh bài bạc gì, nên hai cái túi bóng mỡ cài nứt kim băng cứ phồng lên, no tròn theo thân hình béo ních của chủ nó. Cuộc đời và uy tín của bà ta, nói tóm lại đều tập trung ở hai cái núi nặng trĩu giấy bạc này.

– Lão Ba Ngù ngày hôm nay có tới đây không? – dì Tư Béo chợt hỏi tôi.

– Không thấy đến. Việc gì thế, dì?

Không: Cũng chẳng có việc gì. Hỏi thế thôi?

Lúc sáng cháu có gặp bác ấy ở chợ. Bác ấy mua con rắn to lắm. Bác ấy rủ cháu về theo bác ăn cháo rắn chơi . Nhưng cháu không đi.

Thảo nào? Chắc là nướng trọn mấy đồng bạc của người ta nhờ lão đưa trả cho tao rồi. Hứ hự

Tôi cất dọn mâm bát xong, không biết làm gì, nhận thấy bếp còn hồng bèn đi lấy ấm đặt lên. Dì Tư Béo thì ngồi nhai trầu tóp tép ngoài chiếc chõng tre, tay không ngớt phẩy quạt xành xạch.

Đêm oi quá. Không có lấy một chút gió nhẹ cho đỡ bức. Dường như cơn dông ban chiều đã phung phí quá trớn, giờ đây, đêm đến, hết sạch gió rồi, đành hổn hển nén sự bực bội vào trong bóng đen dày đặc một thêm nặng nề trùm xuống mặt đất mênh mang.

– Chào dì Tư Gớm, mắc cơn dông hồi chiều, chèo xuýt chết. Mệt rã người. Về tới quán dì, thấy khỏe ra ngay.

Tiếng cười lanh lảnh của mụ vợ Tư Mắm cùng với chiếc áo bà ba lụa màu xanh nước biển của y xuất hiện trong quán như xua tan bầu không khí ngột ngạt từ nãy giờ.

Đã cơm nước gì chưa? – dì Tư Béo bước xuống chõng, vặn to ngọn đèn, hỏi cách vồn vã.

Mụ đàn bà uốn lưng như một con mèo cái, đưa mắt nhìn vào tận bếp rồi xòe đôi bàn tay trắng muốt để lên mặt bàn. Mụ thong thả đặt đít xuống ghế, thở phào ra:

– Chừng này chưa có gì bỏ bụng thì có mà chết! ăn cơm rồi dì ạ . Nhưng nếu nhà còn thứ gì mặn mặn thì dì bắc hộ nồi cháo hoa, chốc nữa húp vài bát cho nó tỉnh người.

– Bữa nay tôi đóng cửa cả ngày, có bán chác gì đâu. Nhà còn một ít cá kho tiêu thôi. Tôi thèm, kho ăn chơi một bữa, hãy còn nửa nồi đây! dì Tư Béo đáp.

Tư Mắm khom người bước vào quán, nách cắp chai rượu tây, tay cầm con cá mực khô.

Nướng giùm qua chút, chú em! – hắn nói vọng vào bếp, mắt nhận ra ngay tôi dang đứng trong bóng tối.

Không chờ tôi bước ra, Tư Mắm đi luôn vào bếp giúi con mực khô vào tay tôi. Rồi hắn móc thuốc lá ra, nách vẫn cắp chai rượu, bật lửa lên đốt điếu thuốc hút tại chỗ. Đôi tròng mắt bé ti hí như mắt rắn đảo quanh một vòng rất nhanh, khiến tôi phải sợ sợ, không dám nhìn hắn.

Tôi quạt than đỏ lên, nướng mấy con mực xong, đặt lên cái đĩa kèm theo quả chanh và. một ít hạt tiêu giã nhỏ, bưng ra bàn.

Tư Mắm gọi một xị rượu đế, ngồi ngay ở đầu bàn, chiếc bàn dài chỗ cửa ra vào, rót rượn ra cốc và lặng lẽ xé mực bỏ vào miệng nhai nhồm nhoàm. Mụ vợ hắn ri thì ngồi chỗ góc bàn nhỏ bên trong, kê sát vách. Thấy mụ mở nút chai “cột nhà vuông rót thứ rượu thơm thơm vào chiếc cốc nhỡ, cho thìa đường vào, tôi vội vàng lấy ngay ra bát nước sôi đặt lên bàn, trước mặt mụ ta.

Thằng bé này ngoan quá! Em phải là đứa làm bồi các nhà hàng lớn ngoài tỉnh, chứ không phải là chú nhỏ hầu rượu chỗ này đâu?

Mụ cười cười khen tôi như vậy và chậm rãi thả cốc rượu ngâm vào bát nước sôi. Hai bàn tay ngón búp măng thoăn thoắt mở con dao xếp kiểu sáu lưỡi ra, cắt gọn nhẹ một lát chanh rồi cho vào cốc, úp đĩa lên đậy lại. Giống hệt như cái lần mụ đã “chế biến món thuốc giải cảm ! bận trước .

– Hai ông bà ngồi chơi, nghỉ một chốc đi! Tôi đi tắm một cái cho mát đã, – dì Tư Béo vừa nói vừa bước vào buồng lấy quần áo, và khi trở ra, không quên bảo tôi: –

Vo nắm gạo bắc lên bếp nấu nồi cháo đi, con. Nhớ nấu loãng nhá!

Trong một thoáng, tôi đã làm xong việc bà chủ bảo, rồi đến lặng lẽ ngồi bên bếp lửa, chỗ nghỉ ngơi và là nơi trú ẩn tốt nhất cua tôi mỗi khi tôi muốn quan sát một người khách rượu nào đó ở bên ngoài.

Từ trong bếp lửa nhìn ra, không có một cử chí nào của Tư Mắm lọt khỏi mắt tôi. Hắn uống hai cốc rượu liền, uống vội vàng, xong lại xé mực nhai nhóc nhách, mắt luôn luôn ngó ra cửa… Hành tung của đôi vợ chồng này có nhiều khác lạ, càng khiến tôi chú ý theo dõi. Những lần trước, quán đông khách, Tư mắm vẫn đến uống rượu.

Mắt hắn luôn luôn nhìn vào cốc rượu, dường như người đăm chiêu nghĩ ngợi, hoặc có một tâm sự đau buồn gì.

Hắn không mấy khi bắt chuyện với ai và không nhìn ai. Chỉ khi nào hắn đưa cốc rượu lên uống, đôi mắt ti hí mới liếc ngang, nhanh như tia chớp, ném cái nhìn trộm ra xung quanh. Đêm nay hắn không nhìn vào cốc rượu, mà chỉ ngó ra cửa.

Không biết con mụ vợ nó làm gì ngoài góc bàn. Chỗ tôi ngồi, khuất tấm vách ngang không trông ra được. “Chà, con qủy cái này là một tay rượu không vừa đâu?”. Tôi nghĩ thầm như vậy. Mới cách đây có hai hôm mà nó đã mở thêm một chai “cột nhà vuông” nữa rồi. Dứt khoát không phải là thuốc giải cảm như mụ ta nói. Thuốc thì người ta nhắm mắt, nhắm mũi uống một hơi chứ đâu có ngồi nhấm nháp từng ngụm, thưởng thức một cách khoái trá như những tay bợm rượu sành sỏi? Và bàn tay nó cầm thìa khuấy cốc, ngón út cong lên đầy kiểu cách, có phải là bàn tay của người lam lũ đâu Giá như đó là những con mẹ che dù đầm từ ngoài tỉnh chạy vào, luôn mồm kêu là không có nước ngọt tắm, không có nước đá uống thì là chuyện dĩ nhiên, không nói làm gì. Vợ một tên lái mắm tèng xí (đồ bỏ, đồ vứt đi) mà chứng học đòi làm sang thế kia ư?

Không? Dứt khoát là không phải. BỘ quần áo bà ba tầm thường của mụ chỉ là cái lốt bên ngoài, không che giấu nổi cốt cách của mụ ta.

Con mụ quái qủy này đang làm gì ngoài đó? Câu hỏi ấy cứ lởn vởn qua hình bóng những lưỡi lửa nhảy múa trước mắt tôi . Tôi không thể chịu được nữa, bèn đứng dậy rón rén bước ra.

Mụ ta đang cắm cúi viết trên một mảnh giấy nhỏ xé ra từ quyển sổ ghi chép các món tiền thu nhập hàng ngày. Cốc rượu vẫn nguyên chưa đụng tới. Làm sao xem được mụ ta viết cái gì đây? Tôi lia mắt sang thấy bát nước hâm rượu không còn bốc hơi nữa, bèn nảy ra ý nghĩ sẽ vờ cầm ấm nước sôi đến rót thay vào bát nước nguội để có thể tới bên bàn mụ ta ngồi. Tôi nén thở, bước rén bằng những đầu ngón chân và đứng sát bên lưng mụ, nhìn qua vai mụ . Trên mảnh giấy, những dòng chữ Pháp viết tháu vội vàng, nhưng vẫn đẹp như cắt, nghĩa như sau:

llcB-15-5-/946. – Hai trung dội chính quy trang bị đầy đủ. Một súng máy Bữ-ren. Cạnh đền: Một đại đội dân quân vũ khí thô sơ. Đập Đá: Một trung đội hỗn hợp, mười cây súng trường. vài chục lưu đạn tự làm lấy. 13.5: Một cán bộ quân sự cao cấp dã qua đây: Đoàn thuyền vận tải quân lương đi. về hướng Thới Bình. . . ”

Những dòng chữ phía đuôi bị khuất qua mớ tóc xõa bên vai mụ ta, không đọc được. Tôi nén thở, rướn người lên, tim đập thình thịch trong ngực. Đột nhiên, mụ ta quay phắt lại khiến tôi giật mình suýt buông rơi cái ấm xuống đất. Nét hốt hoảng vừa thoáng hiện trong đôi mắt to đen lay láy của con mụ đàn bà nham hiểm khi vừa nhìn đến tôi lập tức biến ngay, và nhường chỗ cho những tia nhọn hoắt như những mũi kim phóng vào mặt tôi.

Xem trộm cái gì? – mụ ta nén giọng hỏi khẽ, cặp môi mỏng dính run run dầy phẫn nộ.

Tư Mắm lập tức xô ghế đứng dậy. Tôi tưởng hắn sẽ nhảy xổ vào bóp họng tôi ngay. Nhưng hắn vẫn đứng nguyên đấy và đưa mắt nhìn mụ vợ, rõ ràng là hắn đang chờ mệnh lệnh mụ ta giống như một con chó săn chờ lệnh chủ.

Trong lúc ấy, tôi đã kịp đủ thì giờ trấn tĩnh. Lúc bấy giờ tôi cũng không hiểu tại sao mình lại tỉnh táo được như vậy… Tôi gãi tai, cười và nói cách hồn nhiên:

– Thím viết đẹp quá! Chữ đẹp như cắt ấy, mà lại không kẻ dòng… Đẹp hơn cả chữ anh Sáu tuyên truyền

Mày đọc rồi à? – mụ ta trố mắt hỏi, cốnén giận dữ.

– Đọc từ nãy giờ. . . mà thím viết thứ chữ Tây chữ u gì , cháu không hiểu dọc. Cháu chỉ đánh vần quốc ngữ bập bẹ và đọc được con số từ một đến một trăm thôi Nhưng phải đánh vần lâu lắm kia

Con mụ thở phào một hơi nhẹ nhõm:

– Con nít đừng có nhìn lén, đừng xem trộm khi người lớn đang viết, nhớ không. Vậy là kém lịch sự và vô phép

Tôi cười hì hì ra vẻ nhận lỗi:

– Cháu đến thay bát nước sôi cho thím chứ Tại chữ thím viết đẹp quá, cháu cứ mải xem… Cháu đâu có dè thím rầy! Mọi khi, anh Sáu tuyên truyền viết, cháu đứng sau lưng coi mà ảnh chẳng rầy la gì.. .

ừ, thôi Thay bát nhóc khác đi! – mụ ta chớp chớp mi mắt, cười với tôi… – Qua ghi các món tiền ngừờl ta mua chịu mà. Viết bằng chữ quốc ngữ mới, em không đọc được đó thôi. Đây này – mụ ta vừa nói vừa chìa mảnh giấy đến bên ngọn đèn – con số 15 nầy là người ta thiếu qua mười lăm đồng. . . Con số năm này là năm ngày nữa họ sẽ trả . cháu biết! – tôi tươi cười.

Con mụ càng cố ý đánh lừa tôi bằng vẻ thành thực thì tôi cũng mượn màu thành thực để lừa lại nó. Trong khi ừ ào với mụ ta, tôi đã đọc nốt những dòng chữ cuối: tấn công tốt nhất vào khoảng bốn giờ sáng. Trạm canh gác chỉ có bốn đứa: hai súng ca-líp 12. Bắt sống. Trời mưa to, có thể núp trong mưa. tắt đường ruộng bất thần đánh vào ban ngày

Thay bát nước xong – không hiểu sao bây giờ tay có hơi run – tôi cố trấn tĩnh bằng cách đứng lại nói với mụ ta một câu tróc khi quay vào bếp .

– Thím đừng mách dì Tư, dì Tư mắng cháu tội nghiệp?

– ừ không mách đâu Vào xem nồi cháo được chưa . . .

Tôi không nhìn Tư Mắm nhưng tôi biết Tư Mắm đang cười Tôi vào đến cửa bếp, còn nghe hai tiếng thở phào ra cùng một lúc của đôi gián điệp vườn này , và tôi biết chắc chắn rằng chúng đang nhìn theo tôi không phải bằng nhũng cặp mắt đầy hoảng hốt và dữ dội như ban nãy.

Dì Tư Béo đã tắm xong, vào ngồi bên chõng rũ tóc ra cầm quạt quạt cho khô tóc.

Trời oi quá! Tắm rồi mà mồ hôi cứ vã ra như chưa tắm!

Thấy con mụ vẫn cắm cúi viết, dì Tư Béo hỏi:

– Bữa nay người ta mua chịu nhiều lắm sao Ghi gì mà hết tờ nọ tới tờ kia vậy?

– Cũng chút đỉnh thôi. . . Biên các số tiền chi tiêu lặt vặt ấy mà? Mà cũng xong rồi đấy. Thôi, dọn cháo ra ăn chơi đi, dì Tư

– An ơi, lau mâm bát đi, con? – dì Tư Béo gọi vọng vào bếp, bảo tôi.

Tôi vừa toan nhấc nồi cháo xuống, bỗng nghe dì nói tiếp:

– Ngày nào cũng biên chép nhiều như vậy, bảo thằng bé nhà tôi nó viết hộ cho. Nó tốt chữ lắm đấy! .

Không biết qủy ma nào giật lưỡi bà ta, mà bà ta ngứa mồm ngứa miệng nói ra làm gì điều đó. Tôi nghe con mụ vợ Tư Mắm “à” lên một tiếng, và mụ ta bưng cốc rượu uống ừng ực một hơi . hình như mụ ta đang xoay xoay cái cốc trong tay, nghĩ ngợi gì lung lắm, vì sau một hồi lâu, tôi mới nghe tiếng cốc dằn hơi mạnh xuống bàn.

– Thằng bé mới mười bốn mười lăm tuổi gì đó mà đã đỗ .phi-ca” rồi đấy! “Biết đâu chùa rách Phật vàng… Ai hay trong quán ẩn tàng kim luân”(2 câu trong truyện thơ lục vân tiên). Coi nó lèng quèng vậy mà chữ Tây đọc giòn như bắp rang đó. Hôm nọ nó cầm tờ báo Tây đọc vách vách, còn cắt nghĩa cho thằng Sáu tuyên truyền nghe nữa chứ! .

Tôi nghe bà chủ quán nói một hơi như vậy, túc muốn điên lên. Trời ơi! Tôi có đọc báo Tây và dịch nghĩa dịch ý cho anh Sáu tuyên truyền hồi nào đâu mà bà ta bỗng dưng hứng khẩu khoe tướng lên như vậy? Mà bà ta đã quả quyết như vậy rồi thì tôi còn hòng chối cãi làm sao tôi làm sao thoát khỏi tay bọn chúng mà chạy đến báo cho anh Sáu tuyên truyền hay được Tôi đứng im để hết tai ra nghe ngóng, nhưng mạch máu cứ đập trong tai làm tôi không còn nghe gì rõ

Không thấy vợ chồng Tư Mắm nói gì , bà ta trỗi giọng:

Bé thế mà đỗ “phi-ca” thì giỏi lắm?… Ngày xưa có một ông giáo “phi-ca” mê tôi lắm, nhưng duyên trời không định…

Từ quán đến chợ thì xa. Ngược lên, đến xóm Tràm nơi trung đội Cộng hòa vệ binh đóng lại càng xa hơn nữa! Tôi mà chạy đi, nhất định Tư Mắm sẽ giết tôi ngay giữa đường. Không làm cách nào bịt mồm bà chủ được, tôi đành liều thôi. Hai tay run lập cập, tôi lần trong bóng tối, tháo miệng túi da beo ra để cho dễ rút con dao găm, rồi cứ để nguyên cả bao da nhét vào bên trong thắt lưng, phủ vạt áo vét tông ra ngoài cho khuất cán. Tôi không thể chuẩn bị trước những câu trả lời với bọn chúng. Biết thế nào được mà chuẩn bị? Tới đâu sẽ ứng phó tói đấy! Nếu chúng giở trò hành hung thì tôi sẽ sử dụng tới con dao.

Ngoài kênh đã không nghe một tiếng chèo. Cũng không một ông khách rượu nào tới quán. Sao mọi đêm, bọn họ khép tới một lúc năm bảy người, tấp nập hết tốp này đến tốp khác, làm tôi chạy chân không bén đất mà hầu, nhưng cũng chẳng kịp – tại sao đêm nay không thấy ma nào mò tới? .

– Bưng cháo ra đây, chú em? – tiếng con gián điệp gọi lên lanh lảnh, khiến tôi nổi gai ốc khắp người.

“Sao mày hèn thế” Tôi tự hỏi mình như vậy. Và đột nhiên tôi bỗng nhớ tới gương mặt bầu bĩnh của em bé gái có hai bím tóc tết trái đào:.. CÔ bé mặc bộ quần áo xa tanh màu đỏ bắt đầu khởi động, đôi hài đen nhỏ xíu giẫm xuống, mắt nhìn thẳng vào vòng lửa cháy vù vù tua tủa những lưỡi dao nhọn hoắt… CÔ bé hét lên một tiếng, nhưng không bay qua vòng lửa mà quay lại nhìn thẳng vào mặt tôi, cười mủm mỉm.

Mặt tôi nóng ran lên. Tôi dặng hắng một tiếng, bưng mâm bát bước ra.

Tư Mắm không nhìn tôi. Hắn ngồi xé mực nhai nhóc nhách, mắt ngó ra ngoài tối đen. Con gián điệp cũng không nhìn tôi. NÓ vờ như đang chăm chú đọc những khẩu hiệu của anh Sáu tuyên truyền đã dán lên vách hôm nọ, chứ thực ra quả là nó đang rình theo tôi từng cử động. Tôi trở vào bưng ra nồi cháo đặt lên chõng.

– Thôi, để đấy cho dì. Mày xuống thuyền ngủ trước đi con? – dì Tưbéo truyền lệnh cho tôi.

Tôi không đi ngay. Tôi còn trùng trình đứng lại múc cháo ra bát, xem thái độ chúng như thế nào, nhưng chẳng thấy chúng tỏ ra lưu ý gì đến tôi. Tôi bèn lặng lẽ bước ra, đi lần đến thuyền mui ống đậu trong mương.

Thế nào Tư Mắm cũng đi theo tôi . Tôi nghĩ như vậy và làm bộ vấp chân, kêu “ái “, một tiếng. Tôi xuýt xoa ngồi xuống, nắn nắn bàn chân nhìn ngang và quả thấy Tư

Mắm đã bước ra đứng ở chỗ cửa. Linh tính báo cho tôi biết sẽ có điều nguy biến xảy ra cho tôi trong đêm nay.

Tôi chạy cũng không thoát kịp nữa rồi. Hình như trong giờ phút mấp mé đứng trước cái chết hoặc trước một nguy hiểm tột độ nào đó, con người trở nên bình tĩnh hơn bao giờ hết. Tôi co chân nhảy độp xuống thuyền, lôi chiếc nói ra giũ phành phạch, vờ sửa soạn chui vào nóp.

Nhưng tôi không chui vào, tôi lấy chiếc gối chống dựng một đầu nói lên và kéo cho dầu nóp ló ra ngoài mui thuyền để người đứng trên bờ có thể nhìn thấy được.

Xong đâu đấy, tôi trườn nhẹ ra sau lái, nhẹ nhàng bước trên những chùm rễ gáo và bò theo mé mương. Lên được bờ rồi thì bấy giờ trăng cũng vừa mọc. Chung quanh ngôi quán, mặt đất sáng như ban ngày. Bóng tối chỉ còn lại một vùng đen sâm sẫm dưới gốc cây gáo cổ thụ. Tôi núp theo bóng cây, chui vào một cái hốc có chùm lá ráng phủ bên ngoài mà một hôm tình cờ tôi phát hiện ra.

Tôi không biết mình ngồi thu hình trong hốc cây, nén thở như vậy đã bao lâu. MỒ hôi ướt đầm đìa sau lưng áo.

Bàn chân tôi chạm vào mình con vật gì mềm nhũn. như con rắn. Tôi hốt hoảng rụt chân lại. Con vật bò rột roạt theo hốc cây, kêu “tắc kè . . . tắc kè . . . tắc kè . . . ” ngay trên đỉnh đầu tôi.

Trong quán đã nghe tiếng thu dọn bát đĩa. Con mụ gián điệp chào dì Tư Béo, không biết nó nói gì mà bà chủ quán của tôi cười lên khấc khấc… Lát lâu sau, nghe nó rửa chân lạc xạc ngoài cầu nước, rồi tiếng chân nó dẫm lên sạp thuyền. RÕ ràng chỉ có mỗi mình con mụ xuống thuyền.

Mỗi một tiếng động, một âm thanh nào đó từ bên ngoài vẳng vào gốc cây ẩm mục, tối om vào hôi hám ngột ngạt đến tức thở này, đối với tôi đều có ý nghĩa vô cùng quan trọng. NÓ mở cho tôi một tia hi vọng, hoặc đẩy tôi mỗi lúc một chuồi sâu xuống bãi lầy đen kịt mà tôi không phương vùng vẫy.

Cánh liếp trên quán đã sập xuống. Nghe then cửa gài đánh “cách” một tiếng. Luồng sáng tỏ của ngọn đèn từ trong quán chiếu xuyên qua hàng rào mắt cáo, soi ra tận luồng cỏ bấc bên kia mép mương, chớp chớp mấy cái trướt khi tắt phụt.

Tư Mắm đi dò từng bước ra mương. Hắn bước rất khẽ, dáng như chân không chạm vào đất vậy. Hắn ngó trở vào quán rồi quay lại rướn cái cổ dài nhìn xuống chỗ đầu nóp tôi đã kéo ló ra mui thuyền. Hắn đứng im như vậy có đến chừng hai phút. Trong quán, dì Tư đã bắt đầu “khò… khò . . . khò . . . khừ” , ngáy như kéo cưa .

Tư Mắm đưa tay lên vén tóc, ngó vào gốc cây rồi thong thả bước đến ngồi thụp xuống quay lưng vào mặt tôi cách chừng một thước. Tôi nén thở, nhắm mắt lại cho thần kinh đỡ căng thẳng.. Hồi lâu, bỗng nghe tiếng người dặng hắng đâu ở phía sau quán. Tôi mở mắt ra trống ngực đập rộn lên. Cứu tinh đã đến với mình đây rồi? Trời ơi giá mà anh Sáu tuyên truyền đến với tôi trong lúc này…, không phải anh thì lão Ba Ngù, hay không phải lão Ba Ngù thì một người đàn ông nào đó cũng được.

CÓ tiếng chân giẫm thình thịch vòng sau quán men ra gốc cây Tư Mắm nhẹ nhàng đứng dậy, đưa ngón tay lên mồm xuỵt một tiếng. Thôi, thế là hết? Tia hy vọng cuối cùng và mong manh nhất chợt đến với tôi cũng tắt ngấm từ phút này đây.

LỘ rồi? – Tư Mắm thều thào nói với bóng đen, và hất hàm về phía đầu nói ló ra mui .

Hắn còn thì thào mấy câu gì nữa, nhưng tôi không nghe được.

Tôi không thể nào nhận ra bóng đen đó là ai . Trong tất cả những người đàn ông lui tới quán rượn này, không có hắn. Đôi vai rộng bè khom khom chồm tới trước như một con giả nhơn; khi hắn ngóc lên, tôi vừa kịp trông thấy một nửa bên quai hàm bạnh ra, trán rất thấp, vòm mắt nhô cao, lông mày rậm rịt. Hắn cởi trần, bắp thịt nổi cuồn cuộn lấp loáng dưới ánh trăng. Tôi rùng mình. Bàn tay tôi cấu thử vào sườn mấy cái, thấy đau điếng…

Không? Không phải tôi chiêm bao mà!

Bóng đen khủng khiếp ấy rút con dao dài non năm tấc giắt bên hông ra, cầm lăm lăm trong tay. Trong hốc cây, bàn tay bé nhỏ của tôi cũng lần lần rút con dao găm ra khỏi vỏ.

Tư Mắm cầm khẩu súng lục – không biết hắn lấy ở đây ra từ lúc nào – kẹp khẩu súng vào đùi, tay kéo qui lát “rắc” một tiếng khô gọn, trong khi bóng đen khủng khiếp kia lom khom bò xuống mũi thuyền mà hắn tin chắc rằng tôi đang nằm ngủ dưới đó.

Bỗng nghe con gián diệp ho một tiếng ngoài cầu nước. Tư Mắm quay đầu về phía có tiếng ho. Đêm vắng lặng đến nỗi con mụ nói rất khẽ nhưng tôi vẫn nghe rõ mồn một : “Đừng Đừng! Xuống lấy cái bao tải. Nhét giẻ vào mồm thôi . . . ” Tư Mắm vừa đi thì tôi cũng vừa lách mình ra khỏi hốc cây. Khi tôi thấy hắn dò dẫm rén chân bước xuống chiếc cầu nước dẫm bùn trơn như mỡ thì nhanh như cắt tôi lập tức phóng ra khỏi gốc cây lao đi như một mũi tên.

Tôi không biết mình chạy đi đâu. Bên tai tôi, gió rít vù vù, lùm cây bãi cỏ rùng rùng xô nhau chạy ngược về phía sau lưng tôi. Dãy phố ngói và những tàn cây bã đậu thấp thoáng trong làn sóng đất; một ngọn đèn le lói từ ngôi nhà ai còn thức, chiếu nhấp nhây, dường như nhảy lên nhảy xuống đằng xóm chợ im lìm kia. Bản năng không tự giác đã điều khiển đôi chân tôi chạy tìm về chỗ có người khi lâm hoạn nạn. Tôi toan kêu lên, nhung không còn đủ sức kêu nữa. Tôi lại tiếp tục chay. Bỗng nhiên tôi cảm thấy ruột gan phèo phổi mình thót lên, đầu chúi tới trước. Một làn sương mù dày đặc từ từ bao trùm khắp người tôi, tôi chỉ còn đủ cảm giác thấy tay chân mình tan ra như nước hòa lẫn vào trong lớp sương mù quái di đó, rồi tôi không còn biết gì nữa . . .

Khi tôi tỉnh dậy, tay hãy còn nắm chặt cán dao găm. Lưỡi dao cắm ngập vào mặt đất sét ấm, khiến tôi phải ngồi lên mới rút ra được. Tôi đút con dao vào vỏ, nhét trong thắt lưng, định thần một lúc mới nhận ra rằng trong lúc mình chạy, mình đã ngã chúi xuống một đường hào chiến đấu mà các anh thanh niên trong chợ vừa đào mấy hôm nay. Tôi lần nhớ lại các việc đã xảy ra… Quái, tiếng trống tiếng mõ ở đâu mà khua động inh tai thế này? Tôi toan nhảy thóc lên bờ hào, nhưng chưa kịp với vào thành đất đã rơi xuống ngay. Khắp người ê ẩm, chân tay đau buốt, tôi có sức cào đất trườn lên. Khi tôi bò ra khỏi hào thì thấy một vầng lửa đỏ rực dang bao trùm lên ngôi tửu quán. Những lưỡi lửa khổng lồ le lên liếm trụi các cành khô trên ngọn gáo cố thụ. Tre nứa nổ lốp đốp.

Khói cuồn cuộn bốc lên, đưa tàn lửa bay chấp chới như một bầy ong đỏ từ trong đám cháy bị mùi rượn sực nồng xua lên, bay tản mác ra xa.

Tôi lại cố sức chạy trở về ngôi quán thân thuộc đang làm mồi cho thần lửa. Trong ánh lửa dỏ rụt chiếu sáng khắp chung quanh, ở một góc sân sau, hai ngươi. đàn ông đang nắm chặt hai cánh tay dì Tư Béo lôi ra. Bà ta giãy giụa, gào thét, hết ngã xuống lại chồm lên. Cả khối thịt của cái thân hình to lớn ấy run lẩy bẩy trông rất dễ sợ.

Tôi lách đám đông chạy sả vào. Người đầu tiên tôi nắm lấy cánh tay kêu lên là anh

Sáu tuyên truyền:

– Bắt lấy vợ chồng Tư Mắm? Chúng nó là gián diệp. . .

Trong những người đứng chung quanh đang bó tay tuyệt vọng, buồn rầu nhìn ngọn lửa hoành hành, tự do thiêu hủy ngôi quán, vừa nghe tôi thét lên như thế, có người tức khắc nhảy chồm lên: “Làm sao mày biết, hở thằng bé kia?” CÓ người hỏi dồn tôi: “Nhưng chúng nó đâu rồi?i

Tôi kể không ra đầu cua tai nheo gì cả, tiếng được tiếng mất. Nhưng tôi chắc chắn rằng tôi không bỏ sót một chi tiết quan trọng nào. Người ta nhốn nháo đi gọi các anh Cộng hòa vệ binh. ông thưởng công an xã ở tít xóm dưới bây giờ mới vác khẩu súng bắn chim hai nòng lích kích chạy tới:

Chúng nó chưa đi xa đâu?

Chia ngươi ra ba cánh, đuổi theo các ngã ba kênh?

– Đuổi cái con khỉ! Không biết chừng nào đã tới Ngã Bảy rồi!

– Này, anh em! Không được giết chết. . . Bắt sống chúng nó mang về đây, chặt dầu cho đồng bào xem? .

Không biết một người nào đó đứng trong đám đông ồn ào đã truyền lệnh ra như vậy. Và ai nấy đều răm rắp tuân theo. Tôi không theo toán người đi đuổi bắt vợ chồng Tư Mắm. Tôi đến bên dì Tư Béo, cầm lấy bàn tay lạnh ngắt của bà ta, không biết nên nói gì đây.Một câu an ủi trong lúc này, có nghĩa lý gìl Bà chủ khốn khổ của tôi đang tựa lưng vào một vò rượu – không biết tay nào chạy hộ ra đây hay tự bà ta khênh ra kịp thì chẳng rõ – vừa thấy tôi đến, đã quay mặt đi.

– Dì Tư Dì Tư! – Tôi lo lắng và buồn rầu gọi nho nhỏ .

– Thằng nhỏ nó về rồi đây này? – một người đàn bà nào đó ngồi cạnh bà ta kêu lên.

Dì Tư Béo vẫn quay mặt vào bóng tối . Bỗng nhiên bà ta òa lên: “Con ơi! Con đi đâu mà bỏ dì một thân một mình . . . ” Tôi đứng dậy cầm chiếc khăn rằn phủi bùn đất bám đầy trên vai bà ta. Trước mắt tôi, bà ta chỉ là một con người đáng thương và gần gũi nhất. Tự nhiên, không hiểu sao tôi cũng quay mặt vào bóng tối. Phải rồi, một thiếu niên dù bất cứ ở hoàn cảnh nào cũng không được tỏ ra mềm yếu trước mọi người . . .

Mãi đến chiếu hôm sau, vẫn không tìm ra tung tích vợ chồng Tư Mắm. Ai gặp tôi cũng hỏi, cũng bắt tôi phải kể đi kể lại có hàng trăm bận. Cả chợ nhao lên. Người ta nhìn nhau, ai cũng có vẻ đáng nghi ngờ. Lão Ba Ngù đứng giữa dám đông, vỗ trán kêu lên:

– Tôi biết cái thằng có đôi vai rộng bè, lưng khom khom như con giả nhơn ấy rồi !

– Lại bịa nữa? Biết thì nói, không thì thới. Chẳng ai ép đâu nhá! – một ông bạn rượu của lão Ba Ngù khịt mũi nói như vậy.

Sao lại không? NÓ là thằng cùi. Mấy hôm nọ, tôi thấy nó nằm dưới xóm Đập Đá. Đúng là nó! – Lão Ba Ngù khẳng định như vậy, và chờ cho mọi người đưa mắt ngơ ngác đợi lão nói tiếp, lão mới e hèm mấy cái, tặc lưỡi: – Chà, nó không phải cùi đâu! NÓ lấy thịt thối buộc giẻ rách bó vào chân, ruồi nhặng đến bu vo ve, ai thấy cũng tởm, chẳng ai muốn đến gần. Hóa ra có hồi nó ngồi ngay trước mặt mình mà mình tránh đi, để lúc nó chuồn rồi mới ba chân bốn cẳng chạy đi lùng?

Không biết lão Ba Ngù nói vậy có dúng không, nhưng chẳng thấy ai bác bẻ lại lão. CÓ điều mọi người trong chợ đều nhất trí nhận định là : “Đích thị vợ chồng Tư Mắm đã đốt quán trước khi rút lui. CÓ thể chúng đặt trước một mồi lửa. khi đi xa rồi, quán mới bốc cháy. Dân trong chợ mắc lo chữa cháy dù có biết cũng muộn rồi, không đuổi theo kịp chúng nó nữa” .

Quán ruựu dì Tư Béo cháy sạch trong đêm dó. Nhưng còn được chiếc thuyền mui ống, nhờ có người đẩy ra kịp mương nên chỉ cháy sém một bên mui. DẦU sao thì hai chiếc túi bóng mỡ cài kim băng của bà chủ quán rượu cô độc cũng chưa hề hấn gì. Bà ta quyết định không cất lại quán trên mảnh đất xúi quẩy này nữa. “Phước bất trùng lai, họa vô đơn chí” mà?

Phải mau mau rời khỏi chỗ này thôi . Dì Tư Béo không ngớt than vãn như vậy, và sau cùng quả quyết bảo tôi:

– Con ơi? Đi với dì xuống Thới Bình đi!

Cháu ở lại đây thôi. Cháu còn chờ một ngươi quen.. .

Tôi đáp với bà ta như vậy, chứ thật ra tôi có chờ ai đâu May ra trong số người qua lại xóm chợ này, tôi có thể tìm một người quen nào chăng Ba má tới thì chắc chắn là còn ở bên kia sông Hậu Giang, chẳng bao giờ xuống tới chốn này.

SỐ trời bắt tao phải sống một thân một mình. Thôi thì cũng đành! Nếu mai kia mốt nọ… con có dịp về gần Thới Bình, cứ hỏi thăm tên dì, ắt dì cháu ta còn có cơ hội gặp nhau…

Bà ta sụt sịt, giúi vào tay tôi một đòn bánh tét, nặng nề bước xuống chiếc thuyền vừa thoát khỏi trận hỏa tai, rồi nhổ sào tách bến.

Trời sâm sẩm tối. Tôi đứng dưới gốc cây gáo cổ thụ, lổm nhổm những mảnh lu mảnh vại vỡ, bên đám tro tàn còn phảng phất mùi rượu cháy chua tanh Tôi đứng im lặng một mình như vậy, nhìn theo vạt áo trắng của dì Tư đang chèo khuất dần trong bóng tối của mặt nước dòng kênh. Lát lâu sau, tôi bỗng cảm thấy rưng rưng một nỗi buồn lạ lùng không sao xua đi được, một thứ trống rỗng ùa vào tâm hồn, khiến tôi gần như sợ hãi. Tôi chạy theo gọi : ” Dì Tư ơi ? Dì Tư Chờ cháu với . . . ”

Tôi vấp mấy cái trong bóng tối, suýt ngã xuống nước.

Màn đêm lặng lẽ buông trùm xuống những ngọn sóng xôn xao trên mặt nhóc cuồn cuộn, không biết chảy về đâu', N'Đêm Kinh Khủng', N'dem-kinh-khung')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (28, 5, N'Dì Tư Béo đã đi rồi. Cả bác tài công già trong đoàn thuyền vận tải quân lương và anh học sinh cô-le đã cho tôi chiếc áo vét-tông, hiện giờ cũng không biết ở đâu. phải chăng những người mà số mệnh đã run rủi cho tôi gặp họ trên đường giạt trôi vì khói lửa đều vội vàng tất bật buông rơi tôi lại, bỏ tôi trơ trọi giữa đường? Mà tôi chỉ là thằng bé từ lúc còn lẫm chẫm biết đi cho đến mấy tháng trước đây chưa hề rời khỏi thành phố mình sinh trưởng. Hay đó là thử thách của cuộc đời đối với tôi chăng?

Anh Sáu tuyên truyền bảo tôi về ở với anh. Ban ngày tôi theo anh ra quét dọn phòng thông tin, tô lại những khẩu hiệu cũ. Ban đêm thì tôi bạ đâu ngủ đấy. CÓ khi tôi ăn và ngủ ở nhà anh, nhưng cũng có nhiều bữa tôi ăn cơm nơi nhà người khác, phần đông là các anh thanh niên trong chợ. Bởi họ thấy tôi dễ bảo có chút ít chữ nghĩa, lúc nào cũng sẵn sàng giúp họ viết những khẩu hiệu xanh đỏ lòe loẹt bằng các thứ kiểu chữgô-tích, ba-tông, broa… Đôi khi tôi còn chịu khó ngồi nắn nót vẽ nhũng chữ hoa trên góc các vuông khăn vải phin trắng còn thơm mùi hồ mà các chị phụ nữ Tiền phong đã cậy tôi vẽ để họ thêu…

Tôi làm các công việc vặt này một cách say sưa, bởi đó là thích thú của tôi, đồng thời cũng muốn phô khoe chút tài khéo léo của mình. Anh Sáu tuyên truyền chẳng đã nhiều lần khen tôi là một thằng bé có “hoa tay” đấy ư

Dẫu sao thì tôi cũng vẫn buồn . Cái hy vọng gặp lại ba má tôi và ngày mình có thể trở về thành phố quê hương cứ khuấy động trong tôi một nỗi buồn nhớ không nguôi.

Nhưng tôi tuyệt nhiên không hề hé môi thốt ra một lời than vãn. Thảng hoặc có một vài người nào đó lưu tâm hời hoàn cảnh gia đình cha mẹ tôi Ở đâu… thì tôi đều kiếm cớ nói tránh đi, hoặc lái câu chuyện về một hướng khác Tôi không muốn thấy ai bày tỏ lòng thương hại đối với mình. Bởi vì, nói cho cùng chung đem lại một kết quả gì mà chỉ gây thêm tủi cực, xót xa hơn cho mình sau đó.

Tôi sống lần hồi ở xóm chợ này được đâu hơn một tháng . Ban ngày, tôi có thể tạm quên nỗi buồn nhớ ba má tôi bằng cách đi chơi đây đó, vui đùa với bọn nhỏ và các anh thanh niên. Nhưng ban đêm, tôi thường giật mình thức giấc thấy mình nghiêng mặt trên cánh cánh tay gối đầu ướt đầm nước mắt. .

Những con đường hàng me mượt mà lớp lá xanh non sau những trận mưa đầu mùa, suốt ngày vi vu tiếng kêu của những bầy ong không ngớt bay lượn trên những chùm hoa, làm rơi lả tả những cánh hoa trắng bé xíu trên đầu bọn học trò nhỏ chúng tôi. Những con đường hàng xoài, mùa quả năm nào cũng có những chú pô lít( Cảnh sát) áo vàng cứ trưa lại núp trong các ngõ hẻm rình chộp lấy chiếc giàn thun(giàn ná, súng cao su ) của mấy đứa trẻ trốn bố mẹ, vờ đi học sớm để ra đó bắn quả xanh . . .

Những đêm thứ bảy, ba tôi thường dắt tôi ra cầu tàu lục tỉnh ngồi xem ông thả mồi, buông một sợi câu rất dài, câu cá bông lau. Thành phố yên tĩnh dưới trăng khuya. Tiếng gió rì rào trên những ngọn dương trồng dọc con đường đá đỏ chạy cặp theo bờ sông Tiền Giang, lác đác một vài người đi dạo đêm đứng dưới cội cây, hoặc ngồi trên bậc cầu đá nhìn ra dòng nước mênh mang nhấp nhánh ánh lửa thuyền câu .

Tôi đã lớn lên trong cái thành phố vừa đông vui trù mật vừa yên tĩnh dịu dàng, tràn ngập một thứ gió sông nhiễm đầy mùi phù sa và nắng ấm đó cho đến ngày “đằng mình” cướp chính quyền. . . . .

Lần .đầu tiên, tôi nghe ba tôi nói hai tiếng “độc lập” với một vẻ mặt dầy xúc động

– Bà nó ơi, độc lập rồi? . Thằng An, mày có biết không, TỔ quốc ta từ nay độc lập rồi ông lắp bắp nói như vậy, mặt mũi tay chân đỏ bừng như con gà trống. Và bằng một dáng điệu rất tự hào, ba tôi đứng nghiêng đầu nhìn lá cờ đỏ sao vàng treo trên bục ảnh HỒ Chí Minh mà các anh thanh niên Tiền phong vừa dựng Ở chỗ ngã ba đường, ngay trước cửa nhà tôi. trường học của chúng tôi đóng cổng mấy hôm cho học sinh nghỉ ngơi đi biểu tình mừng ngày độc lập. Thành phố nhuốm màu đỏ rực của băng, cờ, khẩu hiệu ngày đêm rầm rập bước chân của thanh niên, phụ nữ Tiền Phong, của Cộng hòa vệ binh, của các đội dân quân cách mạng vũ trang, của dân chúng từ các làng quận xa xôi kéo về tỉnh mừng ngày hội lớn có một không hai đó . Thực ra thì bấy giờ tôi cũng không hiểu hết ý nghĩa của danh từ “độc !ập” là ra sao cả. Chỉ biết rằng thằng cò Tây, bọn lính Tây trong thành san-dá trước đây hay đuổi học sinh chúng tôi và thường bắt bớ đánh đập dân chúng, đã bị mình bắt bỏ vào khám sau một hồi chúng nó nổ súng lẹt đẹt chống cự lại ta, và bọn binh lính Nhật đóng trong thành phố lúc trước, giờ đây ra đường cúi mặt xuống, lê chiếc gươm dài như lê một khúc củi mục mà đi thất thểu.

Và tất cả các công sở, nhà máy trước kia do bọn chủ Pháp, chủ nhật cai quản, nay đầu thuộc về mình.

Chưa được hai mươi hôm, bỗng xôn xao nghe tin giặc pháp lại nổ súng đánh ta ở Sài Gòn. Thành phố tôi còn đang vui tở mở như bọn trẻ chúng tôi thi chỉ qua một dêm nghe biến cố, đã trở nên nghiêm nghị như một cụ già. ông già Tám đánh xe ngựa ở sát cạnh nhà tôi lúc nào cũng sẵn sàng một ngọn tầm vông, chỉ chờ dịp xông ra đâm chết lũ giặc. Người ta rèn vũ khí, người ta chuẩn bị lương khô, “ai có dao dùng dao. có mác dùng mác” – đúng như lời trong bảng hiệu triệu của hai ông Hoàng Quốc Việt và Cao Hồng Lãnh thay mặt Tổng bộ Việt Minh kêu gọi dân chúng xông ra bảo vệ nền độc lập của Tôi quốc mới phôi thai.

, Này thanh niên ơi, đứng lên đáp lời sông núi.. .

Trong dêm dài mù mịt tầm tã giọt mưa rơi, hay giữa ngày nắng chói chang dưới ánh mặt trời nóng như thiêu như đốt ở khắp góc phố, bờ sông, ngõ hẻm, bãi chợ, đầu cầu trong những khu vườn ngoại Ô lan dài đến tận ruộng đồng và các xóm làng xa, tiếng hát cứ bồng lên như sóng, âm vang chưa dứt đầu này đã nghe nổi.lên dồn dập Ở chỗ cuối kia. Hình như không phải là người ta đang hát, mà họ gào lên với tết cả tâm hồn khát khao yêu nước yêu độc lập thì đúng hơn… Ủy ban nhân dân Nam BỘ từ sài gòn chuyển về đóng ở thành phố tôi, binh sĩ bị thương ở các mặt trận chung quanh Sài Gòn – Chợ Lớn chở về nằm chật các gìùơng bệnh của y viện tỉnh. Ngày nào cũng có đoàn xe tô chở thanh niên Tiền phong, thanh niên Cứu quốc, cảm tử quân từ trong thành phố chạy ra hướng Trung lương đi về các vùng Phú Lâm, Chợ Đệm, nơi đang diễn ra các trận đánh ác liệt giữa các sư đoàn dân quân cách mạng với bọn giặc Pháp núp sau lưng bọn lính ăng-lê lính ấn ĐỘ mang đanh nghĩa Đồng minh vào tước khí giới Nhật và lén lút từ trong thành phố đánh ra.

Đêm, tôi thường rất ít ngủ. Giấc ngủ cứ chập chờn trong tiếng bánh ôtô chuyển rung động phố chở thanh niên ra mặt trận, trong những lời hát sôi nổi bằng giọng trầm hùng của những anh sinh viên, học anh cỡ lớn xếp bút nghiên lên đường tranh đấu, xếp bút nghiên coi thường công danh…”

CÓ khi tôi chiêm bao thấy mình đã lớn mặc áo sơ mi trắng lồng vào quần sóc đen, đầu đội nón bàng rộng vành, bên lưng đeo dao găm, tay cầm tầm vông đứng gác trước trụ sở Uy ban nhân dân như một anh thanh niên Tiền phong thực thụ. “Đánh giặc cũng vui chứ Tôi thường nghĩ như vậy và háo hức tiếc mình vì còn bé quá, không được theo các anh ra mặt trận.

Giặc đã tiến xuống đến gần Tân An. Ta vẫn còn án ngữ ở hai đầu cầu quan trọng trên hai con sông Vàm CỎ Đông và Vàm CỎ Tây, thì chưa dễ gì chúng có thể tới tỉnh

Định Tiếng này được…

Một đêm, tôi dang ngủ bỗng giật mình choàng dậy.

Tiếng gì y như tiếng bọn giặc tấn công . . Đùng. . . oang. . . áng. oàng

Hai chân tôi đạp lung tung mà cũng không rút ra được khỏi chăn. Trong nhà tối den. Một tiếng nổ, hai tiếng nổ, ba tiếng nổ. Rồi một tràng dài tiếng nổ liền theo, không đếm xuể nữa.

– ông ơi ? Tây tới rồi , ông ơ. . . ơ. . . oi ! – má tôi hét thất thanh. Tiếng chân má tôi quờ quạng dò tìm đôi guốc.

Ba tôi đập mạnh tay xuống bàn:

– Im! Để nghe coi phải không đã? Làm gì mà cuống lên. . . như giặc tới vậy? . Má tôi lại hét :

– Tây tới bên nách rồi, ông còn đứng đây chờ nghe? An ơi dậy mau! Tây tới rồi, con ơi!

Tôi-nhảy phóc xuống giường, dụi mắt lia lịa. Tôi chạy va đầu vào một cái ghế. Cả ngừờl, cả ghế ngã đổ lổng chổng. Tay tôi sờ soạng mãi vẫn không tìm được lối ra khỏi buồng.

Tiếng guốc chạy lốp cốp ra phòng ngoài. Nghe hơi thở hổn hển vụt qua trước mặt, tôi lao tới ôm chầm lấy má tôi súng đại liên nổ pập pập. .. một tràng dài. Tiếng ào ào khủng khiếp chạy trên rời như một cái chổi khổng lồ bằng sắt quét không khí, cuốn theo những luồng gió hút ghê rợn . Trẻ con các nhà hàng xóm khóc vang dậy. Bỗng nghe cánh cửa chớp bật “kẹt” một tiếng. ánh điện đường ùa vào nhà sáng rực. Ba tôi đã đứng đấy, hai tay vin vào thành cửa sổ, chồm người ra ngoài quan sát. Má tôi vẫn ngồi trên nền gạch, đầu tóc xòa tung phủ xuống mắt tôi.

Đôi mắt má tôi mở thao láo vì sợ hãi, hai bàn tay bà run run ôm chặt lấy tôi. Tôi toan gỡ tay má tôi .để chạy ra ngoài xem thế nào, thì ánh diện ngoài đường vụt tắt.

Tiếng guốc khua lộp cộp bên các nhà hàng xóm, tiếng trẻ con khóc cũng đồng thời im bặt. Một sự im lặng mênh mông ập xuống nặng nề ghê rợn. Đột nhiên tiếng súng lại đùng đùng. . . oang. . . oang nổi lên . Bây giờ, tới phiên có nhiều bà vừa gọi nhau vừa khóc. Trẻ con thì không phải nói . Chúng nó đã khóc thét lên khi tiếng đại bác bắt đầu nổ đợt thứ hai. .

Má tôi móc được bao diêm trong túi ra, quýnh quáng đánh lên.. Que diêm cứ trật xoèn xoẹt ngoài vỏ bao. Tôi thớ đến cái công tắc, bèn chạy đến chỗ bật đèn. Tôi cứ vẫn lắc cắc mãi mà trong nhà vẫn tối đen. Thôi, ngoài nhà máy đèn người ta đã cắt điện rồi! Xoẹt… xoẹt!… Lửa bỗng lòe lên . Má tôi cứ cầm cái đèn trứng vịt chạy ra chạy vào

Ngoài đường, tiếng người kêu thét, tiến chân chạy hỗn loạn. Xe thổ mộ chọc cán roi vào căm xe (nan hoa ) khua lách . Ngựa nhảy dựng, hí ran, gõ móng cồm cộp xuống mặt đường, tung vó phi nước đại. ô-tô rú ga hù hù, rít phanh ken két, vừa hãm tốc độ máy xong lại hù hù mở máy rú lên lại. Chuông xe đạp leng keng… leng keng… không dứt. Ngừờl lạc gọi nhau. Trẻ con kêu khóc. .. Tất cả cuốn di, xa dần. Rồi lại từ từ kéo đến một tốp người khác, đông hơn, dài hơn. Tốp này đến tốp sau, liên tiếp vượt qua trước nhà tôi, chạy ra khỏi thành phố như một cuộc đuổi bắt khổng lồ.

Trong ánh dèn dầu hỏa lù mù, giữa đống bàn ghế hỗn độn, đồ dạc tháo tung bừa bãi, má tôi cuống lên, loay hoay mãi vẫn không nhét được cái gì vào va-li. Cái gì má tôi cũng muốn mang theo, vừa bỏ ra lại nhặt vào, lại bỏ ra.Ba tôi thì tỏ ra trầm tĩnh hơn. Những thứ nào không cần thiết,ông vất ra ngay. Má tôi vừa giục, vừa càu nhàu vừa khóc Ba tôi không muốn cãi nhau với má tôi trong lúc này, cứ thản nhiên thu xếp đồ đạc vào hai chiếc va-li.

Tôi đã lóc cóc chạy ra khỏi nhà, đứng nhìn đoàn người tản cư diễu qua như nước chảy. Hồi lâu, ba tôi dắt xe đạp ra nhập vào toán ngươi thưa thớt vừa hớt hải chạy tới. Hai chiếc va-li to tướng, ba tôi đã đặt xuôi một chiếc lên ghi dông, một chiếc buộc sau booc-ba-ga . Má tôi khóa cửa xong, tay cầm nón không kịp đội, tay xách chiếc làn mây nhét linh tinh từ chai nước mắm đến cái bàn chải đánh răng, hối hả chạy theo ra đường.

Trời chưa rạng, nhưng một thứ ánh sáng tai tái đã vươn nhẹ trên những đầu cây mận còn im lìm ngái ngủ trước sân những ngôi nhà nhỏ, cửa đóng chặt, chắc là chủ nhà cũng vừa rời đi trước chúng tôi không lâu. Trong các xóm vườn trồng cây ăn quả, có bóng những người đàn ông cởi trần hiện lờ mờ trong sáng, đang chạy đuổi bắt heo, bắt gà vịt. “Thực hiện triệt để vườn không nhà trống khi giặc đến”, tôi nhớ tới khẩu hiệu dán chỗ ngã ba nhà tôi mấy hôm trước, và lia cặp mắt thán phục nhìn theo bóng những người đàn ông cởi trần chạy thấp thoáng trong các vươn cây Đi một quãng, tôi gặp bọn thằng Phi, thằng Tính mặc quần sóc tuýt-xo, áo sơ mi thả cúc, đứng giữa đường cạnh chiếc ô-tô mui hòm sơn đen chết máy đỗ bên lề hai anh em nó thấy gia đình tôi lích kích đẩy chiếc xe đạp thồ va-li cồng kềnh ngang qua, chúng nó thọc tay vào túi quần, nhe răng cười. Dường như chúng nó cười chào…. mà thực ra không phải cười chào. Coi bộ chúng nó không có vẻ gì lo lắng cả . Ba nó ưỡn cái bụng to ra, dừng bên gốc cây vẫn phì phèo hút thuốc lá thơm, xem người tài xế loay hoay chui dưới gầm xe chữa máy. Má nó thì ngồi nhai trầu trong xe bên cạnh có người vú em đang bung búng vào những sợi dây dàn để dỗ em nín khóc. Cho tới cả cây đàn măng-đô-lin, chúng nó cũng mang theo chơi trong lúc chạy giặc!

Tôi bỗng chợt nhớ mình còn quên một món ở nhà, toan chạy trở lại. Nhưng ba tôi lừ mắt nhìn tôi, và ông cứ cắm cúi đẩy chiếc xe đạp cồng kềnh vượt sang ngã ba Đạo

Ngạn. Chúng tôi đã ra khỏi thành phố rồi, CÓ quay lại cũng không kịp. Huống chi cửa nhà tôi đã khóa chặt, mà má thì nhất định không trao chìa khóa cho tôi.

ôi, cái địa bàn bằng quả trứng có cây kim đồng hồ quay quay chỉ về hướng bắc của anh Ba thủy thủ cho tôi năm ngoái, nó còn nằm trong ngăn kéo bàn học, bên cạnh hộp thuốc màu Lơ-phơ-răng và xấp các-pốt-tan( Bưu ảnh) in đủ hình phong cảnh năm châu bốn biển… Tại sao tôi lại có thể quên cái “tài sản .quí báu ấy của mình được? Tôi đâm ra giận má tôi Đến chai nước mắm bà vẫn còn nhớ mang theo, thế mà những thứ ấy bà lại không nhớ giùm tôi.

Không biết hiện giờ anh Ba thủy thủ thân mến của tôi ở đâu? Anh có nhập vào Cộng hòa vệ binh chặn đánh giặc Pháp ở nơi nào đó không Hay anh đang lênh đênh trên một con tàu giữa biển khơi mà không biết rằng giờ đây, giặc Pháp đang đuổi tôi chạy hộc tốc thế này? Chân bước đi mà mặt tôi cứ ngoảnh lại nhìn về thành phố. Mấy đứa bạn nhỏ cua tôi ở bên kia đầu cầu quay, vùng chợ cũ, xóm Đình, xóm cả, chắc đã chạy vế hướng chùa Vinh Tràng đổ về GÒ Cát, Bến Tranh rồi… Chà, mai mốt đây cánh thanh niên đuổi giặc ra khỏi thành phố, chúng tôi lại quay về gặp nhau, tha hồ mà kể dủ thứ chuyện nhé?

Tôi vừa có phần lo, lại vừa có phần vui. CÓ gì đâu mà má tôi lại mặt xanh mày xám thế kia? Lâu lâu, tản cư một lần thế này cũng vui như cái bận quân Đồng minh ném bom bọn Nhật, đi ít hôm lại về: Lúc về, trong các buổi đến trường gặp nhau chúng tôi càng thêm nhiều chuyện vui hơn trước.

Chạy nhanh lên bà con ơi!

Tiếng kêu của một người nào đó khiến chúng tới giật mình quay lại. Cây dang bị chặt ngã, đổ rầm rầm phía sau. Thanh niên bắt đầu đốn cây chặn đường, ngừa giặc tiến về hướng này. Người ta kháo nhau: thằng Tây khôn lắm! NÓ chẳng dại gì từ Tân An đánh xuống. NÓ vòng ra biển rồi bất ngờ từ cửa GÒ công thọc lên. Mình không đề phòng mặt đó thì đến trời cũng chẳng kịp trở tay” . Một tiếng nổ vọng rền từ trung tâm thành phố. Cột khói đen sì cuồn cuộn bốc lên. Một chỗ, hai chỗ, ba chỗ lửa đã cháy khắp nơi trong thành phố, từ trên bẹ một ngọn dừa cao chót vót, một cụ già đứng che tay lên mắt, nhìn theo các cột khói.

Tây chiếm Mỹ Tho rồi, bà con ơil – Tiếng kêu thất thanh của ông lão tắt giữa những tràng tiếng súng liên thanh nặng nổ pãp… pập và tiếng đạn bay vui víu trên trời

Hai hôm sau, chúng tôi chạy tới Cai Lậy, cách thành phố tỉnh ly chừng ba tầm súng đại bác. Thị : trấn vẫn đông vui, chợ nhóm tấp nập như thường nhưng không khí chuẩn bị chiến đấu có phần sôi nổi và căng hơn ở tỉnh Ba má tôi vào ở nhờ nhà một người bà con. Không hiểu sao tôi cũng bắt chước điệu bộ quái quỉ của anh em thằng Phi, thằng Tính, thọc hai tay vào túi quần sooc, nhẩn nha đi dạo phố. Tôi đứng xem các anh thanh niên nông dân mặc quần áo nhuộm màu phèn, tóc tai bù xù, từ các thôn ấp xa xôi vác tầm vông nối nhau kéo vào thị trấn. Trông cũng khí thế lắm. HỌ ít nói, ít cười, mặt lầm lầm. Chắc là đánh giặc khá lắm. Nhưng họ xếp hàng từng tiểu dội đi la mác, chân tay con chệch choạc, không được đều bước và oai như các anh thanh niên ở tỉnh. Tôi chỉ phục nhất có cậu Lê Văn Tám ở Sài Gòn. Ngày nào tôi cũng vào phòng thông tin xem tranh, đọc báo “Kèn gọi lính” để về kể lại cho má tôi nghe. Cậu này cũng cỡ tuổi tôi thôi, có khi còn bé hơn, thế mà dám tẩm dầu vào người đốt kho xăng địch thì bảnh thật Người họa sĩ nào vẽ bức tranh “Em bé tẩm dầu, đã tô nhiều ngọn lửa quá, khiến tôi chỉ thấy có đôi mắt sáng ngời của cậu bé, còn cả ngươi cậu ta thì đỏ rực như một cây đuốc ấy! Giá tôi có mang hộp thuốc màu theo thì tôi cũng bắt chước vẽ một bức như thế này để khi nào trở về đưa ra treo ở lớp học.

Thường trong lớp, tôi là đứa học trò vẽ giỏi nhất. Thầy giáo đã nhiều lần khen, bảo tôi vẽ những hình con bọ dừa, con bướm phóng đại to như cái quạt treo lên bảng làm bài học cho cả lớp kia mà!

Tôi chẳng đủ thì giờ nghĩ lan man những chuyện đâu đâu nữa. Tôi ở Cai Lây độ tuần lễ thì giặc Pháp mò lên.

Gia đình tôi lại chạy về hướng Cái Bè . Chúng tôi cứ chạy truy tầm đại bác của giặc. Rồi Cái Bè cũng mất. Gia đình tôi chạy vào đồng ruộng. Chiếc xe đạp vướng lắm, ba tôi đem biếu nó cho các anh tự vệ dùng để chạy liên lạc trên đường quốc lộ. . .

Bây giờ thì tiếng súng nổ rền bốn phía chung quanh, không còn biết đâu là đâu nữa. Chúng tôi quá giang theo xuồng của đồng bào đi vào chợ Thiên Hộ( Thiên hộ dương tên một người anh hùng chống pháp ở đồng háp mười ).

Những người nông đần sẵn sàng giúp đỡ ba má tới đủ mọi thứ. HỌ cho gạo thổi cơm, cho mượn xuồng đi chợ. . .

Những thằng bé con còn dạy tôi cách cầm chĩa ba mũi phóng cá rô dưới kênh… Ở đây cũng thú, chỉ phải cái muỗi và đỉa thì quá lắm! Nhiều đến phát khiếp? Đứng ở sân chợ nhìn về quảng đông, chỉ thấy đồng cỏ mịt mùng, lau sậy nối liền với chân trời. Hóa ra đồng tháp mười là chốn này đây. Tưởng ở yên, nhưng chưa được mấy hôm, tàu bay giặc đã ầm ầm ù ù bay lượn dọc theo các xóm bờ kênh bắn xuống như trấu vãi. Thế là chúng tôi lại đi.

Qua Mỹ An, qua Cái Bèo, chúng tôi lại đổ ra hướng sông Tiền Giang.

Những làng mạc êm đềm, bóng dừa bóng chuối che rợp các khu vườn mát rượi đất phù sa, con đường đất nhỏ lượn trên bờ rạch nước đầy ăm ắp soi bóng những cây sầu riêng, măng cụt… Những ngôi nhà mái đỏ thấp thoáng trong các khu vườn xoài . . .

Tất cả những nơi mắt tôi nhìn thấy, chân tôi bước qua đều đã mất đi sự bình yên phẳng lặng của nó, không khí chiến tranh đã tràn về tận các thôn ấp xa xôi nhất . . .
Và cũng từ những thôn ấp xa xôi , bình yên phẳng lặng ấy, những anh thanh niên, những chị phụ nữ, những em bé, những cụ già chất phác hiền lành cũng đã cầm lấy vũ khí thô sơ. Chao ôi Những người nông dân xưa kia đi vào thành phố thì củ mỉ cù mì, chẳng thấy nói một câu, bước e dè, sợ sệt từ thằng lính mã tà(lính gác đường) cho đến con mụ góp tiền chỗ, nhẫn nhục mỉm cười trước những cặp mắt rẻ khinh của bọn người thành phố ăn trắng mặc trơn, thì bây giờ, họ đà vùng lên một cách dũng mãnh, sẵn sàng lao vào cái chết để chặn giặc, sẵn sàng cưu mang giúp đỡ những con người đã rời bỏ đô thị chạy đi trước khi giặc tới? Và dù miệng họ không nói ra được ý nghĩ của mình bằng những danh từ bóng bẩy văn hoa, nhưng hành động của họ lại thiết thực và anh dũng biết bao trước lời kêu gọi của TỔ quốc lâm nguy… tiến lên đường máu, quốc dân Việt Nam!

Non nước nát tan vì quân thù xâm lấn.

Đồng bào mau hiệp sức ra đấu tranh .

Đi đi. .. nước mất sao ta nỡ đành…

Tiến lên vì nước, thù kia ta đánh lui

Tiến lên đường máu, núi sông sáng ngời.. .

Trong tiếng sóng ầm ầm của dòng sông Cửu Long ngày đêm không ngớt thét gào, tiếng hát của họ vờn bay như một cơn bão lốc, âm vang khắp mọi nơi, khi thì như thúc giục gọi kêu, khi thì như giận dỗi trách mắng, lúc lại nghe như buồn bã âu sầu, lúc lại cuồn cuộn lên đầy phẫn nộ… Hay là vì từ trong tấm lòng thơ bé của tôi, từ lúc tâm trạng buồn vui khác nhau làm cho tôi nghe ra như thế, tôi cũng chẳng biết nữa?

Chúng tôi đã vượt sông Tiền Giang và mò mẫm lần hồi, hơn tháng sau đã nghe tiếng sóng vỗ. bờ của dòng sông Hậu Giang trước mắt. Đến đây thì sức má tôi đã yếu lắm. CÓ những đêm không chạy nổi nữa, chúng tôi phải dừng lại.ngủ giữa cánh đồng trơ trụi, quần áo ướt đẫm sương, có khi phải đội mưa đi suốt ngày; mệt vẫn không dám nghỉ, đói vẫn không kịp ăn… Lo sợ và cực nhọc đã quật má tôi ngã xuống mấy bận ở dọc đường. Tai hại nhất là những cơn sốt liên miên kéo dài, làm cho con người gầy gò như má tôi mỗi ngày một kiệt di. Nhiều bữa, má tôi không ăn uống gì, nằm thở mệt nhọc, bàn tay lạnh ngắt cứ nắm chặt lấy tay tôi. Nhưng đến khi nghe tiếng súng nổ, thì má tôi lại tức khắc ngồi dậy, nhanh nhẹn thu vén đồ đạc, dắt tôi chạy theo đoàn người tản cư.

Hễ có dịp dừng lại một nơi nào yên ổn, là y như một chốc sau, tôi đã lẻn trốn má tôi, nhập bọn với đám trẻ, con những người tản cư khác và bọn trẻ địa phương chưa hề quen biết bao giờ. Chúng tôi đi thật xa, ra tận giữa đồng, hoặc chui vào những khu vườn rậm để người lớn không tìm thấy, ở dó chúng tôi mặc sức bày ra dủ các thứ trò chơi mà trước kia ở thành phố tôi chưa hề nghĩ ra. Chỉ cần một cái mo cau rụng và mươi cọng sậy là chúng tôi đã làm thành chiếc cộ hai ngựa kéo, đưa viên tướng cởi truồng đầu đội mũ tết lá xanh di “quan sát mặt trận theo sau có cả tiểu đội trẻ em bồng súng theo hầu. Với vài bẹ chuối cắt ngắn, cắm đầy que khô thả xuống. con mương nhỏ, thế là chúng tôi đã có cả một đội hải thuyền rồi. Còn đạn trái phá thì tha hồ, cứ nhặt quả mù u rụng ném xuống lệnh uỳnh” làm cho bẹ chuối dập dềnh, nước có bắn tung tóe ướt cả áo quần cũng mặc.. . Chúng tôi bày ra rồi lại phá đi, ngày này qua ngày khác, nhiều trò chơi cứ lặp lại mãi không đứa nào thấy chán.

– An ơi? Ba má chỉ có mỗi mình con. Giặc bắn phá lung tung mà con chẳng biết lo lắng chút gì ! Còn cứ mê chơi đi lung tung, rủi ro bị lạc, hay có nguy hiểm gì xảy ra thì ba má biết con ở đâu mà tìm! – Má tôi thường rầu rầu nét mặt bảo tôi như vậy. –

Tôi thương má tôi lắm. Những lúc ấy thì giá có trời xuống rủ đi chơi tôi cũng chẳng đi. Tôi rơm rớm nước mắt, cúi mặt xuống, lòng buồn thỉu buồn thiu.

Nhưng nước mắt và cái buồn của trẻ thơ mau đến và cũng mau tan, như những giọt mưa bóng mây thôi. Quẩn quanh bên chân má tôi được vài buổi, tôi lại lén theo bọn nhỏ, chạy nhảy reo hò như một đám quỉ ranh, hoặc lại đi chơi xa cùng chúng nó.

Một buổi trưa, tôi lẽo đẽo theo mấy đứa chăn trâu mò vào đầm sen bắt cá thia thia. Bỗng có hai chiếc tàu bay khu trục đen sì ầm ầm bay tới. Như hai con ác điểu khổng lồ, chúng gào rú lượn lên sà xuống, quần trên đầu xóm bờ sông, chỗ đám người tản cư vừa dừng lại ban sáng. bom rơi xuống từng chùm, trông rõ mồn một.

Tiếng bom nổ rung rinh cả mặt nước đầm sen. Súng bắn dữ đội. Dường như chỉ có tiếng súng trên trời bắn xuống.

Khói cuồn cuộn phủ mất những đầu cây cao nhất mọc dọc theo bờ sông. Bọn chăn trâu mặt xám ngoét, vất rổ chạy tứ tung Mãi đến tối, lửa vẫn còn cháy đỏ khắp làng

Tôi lần về đến nơi thì không.thấy ba má tôi đâu nữa.

Ngôi nhà chúng tôi vào nghỉ nhờ ban sáng giờ chỉ còn lại mỗi đống tro, và những cây cột than gãy đổ vẫn còn đang nghi ngút cháy.

– Còn ở đây à? Giặc đổ bộ rồi, không biết sao? NÓ đổ bộ lên . . . ở đâu, anh?

– Đóng ở trong đình ấp dutn chứ còn ở đâu!

Một anh thanh niên tự vệ cầm tầm vông đi qua gặp tôi đã bao tôi như vậy. Tôi hỏi thăm ba má tôi, anh chẳng biết. Tôi hỏi rất nhiều người khác nhưng chẳng ai biết cả. HỌ bảo tôi cứ chạy dọc bờ sông, đi về hướng ấp trên xem may ra có gặp không

Tôi trượt lên ngã xuống, lần theo vết chân những nơừơi chạy trước mà đi mãi. Tôi cũng không biết mình đi đâu Đến một ngã ba sông thì cùng đường. Tôi ngồi xuống một gốc cây xa-kê? chờ xem có chiếc xuồng nào tới để xin quá giang sang bên kia bờ.

Đêm tối quá, Trời lại lấc rắc đổ mưa. Tôi quên cả mệt cả đói quên cả giặc đằng sau lưng, chỉ lo không tìm được ba má tôi. Vào khoảng nửa đêm thì có một đoàn thuyền vận tải ngang qua. .. Tôi đã gặp anh học sinh cô-le và bác tài công già tốt bụng, và họ cho tôi xuống thuyền.

HỌ bảo tôi cứ đi theo họ, rồi sẽ tìm gặp ba má nay mai thôi. Cho đến bây giờ, rốt lại thì tôi vẫn ngồi một mình ở đây.', N'Ôn Lại Ngày Cũ', N'on-lai-ngay-cu')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (28, 6, N'Em có biết con panh-goanh không? Biết à? ừ, loài chim cánh cụt ở Bắc Băng Dương ấy, người ta bảo rằng nó có một bản năng huyền bí để tìm về tổ cũ

ĐÓ là nhũng lời mở đầu của một câu chuyện mà anh Ba thủy thủ đã kể cho tôi nghe cách đây hai năm. Giờ đây, giọng nói ấm áp của anh lại như văng vẳng bên tai

Đã mấy hôm liền, chiều nào tôi cũng thấy trong người gai gai sốt. Để được nghỉ ngơi và yên tĩnh một mình, tôi ôm nóp mò vào nằm trong ngôi miếu cô hồn. Tôi chỉ nằm đó từ trưa đến chạng vạng thôi. Ban đầu, cũng có hơi rờn rợn Nhưng qua ngày thứ hai thì tôi đã quen đi, chẳng nhưng không có gì đáng sợ mà lại còn thấy rất dễ chịu.

Trong ngôi miếu vắng vẻ này, tôi không bị ai quấy rầy, tha hồ ngủ, và khi thức dậy, tôi có thể ngồi tự do hàng giờ miên man đắm chìm trong những ý nghĩ và hình ảnh lộn xộn lục ra từ trong mới hồi ức rối tinh của mình.

Lần này, khi tôi cựa mình ngồi dậy, nhìn ra ngoài thì không thấy bóng mặt trời chiếu đỏ rực hạ xuống bên kia bờ kênh như mọi hôm nữa, mà là một bóng trăng xanh lạnh ngắt thấp thoáng sau cành đa, đang chiếu những tia sáng yếu ớt xuống bên thềm miếu.

CÓ lẽ đã khuya lắm. Đêm vắng vẻ quá. Cơn sốt dữ dội ban chiều đã vật tôi nằm mê man đến tận giờ này. Đầu nhức như búa bổ, miệng đắng ngắt, và một cơn khát cháy khô cổ họng lại bắt đầu đến giày vò hành hạ tôi. Giá tôi đang nằm Ơû nhà thì mở mắt ra đã thấy có má tôi ngồi một bên. CÓ lẽ má tôi sẽ đỡ tôi ngồi dậy, nâng cốc nước chanh đến tận miệng tôi, và tôi còn chờ xem má tôi lo lắng thế nào, còn chờ xem má tôi xuýt xoa an ủi dỗ dành một lúc rồi tôi mới uống cũng nên. .. Cuộc sống trôi nổi trong mấy tháng gần đây đã dạy khôn cho tôi nhiều rồi.mày hãy tự lo lấy cho mày trước đã: Đừng có nghĩ đến việc cậy ai nước rót cơm dâng”. Tôi cố sức đứng dậy, lảo đảo đi ra bờ kênh. Chao ôi, làn nước lấp loáng ánh trăng lờ đờ trôi nhẹ dưới kênh kia mới trong và mát làm Sao! Tôi cúi xuống vốc những giọt vàng vỡ vụn vào lòng hai bàn tay, uống lấy uống để, tưởng chừng như mình có thể uống cạn cả con kênh này thì mới hả được cơn khát. Những làn nước mát vả vào mặt, vào gáy làm cho tôi dần dần tỉnh hẳn.

Tôi lò dò trở vào ngôi miếu, ngồi tựa lưng vào tường, thở dốc.

– Mau mau tìm cách trởlại nhà thôi

– Thành phố quê hương mày giặc đã chiếm rồi, mày còn về làm sao được chứ Ước gì mình có được đôi cánh như những con chim

Những câu tự nhủ và tự hỏi mình cứ vẩn lên trong đầu óc tôi Đột nhiên, tôi bỗng nhớ tới câu chuyện anh Ba thủy thủ đã kể cho tôi nghe về bản năng huyền bí của loài chim cánh cụt những nhà sinh vật học trên thế giới đã chứng minh điều đó… HỌ buộc những mảnh đồng nhỏ, ghi ngày tháng và hòn đảo sinh trưởng của những con chim bắt được HỌ mang nó đi rất xa, xuống tận vùng Nam Băng Dương và thả chúng ra. Thế mà một hai năm sau, người ta lại bắt được những con chim đó Ơû đúng trên các hòn đảo cũ ”

Giọng nói ấm áp, đầy hấp dẫn của người thủy thủ vui tính và nhiều mơ mộng xưa kia khiến cho tôi lúc nào cũng hong hóng chờ nghe, lại văng vẳng bên tai. Tôi ngồi nhìn ra ánh trăng soi lờ mờ, thấy dần dần hiện lên quang cảnh nhộn nhịp của các bến vận hà dọc theo đôi bờ sông trắng của con sông Tiền Giang. Trên cầu tàu lục tỉnh, anh ngồi tựa lưng vào một trụ buộc đỏi(Xích), tay cầm tẩu thuốc lá; những làn khói mỏng xanh xanh từ trong tẩu thuốc lá chưa kịp bay lên đã tan mất ngay theo gió. Tôi ngồi bên anh, từ trên sàn cầu qua những khe ván đóng hở, có thể nhìn thấy ngay dưới chỗ mình ngồi những thanh đà sắt bắt chéo vào nhau trong một màu tối âm u, và sâu hơn một chút, dưới kia dòng nước lao nhanh như cắt lúc nào cũng giận dữ réo ào ào, dường như muốn nhổ phăng những chiếc cột tàu bằng thép to tướng mà lôi dìm xuống đáy sâu.

Sướng nhỉ, anh nhỉ Được như con chim cánh cụt ấy thì bọn trẻ chúng em không bao giờ sợ lạc! – tôi huơ tay nói như vậy.

ĐÓ là một con chim đáng thương!

Vì cánh nó quá ngắn phải không anh?

– ừ cũng có thể. . . Nhưng không hẳn như vậy đâu . Anh muốn nói với em một vấn đề khác kia. . .

Ngừởl thủy thủ trẻ có khuôn mặt sạm nắng rất đẹp, mái tóc lúc nào cũng bồng lên vì sóng gió đại dương, đăm đăm nhìn về chỗ vạch ngang của dòng sông Cửu Long lòa nhòa gắn liền mặt nước với chân trời. Anh im lặng một lúc; sau khi đã hút mấy hơi khói thuốc dài, giọng anh bắt đầu trầm hẳn xuống, như nói với mình:

Cuộc sống của con người phải đâu chỉ thu hẹp trên mảnh đất vùng quê? Đã đành quê hương là nơi gắn bó với cuộc đời mình nhất, nhưng khi người ta còn trẻ tráng, phải bay nhảy hoạt động, đi đây đi đó chứ. Lúc nào cũng chạnh nghĩ về quê hương, đó là báo hiệu của tuổi già…

Không phải vì có dôi chim cánh cụt mà con panh-goanh không di xa được đâu. NÓ là một con chim không có cánh Ơû tâm hồn. NÓ như một ông cụ già lưng mỏi gối chùn, lúc nào cũng muốn tìm về nằm xuống Ơû quê hương!

Chiều chiều, sau giờ học, thầy giáo tôi thương dắt học trò ra sông Cửu Long tập bơi. Trên cầu tàu lục tỉnh ấy, tôi đã gặp và quen anh. Anh làm thủy thủ trên một chiếc tàu rất lớn, có ba ống khói to tướng sơn màu xanh da trời. Lâu lâu, tàu anh lại cặp bến một lần. Gặp anh vài bận, tôi đã thấy gắn bó với anh rồi. Mà anh thì cũng rất mến tôi Bởi tôi hay hời đủ mọi thứ chuyện trên trời dưới đất, lung tung, mà anh cũng lấy làm thích thú một thằng bé tò mò, lúc nào gặp anh cũng đặt ra nhũng câu hỏi, khiến anh phải nhồi rất nhiều thuốc lá vào tẩu mới tìm ra lời giải đáp. Tôi mời anh về nhà tôi chơi. Ba má tôi cũng rất qúy anh thủy thủ vui tính, biết nhiều chuyện lạ này. Lần nào anh đến chơi, ba má tôi giữ anh Ơû lại ăn cơm. Nhũng hôm ấy, nhà tôi rộn lên tiếng nói, tiếng cười, vui như có cỗ. Quan hệ mật thiết giữa anh và tôi khiến ba má tôi xem anh như người trong họ hàng.

Cuộc đời anh lênh đênh nhiều năm khắp các mặt biển, trên nhiều chiếc tàu của những công ty hàng hải khác nhau. Anh đã đi qua ân ĐỘ Dương, vượt kênh đào Xuy-ê ra Địa trung Hải, men theo bờ Đại Tây Dương lên tận cảng Lơ Ha-vrơ… Gần khắp mặt biển Thái Bình Dương, cảng nào anh cũng có tới. Anh biết rất nhiều thành phố, nhiều giống người… Chỉ có những xứ Ơû bên kia tây bán cầu là anh chưa đặt chân tới thôi. Trong những mẩu chuyện anh kể, tôi nghe quen nhiều tên giống người, tên vùng đất, hải cảng, tên thủ đô, thành phố quan trọng trên hầu khắp các lục địa mà tôi đã học say mê trong các bài địa dư Ơû trường.. .

– Em coi bộ thích phiêu lưu lắm hả? – có lần anh hỏi tôi như vậy. Phiêu lưu là sao, anh?

Anh nhoẻn miệng chơi, bập bập cái tẩu thuốc lá làm cho khói bốc xanh um như một ống khói tàu, hạ thấp giọng:

– Ờ phiêu lưu là nay đây mai đó. Trên rừng, dưới biển, đồng ruộng, núi cao… bất cứ chỗ nào mình cũng đi tới.

Càng đi thì càng gặp nhiều chuyện lạ, khiến cho mình say mê… Thôi, bao giờ em lớn lên, em sẽ biết

Năm ngoái, anh đi đâu bên Thái Lan về, mang cho gia đình tôi nhiều thứ. Quà tặng ba tôi là chiếc hộp thuốc bằng bạc chạm: quà tặng má tôi là một ông Phật bằng đồng to lối nắm tay, ngồi dim mắt trên tòa sen. . .

Và suy đi nghĩ lại chẳng biết gì hơn – anh vỗ vỗ vai tôi – anh mua tặng em một chiếc địa bàn Chiếc địa bàn bé bằng quả trứng, có cây kim đồng quay quay chỉ về phương bắc, giờ đây lại hiện ra to tướng, lồng vào khung trăng vành vạnh đang treo lơ lưng giữa trời kia. NÓ là điềm báo như lời má tôi thường nói chăng? Hay cái vật bé nhỏ, xinh xắn mang trong lòng nó mũi tên chỉ đường cho những kẻ viễn du không may lạc lối trong sương mù, bão tố, giữa rừng rậm, đồng hoang… từ khi cầm nó vào tay, số mệnh đã khiến cho tôi phải rơi vào cuộc sống lênh đênh này chăng? Tôi nghẹo đầu vào vách, nhắm mắt lại, tưởng như nghe lại giọng hát quen thuộc của người thủy thủ trẻ đang vẳng đến từ một chỗ thẳm xa nào:

Xưa kia có một con tàu nhỏ

NÓ chưa hề lướt sóng ra khơi…

Này hỡi những chàng thuỷ thủ

Đang xông pha trên ngọn sóng cao vời

Chà, tôi lại khát nữa đây… Tiếng mạch đập trong tai tôi ù ù hay tiếng gió thổi giữa trùng dương Tôi chóng mặt quá, cứ buồn nôn. Tôi đang nằm đây hay đang đứng trên con tàu lắc lư nhồi theo sóng? Giọng nam trầm của anh Ba thủy thủ cứ dập dềnh đưa tiếng hát bè cao cua tôi chồm chồm bay vút ra xa. .. “Xưa kia có một con tàu nhỏ… NÓ chưa hề lướt sóng ra khơ. .. ơ…i . Một lượn sóng thần cao vút như núi hiện lên Ơû chân trời, băng băng chạy tới trong tốc độ nhanh khủng khiếp, rồi chồm qua phủ mất con tàu và cuốn tôi đi . . . trôi mãi . . . trôi mãi . . Tôi càng vùng vẫy thì càng thấy bị chìm sâu xuống đáy, mỗi lúc một ngạt thở đến không còn đủ sức chịu đựng được. Rồi tôi không còn biết gì nữa . . .

– Thằng bé tỉnh dậy rồi! – giọng mừng rỡ của một chị nào đó dịu dàng nói bên tai tôi.

– Tôi từ từ mở mắt ra, thấy mình còn đang nằm trong ngôi miếu. Một chị cứu thương mặc chiếc áo bà ba màu lục đang ngồi bên cạnh, bàn tay mát rượi của chị hãy còn đặt trên vầng trán nóng như lửa đốt của tôi. Chung quanh tôi, la liệt những thương binh. Một anh bị thương Ơû đầu quấn đầy băng trắng, đang tựa lưng vào chân bệ thờ hút thuốc lá, mửn cười nhìn tôi . ánh nắng trời chiếu rọi nghiêng bên mặt anh một quầng sáng lóa. Tiếng súng nổ ran xa xa. Lâu lâu, một tràng đại bác không biết từ đâu bắn tới ùng oang. . . ùng oang. . . nổ dữ dội ngoài Ngã Ba Kênh. Không khí sặc sụa mùi lửa cháy nhà và mùi thuốc súng cay nồng nồng.

– Tây đến rồi hả anh? – Tôi hỏi anh thương binh đang mỉm cười nhìn tôi. Tôi cố chống tay ngồi dậy, nhưng lại run run khuỵu xuống.

Cả người tôi rã rời mệt mỏi như vừa qua một trận ốm lâu ngày. Qua lời kể của chị cứu thương tôi mới hay rằng giặc Pháp bắt đầu tấn công vào vùng này từ sáng sớm.

Chúng cho quân xích hầu( trinh sát ) ăn mặc giả thường dân mò vào, toan bắt sống mấy anh tự vệ Ơû đầu trạm canh, nhưng ta đã cảnh giác phát hiện kịp. Tàu bày giặc ném bom đốt cháy xóm chợ từ lúc giữa trưa. Hiện giờ, chúng còn đang Ơû bên đầu cầu con lộ Cái Chanh…

– Cha chả? Lúc khiêng các anh bị thương vào đây, thấy chú nằm mê man, thỉnh thoảng cứ hét lên, tôi lo quá…

Cạy mồm cạy miệng mãi mới nhét được mấy viên thuốc cảm cho chú đấy Lại hát lảm nhảm những gì gì… Này, nhà chú Ơû đâu?

– Em không có nhà! – tôi đáp.

Coi bộ thằng bé này chưa tỉnh hẳn đâu. Xem như nó còn mê đấy! anh thương binh ban nãy thong thả nói như vậy và cầm điếu thuốc lá hít một hơi dài, thản nhiên như một người nhàn nhã đang Ơû nhà mình. Rồi anh lại nói: – Chị pha cho nó một cốc sữa đi, nó sẽ tỉnh ngay. Lấy hộp sữa trong ba-lô tôi đấy. Tôi chưa cần đến…

Chị cứu thương loay hoay đèn cồn đun nước Tôi ngồi dậy, đưa đôi mắt mệt mỏi nhìn các anh thương binh đang nằm thiêm thiếp trên nhưng tấm đệm bê bết dấu máu chưa khô. Một anh bị mảnh đạn đại bác cắt giập ống chân, những bắp thịt đùi cứ giật giật khiến anh cựa người nhăn nhó theo, nhưng tuyệt nhiên không hề nghe anh rên một tiếng.

Tôi uống hết cốc sữa. Quả thấy người tỉnh táo lại ngay, nhưng miệng hãy còn khô và đắng lắm, cứ thèm uống nước. Vào lúc gần tối thì giặc Pháp đã vượt được sông Cái Chanh. Đạn súng máy bắn vào khu chợ bay vèo vèo trên nóc miếu. Người ta bắt đầu đưa thương binh xuống xuồng chuyển đi từ lúc ngớt tiếng tàu bay.

Tôi ngỏ ý muốn theo xuồng đưa các anh thương binh đi Nhưng các ông cụ già bơi xuồng không cho. Và chị cứu thương cũng bảo rằng tôi chưa khỏe hẳn. Chị cho tôi một gói độ mươi viên thuốc cảm và một đòn bánh tét, lại ân cần khuyên tôi nên về nhà mà nghỉ, muốn theo các anh thì còn nhiều dịp, lúc nào chả được, RÕ ràng là không ai ngờ rằng tôi là một thằng bé sống không nhà. Chả nhẽ mỗi chốc lại đem chuyện mình ra kể lể với mọi người sao? Nhất là để cầu lấy một lòng thương?

Không! Tôi không thể làm như vậy được. Mà ngươi ta đang bận tíu tít kia, bao nhiên chiến sĩ bị thương phải chuyển đi, giặc dã đổ bộ qua sông, xóm chợ cũng cháy rồi . Một thằng bé lưu lạc như tôi , đâu phải là đáng bận tâm đối với họ?

Sự tình đã đến nước này thì tôi cũng mặc, tới đâu hay đó Tôi bẻ một số cành cây làm gậy cầm tay, đi dọc theo bờ kênh. Con dao găm còn nằm gọn trong chiếc túi da đeo cồm cộm, ló cán ra bên trong túi áo vét-tông của tôi đây.

Hai bờ kênh, nhà nào cũng đóng chặt cửa. Bàn ghế, lu mái(chum vại ) nhận lổm ngổm dưới mương. Một con chó đứng giữa đường thấy tôi đi tới, cụp đuôi lủi vào bờ dậu.

Khi tôi qua rồi, con vật vắng chủ bèn chạy sủa duỗi theo ăng ẳng sau lưng tôi một lúc.

Đêm đó, tôi vào nằm trong một chòi rẫy bỏ hoang giữa đồng. Kinh nghiệm đã dạy tôi nên tránh các đường giao thông thủy bộ quan trọng trong khi giặc sắp tấn công đến nơi. Cả ngày hôm sau, tôi cứ nhằm về hướng những chòm cây có nhà Ơû mà đi tới. Bây giờ, cơn sốt đã lui rồi. Nhờ mấy viên thuốc cảm và đòn bánh tét của chị cứu thương, tôi đã có thể tiếp tục đi được từ sáng đến chiều, cho tới khi gặp một dòng sông nước đặc như màu cà phê chắn ngang trước mắt.

Tôi không biết mình đang đi tới chốn nào đây? Dọc bờ sông xa xa, người ta bắt đầu đốt lên nhiều đống lửa. Trời không gió. những ngọn lửa cháy thẳng, trông như màu trắng, rực rỡ giữa cảnh trời tà. Một làn ánh sáng tai tái, lờ mờ phảng phất trên mặt nước. Cây cối ngả dần sang màu đen, biến thành những hình thù kỳ dị, như những con quái vật dưới sông trèo lên chồm chỗm ngồi bên bờ.

Trên một doi đất, có đám người xúm xít ngồi dưới chòm cây khô ánh lửa chiếu qua vai những cái bóng quay lưng về mé sông, vờn qua vờn lại trên những chiếc xuồng ghếch mũi kéo lên bãi bùn bên dưới chỗ họ ngồi khiến cho những chiếc xuồng kia trông như động đậy muốn bò lên bãi. Hình như những người ngồi đó đang bàn cãi về chuyện giặc Pháp có dám tiến sâu vào vùng này hay không. Tôi bước đến gần, nhìn vào họ xem họ đang làm gì. Đột nhiên, hai chân tôi bỗng khựng lại… Kìa! ông cụ già bán rắn đang ngồi dạng chân bên đống lửa. Con chó săn nằm sát bên chân chủ, mõm ngóc lên, đuôi vẫy qua vẫy lại Thằng bé đen trũi cầm sào nhảy lên bờ dạo trước thì ngồi đối diện với bố, đang dùng những đầu ngón chân lật ngựa một con rùa nhỏ. Con rùa bị hất vào lửa, bốn chân bơi bơi trong không khí, cổ vươn ra dài ngoẵng. Mấy người đàn ông cởi trần, vận quần đùi đen, cao to như ông cụ già bán rắn, người nào người nấy mặt đỏ lựng ngồi bình thản, ngắm con rùa lắc lư cái mai, cố dịch ra xa luồng nóng hừng hực từ trong đống lửa phả ra. MỘt người rung rung đôi vai cười hé . . hé . . . hơi rượu từ cái mồm há hốc bay ra nồng nặc. Hai người đàn bà mặc quần áo đen, ngồi xế bên ngoài một chút, như hai cái bóng, mắt âu sầu nhìn ra sông.

Tôi đánh bạo bước tới một bước nữa. Con chó săn tức thời chồm lên, sủa oang oang. Mọi người chưa kịp ngẩng lên thì con vật tinh khôn đã phóng tới ngoạm vào túi áo vét tông của tôi

Luốc? yên nào! – ông cụ già quát lên.

Con chó săn buông túi áo tôi ra, lùi về bên chân chủ nhưng mõm vẫn nghếch lên hướng về phía tôi, hai cánh mũi bóng nhẫy luôn luôn động dậy.

ông ơi? CÓ phải cái này của ông không? – tôi móc chiếc túi da beo ra, chìa về phía ông cụ già bán rắn.

ông cụ già ngước nhìn lên, sửng sốt. Hai mắt ông dán chặt vào chiếc túi vằn hoa trên tay tôi. Thằng bé bỏ con rùa nằm đấy, nhẩy đến chộp ngay chiếc túi tưởng đã mất rồi. NÓ nhe răng, cười như mếu:

– Biết thế nào cũng có người nhặt được mà ? Tía cứ bảo rơi dưới kênh !

Tôi đang nhìn ông lão hay nhìn vào ngọn lửa, tôi cũng không biết nữa. Tôi bắt đầu kể:

– Hôm trời nổi dông, khi ông xuống thuyền chèo đi rồi, cháu bắt gặp cái túi này nằm Ơû chỗ gốc cây bã đậu . Cháu nghĩ là của ông. Cháu nhặt lên, chạy theo gọi mãi mà gió lớn quá, ông không nghe… ông cụ già bán rắn lặng lẽ đứng lên. Tôi hơi lùi chân lại một bước. Nhũng người ngồi chung quanh đống lửa cùng đưa mắt nhìn ông. Không thấy ông nói gì . Đột nhiên ông xốc tới, dang hai cánh tay đại bàng ra, cắp lấy hai chân tôi, nâng bổng cả người tôi đưa lên ngang mặt ông.

Đầu lấc qua lắc lại, hàm râu cọ vào bắp vế tôi sào sạo, ông cất tiếng cười ha hả. Con chó săn nhẩy cỡn chung quanh đống lửa, sủa ăng ẳng mấy tiếng, lại lao tới liếm chiếc túi da beo trên tay thằng bé.

– Tốt lắm, chú em! Qua cám ơn chú em đa! – giọng mừng rỡ của ông lão vang âm rất xa trong đêm tối . ông ôm tôi quay một vòng rồi mới chịu buông tôi ra, đỡ tôi vào ngồi cạnh đống lửa.

ông giật chiếc túi da beo trên tay thằng bé, tung lên tung xuống mấy cái trong lòng bàn tay to lớn của mình, đoạn nghiêng người vào gần đống lửa, tháo miệng túi cầm ra từng món, săm soi mãi.

Một người đàn ông vỗ đánh bốp vào vai ông cụ già:

Bác Hai? Vật đã tìm chủ trở về thì ta phải làm một cái gì chứ.

ông lão cười khà khà:

– Rồi khắc có ngay! Khắc có ngay mà?

Hai người dàn bà ngồi nhích lên bên tôi. Một bà hỏi:

– Em từ ngoài chợ Thới Bình vô đây à?

– Cháu không biết Thới Bình. Cháu từ trên Chắc Băng xuống đây . . . ủa, vậy em đi đường nào?

– Cháu cũng không biết. . . Cháu cứ theo đường mòn lội qua rẫy, lần mò đi mãi vậy thôi?

Nghe nói Tây vô Chắc Băng rồi phải không? Đằng mình bỏ trống cho nó vô à?

– CÓ đánh chứ! Đánh nhau suốt ngày…

Tôi lần lượt kể lại chuyển những người thương binh trong miếu và chị cứu thương mặc chiếc áo bà ba màu lục Những người ngồi xung quanh đống lửa vừa hút thuốc lá vừa lắng nghe chăm chú. Thỉnh thoáng họ lại à lên một tiếng và đưa mắt nhìn nhau, mỉm cười.

Không biết họ trao đổi với nhau những ý nghĩ gì.

Thế ba má chú em đâu rồi? ông cụ già gõ cái nõ tẩu vào gót chân để trút tàn thuốc lá ra, chợt hỏi tôi.

Nhà cháu Ơû tận bên kia sông Tiền Giang. Cháu lạc mất ba má cháu đã lâu rồi.

– Ở Tiền Giang à? Vùng xã nào? – ông trố mắt hỏi.

– Dạ, Ơû Mỹ Tho?

ờ Mỹ Thon Qua cũng có biết…

Người đàn bà ngồi cạnh tôi chép miệng:

– Khổ thân thằng bé! Bây giờ em tính đi dâu?

Tôi cầm vỏ cây khô ném nhẹ vào đống lửa. Tôi lúng túng không biết đáp ra sao.

Nhưng tự nhiên tôi bỗng ngước lên, nói rắn rỏi:

– Đi đâu cũng được. Cháu không sợ gì cả. Cháu còn trẻ tráng… đi được tới đâu, cháu đi tới đó? Ơ đâu mà chả thích…

Tôi không biết chính tôi đang nói, hay anh Ba thủy thủ hóa thân vào tôi thốt ra câu ấy. Chắc là bộ mặt ngênh nghênh làm ra vẻ tự hào của tôi có gì buồn cười lắm hay sao, mà khi tôi vừa dứt tiếng, mọi người ngồi chung quanh tôi đều cười rộ lên .

Đưa tay chú em cho qua coi nào

Một người đàn ông chụp phăng bàn tay tôi, nắn nắn các ngón tay và kề vào đống lửa ngắm ngiá bàn tay tôi

– Chú mày có số lênh đênh… và sẽ chiu khổ nhiều. Nhưng rồi tất sau này sẽ khá. Lần đầu tiên tao mới nghe một thằng nhóc nói y như giọng người lớn đấy! Khá lắm

Khá lắm ông cụ già bán rắn hơi ngửa đầu ra, mắt nhìn vào khoảng không trước mặt, miệng ngậm tẩu thở ra những hơi khói thuốc lá đặc sệt. ông khẽ gật gù, quay lại ngó vào tay tôi. Tôi cảm thấy rân rân, dường như đang bị những tia mắt của ông sờ vào khắp người mình vậy.

Thằng bé đen trũi đã chạy xuống mé sông, mò vào thuyền cầm lên chai rượu tổ bố và cái bát sành to tướng.

Đám đàn ông nhịp nhịp đùi, vung tay lên nhao nhao:

Nào, chúng ta mừng cho bác Hai

VÔ tửu bất thành lễ!

– Lễ gì vậy?

Lễ ra mắt của chú bé này… chúng ta đều cùng họ “lênh đênh” cả

ông cụ già bán rắn rót rượu ra bát, đưa mắt hỏi tôi:

– Nhấp môi một tí, được chứ

Tôi cười và lác đầu. ông nâng bát rượu lên, tợp một ngụm nhỏ(Theo tục lệ vùng này bao giờ chủ mời cũng uống trước để chứng tỏ trong rượu không có độc ) rồi trao chuyền tay cho những người ngồi quanh đống lửa.

Thằng CÒ – tôi còn nhớ tên nó trong lần gặp trước, cầm tay tôi kéo lại gần nó. NÓ rủ rỉ nói vào tai tôi:

– Mày ăn gì chưa.

– ăn rồi – tôi đáp.

CÓ rùa vàng ngon lắm? Còn mấy con dưới thuyền.

Chốc nữa nướng cho mày ăn.

Vừa lúc đó, con chó bỗng chồm lên sủa oang oang. Trong tiếng chó sủa dữ dội bất thình lình, tôi nghe có tiếng con vật gì kêu “ché . . . ét . . . ché . . . ét ” Ơû ngoài bóng tối .

A ha, VÕ Tòng? Cả tháng nay không gặp!

Một người đàn ông búng đầu ngón tay canh cách vào cổ chai rượu, lắc lắc đôi vai, khề khà hát:

Võ Tòng mà đả hổ

Tại Kiến Dương Cang

Gặp anh thời giữa đàng. . . ”

Con chó nhe nanh, lông gáy dựng lên, hai chân trước chồm chồm ra bóng tối sủa dữ dội.

– Luốc? yên nào?

ông cụ già quát một tiếng. Con chó săn tiu nghỉu lùi lại ngoan ngoãn nằm xuống bên chân chủ.

Tôi nắm chặt tay thằng Cò, hãi quá. Một người đàn ông cổ lộ hầu, đen như cột nhà cháy, cởi trần, cao cao lêu nghêu đang hiện ra trong ánh lửa. Hai hố mắt ông ta sâu hoắm, và từ trong đáy hố sâu thẳm đó, một cặp tròng mắt trắng dã, long qua long lại, sắc như dao. Mái tóc hung hung như bờm ngựa phủ dài xuống gáy. bộ ngực chắc nịch của ông ta ướt đẫm mồ hôi. Dưới lớp mồ hôi bóng như mỡ đó, có hình một con rồng cuộn khúc xanh lè thích chàm bằng những nét tinh vi, phập phồng theo hơi thở của ông ta. Con rồng xanh vươn vây ôm chặt một quả tim, giữa có những chữ gì lấp loáng mồ hôi trông không rõ. Chỗ gò má bên phải, năm cáí sẹo dài sả xuống từ thái dương vắt đến cổ, như đầu móng cọp cào. Một con gì giống như khỉ, hai tay dài nguều ngào, sắc lông đen tuyền, chỉ trừ chỗ hai gò má là có mọc hai chòm lông trắng, đang ngồi vắt vẻo trên vai con người kinh dị ấy.

Lâu nay có làm dược con thịt nào khá không, ông chúa sơn lâm? – một người quay mặt ra, hỏi.

Người đàn ông mới đến thở phào một tiếng, thả con vật xuống đất, tháo cánh nỏ đeo bên lưng ra, ngồi vào bên đống lửa nói trống không:

Tàm tạm vài con heo rừng. Hơn tháng nay còn phơi cái da beo đóng mốc Ơû lều. Tây đánh gần tới, thiên hạ chạy tứ tán, bán cho ai?

– Làm một hớp rượu đón gió đi, chú! – ông cụ già bán rắn nghếch râu lên mời.

– Không bán được da thì ta phơi thịt nhậu. Lo gì.

– Bảo Tiểu đồng hầu rượu xem? Cho nó hầu rượu đi, VÕ Tòng! .

VÕ Tòng búng vào miệng bát một cái, tức thời con vật đưa hai tay dài nguều ngào ra bưng cái bát nâng lên ngang mặt lắc lư đi đến chìa ra trước mặt ông cụ già ông cụ già cầm chai róc thêm rượu vào đầy bát và hất hàm về phía VÕ Tòng.

Tôi hỏi thằng Cò:

Con gì lạ vậy?

Con vượn bạc má. Khôn lắm NÓ tên là Tiểu Đồng.

Thằng CÒ cứ ngó chăm chăm vào con vật, coi bộ thích lắm. Con vượn bạc má đứng thẳng hai chân sau lên như người. Hai tay nó bưng bát rượu đi thẳng đến chỗ VÕ Tòng, đưa lên mời chủ. Tiểu Đồng nhe răng kêu “ché… ét, ché . . .ét”, rồi bắt đầu đi vòng quanh đống lửa mời rượu từng người. Con chó săn gừ từ mấy tiếng, vì sợ chủ nên phải nằm yên chứ coi bộ như nó chỉ chực chạy ra cắn một miếng vào đùi con vượn thì mới hả. Đến chỗ hai người đàn bà mặc quần áo đen, Tiểu Đồng nghiêng dầu cúi xuống chào, làm cho những người đàn ông thích chí cười rộ lên. Hai người đàn bà lắc đầu quầy quậy, xua tay từ chối, nhưng con vượn bạc má không chịu đi, cứ đứng giậm chân kêu “Ché~ét, ché…ét”. Cho đến khi mỗi bà phải cầm bát rượu lên nhấp môi một ít, Tiểu Đồng mới chịu bưng bát đi mời người khác.

Chú định đi đâu mà thả ngược lên vùng này vậy? – ông cụ già bán rắn hỏi VÕ Tòng.

Quần áo rách hết rồi. Nghe Tây sắp đến, đi đón kiếm một bộ ka-ki mặc chơi – VÕ Tòng đáp chậm rãi.

Một người đàn ông vỗ tay đánh bốp:

– Này? Lấy dược súng về bán cho anh em đi săn kiếm thịt ăn với nhé?

VÕ Tòng nhếch môi cười. Những vết sẹo Ơû gò má bên phải nhăn nhúm lại, thấy rất dễ sợ.

Súng để bắn giặc chứ có súng đâu thừa mà đi săn!

Nhất định là tôi sẽ kiếm được. Chỉ lấy quần áo thôi. Còn súng thì phải để cho anh em tự vệ chứ chợt thấy tôi gật đầu tỏ ý đồng tình, VÕ tòng dừng lại chỉ vào tôi:

Chú bé này, xem không phải là người cánh ta? ông cụ già bán rắn gật gù, thò tay cầm một cái que khô cời vào đống lửa:

Nhưng nó sẽ là người cánh ta. Chốc nữa, tôi sẽ đưa nó theo tôi… Bà nhà tôi hẳn là phải mừng lắm?

Một bầy chim đêm bay vút qua trên đầu chúng tôi.

Tiếng đập cánh rào rào mất hút trong vòm trời nhấp nháy những vì sao xanh biếc.', N'Bước Đầu Cuộc Sống Lưu Lạc', N'buoc-dau-cuoc-song-luu-lac')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (30, 1, N'Warren Buffet từng nói: “Không bao giờ có ai giống bạn.” Một ý tưởng rất thâm thúy. Một con người khôn ngoan. Không bao giờ có ai giống như tôi. Và không bao giờ có ai giống như bạn. Sẽ có người cố gắng bắt chước cách bạn suy tư, nói năng, hành động. Nhưng dù cố gắng hết sức họ cũng chỉ đứng hàng thứ hai mà thôi. Vì bạn là duy nhất. Một bản thể duy nhất tồn tại hôm nay. Giữa hàng tỷ người khác. Hãy dừng lại và nghĩ về điều này. Bạn chợt nhận ra mình đặc biệt. Không, rất đặc biệt mới đúng. Và không thể có ai tranh giành được.

Thế thì hôm nay, bạn làm gì khi bước vào thế giới cần những con người thể hiện vượt trội trong cuộc sống từ trước đến giờ? Bạn đã bộc lộ hết mọi khả năng tiềm ẩn chưa? Bạn đã tiết lộ con người chân thật của mình chưa? Bạn có là chính mình? Hãy tự hỏi. Bởi vì không còn lúc nào thể hiện chính mình tốt hơn lúc này. Và nếu không phải bây giờ, thì khi nào? Tôi nhớ đến lời của triết gia Herodotus: “Thà chấp nhận rủi ro phải gánh chịu một nửa những chuyện xấu mà ta từng dự đoán trước, còn hơn giữ mãi sự vô danh hèn nhát vì sợ những điều có thể xảy ra.” Một lời nói tuyệt đẹp.', N'Hãy Là Chính Minh', N'hay-la-chinh-minh')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (30, 2, N'Tôi đang ngồi tại phi trường Los Angeles. Tôi đến đây để diễn thuyết trước tập thể các nhân viên đầy tiềm năng của công ty General Electric, về vai trò lãnh đạo không cần chức danh, về thế giới việc làm. Về sự vượt trội trong bất cứ công việc nào.

Sau buổi nói chuyện, tôi hồi tưởng lại tại sao rất nhiều người trong chúng ta lại thích đóng vai trò nhỏ bé ở các lĩnh vực cốt lõi trong cuộc sống. Tại sao họ tránh né sự thay đổi? Tại sao họ không đổi mới và bộc lộ tài năng sáng tạo đang ngủ yên trong mỗi con người? Tại sao nhiều người cố tình không muốn nổi bật. Tôi rút ra câu trả lời: những rào cản vô hình.

Tôi muốn kể chuyện này: Tuần trước tôi lái xe về miền quê. Để hít thở. Để làm tươi mới. Để suy tư. Tôi thấy một bảng hiệu của một công ty huấn luyện chó. Bảng hiệu nói về một hàng rào vô hình, chính là hệ thống những giới hạn vô hình mà con chó không thể vượt qua. Cuối cùng người ta đã tạo ra những phản xạ có điều kiện để dù hàng rào đó không còn nữa thì con chó vẫn không dám vượt qua giới hạn. Nó hình thành giới hạn trong đầu để xác định thực tại của nó. Chúng ta cũng giống như vậy. Khi trưởng thành, ta chấp nhận những niềm tin tiêu cực, những giả định sai lầm, những nỗi sợ đang phá hoại thế giới quanh ta. Chúng trở thành rào cản vô hình. Chúng ta tin rằng rào cản có thực. Khi đối đầu với những rào cản trong công việc, trong đời sống, ta thoái lui. Ta tin rằng giới hạn là có thật. Vì thế ta lùi bước trước tất cả những gì mình đáng trở thành, đáng làm, đáng có.

Ảo tưởng đó dường như quá thật, nhưng vẫn chỉ là ảo tưởng. Xin hãy nhớ điều này. Thế nên tôi mong bạn tự hỏi về rào cản vô hình của mình. Ý thức về chúng. Quan sát chúng. Thách thức chúng. Để khi một trong số đó đối đầu với bạn, thay vì chạy mất, bạn sẽ dùng sức mạnh ý chí và nhiệt huyết của trái tim để lao qua nó. Tiến về miền tươi sáng mà cuộc đời bạn đáng được hưởng. Những gì bạn mãi chịu đựng sẽ cứ dai dẳng hoài, nhưng với những gì bạn biết kết thân và tận dụng, bạn sẽ vượt hơn chúng.', N'Rào Cản Vô Hình', N'rao-can-vo-hinh')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (30, 3, N'Tôi học hỏi nơi các con rất nhiều. Các con tôi không những là người hùng mà còn là người thầy giỏi. Chúng giúp tôi biết sống với hiện tại, giúp tôi thấy cuộc đời là một cuộc phiêu lưu và dạy tôi cách mở lòng ra. Chúng còn cho tôi nhiều bài học về sức mạnh của sự đơn giản. Lúc này mọi điều tôi theo đuổi đều đơn giản – một thông điệp đơn giản về tư tưởng: mọi người đều là lãnh đạo dù họ làm gì hoặc ở chức vụ nào; một ý tưởng và công cụ đơn giản giúp người khác xây dựng sự nghiệp; một cuộc sống đơn giản hơn (vì thực ra, tôi đã là người sống rất đơn giản). Đối với tôi, đơn giản rất mạnh mẽ. Nhà đồng sáng lập Google Sergey Brin đã nhấn mạnh điều này khi nói rằng ở công ty ông “thành công đến từ sự đơn giản”.

Điều đó khiến tôi nhớ đến cậu con trai Colby của mình. Chúng tôi đến thành phố New York cách đây vài tháng, cùng nhau chia sẻ một trải nghiệm mà cả hai đã lên kế hoạch từ lâu: ăn mừng sinh nhật lần thứ 13 (để đánh dấu con tôi trở thành một thiếu niên, chỉ có một lần trong đời). Chúng tôi ăn tại nhà hàng Soho. Đi siêu thị mua đồ chơi. Ghé cửa hàng Lotteria ưa thích của con. Cùng xem bộ phim 3D mới nhất. Một ngày cuối tuần đầy những niềm vui quí giá và những kỷ niệm không thể nào quên. Giữa cha và con.

Tối Chủ nhật trên đường trở về nhà, tôi hỏi: “Thế con thích nhất điều gì trong ngày cuối tuần vừa qua?”. Nó ngồi thinh lặng. Suy nghĩ trầm tư. Rồi nó mỉm cười nói: “Bố còn nhớ cái bánh hot dog mình ăn trên hè phố hôm qua không? Con thích nó nhất đấy.” Đúng là Sức mạnh của sự đơn giản. ', N'Sức Mạnh Của Sự Đơn Giản', N'suc-manh-cua-su-don-gian')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (30, 4, N'<p><strong>Diễn vi&ecirc;n h&agrave;i Steve Martin khuy&ecirc;n c&aacute;c t&agrave;i năng trẻ: &ldquo;H&atilde;y giỏi đến mức người ta kh&ocirc;ng thể ng&oacute; lơ bạn.&rdquo; C&acirc;u n&oacute;i thật &yacute; nghĩa. Cuộc sống ưu đ&atilde;i những ai tận lực. Bạn c&agrave;ng cho đi, cuộc đời c&agrave;ng gửi lại. Nếu bạn thực hiện bất cứ c&ocirc;ng việc n&agrave;o một c&aacute;ch tuyệt vời, lu&ocirc;n lu&ocirc;n t&igrave;m kiếm sự vượt trội, lu&ocirc;n ở vị tr&iacute; xuất sắc, bạn kh&ocirc;ng thể vuột mất chiến thắng cuối c&ugrave;ng. Nh&agrave; văn Jerry Garcia với t&aacute;c phẩm The Greatful Dead từng n&oacute;i: &ldquo;Bạn kh&ocirc;ng chỉ muốn trở th&agrave;nh người giỏi nhất. Bạn c&ograve;n muốn được thi&ecirc;n hạ c&ocirc;ng nhận l&agrave; người duy nhất thực hiện điều đ&oacute;.&rdquo; Đ&ocirc;i khi thất vọng sẽ đến. Điều n&agrave;y xảy ra cho tất cả mọi người. Ta cố gắng hết sức, trung th&agrave;nh với giấc mơ v&agrave; theo đuổi l&yacute; tưởng. Thế m&agrave; chẳng c&oacute; g&igrave; xảy ra. Hoặc dường như l&agrave; vậy. Nhưng mọi lựa chọn đều gi&aacute; trị. Mọi bước đi đều quan trọng. Cuộc sống vẫn diễn ra theo c&aacute;ch của n&oacute;, kh&ocirc;ng phải theo c&aacute;ch của ta. H&atilde;y ki&ecirc;n nhẫn. Tin tưởng. H&atilde;y giống như người thợ cắt đ&aacute;, đều đặn từng nhịp, ng&agrave;y qua ng&agrave;y. Cuối c&ugrave;ng, một nh&aacute;t cắt duy nhất sẽ ph&aacute; vỡ tảng đ&aacute; v&agrave; lộ ra vi&ecirc;n kim cương. Người tr&agrave;n đầy nhiệt huyết v&agrave; tận t&acirc;m với việc m&igrave;nh l&agrave;m kh&ocirc;ng bao giờ bị chối bỏ. Sự thật l&agrave; thế. Steve Martin cho t&ocirc;i một &yacute; tưởng s&acirc;u sắc. &ldquo;H&atilde;y giỏi đến mức người ta kh&ocirc;ng thể ng&oacute; lơ bạn.&rdquo; Chuy&ecirc;n gia quản trị Peter Drucker cũng nhận x&eacute;t gần như vậy khi cho rằng: &ldquo;Hoặc giỏi hoặc ra r&igrave;a.&rdquo; H&atilde;y &aacute;p dụng triết l&yacute; n&agrave;y trong c&ocirc;ng việc. Trong gia đ&igrave;nh. Trong cộng đồng. Trong thế giới của bạn. H&atilde;y can đảm tr&igrave;nh diễn năng khiếu để ch&uacute;ng mang lại những phần thuởng tuyệt vời. Cuối c&ugrave;ng cuộc sống lu&ocirc;n c&ocirc;ng bằng. H&atilde;y tin ở n&oacute;.</strong></p>
', N'Hoặc Giỏi Hoặc Ra Rìa', N'hoac-gioi-hoac-ra-ria')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (30, 5, N'Đây là một ý tưởng mạnh mẽ có thể cách mạng hóa cuộc sống và sự nghiệp nếu bạn bám vào tận gốc rễ của nó: cuộc sống rộng ra hoặc co lại tùy vào ý chí muốn tiến thẳng vào nỗi sợ của mình. Hãy thực hiện những gì bạn sợ, bạn sẽ tỏa sáng. Chạy trốn nỗi sợ khiến bạn cũng lùi xa sự vượt trội. Điều đó nhắc tôi nhớ lời Frank Herbert đã viết trong tác phẩm Xứ cát: “Tôi không được quyền sợ. Sợ hãi là kẻ hủy diệt tâm trí. Sợ hãi là cái chết sẽ dần dẫn ta đến chỗ hoàn toàn tiêu vong. Tôi phải đối mặt nỗi sợ. Tôi sẽ cho phép nó đi qua đời mình. Và khi nó đi qua, tâm trí tôi sẽ quay lại nhìn chặng đường của nó. Nơi nỗi sợ đi qua sẽ không có gì. Chỉ mình tôi còn lại.” 

Khi dám đối mặt với hoàn cảnh nào khiến bạn cảm thấy bất an, sợ hãi, kết quả đạt được sẽ rất đáng khích lệ. Thay vì chạy đến cánh cửa thoát hiểm nào đó, bạn vẫn đứng vững và thực hiện điều bạn biết mình nên làm. Trước hết, bạn sẽ thấy nỗi sợ chẳng qua chỉ là ảo giác. Thứ đến, bạn nhận được phần thưởng cho lòng can đảm, bởi vì bên kia cánh cửa của bất cứ nỗi sợ nào cũng đều có sẵn những món quà lộng lẫy, món quà của sự trưởng thành nhân cách, lòng tự tin, sự khôn ngoan. Tôi vẫn nhiều lần chứng kiến điều này trong cuộc đời.

Tôi tin đó là qui luật của cuộc sống. Vậy hãy hướng đến nỗi sợ. Chỉ cần khởi đầu từng bước nhỏ thôi, nhưng trong các cuộc đua, chậm mà chắc sẽ luôn chiến thắng. Hãy chứng kiến thành công bạn đáng được hưởng đang dần hiện ra. Vào đúng lúc bạn cần nó nhất.', N'Nguyên Tắc Mở Rộng Thành Công', N'nguyen-tac-mo-rong-thanh-cong')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (30, 6, N'Tất nhiên, không cần giày phải bóng thì bạn mới trở thành nhà lãnh đạo tuyệt vời. Và xin nhớ rằng vai trò lãnh đạo không tùy thuộc chức vụ, mà tùy thuộc cách sống – lãnh đạo không cần chức danh, chính xác là vậy. Khả năng lãnh đạo là khả năng giữ mình chuẩn mực trong thế giới công việc, nhận lãnh trách nhiệm (trái ngược với việc trở thành nạn nhân), vượt trội trong tầm ảnh hưởng của mình, xây dựng các quan hệ tốt đẹp và nâng cao người khác qua gương mẫu của mình. Trong bài này tôi chỉ muốn thể hiện một quan điểm đơn giản: Cách bạn thực hiện những việc nhỏ bé sẽ tiết lộ rất nhiều về cách bạn thực hiện những việc lớn lao. Tự đặt mình vào sự tầm thường với những mục tiêu vụn vặt sẽ khiến bạn cũng trở nên tầm thường trong những chuyện lớn lao.

Nếu một sân vườn, một căn nhà ngăn nắp, thì tôi dám cá rằng cuộc sống bạn cũng rất ngăn nắp. Nếu bạn để ý đến những tiểu tiết như ghi nhớ sinh nhật bạn bè hoặc gửi lời nhắn cảm ơn sau các buổi gặp gỡ, tôi chắc rằng bạn cũng để ý đến những tiểu tiết trong các dự án lớn, trong những cơ hội vĩ đại. Và nếu nơi làm việc của bạn rất tinh tươm, nhiều khả năng đó cũng là cách bạn làm việc rất tận tâm với khách hàng để mọi sự hoàn hảo. (Tôi có thể đoán biết về một công ty nào đó qua sự sạch sẽ của nhà vệ sinh. Nhà vệ sinh thơm tho như muốn nói to rằng: “Chúng tôi chăm sóc bạn!”, và sự chăm sóc ấy mang nghĩa là phục vụ tận tình.)

Vậy hãy chú ý đến tiểu tiết. Tập trung vào điều nhỏ nhặt. Tận tầm với điều gọi là: TTT – thích tiểu tiết. Người vĩ đại và các công ty thành công đều như vậy. Bởi vì điều nhỏ nhặt thực ra lại là điều lớn lao.', N'Giữ Đôi Giày Bóng Láng', N'giu-doi-giay-bong-lang')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (30, 7, N'Hãy đọc câu nói thâm thúy của nhà thiết kế nổi tiếng Bruce Mau mà tôi muốn chia sẻ với bạn: “Mỗi cộng tác viên khi bước vào quỹ đạo của chúng tôi đều mang theo một thế giới kỳ lạ và phức tạp hơn bất cứ những gì chúng tôi mong đợi và tưởng tượng. Khi lắng nghe chi tiết, nhu cầu, ước muốn, hoài bão rất mơ hồ của họ, chúng tôi đang hòa nhập thế giới của họ vào thế giới của mình. Và cả hai sẽ không còn giống như xưa.”

Ta hình thành nhân cách qua các cuộc nói chuyện. Ta bị ảnh hưởng bởi ý tưởng mình nghe được và bởi người đang nói chuyện. (Ý tưởng lớn: Mỗi người bạn tiếp xúc đều biết ít nhất một thứ mà bạn không biết. Đừng để họ ra đi mà chưa học được điều gì.) Lắng nghe là kỹ năng chủ đạo để hoàn thiện cá nhân cũng như sự nghiệp. Nhà lãnh đạo lắng nghe. Và nghe rất giỏi. Bruce Mau hoàn toàn đúng: khi tập trung lắng nghe người mình đang giao tiếp, khi cho phép họ chia sẻ điều họ biết, ta có cơ hội nhìn sâu vào trí tuệ ấy để học hỏi, phát triển và tiến hóa lên mức cao nhất và giỏi nhất. Và nếu may mắn nói chuyện với một người khôn ngoan – đúng dịp – thì cuộc trò chuyện duy nhất ấy có thể là thứ sẽ thay đổi cách bạn suy nghĩ, cảm xúc, hành xử mãi mãi. Họ mài giũa bạn và biến đổi bạn với những điều tốt đẹp.', N'Lắng Nghe Kỹ', N'lang-nghe-ky')
INSERT [dbo].[ChapterDetails] ([IDBook], [ChapterID], [Content], [NameChapter], [Alias]) VALUES (1041, 1, N'<p>Demo</p>
', N'Lời mở đầu', N'hanh-trinh-ve-phuong-dong-phan-1')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (10, 2, N'https://drive.google.com/file/d/1LHnvw1kCaNEt12PLHQfHgttNkLJ2ZK8N/view?fbclid=IwAR3IiCo0wWbKV0TxFwA7oCCtWOC1LU8Kdt9oZzqBKLoooBFCVNR3zElJbhA')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (10, 3, N'https://drive.google.com/file/d/1LHnvw1kCaNEt12PLHQfHgttNkLJ2ZK8N/view?fbclid=IwAR3IiCo0wWbKV0TxFwA7oCCtWOC1LU8Kdt9oZzqBKLoooBFCVNR3zElJbhA')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (16, 1, N'https://drive.google.com/open?id=1-gfd48MC2RXjjuGXXuyvJ46UW91ru8wx')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (16, 2, N'https://drive.google.com/open?id=1jlnBCU2363o7HjUOr_7sX0oT_IHpR9Hr')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (16, 3, N'https://drive.google.com/file/d/1LHnvw1kCaNEt12PLHQfHgttNkLJ2ZK8N/view?fbclid=IwAR3IiCo0wWbKV0TxFwA7oCCtWOC1LU8Kdt9oZzqBKLoooBFCVNR3zElJbhA')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (30, 1, N'https://drive.google.com/file/d/1LHnvw1kCaNEt12PLHQfHgttNkLJ2ZK8N/view?fbclid=IwAR3IiCo0wWbKV0TxFwA7oCCtWOC1LU8Kdt9oZzqBKLoooBFCVNR3zElJbhA')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (30, 2, N'https://drive.google.com/file/d/1LHnvw1kCaNEt12PLHQfHgttNkLJ2ZK8N/view?fbclid=IwAR3IiCo0wWbKV0TxFwA7oCCtWOC1LU8Kdt9oZzqBKLoooBFCVNR3zElJbhA	')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (30, 3, N'https://drive.google.com/file/d/1LHnvw1kCaNEt12PLHQfHgttNkLJ2ZK8N/view?fbclid=IwAR3IiCo0wWbKV0TxFwA7oCCtWOC1LU8Kdt9oZzqBKLoooBFCVNR3zElJbhA')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (1038, 3, N'https://drive.google.com/file/d/1LHnvw1kCaNEt12PLHQfHgttNkLJ2ZK8N/view?fbclid=IwAR3IiCo0wWbKV0TxFwA7oCCtWOC1LU8Kdt9oZzqBKLoooBFCVNR3zElJbhA')
INSERT [dbo].[Ebook] ([BookID], [TypeEbookID], [Link]) VALUES (1041, 3, N'https://drive.google.com/file/d/1kJ2OzrnTIj_4l7DwqcIiM8WpIHT1yaNF/view')
SET IDENTITY_INSERT [dbo].[Quotations] ON 

INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (1, N'Khi đàn ông im lặng là họ đang suy nghĩ, khi đàn bà im lặng là họ đang suy diễn 
')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (2, N'Học nấu ăn hay học may vá sẽ có ích hơn tham gia các khoá học làm giàu. ')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (3, N'Tình yêu giết chết thời gian, nhưng thời gian cũng giết chết tình yêu. 
')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (4, N'Chúng ta phải hiểu cơn thịnh nộ là một dấu hiệu của cảm giác thấp kém. 
')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (5, N'Người quân tử cầu ở mình, kẻ tiểu nhân cầu ở người. 
')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (7, N'Tình yêu trông từ xa giống như giọt mật nhưng khi đến gần thì lại là một giọt nước mắt long lanh. ')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (8, N'Tình yêu là mù quáng nhưng hôn nhân sẽ làm bạn sáng mắt ra 
')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (9, N'Kim loại vì cứng mà hay gẫy, nước vì mềm mà được vẹn toàn. 
')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (10, N'Tình yêu giết chết thời gian, nhưng thời gian cũng giết chết tình yêu. ')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (11, N'Ở đâu chan chứa những lời lẽ yêu đương, thì ở đó tình yêu không chân thật.')
INSERT [dbo].[Quotations] ([QuotationID], [NameQuotation]) VALUES (16, N'Tình yêu thật sự đã hiếm, tình bạn thật sự còn hiếm hơn. ')
SET IDENTITY_INSERT [dbo].[Quotations] OFF
SET IDENTITY_INSERT [dbo].[ThongTin] ON 

INSERT [dbo].[ThongTin] ([ID], [MetaTitle], [Name], [Description]) VALUES (1, N'loi-noi-dau', N'Lời Nói Đầu', N'<p>Thư viện online ra đời với mục đích chia sẻ ebook đến với mọi người , hoàn toàn miễn phí , đa số mọi bài viết đều có định dạng hỗ trợ các bạn đọc sách trên smartphone&nbsp; hoặc máy đọc sách (mobi ,epub ,prc) và hiện bọn mình đang tiếp tục code thêm chức năng cho web, để sắp tới mọi người có thể đăng kí thành viên và cùng chia sẻ những ebook hay&nbsp; .</p>
<p>Chúc các bạn vui vẻ !</p>')
INSERT [dbo].[ThongTin] ([ID], [MetaTitle], [Name], [Description]) VALUES (2, N'ban-quyen', N'Bản Quyền', N'<p style="text-align:center"><img alt="Books 1 icon" src="http://icons.iconarchive.com/icons/itzikgur/my-seven/256/Books-1-icon.png" style="height:256px; margin-top:3px; width:256px" title="Books 1 icon"></p>
<p>Toàn bộ ebook có trên website đều có bản quyền thuộc về tác giả,<strong> Thư Viện Online khuyến khích các bạn nếu có khả năng hãy mua sách để ủng hộ tác giả </strong>.</p>
<p>Ebook được sưu tập và tổng hợp từ các nguồn trên internet ( tve , e-thuvien , tinhte&nbsp; .... ) và các dự án ebook của cộng đồng. Chúng tôi chỉ chia sẻ lại cho cộng đồng ,và không bán những ebook này, toàn bộ ebook có trên web đều được chia sẻ miễn phí.</p>
<p>Mọi cá nhân hay tổ chức nếu muốn in ấn hay phát hành sách từ Thư Viện Online phải được sự cho phép của tác giả, chúng tôi không khuyến khích việc thương mại hóa các ebook này.</p>')
INSERT [dbo].[ThongTin] ([ID], [MetaTitle], [Name], [Description]) VALUES (3, N'lien-he', N'Liên Hệ', N'<p><u><strong>Chú ý:</strong></u></p>
<p>-  <strong>Không có dự án làm ebook nào hết</strong>! tất cả đều được lấy từ dự án của nhóm và người khác, nên <strong>không</strong> tuyển người làm ebook.</p>
<p>- Thư Viện Online không thu phí hay gạ gẫm đóng góp từ email hay PM riêng cho ai hết! <strong>Cận thận lừa đảo.</strong></p>
<p>&nbsp;</p>
<p><strong>Các nội dung email sau đây sẻ <span style="color:#0000FF">được hồi đáp</span></strong></p>
<p>- Báo cáo nội dung xuyên tạc chống phá nhà nước</p>
<p>- Góp ý, báo lỗi website hoặc ebook&nbsp;</p>
<p>- Đóng góp ebook</p>
<p>&nbsp;</p>
<p><strong>Các nội dung email sau đây sẻ <span style="color:#FF0000">KHÔNG được hồi đáp</span></strong></p>
<p>- Hợp tác quảng cáo<strong>&nbsp;</strong>CPM, CPC, CPA , Pop-up, Quảng cáo ăn theo sản phẩm.</p>
<p>- Hỏi mua sách</p>
<p>- Hỏi đáp kiến thức</p>
<p>- Xin ebook, tài liệu</p>')
INSERT [dbo].[ThongTin] ([ID], [MetaTitle], [Name], [Description]) VALUES (4, N'bao-cao-vi-pham', N'Báo Cáo Vi Phạm', N'<p>Hiện tại với số lượng cộng tác viên viết bài và chia sẻ Ebook khá nhỏ, nên chúng tôi không thể kiểm soát được nội dung đưa lên, chính vì thế nếu các bạn thấy các vi phạm bao gồm :</p>
<ul> <li><strong>Phản động, xuyên tạc đường lối, chủ trương của Đảng và Nhà nước.</strong></li> <li>Tài liệu khiêu dâm, đồi truỵ .</li> <li>Thông tin cá nhân và bí mật.</li> <li>Hoạt động bất hợp pháp.</li> </ul>
<p>- Các bạn vui lòng gửi&nbsp;Email<span style="font-family:helvetica neue,helvetica,arial,sans-serif; font-size:14px">&nbsp;về<strong> nghianguyen1998.com@gmail.com</strong>&nbsp;, kèm theo nội dung vi phạm và văn bản yêu cầu nếu có .</span></p>')
SET IDENTITY_INSERT [dbo].[ThongTin] OFF
SET IDENTITY_INSERT [dbo].[TypeEbook] ON 

INSERT [dbo].[TypeEbook] ([TypeID], [Name], [Status]) VALUES (1, N'EPUB', 1)
INSERT [dbo].[TypeEbook] ([TypeID], [Name], [Status]) VALUES (2, N'MOBI', 1)
INSERT [dbo].[TypeEbook] ([TypeID], [Name], [Status]) VALUES (3, N'PDF', 1)
SET IDENTITY_INSERT [dbo].[TypeEbook] OFF
SET IDENTITY_INSERT [dbo].[TypeUsers] ON 

INSERT [dbo].[TypeUsers] ([TypeID], [TypeName]) VALUES (1, N'Admin')
SET IDENTITY_INSERT [dbo].[TypeUsers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [Status], [Type]) VALUES (1, N'ngoctuan', N'123', N'Đặng Ngọc Tuấn', N'Bình Dương', N'ngoctuan@gmail.com', N'09876217162', CAST(N'2019-06-09T16:31:03.507' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [Status], [Type]) VALUES (3, N'admin', N'123', N'Nguyễn Trung Nghĩa', N'Phú Yên', N'nghia.trungnguyen1980@gmail.com', N'0981019704', CAST(N'2019-06-07T18:03:29.567' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [Status], [Type]) VALUES (4, N'huudanh', N'123', N'Lê Hữu Danh', N'Lâm Đồng', N'huudanh@gmail.com', N'019876542174', CAST(N'2019-06-09T16:38:41.397' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Authors] ADD  CONSTRAINT [DF_Authors_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BookCategories] ADD  CONSTRAINT [DF_BookCategories_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BookCategories] ADD  CONSTRAINT [DF_BookCategories_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [DF_Books_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [DF_Books_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[AudioBook]  WITH CHECK ADD  CONSTRAINT [FK_AudioBook_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[AudioBook] CHECK CONSTRAINT [FK_AudioBook_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_BookCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[BookCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_BookCategories]
GO
ALTER TABLE [dbo].[ChapterDetails]  WITH CHECK ADD  CONSTRAINT [FK_ChapterDetails_Books] FOREIGN KEY([IDBook])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[ChapterDetails] CHECK CONSTRAINT [FK_ChapterDetails_Books]
GO
ALTER TABLE [dbo].[Ebook]  WITH CHECK ADD  CONSTRAINT [FK_Ebook_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[Ebook] CHECK CONSTRAINT [FK_Ebook_Books]
GO
ALTER TABLE [dbo].[Ebook]  WITH CHECK ADD  CONSTRAINT [FK_Ebook_TypeEbook] FOREIGN KEY([TypeEbookID])
REFERENCES [dbo].[TypeEbook] ([TypeID])
GO
ALTER TABLE [dbo].[Ebook] CHECK CONSTRAINT [FK_Ebook_TypeEbook]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_TypeUsers] FOREIGN KEY([Type])
REFERENCES [dbo].[TypeUsers] ([TypeID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_TypeUsers]
GO
USE [master]
GO
ALTER DATABASE [QuanLyThuVien] SET  READ_WRITE 
GO
