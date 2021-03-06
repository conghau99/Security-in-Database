USE [master]
GO
/****** Object:  Database [QLSV]    Script Date: 28/09/2020 9:04:46 AM ******/
CREATE DATABASE [QLSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLSV.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLSV_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLSV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSV] SET RECOVERY FULL 
GO
ALTER DATABASE [QLSV] SET  MULTI_USER 
GO
ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLSV] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLSV', N'ON'
GO
USE [QLSV]
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 28/09/2020 9:04:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOP](
	[MALOP] [varchar](20) NOT NULL,
	[TENLOP] [nvarchar](100) NOT NULL,
	[MANV] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MALOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 28/09/2020 9:04:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MANV] [varchar](20) NOT NULL,
	[HOTEN] [nvarchar](100) NOT NULL,
	[EMAIL] [varchar](20) NULL,
	[LUONG] [varbinary](256) NULL,
	[TENDN] [nvarchar](100) NOT NULL,
	[MATKHAU] [varbinary](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 28/09/2020 9:04:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MASV] [nvarchar](20) NOT NULL,
	[HOTEN] [nvarchar](100) NOT NULL,
	[NGAYSINH] [datetime] NULL,
	[DIACHI] [nvarchar](200) NULL,
	[MALOP] [varchar](20) NULL,
	[TENDN] [nvarchar](100) NOT NULL,
	[MATKHAU] [varbinary](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MASV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_LOP]    Script Date: 28/09/2020 9:04:46 AM ******/
ALTER TABLE [dbo].[LOP] ADD  CONSTRAINT [IX_LOP] UNIQUE NONCLUSTERED 
(
	[TENLOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [FK_LOP_NHANVIEN]
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SINHVIEN_LOP] FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOP] ([MALOP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SINHVIEN_LOP]
GO
/****** Object:  StoredProcedure [dbo].[SP_EDIT_ENCRYPT_NHANVIEN]    Script Date: 28/09/2020 9:04:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SP_EDIT_ENCRYPT_NHANVIEN](
	@MANV VARCHAR(20) ,
	@HOTEN NVARCHAR(100) ,
	@EMAIL VARCHAR(20) ,
	@LUONG VARCHAR(256),
	@TENDN NVARCHAR(100),
	@MATKHAU VARCHAR(32)
) AS
BEGIN
	DECLARE @MK VARBINARY (256)
	SET @MK = HASHBYTES('SHA1',@MATKHAU)

	UPDATE NHANVIEN
	SET HOTEN = @HOTEN, EMAIL = @EMAIL, LUONG = CONVERT(VARBINARY(256),@LUONG), TENDN = @TENDN, MATKHAU = @MK
	WHERE MANV = @MANV
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_ENCRYPT_NHANVIEN]    Script Date: 28/09/2020 9:04:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INS_ENCRYPT_NHANVIEN] (
	@MANV VARCHAR(20) ,
	@HOTEN NVARCHAR(100) ,
	@EMAIL VARCHAR(20) ,
	@LUONG VARCHAR(256),
	@TENDN NVARCHAR(100),
	@MATKHAU VARCHAR(32)  )
AS
BEGIN
	DECLARE @MK VARBINARY (256)
	SET @MK = HASHBYTES('SHA1',@MATKHAU)

	INSERT INTO NHANVIEN(MANV,HOTEN,EMAIL,LUONG,TENDN,MATKHAU)
	VALUES(@MANV,@HOTEN,@EMAIL,CONVERT(VARBINARY(256),@LUONG),@TENDN,@MK)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_ENCRYPT_SINHVIEN]    Script Date: 28/09/2020 9:04:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INS_ENCRYPT_SINHVIEN] (
	@MASV NVARCHAR(20) ,
	@HOTEN NVARCHAR(100) ,
	@NGAYSINH DATETIME ,
	@DIACHI NVARCHAR(200),
	@MALOP VARCHAR (20) , 
	@TENDN NVARCHAR(100), 
	@MATKHAU VARCHAR(256)  )
AS
BEGIN
	INSERT INTO SINHVIEN(MASV, HOTEN, NGAYSINH, DIACHI, MALOP, TENDN, MATKHAU)
	VALUES(@MASV, @HOTEN, @NGAYSINH, @DIACHI, @MALOP, @TENDN, CONVERT(VARBINARY(256),@MATKHAU))
END
GO

GO
USE [master]
GO
ALTER DATABASE [QLSV] SET  READ_WRITE 
GO
