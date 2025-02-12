USE [master]
GO
/****** Object:  Database [Brewery]    Script Date: 3/28/2018 8:58:35 PM ******/
CREATE DATABASE [Brewery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Brewery', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Brewery.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Brewery_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Brewery_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Brewery] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Brewery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Brewery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Brewery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Brewery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Brewery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Brewery] SET ARITHABORT OFF 
GO
ALTER DATABASE [Brewery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Brewery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Brewery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Brewery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Brewery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Brewery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Brewery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Brewery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Brewery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Brewery] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Brewery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Brewery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Brewery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Brewery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Brewery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Brewery] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Brewery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Brewery] SET RECOVERY FULL 
GO
ALTER DATABASE [Brewery] SET  MULTI_USER 
GO
ALTER DATABASE [Brewery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Brewery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Brewery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Brewery] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Brewery] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Brewery] SET QUERY_STORE = OFF
GO
USE [Brewery]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Brewery]
GO
/****** Object:  Table [dbo].[Beer]    Script Date: 3/28/2018 8:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beer](
	[BeerID] [int] IDENTITY(1,1) NOT NULL,
	[BreweryID] [int] NOT NULL,
	[BeerName] [varchar](50) NOT NULL,
	[BeerType] [varchar](50) NOT NULL,
	[ABV] [decimal](3, 1) NULL,
	[BeerAvailability] [char](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[BeerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BeerKeyword]    Script Date: 3/28/2018 8:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BeerKeyword](
	[KeywordID] [int] NOT NULL,
	[BeerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KeywordID] ASC,
	[BeerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brewery]    Script Date: 3/28/2018 8:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brewery](
	[BreweryID] [int] IDENTITY(1,1) NOT NULL,
	[BreweryName] [varchar](50) NOT NULL,
	[BreweryAddress] [varchar](100) NULL,
	[BreweryZip] [char](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[BreweryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BreweryTour]    Script Date: 3/28/2018 8:58:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BreweryTour](
	[TourID] [int] IDENTITY(1,1) NOT NULL,
	[BreweryID] [int] NOT NULL,
	[TourDay] [char](30) NULL,
	[TourCost] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keyword]    Script Date: 3/28/2018 8:58:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keyword](
	[KeywordID] [int] IDENTITY(1,1) NOT NULL,
	[KeywordName] [char](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[KeywordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Beer] ON 

INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (1, 1, N'Schafly Pilsner', N'Pilsner', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (2, 2, N'Belgian Blonde ', N'Blonde Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (3, 1, N'Schafly Kolsch', N'Kolsch', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (4, 1, N'Schafly Pale Ale', N'Pale Ale', CAST(4.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (5, 1, N'Schafly Hefeweizen', N'Hefeweizen', CAST(4.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (6, 1, N'Dry Hopped APA', N'American Ale', CAST(5.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (7, 1, N'Summer Lager', N'Lager', CAST(4.5 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (8, 1, N'Oatmeal Stout', N'Stout', CAST(5.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (9, 1, N'Oktoberfest', N'Lager', CAST(5.5 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (10, 1, N'Winter ESB Ale', N'Ale', CAST(5.8 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (11, 1, N'Raspberry Hefeweizen', N'Hefeweizen', CAST(4.1 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (12, 1, N'Schafly Porter', N'Porter', CAST(5.4 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (13, 1, N'Coffee Stout', N'Stout', CAST(5.4 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (14, 1, N'Extra Stout', N'Irish Stout', CAST(8.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (15, 1, N'Schafly IPA', N'IPA', CAST(7.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (16, 1, N'American IPA', N'IPA', CAST(7.2 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (17, 1, N'Pumpkin Ale', N'Pumpkin Ale', CAST(8.0 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (18, 1, N'Christmas Ale', N'Ale', CAST(8.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (19, 1, N'Imperial Stout', N'Stout', CAST(10.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (20, 1, N'Barleywine-Style Ale', N'Ale', CAST(10.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (21, 1, N'Biere de Garde', N'Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (22, 1, N'Grand Cru Ale', N'Ale', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (23, 1, N'Tripez', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (24, 1, N'Quad Rupel Ale', N'Ale', CAST(12.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (25, 2, N'Atheist Ale', N'IPA', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (26, 2, N'Hop Lock & Drop It', N'Pale Ale', CAST(5.0 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (27, 2, N'Believers Brew', N'Stout', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (28, 2, N'Passport Pale Ale', N'Pale Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (29, 2, N'Satanic Saison', N'Saison', CAST(8.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (30, 2, N'Capulus', N'Stout', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (31, 2, N'Braun', N'Brown Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (32, 2, N'Delphian', N'Blonde Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (33, 2, N'Pinot Saison', N'Saison', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (34, 2, N'Apocryph', N'Saison', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (35, 3, N'citrapolis', N'IPA', CAST(6.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (36, 3, N'Odinson', N'IPA', CAST(6.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (37, 3, N'All Black', N'IPA', CAST(6.5 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (38, 3, N'Arkham''s Finest', N'Stout', CAST(8.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (39, 3, N'The Heeler', N'Pale Ale', CAST(6.5 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (40, 3, N'Mon Precieux', N'Tripel', CAST(7.8 AS Decimal(3, 1)), NULL)
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (41, 3, N'Clandestine', N'Belgian Brown Ale', CAST(6.8 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (42, 3, N'Ms. Sally', N'Pilsner', CAST(4.8 AS Decimal(3, 1)), NULL)
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (43, 3, N'Dew Brew', N'Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (44, 4, N'Winged Nut', N'Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (45, 4, N'Hopfen', N'Lager', CAST(6.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (46, 4, N'Zwickel', N'Pilsner', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (47, 4, N'Schnickelfritz', N'Pilsner', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (48, 4, N'Pierre''s Wit', N'Wheat Lager', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (49, 4, N'Erlkonig', N'Wheat Lager', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (50, 4, N'Schlossturm', N'Lager', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (51, 4, N'Ku''damn', N'Lager', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (52, 4, N'Stammtissch', N'Pilsner', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (53, 4, N'Dorfbier', N'Lager', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (54, 4, N'Teufelspakt', N'Black Lager', CAST(4.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (55, 4, N'Mercator', N'Sour Pilsner', CAST(6.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (56, 4, N'Apotheosis', N'Saison', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (57, 4, N'Fantasyland', N'IPA', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (58, 4, N'Holzrauch', N'Smoked Beer', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (59, 4, N'O''Florian''s', N'Stout', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (60, 4, N'Oxnbrau', N'Pilsner', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (61, 4, N'Kinsale', N'Stout', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (62, 4, N'Xaver', N'Pilsner', CAST(5.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (63, 4, N'Innovator', N'Pale Ale', CAST(10.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (64, 4, N'Forest Park Pilsner', N'Pilsner', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (65, 4, N'Reine Liebe', N'Pilsner', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (66, 4, N'Powell 50', N'Red Ale', CAST(4.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (67, 4, N'Wolpertinger', N'Pilsner', CAST(11.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (68, 4, N'Vanilla Mint  Kinsale', N'Stout', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (69, 4, N'Urban Underdog', N'American Lager', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (70, 5, N'Art of Neurosis', N'IPA', CAST(7.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (71, 5, N'Brewcocky', N'Double IPA', CAST(9.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (72, 5, N'El Gato Grande', N'IPA', CAST(7.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (73, 5, N'Green Bird Gose', N'Lager', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (74, 5, N'Hibiscus Wit', N'Wheat Lager', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (75, 5, N'Katy', N'Saison', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (76, 5, N'Little', N'Big Hop', CAST(4.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (77, 5, N'Sub-Mission', N'IPA', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (78, 5, N'Technical Ecstacy', N'Pilsner', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (79, 5, N'Brewligans', N'IPA', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (80, 5, N'Cat Spit Stout', N'Stout', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (81, 5, N'Liquid Spiritual Delight', N'stout', CAST(11.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (82, 5, N'Weiss & Virtue', N'Hefeweizen', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (83, 5, N'Yippie Rye-Yay', N'IPA', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (84, 6, N'STL Best Ale', N'Ale', CAST(4.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (85, 6, N'American Borown Ale', N'Brown Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (86, 6, N'The Angel and the Sword', N'Ale', CAST(4.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (87, 6, N'Brown Ale', N'Brown Ale', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (88, 6, N'Rye Pale Ale', N'Rye Pale Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (89, 6, N'Stevies'' 5 Star', N'Amber Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (90, 6, N'70 Shilling', N'Scottish Ale', CAST(3.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (91, 6, N'Civil Life Ale', N'Cream Ale', CAST(4.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (92, 6, N'Civil Life Alt', N'Ale', CAST(4.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (93, 6, N'American Session Ale', N'Pale Ale', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (94, 6, N'Civil Life Blonde', N'Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (95, 6, N'Belgian Dubbel', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (96, 6, N'Big American Stout', N'Stout', CAST(6.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (97, 6, N'Big Year Brown', N'Brown Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (98, 6, N'Black Ale', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (99, 6, N'British Bitter', N'English Ale', CAST(4.3 AS Decimal(3, 1)), N'Year-Round                    ')
GO
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (100, 6, N'British Bitter Mild', N'English Ale', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (101, 7, N'Session Ale', N'Ale', CAST(4.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (102, 7, N'Dry Brown', N'Ale', CAST(5.4 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (103, 7, N'Mahlab ESB', N'English Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (104, 7, N'Copper ale', N'Ale', CAST(4.7 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (105, 7, N'Porter', N'Porter', CAST(5.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (106, 7, N'#Basic Blonde', N'Blonde Ale', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (107, 7, N'AIPA', N'IPA', CAST(5.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (108, 7, N'Meteor IPA', N'IPA', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (109, 7, N'Peacon Chicory Stout', N'Stout', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (110, 7, N'Thia Basil IPA', N'IPA', CAST(6.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (111, 7, N'Hopped Wheat', N'Wheat Lager', CAST(4.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (112, 7, N'Second Lunch Pale Ale', N'Pale Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (113, 7, N'Jasmine Gose', N'Lager', CAST(5.1 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (114, 8, N'Vanilla Cream Ale', N'Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (115, 8, N'Ryane''s Red', N'Amber Ale', CAST(6.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (116, 8, N'IPA', N'IPA', CAST(6.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (117, 8, N'Imperial Pumpkin Porter', N'Porter', CAST(9.0 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (118, 9, N'Minivan Maestro', N'Hefeweizen', CAST(4.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (119, 9, N'Old Dog Skip', N'Lager', CAST(4.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (120, 9, N'Caroline', N'Pale Ale', CAST(5.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (121, 9, N'Seperation Anxiety', N'Lager', CAST(8.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (122, 9, N'Pizza Bones', N'IPA', CAST(5.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (123, 9, N'Bunk''s Belgian', N'Belgian Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (124, 10, N'Apricot Layla', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (125, 10, N'Black Dog', N'Porter', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (126, 10, N'Bohemian Rhaspberry', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (127, 10, N'Crowd Surfer', N'Pale Ale', CAST(5.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (128, 10, N'Kiss The Sky', N'Rye IPA', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (129, 10, N'Layla', N'Sour Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (130, 10, N'Left Coast Envy IPA', N'IPA', CAST(6.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (131, 10, N'Petty Wage', N'Saison', CAST(5.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (132, 10, N'Prison Bound', N'Pale Ale', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (133, 10, N'Ruby Soho IPA', N'IPA', CAST(6.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (134, 10, N'Squeeze Box Lemon Wheat', N'Wheat Ale', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (135, 10, N'Vanilla Coffee Underbrown', N'Brown Ale', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (136, 10, N'Velvet Underbrown', N'Brown Ale', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (137, 11, N'Ale Fleur One', N'Pale Ale', CAST(4.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (138, 11, N'Sugar Creek Lager', N'Lager', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (139, 11, N'Pumpkin Ale', N'Pumpkin Ale', CAST(5.8 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (140, 11, N'Spring Fling', N'Wheat Ale', CAST(3.1 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (141, 11, N'Green Mistress', N'Ale', CAST(8.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (142, 11, N'Super Chief IPA', N'IPA', CAST(6.1 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (143, 11, N'Midnight Train', N'Black Lager', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (144, 11, N'Blackberry Wheat', N'Wheat Ale', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (145, 11, N'Lord Otto''s Porter', N'Porter', CAST(6.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (146, 11, N'Peaberry Coffee Stout', N'Stout', CAST(10.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (147, 11, N'Red IPA', N'IPA', CAST(10.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (148, 11, N'Big Five – OH', N'Ale', CAST(8.2 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (149, 11, N'Paddy Shack Red', N'Red Ale', CAST(5.1 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (150, 12, N'Belgian Small Beer', N'Wheat Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (151, 12, N'Belgian Steam Beer', N'Wheat Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (152, 12, N'Belgian Ale', N'Wheat Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (153, 12, N'Belgian Porter', N'Porter', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (154, 12, N'Belgian Summer', N'Wheat Ale', CAST(5.2 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (155, 13, N'Rambler''s Red Ale', N'Red Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (156, 13, N'Halley''s Blueberry Saison', N'Saison', CAST(6.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (157, 13, N'Jumping Frog IPA', N'IPA', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (158, 13, N'Huck Finn''s Habanero Apricot Wheat', N'Wheat Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (159, 13, N'Clemens Kolsch', N'Kolsch', CAST(4.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (160, 13, N'King Arthur''s Court Imperial IPA', N'IPA', CAST(8.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (161, 14, N'DDH OJ Run', N'Double IPA', CAST(8.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (162, 14, N'DDH Cloud City', N'Double IPA', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (163, 14, N'Old Town Porter Hot Java', N'Porter', CAST(5.7 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (164, 14, N'King Fallen Flag', N'Double IPA', CAST(8.6 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (165, 14, N'Tableau de Fluers', N'Saison', CAST(4.7 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (166, 15, N'Rod''s Cream Ale', N'Cream Ale', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (167, 15, N'Hide and Seek Hefeweizen', N'Hefeweizen', CAST(4.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (168, 15, N'Frisco 1501 Historic Lager', N'Lager', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (169, 15, N'Elusive IPA', N'IPA', CAST(6.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (170, 15, N'Revelation Stout', N'Stout', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (171, 15, N'Flynn''s Irish Red', N'Red Ale', CAST(5.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (172, 15, N'Farmstand Peach Ale', N'Ale', CAST(5.3 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (173, 15, N'Courtship Cranberry Ale', N'Ale', CAST(6.1 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (174, 15, N'Giddy Goat Coffee Milk Stout', N'Stout', CAST(5.5 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (175, 15, N'Soest Road', N'Ale', CAST(6.5 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (176, 15, N'Level 2 Fall Risk', N'IPA', CAST(8.7 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (177, 15, N'Provision', N'Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (178, 15, N'Vignoles', N'IPA', CAST(6.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (179, 15, N'Anthony''s Pacification', N'Stout', CAST(10.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (180, 15, N'Dry Fly IPA', N'IPA', CAST(4.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (181, 15, N'Sticke It Up Your Alt', N'Lager', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (182, 16, N'Bavarian Hefeweizen', N'Hefeweizen', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (183, 16, N'Belgian Dubbel', N'Ale', CAST(8.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (184, 16, N'Blood Orange Wit', N'Wheat Ale', CAST(4.7 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (185, 16, N'Cinnamon Maple Stout', N'Stout', CAST(8.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (186, 16, N'Coffee Maple Stout', N'stout', CAST(6.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (187, 16, N'Cranberry Wheat', N'Wheat Ale', CAST(4.7 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (188, 16, N'Double Dry Hopped Citra IPA', N'IPA', CAST(6.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (189, 16, N'El Dorado IPA', N'IPA', CAST(6.8 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (190, 16, N'French Saison', N'Saison', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (191, 16, N'Galaxy IPA', N'IPA', CAST(6.8 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (192, 16, N'Harvest Peach Saison', N'Saison', CAST(5.4 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (193, 16, N'Irish Red Ale With Honey', N'Red Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (194, 16, N'Irish Stout', N'Stout', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (195, 16, N'Mango Hibiscus Blonde', N'Blonde Ale', CAST(4.7 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (196, 16, N'Red IPA', N'IPA', CAST(6.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (197, 16, N'Robust Porter with Ancho', N'Porter', CAST(8.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (198, 17, N'Going Once. Going Twice.', N'Sour Ale', CAST(3.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (199, 17, N'Ophelia''s Wit', N'Wheat Ale', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
GO
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (200, 17, N'Broken Arm Blonde', N'Blonde Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (201, 17, N'Hidden Pool', N'Pilsner', CAST(6.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (202, 17, N'Green Beer', N'Stout', CAST(4.8 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (203, 17, N'Goomah', N'Stout', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (204, 17, N'Capo', N'Stout', CAST(7.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (205, 17, N'Hanging Pants', N'Pale Ale', CAST(5.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (206, 17, N'Enter Sandman', N'Red Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (207, 17, N'Quit Your Day Job', N'Brown Ale', CAST(6.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (208, 17, N'Spandex Spector', N'Ale', CAST(6.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (209, 17, N'Saint Peters'' Porter', N'Porter', CAST(6.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (210, 17, N'Saint Peters'' Porter With Coffee', N'Porter', CAST(6.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (211, 17, N'Orbital Contusion', N'Black IPA', CAST(7.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (212, 17, N'Dyslexic API', N'Double IPA', CAST(8.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (213, 17, N'Dabble In the Snooze', N'Ale', CAST(8.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (214, 18, N'Trailblazer Blonde Ale', N'Blonde Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (215, 18, N'Trailhead Red Amber Ale', N'Amber Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (216, 18, N'Missouri Brown Dark Ale', N'Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (217, 18, N'Riverboat Raspberry', N'Wheat Ale', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (218, 18, N'Old Courthouse Stout', N'Stout', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (219, 18, N'Irish Ale', N'Ale', CAST(5.1 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (220, 19, N' Amarillo-Man', N'IPA', CAST(7.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (221, 19, N' Wielki Lubelski', N'Pilsner', CAST(4.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (222, 19, N'Healing Potion Red Ale', N'Red Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (223, 19, N'Hops Gruber', N'Ale', CAST(5.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (224, 19, N'Motazuma''s Blessing', N'Stout', CAST(7.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (225, 20, N'Heavenly Body NA Golden Wheat', N'Wheat Ale', CAST(0.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (226, 20, N'Hellraiser NA Dark Amber', N'Amber Ale', CAST(0.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (227, 21, N'Kraftig Lager', N'Lager', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (228, 21, N'Kraftig Light', N'Lager', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (229, 22, N'Golden Pilsner', N'Pilsner', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (230, 22, N'Winter Lager', N'Lager', CAST(5.4 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (231, 22, N'Baltic Porter', N'Porter', CAST(9.4 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (232, 22, N'Black Bear', N'Ale', CAST(4.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (233, 22, N'Honey Wheat', N'Wheat Ale', CAST(4.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (234, 22, N'Virgin Territory', N'IPA', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (235, 22, N'Dopplebock', N'Lager', CAST(8.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (236, 23, N'Jaden''s Schwarz', N'Dark Lager', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (237, 23, N'Light Squared', N'Ale', CAST(4.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (238, 23, N'Park Avenue Pale Ale', N'Pale Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (239, 23, N'Bavarian Weizen', N'Lager', CAST(4.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (240, 23, N'2018 I.P.A.', N'IPA', CAST(6.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (241, 23, N'Barley Wine', N'Ale', CAST(12.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (242, 23, N'Irish Stout', N'Stout', CAST(5.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (243, 23, N'Maple Stout', N'Stout', CAST(5.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (244, 23, N'DoublePilsner', N'Pilsner', CAST(9.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (245, 23, N'Single Malt Scotch Ale', N'Scotch Ale', CAST(12.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (246, 23, N'Imperial IPA', N'IPA', CAST(9.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (247, 23, N'Dunkel Weizen', N'Hefeweizen', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (248, 24, N'Til the Night Closes In', N'Stout', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (249, 24, N'17', N'Stout', CAST(10.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (250, 24, N'Abraxas', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (251, 24, N'Anniversaria', N'Pale Ale', CAST(7.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (252, 24, N'Aria', N'Ale', CAST(7.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (253, 24, N'Bailey''s Chocolate Ale', N'Ale', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (254, 24, N'Barrel-Aged 17', N'Stout', CAST(11.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (255, 24, N'Barrel-Aged Abraxas', N'Ale', CAST(11.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (256, 24, N'Barrel-Aged Sump Coffee Stout', N'Stout', CAST(11.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (257, 24, N'Barrel-Aged Vermillion', N'Ale', CAST(13.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (258, 24, N'Brew for the Crew', N'Lager', CAST(5.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (259, 24, N'Camper''s Reserve', N'Pale Ale', CAST(5.9 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (260, 24, N'Cave Torch', N'IPA', CAST(6.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (261, 24, N'Citra Paradisi', N'Saison', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (262, 24, N'Coffee Abrax', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (263, 24, N'Corial de Sang', N'Saison', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (264, 24, N'Devil''s Heart of Gold', N'Ale', CAST(11.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (265, 24, N'Distant Land', N'Saison', CAST(6.2 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (266, 24, N'Dual Artisanship', N'Saison', CAST(6.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (267, 24, N'Dubbel Block', N'Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (268, 24, N'Edgewild Saison', N'Saison', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (269, 24, N'Fantasic Voyage', N'Stout', CAST(8.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (270, 24, N'Fete de Noel', N'Dark Ale', CAST(10.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (271, 24, N'Five Little Monkeys', N'Pale Ale', CAST(6.1 AS Decimal(3, 1)), NULL)
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (272, 24, N'Flat Rock Saison', N'Saison', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (273, 24, N'Flume', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (274, 24, N'Foeder Saison', N'Saison', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (275, 24, N'Funky Wit', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (276, 24, N'Funky Wit Apricot', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (277, 24, N'Funky Wit Raspberry', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (278, 24, N'Funky Wit Raspberry Rhubarb', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (279, 24, N'Glitter and Gold', N'Ale', CAST(6.5 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (280, 24, N'Goodnight Irene', N'Ale', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (281, 24, N'Handshake Drugs', N'IPA', CAST(6.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (282, 24, N'Heart of Gold', N'Wheat Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (283, 24, N'Hereafter', N'Ale', CAST(8.0 AS Decimal(3, 1)), NULL)
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (284, 24, N'Hommel Bier', N'Pale Ale', CAST(5.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (285, 24, N'Hopfenta', N'Wheat Ale', CAST(4.2 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (286, 24, N'Irene', N'Ale', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (287, 24, N'Jack Rose', N'Ale', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (288, 24, N'Keith''s Korner', N'IPA', CAST(6.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (289, 24, N'La Boheme', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (290, 24, N'Maman', N'Stout', CAST(11.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (291, 24, N'Meriwether', N'Saison', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (292, 24, N'Mon Ami', N'Ale', CAST(10.0 AS Decimal(3, 1)), NULL)
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (293, 24, N'Ollie Ollie Oxen Free', N'IPA', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (294, 24, N'On Y Va', N'Saison', CAST(6.6 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (295, 24, N'Owen', N'Ale', CAST(4.7 AS Decimal(3, 1)), NULL)
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (296, 24, N'Peace Offering', N'Brown Ale', CAST(6.3 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (297, 24, N'Peach Berliner Weisse', N'Ale', CAST(4.2 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (298, 24, N'Philly Taco', N'Brown Ale', CAST(7.0 AS Decimal(3, 1)), NULL)
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (299, 24, N'Pils', N'Pilsner', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
GO
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (300, 24, N'Pineapple Kumquat Berliner Weisse', N'Wheat Ale', CAST(4.2 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (301, 24, N'Plan B', N'Dark Ale', CAST(8.0 AS Decimal(3, 1)), NULL)
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (302, 24, N'Prodigal', N'Stout', CAST(10.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (303, 24, N'Regalia', N'Saison', CAST(8.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (304, 24, N'Reverie', N'Ale', CAST(12.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (305, 24, N'Saison de Lis', N'Saison', CAST(5.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (306, 24, N'Saant Beersel', N'Pale Ale', CAST(8.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (307, 24, N'SavantBlanc', N'Sour Ale', CAST(8.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (308, 24, N'Ship of the Sun', N'Saison', CAST(5.5 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (309, 24, N'Southside Blonde', N'Blonde Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (310, 24, N'Static Electricity', N'IPA', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (311, 24, N'Stefon', N'Ale', CAST(7.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (312, 24, N'Suburban Beverage', N'Ale', CAST(4.2 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (313, 24, N'Sump Coffee Stout', N'Stout', CAST(10.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (314, 24, N'Two Tugs', N'Brown Ale', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (315, 24, N'Vermillion Barlywine', N'Ale', CAST(13.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (316, 24, N'Von Pampelmuse', N'Wheat Ale', CAST(4.2 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (317, 24, N'White Impala', N'Wheat Ale', CAST(6.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (318, 24, N'Woodside', N'Ale', CAST(9.1 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (319, 24, N'Working Title', N'Pale Ale', CAST(6.2 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (320, 25, N'Scotch Ale', N'Scotch Ale', CAST(9.2 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (321, 25, N'Nectarine Habanero IPA', N'IPA', CAST(7.7 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (322, 25, N'Baltic Porter', N'Porter', CAST(7.9 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (323, 25, N'Bavarian Wheatwine', N'Wheat Ale', CAST(10.5 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (324, 25, N'Golden Blonde', N'Blonde Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (325, 25, N'Unfiltered German Pilsner', N'Pilsner', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (326, 25, N'Hefeweizen', N'Hefeweizen', CAST(4.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (327, 25, N'St. Louis Pale Ale', N'Pale Ale', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (328, 25, N'Imperial IPA', N'IPA', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (329, 25, N'Pecan Brown Ale', N'Brown Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (330, 25, N'Oatmeal Stout', N'Stout', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (331, 25, N'Irish Red', N'Red Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (332, 26, N'American Golden Ale', N'Ale', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (333, 26, N'Hop Shelf IPA', N'IPA', CAST(6.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (334, 26, N'Ugly Hockey Christmas Sweater Stout', N'Stout', CAST(7.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (335, 26, N'Nash Year''s Eve Imperial Blonde Ale', N'Blonde Ale', CAST(12.1 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (336, 27, N'2101 Pale Ale', N'Pale Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (337, 27, N'Barleywine', N'Ale', CAST(12.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (338, 27, N'Tornado Alley Amber Ale', N'Amber Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (339, 27, N'Hoptimistic IPA', N'IPA', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (340, 27, N'Half-Wit Wheat', N'Wheat Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (341, 27, N'Paul''s Pils', N'Pilsner', CAST(6.3 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (342, 27, N'Box of Chocolate', N'Ale', CAST(10.5 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (343, 27, N'Long White Cloud', N'Pilsner', CAST(5.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (344, 27, N'Late Night Karate Kicks', N'Stout', CAST(6.3 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (345, 28, N'Abricot du Fermier', N'Saison', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (346, 28, N'Anabasis', N'Ale', CAST(14.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (347, 28, N'Balaton', N'Brown Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (348, 28, N'Beer : Barrel : Time', N'Stout', CAST(15.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (349, 28, N'Biere Blanche', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (350, 28, N'Biere du Pays', N'Saison', CAST(4.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (351, 28, N'La Biere de Fantaisie', N'Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (352, 28, N'Black & Berry', N'Dark Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (353, 28, N'Blanc de Blancs', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (354, 28, N'Black & Wild', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (355, 28, N'Bleuet du Fermier', N'Saison', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (356, 28, N'Blueberry Flanders', N'Red Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (357, 28, N'Brett Project', N'Saison', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (358, 28, N'Brett Venture', N'Saison', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (359, 28, N'Bretta Sang', N'Sour Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (360, 28, N'Derivation', N'Stout', CAST(15.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (361, 28, N'Double Barrel Derivation', N'Stout', CAST(15.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (362, 28, N'Fencerow', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (363, 28, N'La Fosse', N'Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (364, 28, N'Framboise du Fermier', N'Saison', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (365, 28, N'Fuzzy', N'Ale', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (366, 28, N'Grisette', N'Blonde Ale', CAST(4.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (367, 28, N'Jammy', N'Saison', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (368, 28, N'Langst', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (369, 28, N'Lattice', N'Pale Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (370, 28, N'Leaner', N'Saison', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (371, 28, N'Marietta Ave.', N'Pale Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (372, 28, N'Merci', N'Saison', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (373, 28, N'Noir du Fermier', N'Dark Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (374, 28, N'Orviamo', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (375, 28, N'Oude du Ble', N'Saison', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (376, 28, N'Oude Fermier', N'Saison', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (377, 28, N'Peche du Fermier', N'Saison', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (378, 28, N'Pulling Nails', N'Sour Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (379, 28, N'Punchdown', N'Ale', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (380, 28, N'Rose du Ble', N'Saison', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (381, 28, N'La Ruche', N'Saison', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (382, 28, N'Saison du Ble', N'Saison', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (383, 28, N'Saison du Fermier', N'Saison', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (384, 28, N'Saison du Fermier - Pinot Noir Puncheons', N'Saison', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (385, 28, N'Saison du Fermier - American Oak Foedre', N'Saison', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (386, 28, N'Saison de Rouge', N'Saison', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (387, 28, N'Le Saisonnier', N'Saison', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (388, 28, N'Smooth', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (389, 28, N'Styrbjorn', N'Ale', CAST(14.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (390, 28, N'Tete de Cuvee', N'Saison', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (391, 28, N'Thicket', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (392, 28, N'Unblended #25', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (393, 28, N'Unblended #40', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (394, 28, N'Trail Dubbel', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (395, 28, N'Vintage 2014', N'Ale', CAST(8.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (396, 29, N'American IPA 1216', N'IPA', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (397, 29, N'Cream Ale', N'Cream Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (398, 29, N'Au Frau', N'Blonde Ale', CAST(4.8 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (399, 29, N'Cerassus', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
GO
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (400, 29, N'Constant Clockwork', N'IPA', CAST(6.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (401, 29, N'Pinion Porter', N'Porter', CAST(6.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (402, 29, N'Nuns Habit', N'Ale', CAST(4.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (403, 29, N'Maestro''s Beer', N'Amber Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (404, 29, N'Rusty Shackle', N'Red Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (405, 29, N'Zeppelin', N'Kolsch', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (406, 29, N'St. Draconius', N'Ale', CAST(6.7 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (407, 29, N'Vulcans Hammer', N'Dark Ale', CAST(7.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (408, 30, N'City Wide', N'Pale Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (409, 30, N'City Wide Pils', N'Pilsner', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (410, 30, N'Single Speed', N'Blonde Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (411, 30, N'Divided Sky Rye IPA', N'Rye IPA', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (412, 30, N'Cast Iron Oatmeal Stout', N'Stout', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (413, 30, N'Incarnation', N'IPA', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (414, 30, N'Contact High', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (415, 30, N'War Hammer Imperial IPA', N'IPA', CAST(9.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (416, 30, N'Ca$h Mony', N'IPA', CAST(8.5 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (417, 30, N'Snake Oil', N'IPA', CAST(6.5 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (418, 30, N'Passion Fruit Prussia', N'Wheat Ale', CAST(4.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (419, 30, N'Cuvee Ange', N'Ale', CAST(5.5 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (420, 30, N'Chocolate Milk Stout', N'Stout', CAST(5.5 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (421, 30, N'Bona Fide Imperial Stout', N'Stout', CAST(8.5 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (422, 30, N'Send Help', N'Blonde Ale', CAST(4.5 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (423, 30, N'Absence of Light', N'Stout', CAST(7.1 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (424, 30, N'Plush', N'Saison', CAST(6.8 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (425, 30, N'Madagascar', N'Stout', CAST(9.3 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (426, 30, N'License to Dance', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (427, 30, N'Kriek', N'Ale', CAST(5.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (428, 30, N'Guava King', N'Blonde Ale', CAST(4.5 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (429, 30, N'Dakine', N'IPA', CAST(6.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (430, 30, N'White Flannel', N'IPA', CAST(9.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (431, 30, N'Table IPA', N'IPA', CAST(4.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (432, 30, N'Loose Particles', N'IPA', CAST(8.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (433, 30, N'Typhon', N'Saison', CAST(6.5 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (434, 30, N'Super Flare', N'IPA', CAST(7.5 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (435, 30, N'City Museum Pils', N'Pilsner', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (436, 30, N'Forbidden Fuzz', N'Ale', CAST(4.5 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (437, 30, N'On Cue', N'Ale', CAST(4.5 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (438, 30, N'Hopeless Romantic', N'Saison', CAST(6.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (439, 30, N'Lemon Gose', N'Wheat Ale', CAST(4.5 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (440, 30, N'Liquid IPA', N'IPA', CAST(7.5 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (441, 30, N'Bone of Contention', N'Saison', CAST(5.0 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (442, 30, N'Zellige', N'Stout', CAST(7.5 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (443, 30, N'Genevieve', N'Wheat Ale', CAST(5.5 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (444, 30, N'Azza', N'Stout', CAST(13.5 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (445, 30, N'La Belleza', N'Stout', CAST(10.5 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (446, 30, N'Ba Bona Fide', N'Stout', CAST(10.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (447, 31, N'1867 IPA', N'IPA', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (448, 31, N'Augusta Barley Wine', N'Ale', CAST(9.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (449, 31, N'Augusta Butch''s Stout', N'Stout', CAST(4.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (450, 31, N'Augusta Cecelia''s Hefe', N'Hefeweizen', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (451, 31, N'Augusta Dingo Double IPA', N'Double IPA', CAST(9.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (452, 31, N'Augusta ESB', N'Ale', CAST(5.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (453, 31, N'Augusta Jack''s Blonde', N'Blonde Ale', CAST(4.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (454, 31, N'Augusta Jonquil', N'Dark Ale', CAST(7.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (455, 31, N'Augusta Pilsner', N'Pilsner', CAST(5.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (456, 31, N'Augusta Roggen Rye Ale', N'Rye Ale', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (457, 31, N'Augusta Saison', N'Saison', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (458, 31, N'Augusta Schwarzbier', N'Dark Ale', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (459, 31, N'Augusta Swamp Ass Double IPA', N'Double IPA', CAST(7.8 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (460, 31, N'Augusta Tripel', N'Ale', CAST(9.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (461, 31, N'Augusta Tripel IPA', N'IPA', CAST(9.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (462, 31, N'Augusta Winter Ale', N'Ale', CAST(7.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (463, 31, N'Augusta Witbier', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (464, 31, N'Citra 7', N'IPA', CAST(8.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (465, 31, N'Dark Chocolate', N'Porter', CAST(5.6 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (466, 31, N'Jaded Bitch', N'Porter', CAST(8.0 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (467, 32, N'Golden Pilsner', N'Pilsner', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (468, 32, N'Unfiltered Bavarian-Style Wheat', N'Wheat Ale', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (469, 32, N'Mild Pale Ale', N'Pale Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (470, 33, N'Belgian White', N'Wheat Ale', CAST(5.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (471, 33, N'Perfect Storm Pale Ale', N'Pale Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (472, 33, N'Dirty Laundry Brown Ale', N'Brown Ale', CAST(5.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (473, 33, N'Citra IPL', N'IPA', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (474, 33, N'Mosaic IPA', N'IPA', CAST(6.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (475, 33, N'Smoked Cherrywood Wheat', N'Wheat Ale', CAST(7.1 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (476, 34, N'O''Fallon Gold', N'Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (477, 34, N'O''Fallon 5 Day IPA', N'IPA', CAST(6.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (478, 34, N'Wheach', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (479, 34, N'Hemp Hop Rye', N'Amber Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (480, 34, N'Smoke Porter', N'Porter', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (481, 34, N'O''Fallon Westport Wheat', N'Wheat Ale', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (482, 34, N'Show Me IPA', N'IPA', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (483, 34, N'STL Red', N'Red Ale', CAST(5.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (484, 34, N'Bottlehouse', N'Brown Ale', CAST(4.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (485, 34, N'King Louie', N'Stout', CAST(6.3 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (486, 34, N'Cherry Chocolate', N'Wheat Ale', CAST(5.7 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (487, 34, N'Big Walt', N'Pilsner', CAST(5.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (488, 34, N'Chinook Me All Night Long', N'Double IPA', CAST(8.2 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (489, 34, N'Dunkel Down', N'Lager', CAST(5.1 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (490, 34, N'Heads Up', N'Lager', CAST(5.5 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (491, 34, N'Quest for the Galaxy', N'Pale Ale', CAST(5.1 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (492, 34, N'Pumpkin Beer', N'Pumpkin Ale', CAST(5.6 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (493, 34, N'Vanilla Pumpkin', N'Pumpkin Ale', CAST(5.6 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (494, 34, N'Jack O'' Latte', N'Stout', CAST(6.6 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (495, 34, N'Pumpkin Bread', N'Pumpkin Ale', CAST(5.4 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (496, 34, N'Saison de Citrouille', N'Saison', CAST(5.3 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (497, 34, N'Strawberry Best', N'Wheat Ale', CAST(4.4 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (498, 34, N'Grape Escape', N'Wheat Ale', CAST(4.1 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (499, 34, N'Daze of Summer', N'Ale', CAST(4.8 AS Decimal(3, 1)), N'Summer                        ')
GO
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (500, 34, N'Pineapple Wheach', N'Wheat Ale', CAST(5.1 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (501, 34, N'Summer Blast Blonde', N'Blonde Ale', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (502, 34, N'Speed Hump', N'Pale Ale', CAST(5.0 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (503, 34, N'Czech Yo'' Self', N'Pilsner', CAST(5.1 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (504, 34, N'Tee It UP', N'Lager', CAST(4.8 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (505, 35, N'Hail Mary Belgian Style', N'IPA', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (506, 35, N'Belgian-Style Abbey Ale', N'Ale', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (507, 35, N'Belgian-Style White Ale', N'Ale', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (508, 35, N'Peaching to the Choir', N'Ale', CAST(9.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (509, 35, N'Heavenly Honey Razz', N'Amber Ale', CAST(5.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (510, 35, N'Forbidden Fruit', N'Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (511, 35, N'Gabriel IPA', N'IPA', CAST(9.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (512, 35, N'Repent Rye IPA', N'Rye IPA', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (513, 35, N'Holy Moly! Imperial Stout', N'Stout', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (514, 35, N'Bourbon Age Holy Moly!', N'Stout', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (515, 35, N'Ave Maria', N'Ale', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (516, 35, N'Immaculate Collaboration V', N'Ale', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (517, 35, N'Divine Correlation', N'Saison', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (518, 35, N'Canes of Judas', N'Sour Ale', CAST(11.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (519, 36, N'1904 Lager', N'Lager', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (520, 13, N'BA Passport to Russia', N'Stout', CAST(12.0 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (521, 37, N'Irish Dry Stout', N'Stout', CAST(4.2 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (522, 37, N'English Dark Mild', N'Ale', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (523, 37, N'Kolsch', N'Kolsch', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (524, 37, N'Pilsner', N'Pilsner', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (525, 37, N'Dark As Funk', N'Saison', CAST(10.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (526, 37, N'Eastern MO IPA', N'IPA', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (527, 37, N'IPA', N'IPA', CAST(6.7 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (528, 37, N'Dry Stout', N'Stout', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (529, 37, N'Red Rye IPA', N'Rye IPA', CAST(5.9 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (530, 38, N'Wasabwitu?', N'Wheat Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (531, 38, N'Bignose IPA', N'IPA', CAST(7.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (532, 38, N'Friendzy IPA', N'IPA', CAST(6.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (533, 38, N'Andrew''s Ale', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (534, 38, N'Belgian Golden', N'Amber Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (535, 38, N'Celtic Blood', N'Rye Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (536, 38, N'Rasmanian Devil', N'Red Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (537, 38, N'Wentzille Downtown Brown', N'Brown Ale', CAST(6.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (538, 38, N'Red 98', N'Red Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (539, 38, N'Ryenot', N'Rye Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (540, 38, N'Laplander DIPA', N'IPA', CAST(9.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (541, 38, N'Cathy''s Cure', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (542, 39, N'American Lager', N'Lager', CAST(4.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (543, 39, N'American Wheat Ale', N'Wheat Ale', CAST(4.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (544, 40, N'Off Duty', N'Lager', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (545, 40, N'Blonde Juele', N'Blonde Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (546, 40, N'Pecan Brown Ale', N'Brown Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (547, 40, N'Salted Caramel Pecan Ale', N'Brown Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (548, 40, N'Cold-Fro-T-5', N'Ale', CAST(6.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (549, 40, N'Common Ride', N'Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (550, 40, N'The Answer', N'Amber Ale', CAST(4.8 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (551, 40, N'2 Hop', N'IPA', CAST(6.7 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (552, 40, N'Zombie Lager 1031', N'Lager', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (553, 40, N'Dunkelweizen', N'Wheat Ale', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (554, 40, N'Oktoberfest', N'Pale Lager', CAST(5.5 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (555, 40, N'420/4', N'Pale Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (556, 40, N'Vanilla Bean Coffee Juele', N'Blonde Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (557, 40, N'Peach Juele', N'Blonde Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (558, 40, N'Blueberry Juele', N'Blonde Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (559, 40, N'Strawberry Juele', N'Blonde Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (560, 7, N'Dark Mild w/ Coconut', N'Dark Ale', CAST(4.1 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (561, 7, N'Open Source Brown', N'Ale', CAST(5.3 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (562, 7, N'Peat Anise Porter', N'Porter', CAST(5.0 AS Decimal(3, 1)), N'Spring                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (563, 41, N'Original', N'Lager', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (564, 41, N'Hefe Weizen', N'Hefeweizen', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (565, 41, N'Dunkel', N'Dark Lager', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (566, 41, N'Light', N'Pale Lager', CAST(4.8 AS Decimal(3, 1)), N'Summer                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (567, 41, N'Marzen', N'Lager', CAST(5.0 AS Decimal(3, 1)), N'Fall                          ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (568, 41, N'Maibock', N'Lager', CAST(7.2 AS Decimal(3, 1)), N'Winter                        ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (569, 42, N'English Mild Ale', N'Ale', CAST(3.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (570, 42, N'Lammastie English Wheat Ale', N'Wheat Ale', CAST(4.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (571, 42, N'High Desert Pale Ale', N'Pale Ale', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (572, 42, N'Raspberry Ale', N'Ale', CAST(5.3 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (573, 42, N'Northern English Brown Ale', N'Brown Ale', CAST(4.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (574, 42, N'“Across the Pond” Hybrid IPA', N'IPA', CAST(6.6 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (575, 42, N'Tower Hill Burton-style ESB', N'Ale', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (576, 42, N'Cascadia Amber Ale', N'Amber Ale', CAST(5.4 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (577, 42, N'Moorgate London-Style Porter', N'Porter', CAST(5.1 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (578, 43, N'Clyde''s Ale', N'Ale', CAST(4.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (579, 43, N'Green Chile Ale', N'Ale', CAST(4.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (580, 43, N'Red Rye', N'Rye Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (581, 43, N'Ale of 1000 Suns', N'Ale', CAST(4.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (582, 43, N'Belgian Wit', N'Wheat Ale', CAST(5.0 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (583, 43, N'Missouri Brunch Stout', N'Stout', CAST(7.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (584, 43, N'Samoa Stout', N'Stout', CAST(7.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (585, 43, N'Straw-Barry Ale', N'Ale', CAST(5.2 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (586, 43, N'Citra IPA', N'IPA', CAST(5.5 AS Decimal(3, 1)), N'Year-Round                    ')
INSERT [dbo].[Beer] ([BeerID], [BreweryID], [BeerName], [BeerType], [ABV], [BeerAvailability]) VALUES (587, 43, N'DWIPA', N'IPA', CAST(9.5 AS Decimal(3, 1)), N'Year-Round                    ')
SET IDENTITY_INSERT [dbo].[Beer] OFF
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (1, 1)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (1, 2)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (1, 3)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (1, 5)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (1, 7)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (1, 9)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (1, 11)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (2, 1)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (2, 7)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (2, 9)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (3, 1)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (3, 3)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (3, 9)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (6, 17)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (8, 17)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (10, 13)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (11, 8)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (11, 10)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (11, 12)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (11, 13)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (11, 14)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (11, 15)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (21, 8)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (21, 9)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (21, 12)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (21, 13)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (21, 14)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (21, 17)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (21, 18)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (21, 19)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (22, 5)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (22, 11)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (23, 7)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (23, 11)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (24, 7)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (28, 1)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (29, 2)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (29, 4)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (29, 6)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (29, 14)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (29, 15)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (29, 16)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (29, 18)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (30, 14)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (30, 19)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (31, 15)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (31, 17)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (32, 8)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (33, 15)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (33, 16)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (35, 11)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (35, 18)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (37, 2)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (38, 4)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (38, 6)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (38, 16)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (41, 2)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (42, 7)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (43, 10)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (43, 18)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (45, 4)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (45, 6)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (45, 15)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (45, 16)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (46, 5)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (47, 6)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (48, 6)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (48, 10)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (49, 8)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (49, 13)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (49, 14)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (49, 19)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (50, 11)
INSERT [dbo].[BeerKeyword] ([KeywordID], [BeerID]) VALUES (51, 12)
SET IDENTITY_INSERT [dbo].[Brewery] ON 

INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (1, N'The Saint Louis Brewery', N'7260 Southwest Ave.', N'63143')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (2, N'Alpha', N'4310 Fyler Ave', N'63116')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (3, N'Modern Brewery Co.', N'5231 Manchester ave.', N'63110')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (4, N'Urban Chestnut', N'4465 Manchester Ave', N'63110')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (5, N'2nd Shift Brewing', N'1601 Sublette Ave.', N'63110')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (6, N'Civil Life', N'3714 Holt Ave', N'63116')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (7, N'Earthbound Beer', N'2724 Cherokee St.', N'63118')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (8, N'Exit & Brewery', N'5055 State Highway Nÿ', N'63304')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (9, N'Greer Brewing Co.', N'16050 Manchester Rd.', N'63011')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (10, N'Heavy Riff Brewery', N'6413 Clayton Ave', N'63139')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (11, N'Kirkwood Station Brewing Company', N'105 E Jefferson Ave.', N'63122')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (12, N'Mackenzie Brewing Co.', N'932 Meramec Station Road', N'63088')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (13, N'Mark Twain Brewing Co.', N'422 N Main S', N'63401')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (14, N'Narrow Gauge Brewing Co.', N'1595 US-67', N'63031')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (15, N'Public House Brewing Co.', N'600 North Rolla Street', N'65401')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (16, N'Six Mile Bridge Beer', N'11841 Dorsett Rd', N'63043')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (17, N'Third Wheel Brewing', N'4008 I-70 North Outer Rd', N'63376')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (18, N'Trailhead Brewing Co.', N'921 S Riverside Dr', N'63301')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (19, N'Two Plumbers Brewery + Arcade', N'2236 1st Capitol Dr', N'63301')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (20, N'Wellbeing Brewing Co.', N'45 Progress Pkwy', N'63043')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (21, N'William K Busch Brewing Co', N'8047 Litzsinger Rd', N'63144')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (22, N'Morgan Street Brewery', N'721 N 2nd St', N'63102')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (23, N'Square One Brewery & Distillery', N'1727 Park Ave', N'63104')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (24, N'Perennial Artisan Ales', N'8125 Michigan Ave', N'63111')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (25, N'Ferguson Brewing Co.', N'418 S Florissant Rd', N'63135')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (26, N'Center Ice Brewery', N'3126 Olive St', N'63103')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (27, N'Charleville Brewing Co.', N'2101 Chouteau Ave', N'63103')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (28, N'Side Project', N'7458 Manchester Rd.', N'63143')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (29, N'Steampunk Brew Works', N'231 Lamp and Lantern Village', N'63017')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (30, N'4 Hands Brewing Co', N'1220 S 8th St', N'63104')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (31, N'Augusta Brew Haus', N'5521 Water St', N'63332')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (32, N'Griesedieck Brothers Brewery', N'P.O. Box 31203', N'63131')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (33, N'Good News Brewing Co', N'330 Sonderen St.', N'63366')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (34, N'O''Fallon Brewery', N'45 Progress Pkwy', N'63043')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (35, N'Cathedral Square Brewery', N'10070 Gravios Ave', N'63123')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (36, N'The BeerHouse', N'777 River City Casino Blvd', N'63125')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (37, N'Missouri Beer Company', N'22 West Industrial Dr', N'63366')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (38, N'Friendship Brewing Co', N'100 E Pitman Ave', N'63385')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (39, N'Bastard Brothers Brewing', N'2114 Penta Driveÿ', N'63049')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (40, N'4204 Main St. Brewing Co', N'4204 W. Main St', N'62002')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (41, N'Hofbrauhaus', N'123 St. Eugene Dr', N'62223')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (42, N'Hopskeller Brewing Co', N'116 E 3rd St', N'62298')
INSERT [dbo].[Brewery] ([BreweryID], [BreweryName], [BreweryAddress], [BreweryZip]) VALUES (43, N'Main & Mill Brewing Co', N'240 East Main St', N'63028')
SET IDENTITY_INSERT [dbo].[Brewery] OFF
SET IDENTITY_INSERT [dbo].[BreweryTour] ON 

INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (1, 1, N'Saturday                      ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (2, 1, N'Sunday                        ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (3, 4, N'Saturday                      ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (4, 24, N'Saturday                      ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (5, 34, N'Saturday                      ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (6, 40, N'Saturday                      ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (7, 40, N'Sunday                        ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (8, 13, N'Saturday                      ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (9, 16, N'Friday                        ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (10, 16, N'Saturday                      ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (11, 16, N'Sunday                        ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[BreweryTour] ([TourID], [BreweryID], [TourDay], [TourCost]) VALUES (12, 19, N'Saturday                      ', CAST(0.00 AS Decimal(2, 2)))
SET IDENTITY_INSERT [dbo].[BreweryTour] OFF
SET IDENTITY_INSERT [dbo].[Keyword] ON 

INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (1, N'Light                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (2, N'Lager                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (3, N'German                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (4, N'Peanut                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (5, N'Chocolate                     ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (6, N'Pumpkin                       ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (7, N'Spicy                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (8, N'Cinnamon                      ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (9, N'Orange                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (10, N'Coffee                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (11, N'Bitter                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (12, N'Peach                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (13, N'German                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (14, N'French                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (15, N'English                       ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (16, N'Irish                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (17, N'Scottish                      ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (18, N'Scotch                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (19, N'Hoppy                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (20, N'High Gravity                  ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (21, N'Dark                          ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (22, N'Fruity                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (23, N'Sweet                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (24, N'Citrus                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (25, N'Cherry                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (26, N'Honey                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (27, N'Wheat                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (28, N'Pilsner                       ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (29, N'Ale                           ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (30, N'Full Bodied                   ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (31, N'Medium Bodied                 ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (32, N'Oatmeal                       ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (33, N'IPA                           ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (34, N'Sour                          ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (35, N'Tart                          ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (36, N'Smooth                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (37, N'Refereshing                   ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (38, N'Pale                          ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (39, N'Straw colored                 ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (40, N'Maple                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (41, N'Belgium                       ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (42, N'Summer                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (43, N'Winter                        ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (44, N'Fall                          ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (45, N'Pale Ale                      ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (46, N'Hefferveisen                  ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (47, N'American                      ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (48, N'Dry                           ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (49, N'Stout                         ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (50, N'Raspberry                     ')
INSERT [dbo].[Keyword] ([KeywordID], [KeywordName]) VALUES (51, N'Porter                        ')
SET IDENTITY_INSERT [dbo].[Keyword] OFF
ALTER TABLE [dbo].[Beer]  WITH CHECK ADD FOREIGN KEY([BreweryID])
REFERENCES [dbo].[Brewery] ([BreweryID])
GO
ALTER TABLE [dbo].[Beer]  WITH CHECK ADD FOREIGN KEY([BreweryID])
REFERENCES [dbo].[Brewery] ([BreweryID])
GO
ALTER TABLE [dbo].[BeerKeyword]  WITH CHECK ADD FOREIGN KEY([BeerID])
REFERENCES [dbo].[Beer] ([BeerID])
GO
ALTER TABLE [dbo].[BeerKeyword]  WITH CHECK ADD FOREIGN KEY([BeerID])
REFERENCES [dbo].[Beer] ([BeerID])
GO
ALTER TABLE [dbo].[BeerKeyword]  WITH CHECK ADD FOREIGN KEY([KeywordID])
REFERENCES [dbo].[Keyword] ([KeywordID])
GO
ALTER TABLE [dbo].[BeerKeyword]  WITH CHECK ADD FOREIGN KEY([KeywordID])
REFERENCES [dbo].[Keyword] ([KeywordID])
GO
ALTER TABLE [dbo].[BreweryTour]  WITH CHECK ADD FOREIGN KEY([BreweryID])
REFERENCES [dbo].[Brewery] ([BreweryID])
GO
ALTER TABLE [dbo].[BreweryTour]  WITH CHECK ADD FOREIGN KEY([BreweryID])
REFERENCES [dbo].[Brewery] ([BreweryID])
GO
USE [master]
GO
ALTER DATABASE [Brewery] SET  READ_WRITE 
GO
