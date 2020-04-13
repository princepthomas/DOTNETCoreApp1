----------########## DATABASE CREATION ##########----------
USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DOTNETCoreApp1')
BEGIN
	CREATE DATABASE [DOTNETCoreApp1]	
END
GO

----------########## USER CREATION ##########----------
USE [master]
GO

IF SUSER_ID('DOTNETCoreApp1_user') IS NULL
BEGIN
	CREATE LOGIN [DOTNETCoreApp1_user] WITH PASSWORD=N'A?HdcS/D8#w74*bQ', DEFAULT_DATABASE=[DOTNETCoreApp1], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
END
GO

USE [DOTNETCoreApp1]
GO

IF DATABASE_PRINCIPAL_ID('DOTNETCoreApp1_user') IS NULL
BEGIN
	CREATE USER [DOTNETCoreApp1_user] FOR LOGIN [DOTNETCoreApp1_user] WITH DEFAULT_SCHEMA=[dbo]	
	exec sp_addrolemember 'db_owner', 'DOTNETCoreApp1_user';
END
GO

----------########## TABLE CREATION ##########----------

USE [DOTNETCoreApp1]

IF NOT EXISTS (SELECT TOP 1 * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'request_log')
BEGIN
	CREATE TABLE [dbo].[request_log](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[request_date] [datetime] NULL,
	 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	) ON [PRIMARY]
END
GO
