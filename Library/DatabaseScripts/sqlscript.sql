USE [master]
GO
/****** Object:  Database [Libraries]    Script Date: 8/30/2019 5:05:51 PM ******/
CREATE DATABASE [Libraries]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Libraries', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Libraries.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Libraries_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Libraries_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Libraries] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Libraries].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Libraries] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Libraries] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Libraries] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Libraries] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Libraries] SET ARITHABORT OFF 
GO
ALTER DATABASE [Libraries] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Libraries] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Libraries] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Libraries] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Libraries] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Libraries] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Libraries] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Libraries] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Libraries] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Libraries] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Libraries] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Libraries] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Libraries] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Libraries] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Libraries] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Libraries] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Libraries] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Libraries] SET RECOVERY FULL 
GO
ALTER DATABASE [Libraries] SET  MULTI_USER 
GO
ALTER DATABASE [Libraries] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Libraries] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Libraries] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Libraries] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Libraries] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Libraries', N'ON'
GO
ALTER DATABASE [Libraries] SET QUERY_STORE = OFF
GO
USE [Libraries]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 8/30/2019 5:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 8/30/2019 5:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ISBN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCopy]    Script Date: 8/30/2019 5:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCopy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[LibraryID] [int] NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 8/30/2019 5:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[EmployeeNumber] [int] IDENTITY(1,1) NOT NULL,
	[LibraryID] [int] NOT NULL,
	[LibraryCardNumber] [int] NOT NULL,
 CONSTRAINT [PK_Librarian] PRIMARY KEY CLUSTERED 
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Library]    Script Date: 8/30/2019 5:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[StreetAddress] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Library] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patron]    Script Date: 8/30/2019 5:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patron](
	[LibraryCardNumber] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[StreetAddress] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Patron] PRIMARY KEY CLUSTERED 
(
	[LibraryCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatronCheckout]    Script Date: 8/30/2019 5:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatronCheckout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[LibraryCardNumber] [int] NOT NULL,
	[CheckedOutOn] [date] NOT NULL,
	[DueOn] [date] NOT NULL,
	[ReturnedOn] [date] NULL,
	[BookCopyID] [int] NOT NULL,
 CONSTRAINT [PK_PatronCheckout] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[BookCopy]  WITH CHECK ADD  CONSTRAINT [FK_BookCopy_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[BookCopy] CHECK CONSTRAINT [FK_BookCopy_Book]
GO
ALTER TABLE [dbo].[BookCopy]  WITH CHECK ADD  CONSTRAINT [FK_BookCopy_Library] FOREIGN KEY([LibraryID])
REFERENCES [dbo].[Library] ([ID])
GO
ALTER TABLE [dbo].[BookCopy] CHECK CONSTRAINT [FK_BookCopy_Library]
GO
ALTER TABLE [dbo].[Librarian]  WITH CHECK ADD  CONSTRAINT [FK_Librarian_Library] FOREIGN KEY([LibraryID])
REFERENCES [dbo].[Library] ([ID])
GO
ALTER TABLE [dbo].[Librarian] CHECK CONSTRAINT [FK_Librarian_Library]
GO
ALTER TABLE [dbo].[Librarian]  WITH CHECK ADD  CONSTRAINT [FK_Librarian_Patron] FOREIGN KEY([LibraryCardNumber])
REFERENCES [dbo].[Patron] ([LibraryCardNumber])
GO
ALTER TABLE [dbo].[Librarian] CHECK CONSTRAINT [FK_Librarian_Patron]
GO
ALTER TABLE [dbo].[PatronCheckout]  WITH CHECK ADD  CONSTRAINT [FK_PatronCheckout_BookCopy] FOREIGN KEY([BookCopyID])
REFERENCES [dbo].[BookCopy] ([ID])
GO
ALTER TABLE [dbo].[PatronCheckout] CHECK CONSTRAINT [FK_PatronCheckout_BookCopy]
GO
ALTER TABLE [dbo].[PatronCheckout]  WITH CHECK ADD  CONSTRAINT [FK_PatronCheckout_Librarian] FOREIGN KEY([EmployeeNumber])
REFERENCES [dbo].[Librarian] ([EmployeeNumber])
GO
ALTER TABLE [dbo].[PatronCheckout] CHECK CONSTRAINT [FK_PatronCheckout_Librarian]
GO
ALTER TABLE [dbo].[PatronCheckout]  WITH CHECK ADD  CONSTRAINT [FK_PatronCheckout_Patron] FOREIGN KEY([LibraryCardNumber])
REFERENCES [dbo].[Patron] ([LibraryCardNumber])
GO
ALTER TABLE [dbo].[PatronCheckout] CHECK CONSTRAINT [FK_PatronCheckout_Patron]
GO
USE [master]
GO
ALTER DATABASE [Libraries] SET  READ_WRITE 
GO
