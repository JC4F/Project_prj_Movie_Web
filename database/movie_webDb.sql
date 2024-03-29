USE [master]
GO
IF DB_ID('Movie_Web') IS NOT NULL 
BEGIN
	ALTER DATABASE [Movie_Web] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [Movie_Web];
END
CREATE DATABASE [Movie_Web]
GO
ALTER DATABASE [Movie_Web] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movie_Web].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movie_Web] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Movie_Web] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Movie_Web] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Movie_Web] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Movie_Web] SET ARITHABORT OFF 
GO
ALTER DATABASE [Movie_Web] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Movie_Web] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Movie_Web] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Movie_Web] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Movie_Web] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Movie_Web] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Movie_Web] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Movie_Web] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Movie_Web] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Movie_Web] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Movie_Web] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Movie_Web] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Movie_Web] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Movie_Web] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Movie_Web] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Movie_Web] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Movie_Web] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Movie_Web] SET RECOVERY FULL 
GO
ALTER DATABASE [Movie_Web] SET  MULTI_USER 
GO
ALTER DATABASE [Movie_Web] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Movie_Web] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Movie_Web] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Movie_Web] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Movie_Web] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Movie_Web] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Movie_Web', N'ON'
GO
ALTER DATABASE [Movie_Web] SET QUERY_STORE = OFF
GO
USE [Movie_Web]
GO
/****** Object:  Table [dbo].[actor]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](30) NULL,
	[birth] [date] NULL,
	[nationality] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[_user_info_id] [int] NULL,
	[_movie_id] [int] NULL,
	[cmt_content] [nvarchar](30) NULL,
	[time_cmt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[director]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[director](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](30) NULL,
	[birth] [date] NULL,
	[nationality] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[genre_name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
	[_director_id] [int] NULL,
	[realse_year] [date] NULL,
	[movie_length] [int] NULL,
	[country] [nvarchar](50) NULL,
	[rating_avarage] [int] NULL,
	[price] [int] NULL,
	[src] [varchar](20) NULL,
	[number_view] [int] NULL,
	[description] [varchar](600) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_actor]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_actor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[_actor_id] [int] NULL,
	[_movie_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_genre]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_genre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[_genre_id] [int] NULL,
	[_movie_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_userInfo]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_userInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[_user_info_id] [int] NULL,
	[_movie_id] [int] NULL,
	[boughtAt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_acc]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_acc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](20) NULL,
	[password] [nvarchar](20) NULL,
	[role] [int] NULL,
	[state] [int] NULL,
	[createdAt] [date] NULL,
	[receiptCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_info]    Script Date: 10/20/2022 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[_user_id] [int] NULL,
	[avatar] [nvarchar](40) NULL,
	[fullname] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[phone] [nvarchar](20) NULL,
	[gender] [bit] NULL,
	[birth] [date] NULL,
	[acc_money] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[actor] ON 

INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (24, N'Se7en', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (25, N'Seo Do Young', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (26, N'Seo In Guk', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (27, N'Seo Ji-hye', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (28, N'Seo Min Jung', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (29, N'Seo Yeong', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (30, N'Shim Eun Ha', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (31, N'Shim Hye-jin', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (32, N'Shin Sae Kyung', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (33, N'Shin Ae Ra', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (34, N'Shin Gu', CAST(N'2020-06-04' AS Date), N'Korea')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (35, N'Lan Ngoc', CAST(N'2022-07-13' AS Date), N'Vietnam')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (36, N'Lan Ngoc', CAST(N'2022-07-14' AS Date), N'Vietnam')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (37, N'quan23', CAST(N'2022-06-28' AS Date), N'Vietnam')
INSERT [dbo].[actor] ([id], [fullname], [birth], [nationality]) VALUES (38, N'quan2333', CAST(N'2022-06-28' AS Date), N'Vietnam')
SET IDENTITY_INSERT [dbo].[actor] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([id], [_user_info_id], [_movie_id], [cmt_content], [time_cmt]) VALUES (15, 11, 41, N'Hay lam ne!', CAST(N'2022-07-11' AS Date))
INSERT [dbo].[comment] ([id], [_user_info_id], [_movie_id], [cmt_content], [time_cmt]) VALUES (16, 11, 41, N'Qua tuyet voi', CAST(N'2022-07-11' AS Date))
INSERT [dbo].[comment] ([id], [_user_info_id], [_movie_id], [cmt_content], [time_cmt]) VALUES (17, 11, 41, N'Dinh v luon', CAST(N'2022-07-11' AS Date))
INSERT [dbo].[comment] ([id], [_user_info_id], [_movie_id], [cmt_content], [time_cmt]) VALUES (18, 12, 42, N'hay zl', CAST(N'2022-07-11' AS Date))
INSERT [dbo].[comment] ([id], [_user_info_id], [_movie_id], [cmt_content], [time_cmt]) VALUES (19, 12, 41, N'dinh', CAST(N'2022-07-11' AS Date))
INSERT [dbo].[comment] ([id], [_user_info_id], [_movie_id], [cmt_content], [time_cmt]) VALUES (20, 11, 42, N'hay qua!', CAST(N'2022-07-12' AS Date))
INSERT [dbo].[comment] ([id], [_user_info_id], [_movie_id], [cmt_content], [time_cmt]) VALUES (21, 11, 42, N'asdad', CAST(N'2022-09-09' AS Date))
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[director] ON 

INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (26, N'Yumenoshima', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (27, N'Odaiba', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (28, N'Jonanjima', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (29, N'Heiwajima', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (30, N'Showajima', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (31, N'Keihinjima', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (32, N'Kashiko', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (33, N'Kozukumi', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (34, N'Mikimoto', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (35, N'Tairajima', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (36, N'Kodakarajima', CAST(N'2010-06-04' AS Date), N'Japan')
INSERT [dbo].[director] ([id], [fullname], [birth], [nationality]) VALUES (37, N'quan2', CAST(N'2022-07-21' AS Date), N'Vietnam')
SET IDENTITY_INSERT [dbo].[director] OFF
GO
SET IDENTITY_INSERT [dbo].[genre] ON 

INSERT [dbo].[genre] ([id], [genre_name]) VALUES (18, N'Action')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (19, N'Adventure')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (20, N'Anime')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (21, N'Comedy')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (22, N'Drama')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (23, N'Honor')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (24, N'Romantic')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (25, N'Sport')
SET IDENTITY_INSERT [dbo].[genre] OFF
GO
SET IDENTITY_INSERT [dbo].[movie] ON 

INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (41, N'Dillon Francis & ILLENIUM ', 37, CAST(N'2021-06-04' AS Date), 180, N'VietNam', 4, 200, N'A57aolLKVGc', 50, N'I''ve been waiting for this one since I heard the previews and have had it on repeat since I got the audio. I''m glad to have Illenium back with Dillon and Evan Giia. Hope you enjoy this one as much as I do!')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (42, N'MAKE IT HAPPEN', 27, CAST(N'2021-06-04' AS Date), 185, N'VietNam', 4, 290, N'A57aolLKVGc', 220, N'Act 1976, allowance is made for "fair use" for purposes Such as Criticism, comment, news reporting, teaching, scholarship, and research. Fair use is a use permitted by copyright Statue that might otherwise be infringing.')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (43, N'Can''t Forget (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 10, N'Lao', 4, 190, N'3DnFbc2saDE', 50, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (46, N'NATIIVE - Memories (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'2Xu_V2MyswE', 40, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (47, N'Summer Vibes #11', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'3YXiNjBgdQg', 43, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (48, N'Summer Vibes #31', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'T9fYNPI29Zc', 31, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (49, N'Acoustic Love Songs 2022', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'fqL7Snc2gyc', 55, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (50, N'Music for a better mood', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'RT2H73mLFGk', 150, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (51, N'Best Alan Walker', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'FlbxCS0dMFc', 66, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (52, N'NATIIVE - Memories (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'2Xu_V2MyswE', 123, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (54, N'Miles Away - Bring Me Back ', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'yk-aSrYBpaM', 54, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (55, N'The Chainsmokers - Don''t Say', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'mFOYeMdZKrU', 43, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (56, N'Catchphrase - Runaway Kids', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'bwkG9K00lsY', 65, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (57, N'Dabin - Smoke Signals', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'qORm95OC_1o', 2, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (59, N'Illenium - Fragments (Lyrics) ', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'Lanm1ioMyIk', 40, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (60, N'Nurko - Hallelujah (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'prpfAc0whBY', 34, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (62, N'Love Is Gone', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'xseJ57EL3E0', 88, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (63, N'Let Her Go, Infinity', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'uavgK8oqCmI', 77, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (64, N'Unstoppable ', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'X-sIsWrqAaU', 99, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (65, N'Said The Sky - All I Got', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'YcvKtp2YY9M', 98, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (66, N'Medii - Kiss Goodbye', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'65T1YLRd1CU', 56, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (68, N'if found - No Lie', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'N2rwYf-qWJo', 76, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (69, N'Miles Away & Bebi - Way Down', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'Vmpk9Myz1Oo', 87, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (70, N'Medii & Exede - Red Light', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'0r9NySh-0To', 45, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (71, N'Aaron Shirk - Drown', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'jOSfa5AGX7w', 67, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (72, N'Beren Olivia - So Emotional', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'RYT3mAaUBb0', 45, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (73, N'GhostDragon - where we were', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'38750lf-u5w', 76, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (74, N'Illenium - Fractures', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'zhs6t9gB4_4', 98, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (75, N'dreamr. & Ruff - Summer ''16', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'4VH208uCdqk', 34, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (76, N'Nurko - Disappearing Now', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'5bWNJvg7h_Q', 56, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (77, N'Tate McRae - chaotic', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'98YQUe5V2dY', 76, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (78, N'GhostDragon - honest', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'C_SBSscFVDY', 98, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (79, N'BrillLion - Healing', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'omT5rKmU5_k', 32, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (80, N'Illenium - Beautiful Creatures', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'tjNvR4D8PWc', 54, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (81, N'Dabin - Forever (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'dRAIy0DQlrs', 65, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (82, N'Dabin - Remember (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'jDGOU24Yf4Y', 87, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (83, N'Phoebe Ryan - Mine', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'wZWF3Q0yMqc', 98, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (85, N'MitiS - Homesick', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'ADo3ACY4wIU', 0, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (86, N'Aaron Shirk - Here to Stay', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'WtoNMbHye5I', 23, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (87, N'Blanke - Stuck On You', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'HAPjl3zgUgc', 67, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (88, N'Breaking Point (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'4JpStkFGpjM', 34, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (91, N'Blanke & RUNN - Lights Out', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'o5pQ6sX2M3c', 65, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (92, N'Viral English Love Songs', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'L4p-g3AprzU', 99, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (93, N'Nobody Compares To You', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'BDiMJWIvtvM', 54, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (94, N'Hoang - Not Over You', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'6f0qaMH7iQw', 100, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (95, N'Still In Love (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'2Xu_V2MyswE', 23, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (96, N'NATIIVE - Memories (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'c41ApEjBvms', 76, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (97, N'Vicetone - Barcelona Nights', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'EXvkdH5j8XA', 45, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (98, N'Mokita - Crash (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'0LE2Y-n0Y3I', 76, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (99, N'Work In Progress (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'mtstG4ZQIg0', 87, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (100, N'This One’s On Me (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'e7MMK7PCvwU', 98, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (101, N'First Place (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'j8pg_774m4s', 45, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (102, N'Bittersweet Melody (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'NqpGHYQtUa4', 23, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (103, N'Walk Me Home (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'SGuJdQBmLkw', 121, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (104, N'Love Again (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'OVzwacdEm40', 45, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (105, N'We Will Meet Again (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'SGuJdQBmLkw', 44, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (106, N'Love Again (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'yiKgGDDEF8g', 65, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (107, N'karma (Official Lyric Video)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'fVeD9vWCpZ8', 4, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (108, N'Sabai - Million Days', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'DfLqy83UHk8', 55, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (109, N'Illenium - Free Fall', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'8dKjCImqeRQ', 76, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (111, N'ARNHEMIA - By My Side', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'_EXzFskm8uk', 65, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (112, N'William Black - Shadow', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'lAXD0V7_neQ', 76, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (113, N'Sabai - Love For You', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'aZEKXuRezTU', 74, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (114, N'I Blame The World (Lyrics)', 28, CAST(N'2020-06-04' AS Date), 100, N'UK', 4, 300, N'dV7IFEE5SFo', 85, N'Many good memories but some I forgot unless it could remind me of something through some events. How about you dear?')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (117, N'English Chill Music Mix123', 31, CAST(N'2022-07-22' AS Date), 120, N'Vietnam', 5, 140, N'BETRuf-LoW0', 97, N'Thank you for sharing this wonderful video. It is helping me with my anxiety and depression. That''s why I created a YT Channel to make myself busy and as an escape from what I''ve been dealing with right now. I am thankful for your channel')
INSERT [dbo].[movie] ([id], [name], [_director_id], [realse_year], [movie_length], [country], [rating_avarage], [price], [src], [number_view], [description]) VALUES (119, N'YASUO MONTAGE 2022', 28, CAST(N'2022-07-05' AS Date), 20, N'Vietnam', 5, 234, N'RAcK-bbQTJs', 0, N'If you want to never miss best League of legends plays, then subscribe! And also don''t forget to send us your lol montages, best plays to get featured!')
SET IDENTITY_INSERT [dbo].[movie] OFF
GO
SET IDENTITY_INSERT [dbo].[movie_actor] ON 

INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (20, 27, 42)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (21, 28, 42)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (22, 29, 42)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (23, 30, 43)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (24, 31, 43)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (25, 32, 43)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (32, 28, 46)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (33, 29, 46)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (34, 30, 46)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (35, 31, 47)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (36, 32, 47)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (37, 33, 47)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (38, 34, 48)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (39, 24, 48)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (40, 25, 48)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (41, 26, 49)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (42, 27, 49)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (43, 28, 49)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (44, 29, 50)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (45, 30, 50)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (46, 31, 50)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (47, 32, 51)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (48, 33, 51)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (49, 34, 51)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (50, 24, 52)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (51, 25, 52)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (52, 26, 52)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (56, 30, 54)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (57, 31, 54)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (58, 32, 54)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (59, 33, 55)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (60, 34, 55)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (61, 24, 55)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (62, 25, 56)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (63, 26, 56)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (64, 27, 56)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (65, 28, 57)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (66, 29, 57)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (67, 30, 57)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (71, 34, 59)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (72, 24, 59)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (73, 25, 59)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (74, 26, 60)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (75, 27, 60)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (76, 28, 60)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (80, 32, 62)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (81, 33, 62)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (82, 34, 62)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (83, 24, 63)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (84, 25, 63)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (85, 26, 63)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (86, 27, 64)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (87, 28, 64)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (88, 29, 64)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (89, 30, 65)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (90, 31, 65)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (91, 32, 65)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (92, 33, 66)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (93, 34, 66)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (94, 24, 66)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (98, 28, 68)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (99, 29, 68)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (100, 30, 68)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (101, 31, 69)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (102, 32, 69)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (103, 33, 69)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (104, 34, 70)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (105, 24, 70)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (106, 25, 70)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (107, 26, 71)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (108, 27, 71)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (109, 28, 71)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (110, 29, 72)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (111, 30, 72)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (112, 31, 72)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (113, 32, 73)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (114, 33, 73)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (115, 34, 73)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (116, 24, 74)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (117, 25, 74)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (118, 26, 74)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (119, 27, 75)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (120, 28, 75)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (121, 29, 75)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (122, 30, 76)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (123, 31, 76)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (124, 32, 76)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (125, 33, 77)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (126, 34, 77)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (127, 24, 77)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (128, 25, 78)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (129, 26, 78)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (130, 27, 78)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (131, 28, 79)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (132, 29, 79)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (133, 30, 79)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (134, 31, 80)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (135, 32, 80)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (136, 33, 80)
GO
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (137, 34, 81)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (138, 24, 81)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (139, 25, 81)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (140, 26, 82)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (141, 27, 82)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (142, 28, 82)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (143, 29, 83)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (144, 30, 83)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (145, 31, 83)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (149, 24, 85)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (150, 25, 85)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (151, 26, 85)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (152, 27, 86)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (153, 28, 86)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (154, 29, 86)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (155, 30, 87)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (156, 31, 87)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (157, 32, 87)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (158, 33, 88)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (159, 34, 88)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (160, 24, 88)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (167, 31, 91)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (168, 32, 91)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (169, 33, 91)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (170, 34, 92)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (171, 24, 92)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (172, 25, 92)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (173, 26, 93)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (174, 27, 93)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (175, 28, 93)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (176, 29, 94)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (177, 30, 94)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (178, 31, 94)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (179, 32, 95)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (180, 33, 95)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (181, 34, 95)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (182, 24, 96)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (183, 25, 96)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (184, 26, 96)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (185, 27, 97)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (186, 28, 97)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (187, 29, 97)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (188, 30, 98)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (189, 31, 98)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (190, 32, 98)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (191, 33, 99)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (192, 34, 99)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (193, 24, 99)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (194, 25, 100)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (195, 26, 100)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (196, 27, 100)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (197, 28, 101)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (198, 29, 101)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (199, 30, 101)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (200, 31, 102)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (201, 32, 102)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (202, 33, 102)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (203, 34, 103)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (204, 24, 103)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (205, 25, 103)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (206, 26, 104)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (207, 27, 104)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (208, 28, 104)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (209, 29, 105)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (210, 30, 105)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (211, 31, 105)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (212, 32, 106)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (213, 33, 106)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (214, 34, 106)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (215, 24, 107)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (216, 25, 107)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (217, 26, 107)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (218, 27, 108)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (219, 28, 108)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (220, 29, 108)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (221, 30, 109)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (222, 31, 109)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (223, 32, 109)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (227, 25, 111)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (228, 26, 111)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (229, 27, 111)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (230, 28, 112)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (231, 29, 112)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (232, 30, 112)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (233, 31, 113)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (234, 32, 113)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (235, 33, 113)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (236, 34, 114)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (237, 24, 114)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (238, 25, 114)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (242, 32, 117)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (243, 33, 117)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (244, 36, 117)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (248, 24, 41)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (249, 25, 41)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (250, 26, 41)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (251, 37, 41)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (252, 38, 41)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (253, 33, 41)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (255, 32, 119)
GO
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (256, 30, 119)
INSERT [dbo].[movie_actor] ([id], [_actor_id], [_movie_id]) VALUES (257, 33, 119)
SET IDENTITY_INSERT [dbo].[movie_actor] OFF
GO
SET IDENTITY_INSERT [dbo].[movie_genre] ON 

INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (22, 20, 42)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (23, 21, 42)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (24, 22, 43)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (25, 23, 43)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (30, 20, 46)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (31, 21, 46)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (32, 22, 47)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (33, 23, 47)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (34, 24, 48)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (35, 25, 48)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (36, 18, 49)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (37, 19, 49)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (38, 20, 50)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (39, 21, 50)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (40, 22, 51)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (41, 23, 51)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (42, 24, 52)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (43, 25, 52)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (46, 20, 54)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (47, 21, 54)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (48, 22, 55)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (49, 23, 55)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (50, 24, 56)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (51, 25, 56)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (52, 18, 57)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (53, 19, 57)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (56, 22, 59)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (57, 23, 59)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (58, 24, 60)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (59, 25, 60)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (62, 20, 62)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (63, 21, 62)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (64, 22, 63)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (65, 23, 63)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (66, 24, 64)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (67, 25, 64)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (68, 18, 65)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (69, 19, 65)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (70, 20, 66)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (71, 21, 66)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (74, 24, 68)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (75, 25, 68)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (76, 18, 69)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (77, 19, 69)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (78, 20, 70)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (79, 21, 70)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (80, 22, 71)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (81, 23, 71)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (82, 24, 72)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (83, 25, 72)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (84, 18, 73)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (85, 19, 73)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (86, 20, 74)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (87, 21, 74)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (88, 22, 75)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (89, 23, 75)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (90, 24, 76)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (91, 25, 76)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (92, 18, 77)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (93, 19, 77)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (94, 20, 78)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (95, 21, 78)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (96, 22, 79)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (97, 23, 79)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (98, 24, 80)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (99, 25, 80)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (100, 18, 81)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (101, 19, 81)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (102, 20, 82)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (103, 21, 82)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (104, 22, 83)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (105, 23, 83)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (108, 18, 85)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (109, 19, 85)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (110, 20, 86)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (111, 21, 86)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (112, 22, 87)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (113, 23, 87)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (114, 24, 88)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (115, 25, 88)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (120, 22, 91)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (121, 23, 91)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (122, 24, 92)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (123, 25, 92)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (124, 18, 93)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (125, 19, 93)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (126, 20, 94)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (127, 21, 94)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (128, 22, 95)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (129, 23, 95)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (130, 24, 96)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (131, 25, 96)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (132, 18, 97)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (133, 19, 97)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (134, 20, 98)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (135, 21, 98)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (136, 22, 99)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (137, 23, 99)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (138, 24, 100)
GO
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (139, 25, 100)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (140, 18, 101)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (141, 19, 101)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (142, 20, 102)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (143, 21, 102)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (144, 22, 103)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (145, 23, 103)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (146, 24, 104)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (147, 25, 104)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (148, 18, 105)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (149, 19, 105)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (150, 20, 106)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (151, 21, 106)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (152, 22, 107)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (153, 23, 107)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (154, 24, 108)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (155, 25, 108)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (156, 18, 109)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (157, 19, 109)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (160, 22, 111)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (161, 23, 111)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (162, 24, 112)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (163, 25, 112)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (164, 18, 113)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (165, 19, 113)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (166, 20, 114)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (167, 21, 114)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (170, 23, 117)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (171, 18, 117)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (172, 19, 117)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (175, 18, 41)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (176, 19, 41)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (177, 23, 41)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (179, 19, 119)
INSERT [dbo].[movie_genre] ([id], [_genre_id], [_movie_id]) VALUES (180, 20, 119)
SET IDENTITY_INSERT [dbo].[movie_genre] OFF
GO
SET IDENTITY_INSERT [dbo].[movie_userInfo] ON 

INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (54, 11, 41, CAST(N'2022-06-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (55, 12, 42, CAST(N'2022-01-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (56, 13, 43, CAST(N'2022-02-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (59, 16, 46, CAST(N'2022-03-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (60, 14, 47, CAST(N'2022-04-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (61, 15, 48, CAST(N'2022-05-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (62, 11, 43, CAST(N'2022-06-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (63, 12, 43, CAST(N'2022-07-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (64, 12, 48, CAST(N'2022-08-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (65, 12, 47, CAST(N'2022-09-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (66, 12, 41, CAST(N'2022-10-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (67, 18, 93, CAST(N'2022-11-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (68, 18, 100, CAST(N'2022-12-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (69, 18, 46, CAST(N'2022-06-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (70, 18, 42, CAST(N'2022-03-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (71, 18, 41, CAST(N'2022-05-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (72, 18, 47, CAST(N'2022-07-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (73, 18, 48, CAST(N'2022-08-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (74, 18, 49, CAST(N'2022-02-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (75, 18, 50, CAST(N'2022-09-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (76, 18, 43, CAST(N'2022-04-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (77, 11, 46, CAST(N'2022-01-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (78, 11, 50, CAST(N'2022-04-04' AS Date))
INSERT [dbo].[movie_userInfo] ([id], [_user_info_id], [_movie_id], [boughtAt]) VALUES (79, 11, 52, CAST(N'2022-06-04' AS Date))
SET IDENTITY_INSERT [dbo].[movie_userInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[user_acc] ON 

INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (19, N'quan', N'quan123', 1, 0, CAST(N'2022-06-04' AS Date), N'0')
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (20, N'khoa', N'khoa123', 0, 0, CAST(N'2022-01-31' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (21, N'hoang123', N'aaaa1111', 0, 0, CAST(N'2022-02-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (22, N'hoang312', N'bbb123445', 0, 0, CAST(N'2022-03-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (23, N'truong', N'truong2222', 0, 0, CAST(N'2022-04-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (24, N'long', N'long2121', 0, 1, CAST(N'2022-05-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (25, N'khoaancut', N'123456', 0, 0, CAST(N'2022-07-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (26, N'khoakhang1406', N'khoakhang', 0, 0, CAST(N'2022-08-04' AS Date), N'0')
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (27, N'yasuo111', N'123456', 0, 0, CAST(N'2022-09-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (28, N'quanlmhe', N'123456', 0, 0, CAST(N'2022-10-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (29, N'quan123', N'123456', 1, 0, CAST(N'2022-06-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (30, N'khoa11111', N'khoa123', 0, 0, CAST(N'2022-03-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (31, N'hoang123333', N'aaaa1111', 0, 0, CAST(N'2022-06-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (32, N'hoang312sadd', N'bbb123445', 0, 0, CAST(N'2022-07-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (33, N'truongdd', N'truong2222', 0, 0, CAST(N'2022-02-04' AS Date), NULL)
INSERT [dbo].[user_acc] ([id], [username], [password], [role], [state], [createdAt], [receiptCode]) VALUES (34, N'long323', N'long2121', 0, 1, CAST(N'2022-06-04' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[user_acc] OFF
GO
SET IDENTITY_INSERT [dbo].[user_info] ON 

INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (11, 19, N'User_Img/index-10.jpg', N'Le Minh Quan1', N'quan@gmail.com1', N'08599010021', 0, CAST(N'2020-04-03' AS Date), CAST(98910.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (12, 20, N'avatar_default.jpg', N'Nguyen Dang Khoa', N'khoa@gmail.com', N'0123456789', 1, CAST(N'2022-06-04' AS Date), CAST(10.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (13, 21, N'avatar_default.jpg', N'Hoang beo', N'hoangbeo@gmail.com', N'9876543210', 1, CAST(N'2021-06-07' AS Date), CAST(1000.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (14, 22, N'avatar_default.jpg', N'Hoang Gay', N'hoanggay@gmail.com', N'9876543210', 1, CAST(N'2021-06-07' AS Date), CAST(1000.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (15, 23, N'avatar_default.jpg', N'truong gay123', N'truonggay@gmail.com', N'9876543210', 0, CAST(N'2021-06-07' AS Date), CAST(1000.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (16, 24, N'avatar_default.jpg', N'Cho Long123', N'longadasncut@gmail.com', N'9876543210', 0, CAST(N'2021-06-07' AS Date), CAST(1000.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (17, 25, N'avatar_default.jpg', NULL, NULL, NULL, 0, NULL, CAST(500.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (18, 26, N'User_Img/2022-06-10.png', N'Nguyen Khoa', N'nguyenkhoa14022002@gmail.com', N'0366125360', 1, CAST(N'2002-12-06' AS Date), CAST(1620.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (19, 27, N'User_Img/index-17.jpg', N'Le Minh Quan222', N'quan@gmail.com', N'0123456789', 1, CAST(N'2022-07-19' AS Date), CAST(500.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (20, 28, N'User_Img/index-15.jpg', N'Le Minh Quan', N'lequan12122002@gmail.com', N'0859901002', 1, CAST(N'2022-06-29' AS Date), CAST(500.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (21, 29, N'avatar_default.jpg', N'Le Minh Quan', N'quan@gmail.com', N'0859901002', 1, CAST(N'2020-03-04' AS Date), CAST(100000.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (22, 30, N'avatar_default.jpg', N'Nguyen Dang Khoa', N'khoa@gmail.com', N'0123456789', 1, CAST(N'2022-06-04' AS Date), CAST(1000.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (23, 31, N'avatar_default.jpg', N'Hoang beo', N'hoangbeo@gmail.com', N'9876543210', 1, CAST(N'2021-06-07' AS Date), CAST(1000.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (24, 32, N'avatar_default.jpg', N'Hoang Gay', N'hoanggay@gmail.com', N'9876543210', 1, CAST(N'2021-06-07' AS Date), CAST(1000.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (25, 33, N'avatar_default.jpg', N'truong gay123', N'truonggay@gmail.com', N'9876543210', 0, CAST(N'2021-06-07' AS Date), CAST(1000.00 AS Decimal(12, 2)))
INSERT [dbo].[user_info] ([id], [_user_id], [avatar], [fullname], [email], [phone], [gender], [birth], [acc_money]) VALUES (26, 34, N'avatar_default.jpg', N'Cho Long123', N'longadasncut@gmail.com', N'9876543210', 0, CAST(N'2021-06-07' AS Date), CAST(1000.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[user_info] OFF
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([_movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([_user_info_id])
REFERENCES [dbo].[user_info] ([id])
GO
ALTER TABLE [dbo].[movie]  WITH CHECK ADD FOREIGN KEY([_director_id])
REFERENCES [dbo].[director] ([id])
GO
ALTER TABLE [dbo].[movie_actor]  WITH CHECK ADD FOREIGN KEY([_actor_id])
REFERENCES [dbo].[actor] ([id])
GO
ALTER TABLE [dbo].[movie_actor]  WITH CHECK ADD FOREIGN KEY([_movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[movie_genre]  WITH CHECK ADD FOREIGN KEY([_genre_id])
REFERENCES [dbo].[genre] ([id])
GO
ALTER TABLE [dbo].[movie_genre]  WITH CHECK ADD FOREIGN KEY([_movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[movie_userInfo]  WITH CHECK ADD FOREIGN KEY([_movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[movie_userInfo]  WITH CHECK ADD FOREIGN KEY([_user_info_id])
REFERENCES [dbo].[user_info] ([id])
GO
ALTER TABLE [dbo].[user_info]  WITH CHECK ADD FOREIGN KEY([_user_id])
REFERENCES [dbo].[user_acc] ([id])
GO
USE [master]
GO
ALTER DATABASE [Movie_Web] SET  READ_WRITE 
GO
