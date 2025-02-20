USE [master]
GO
if exists (select name from sys.databases where name = 'N4CoreLiteDemoDB')
begin
	alter database [N4CoreLiteDemoDB] set single_user with rollback immediate -- veritabanı bağlantısını koparmak için özel sorgu
	drop database [N4CoreLiteDemoDB] -- veritabanını silen esas sorgu
end
go
/****** Object:  Database [N4CoreLiteDemoDB]    Script Date: 22.07.2024 12:19:31 ******/
CREATE DATABASE [N4CoreLiteDemoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'N4CoreLiteDemoDB', FILENAME = N'C:\Users\cagil\N4CoreLiteDemoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'N4CoreLiteDemoDB_log', FILENAME = N'C:\Users\cagil\N4CoreLiteDemoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [N4CoreLiteDemoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET  MULTI_USER 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [N4CoreLiteDemoDB] SET QUERY_STORE = OFF
GO
USE [N4CoreLiteDemoDB]
GO
/****** Object:  Table [dbo].[Ders]    Script Date: 22.07.2024 12:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [nvarchar](36) NULL,
	[Adi] [nvarchar](100) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Ders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenci]    Script Date: 24.07.2024 22:46:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenci](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [nvarchar](36) NULL,
	[SinifId] [int] NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Soyadi] [nvarchar](50) NOT NULL,
	[DogumTarihi] [datetime] NOT NULL,
	[MezunMu] [bit] NOT NULL,
	[Uyruk] [int] NOT NULL,
	[Cinsiyeti] [int] NOT NULL,
	[TcKimlikNo] [nvarchar](11) NULL,
	KullaniciAdi nvarchar(256) not null
 CONSTRAINT [PK_Ogrenci] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OgrenciDers]    Script Date: 24.07.2024 22:46:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrenciDers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [nvarchar](36) NULL,
	[OgrenciId] [int] NOT NULL,
	[DersId] [int] NOT NULL,
	[Not1] [decimal](5, 1) NULL,
	[Not2] [decimal](5, 1) NULL,
	[Not3] [decimal](5, 1) NULL,
 CONSTRAINT [PK_OgrenciDers] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sinif]    Script Date: 24.07.2024 22:46:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sinif](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [nvarchar](36) NULL,
	[Adi] [nvarchar](25) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Sinif] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ders] ON 
GO
INSERT [dbo].[Ders] ([Id], [Guid], [Adi], [IsDeleted]) VALUES (1, N'05411860-41EB-4204-BBEF-D13976106E52', N'Matematik', NULL)
GO
INSERT [dbo].[Ders] ([Id], [Guid], [Adi], [IsDeleted]) VALUES (2, N'616AA128-25BA-4C42-9B40-12F4035B5D34', N'Türkçe', NULL)
GO
INSERT [dbo].[Ders] ([Id], [Guid], [Adi], [IsDeleted]) VALUES (3, N'7E8C4E56-BADA-4476-B4F3-FE190C116374', N'Tarih', NULL)
GO
INSERT [dbo].[Ders] ([Id], [Guid], [Adi], [IsDeleted]) VALUES (4, N'D2601377-C34A-41A5-BD19-4D0C3ABE97B0', N'Fizik', NULL)
GO
SET IDENTITY_INSERT [dbo].[Ders] OFF
GO
SET IDENTITY_INSERT [dbo].[Ogrenci] ON 
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (1, N'A01F4E47-5A91-4494-B46D-5991C527CC02', 1, N'Ahmet', N'Yilmaz', CAST(N'2005-03-15T00:00:00.000' AS DateTime), 0, 1, 1, NULL, 'ahmet@yilmaz.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (2, N'C8FF16F2-E392-45B6-B87E-AE412F80D54A', 2, N'Ayse', N'Kara', CAST(N'2006-07-22T00:00:00.000' AS DateTime), 0, 1, 2, NULL, 'ayse@kara.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (3, N'464F2CCA-330B-4B60-A673-DD633B80B405', 3, N'Mehmet', N'Çelik', CAST(N'2004-01-30T00:00:00.000' AS DateTime), 1, 1, 1, NULL, 'mehmet@celik.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (4, N'7C4FCDBF-DDDC-4389-974D-D87F2D573156', 3, N'Fatma', N'Demir', CAST(N'2005-11-11T00:00:00.000' AS DateTime), 0, 1, 2, NULL, 'fatma@demir.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (5, N'5A7E26B3-CE63-406E-8212-6FF15C36CC76', 2, N'Ali', N'Sahin', CAST(N'2006-05-19T00:00:00.000' AS DateTime), 0, 1, 1, NULL, 'ali@sahin.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (6, N'4822F78A-3F30-4E68-9368-8C8C52BE4333', 1, N'Zeynep', N'Öztürk', CAST(N'2005-09-08T00:00:00.000' AS DateTime), 0, 1, 2, NULL, 'zeynep@ozturk.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (7, N'FEEBF103-7844-44D4-8DA6-EBF48B9F1205', 1, N'Emre', N'Yildirim', CAST(N'2004-12-25T00:00:00.000' AS DateTime), 0, 1, 1, NULL, 'emre@yildirim.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (8, N'B0F3C692-0256-4F2F-BAAD-C7D4C695C0F7', 2, N'Elif', N'Aydin', CAST(N'2006-04-02T00:00:00.000' AS DateTime), 0, 1, 2, NULL, 'elif@aydin.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (9, N'6EC784BD-F130-4D4C-8CFF-DE8F9534EDEB', 3, N'Michael', N'Townley', CAST(N'2005-08-14T00:00:00.000' AS DateTime), 0, 2, 1, NULL, 'michael@townley.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (10, N'A7D92E0D-EC49-4F19-9FC3-3C43051BA1D3', 3, N'Buse', N'Tas', CAST(N'2006-10-30T00:00:00.000' AS DateTime), 1, 1, 2, NULL, 'buse@tas.com')
GO
INSERT [dbo].[Ogrenci] ([Id], [Guid], [SinifId], [Adi], [Soyadi], [DogumTarihi], [MezunMu], [Uyruk], [Cinsiyeti], [TcKimlikNo], KullaniciAdi) VALUES (11, NEWID(), 3, N'Çağıl', N'Alsaç', CAST(N'1980-05-01T00:00:00.000' AS DateTime), 0, 1, 1, NULL, 'cagil@alsac.com')
GO
SET IDENTITY_INSERT [dbo].[Ogrenci] OFF
GO
SET IDENTITY_INSERT [dbo].[OgrenciDers] ON 
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (1, N'785AEA50-F75F-4AD3-AD44-D2360B8351EF', 1, 1, CAST(90.0 AS Decimal(5, 1)), CAST(80.0 AS Decimal(5, 1)), CAST(70.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (2, N'5992BCBD-3ECD-4917-BE2D-DC1DE07EAF5C', 2, 1, CAST(45.5 AS Decimal(5, 1)), CAST(50.5 AS Decimal(5, 1)), CAST(40.5 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (4, N'D2BFAA1A-AF0D-4124-887D-603EDB24A256', 3, 1, CAST(15.0 AS Decimal(5, 1)), CAST(95.0 AS Decimal(5, 1)), CAST(85.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (6, N'F4A2BA4F-9B85-4E62-81CB-80DF12029486', 3, 3, CAST(44.0 AS Decimal(5, 1)), CAST(33.5 AS Decimal(5, 1)), CAST(88.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (7, N'A7ADDF47-D4A1-4A05-A3B8-ADFF0B36A6C3', 4, 1, CAST(90.0 AS Decimal(5, 1)), CAST(95.0 AS Decimal(5, 1)), CAST(80.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (9, N'C4D50362-C309-4F46-97A5-0E3A24D3F742', 4, 3, CAST(99.0 AS Decimal(5, 1)), CAST(78.0 AS Decimal(5, 1)), CAST(84.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (10, N'DB86FD53-6902-44DD-BE71-4311844122A0', 5, 1, CAST(64.0 AS Decimal(5, 1)), CAST(86.0 AS Decimal(5, 1)), CAST(75.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (12, N'6A222FB7-6D43-40C4-B4CB-8CDEA19A1B86', 6, 1, CAST(99.0 AS Decimal(5, 1)), CAST(77.0 AS Decimal(5, 1)), CAST(88.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (13, N'14E36EC5-95CE-49A9-9EE9-3E6F77955EFC', 7, 1, CAST(55.0 AS Decimal(5, 1)), CAST(100.0 AS Decimal(5, 1)), CAST(100.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (14, N'5E195DA4-4EA1-453E-9464-D6B732CDD00F', 8, 1, CAST(15.0 AS Decimal(5, 1)), CAST(50.5 AS Decimal(5, 1)), CAST(70.5 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (16, N'7E0FCE62-8E42-4EAA-B3A2-215B5AFD4F25', 9, 1, CAST(36.0 AS Decimal(5, 1)), CAST(49.5 AS Decimal(5, 1)), CAST(99.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (18, N'EDAF403F-09D6-4C64-91E0-5D10C6FC5406', 9, 3, CAST(35.0 AS Decimal(5, 1)), CAST(96.0 AS Decimal(5, 1)), CAST(66.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (19, N'0FD5C0E1-81C8-4772-941C-BFDA3C1C5E5F', 10, 1, CAST(88.0 AS Decimal(5, 1)), CAST(42.0 AS Decimal(5, 1)), CAST(76.0 AS Decimal(5, 1)))
GO
INSERT [dbo].[OgrenciDers] ([Id], [Guid], [OgrenciId], [DersId], [Not1], [Not2], [Not3]) VALUES (21, N'733D3435-7FA5-4B2F-8606-82EF85837DAE', 10, 3, CAST(56.0 AS Decimal(5, 1)), CAST(76.0 AS Decimal(5, 1)), CAST(86.0 AS Decimal(5, 1)))
GO
SET IDENTITY_INSERT [dbo].[OgrenciDers] OFF
GO
SET IDENTITY_INSERT [dbo].[Sinif] ON 
GO
INSERT [dbo].[Sinif] ([Id], [Guid], [Adi], [CreateDate], [CreatedBy], [UpdateDate], [UpdatedBy], [IsDeleted]) VALUES (1, N'4CD52030-11C6-4B40-A5B2-70D018A6D9E6', N'1. Sinif', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sinif] ([Id], [Guid], [Adi], [CreateDate], [CreatedBy], [UpdateDate], [UpdatedBy], [IsDeleted]) VALUES (2, N'C31C8D27-EB89-4CA5-BE37-05D3854DF4AA', N'2. Sinif', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sinif] ([Id], [Guid], [Adi], [CreateDate], [CreatedBy], [UpdateDate], [UpdatedBy], [IsDeleted]) VALUES (3, N'33889411-3F34-4359-AFD9-C20E514236E6', N'3. Sinif', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sinif] OFF
GO
ALTER TABLE [dbo].[Ogrenci]  WITH CHECK ADD  CONSTRAINT [FK_Ogrenci_Sinif] FOREIGN KEY([SinifId])
REFERENCES [dbo].[Sinif] ([Id])
GO
ALTER TABLE [dbo].[Ogrenci] CHECK CONSTRAINT [FK_Ogrenci_Sinif]
GO
ALTER TABLE [dbo].[OgrenciDers]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciDers_Ders] FOREIGN KEY([DersId])
REFERENCES [dbo].[Ders] ([Id])
GO
ALTER TABLE [dbo].[OgrenciDers] CHECK CONSTRAINT [FK_OgrenciDers_Ders]
GO
ALTER TABLE [dbo].[OgrenciDers]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciDers_Ogrenci] FOREIGN KEY([OgrenciId])
REFERENCES [dbo].[Ogrenci] ([Id])
GO
ALTER TABLE [dbo].[OgrenciDers] CHECK CONSTRAINT [FK_OgrenciDers_Ogrenci]
GO

alter table OgrenciDers add constraint UC_OgrenciDers unique (OgrenciId, DersId)
go
alter table Ogrenci add constraint UC_Ogrenci unique (KullaniciAdi)
go
create function EsitMi (@deger1 nvarchar(MAX), @deger2 nvarchar(MAX)) returns bit
as
begin
	declare @esitMi bit = 0
	select @esitMi = 1 where TRIM(@deger1 collate Turkish_CI_AS) = TRIM(@deger2 collate Turkish_CI_AS)
	return @esitMi
end
go
create function DersOrtalamaHesapla (@not1 decimal(5, 1), @not2 decimal(5,1), @not3 decimal(5, 1)) returns decimal(5, 1)
as
begin
	declare @ortalama decimal(5, 1)

	declare @not1carpan decimal(5, 1)

	declare @not2carpan decimal(5, 1) = 0.2
	declare @not3carpan decimal(5, 1) = 0.6

	set @not1carpan = 0.2

	set @ortalama = @not1 * @not1carpan + @not2 * @not2carpan + @not3 * @not3carpan

	return @ortalama
end
go
create procedure NotOrtalamaHesapla (@ogrenciId int, @notOrtalama decimal(5, 1) output)
as
begin
	select @notOrtalama = AVG(dbo.DersOrtalamaHesapla(od.Not1, od.Not2, od.Not3)) from OgrenciDers od where od.OgrenciId = @ogrenciId
end
go
create view OgrenciRaporuView
as
select ISNULL(CAST(ROW_NUMBER() over (order by o.Adi, o.Soyadi, o.DogumTarihi) as int), 0) Id, CAST(null as nvarchar(36)) Guid, o.Id OgrenciId, 
o.Guid OgrenciGuid, case when s.IsDeleted = 1 then '[Silinmiş] ' else '' end + s.Adi Sinif, o.Adi + ' ' + o.Soyadi OgrenciAdiSoyadi, o.DogumTarihi OgrenciDogumTarihi,
o.MezunMu OgrenciMezuniyet, o.Uyruk OgrenciUyruk, o.Cinsiyeti OgrenciCinsiyet, o.TcKimlikNo OgrenciTcKimlikNo, o.KullaniciAdi OgrenciKullaniciAdi,
case when d.IsDeleted = 1 then '[Silinmiş] ' else '' end + d.Adi Ders, od.Not1 DersNotu1, od.Not2 DersNotu2, od.Not3 DersNotu3, dbo.DersOrtalamaHesapla(od.Not1, od.Not2, od.Not3) DersOrtalamasi,
s.Id SinifId, d.Id DersId
from Sinif s left outer join Ogrenci o on s.Id = o.SinifId
left outer join OgrenciDers od on o.Id = od.OgrenciId
left outer join Ders d on od.DersId = d.Id
go
