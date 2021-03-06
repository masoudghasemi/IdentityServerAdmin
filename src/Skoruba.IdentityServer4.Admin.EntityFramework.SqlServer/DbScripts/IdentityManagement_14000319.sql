/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.1000)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [IdentityManagement]    Script Date: 6/9/2021 5:18:12 PM ******/
CREATE DATABASE [IdentityManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IdentityManagement', FILENAME = N'D:\Databases\IdentityManagement.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IdentityManagement_log', FILENAME = N'D:\Databases\IdentityManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IdentityManagement] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IdentityManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IdentityManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IdentityManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IdentityManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IdentityManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IdentityManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [IdentityManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IdentityManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IdentityManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IdentityManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IdentityManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IdentityManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IdentityManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IdentityManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IdentityManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IdentityManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IdentityManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IdentityManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IdentityManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IdentityManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IdentityManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IdentityManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IdentityManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IdentityManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [IdentityManagement] SET  MULTI_USER 
GO
ALTER DATABASE [IdentityManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IdentityManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IdentityManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IdentityManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IdentityManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IdentityManagement', N'ON'
GO
ALTER DATABASE [IdentityManagement] SET QUERY_STORE = OFF
GO
USE [IdentityManagement]
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
USE [IdentityManagement]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceClaims]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceProperties]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
	[AllowedAccessTokenSigningAlgorithms] [nvarchar](100) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceScopes]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceSecrets]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeProperties]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLog]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Event] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
	[SubjectIdentifier] [nvarchar](max) NULL,
	[SubjectName] [nvarchar](max) NULL,
	[SubjectType] [nvarchar](max) NULL,
	[SubjectAdditionalData] [nvarchar](max) NULL,
	[Action] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AuditLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 6/9/2021 5:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[RequireConsent] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ConsentLifetime] [int] NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[UserSsoLifetime] [int] NULL,
	[UserCodeType] [nvarchar](100) NULL,
	[DeviceCodeLifetime] [int] NOT NULL,
	[NonEditable] [bit] NOT NULL,
	[AllowedIdentityTokenSigningAlgorithms] [nvarchar](100) NULL,
	[RequireRequestObject] [bit] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataProtectionKeys]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataProtectionKeys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FriendlyName] [nvarchar](max) NULL,
	[Xml] [nvarchar](max) NULL,
 CONSTRAINT [PK_DataProtectionKeys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCodes]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCodes](
	[UserCode] [nvarchar](200) NOT NULL,
	[DeviceCode] [nvarchar](200) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
 CONSTRAINT [PK_DeviceCodes] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceClaims]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceProperties]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[MessageTemplate] [nvarchar](max) NULL,
	[Level] [nvarchar](128) NULL,
	[TimeStamp] [datetimeoffset](7) NOT NULL,
	[Exception] [nvarchar](max) NULL,
	[LogEvent] [nvarchar](max) NULL,
	[Properties] [nvarchar](max) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Data] [nvarchar](max) NOT NULL,
	[ConsumedTime] [datetime2](7) NULL,
	[Description] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
 CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 6/9/2021 5:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191119163918_DbInit', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191119163936_DbInit', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191119163952_DbInit', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191119164007_DbInit', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191119164022_DbInit', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200221180348_DbInit', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200419130339_ChangeAuditLogToLong', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201030101834_UpdateIdentityServerToVersion4', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201030101938_UpdateIdentityServerToVersion4', N'5.0.5')
SET IDENTITY_INSERT [dbo].[ApiResources] ON 

INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Created], [Updated], [LastAccessed], [NonEditable], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument]) VALUES (1, 1, N'skoruba_identity_admin_api', NULL, NULL, CAST(N'2021-06-07T13:30:18.9907269' AS DateTime2), NULL, NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[ApiResources] OFF
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] ON 

INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (1, N'skoruba_identity_admin_api', 1)
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] OFF
SET IDENTITY_INSERT [dbo].[ApiScopeClaims] ON 

INSERT [dbo].[ApiScopeClaims] ([Id], [Type], [ScopeId]) VALUES (1, N'role', 1)
INSERT [dbo].[ApiScopeClaims] ([Id], [Type], [ScopeId]) VALUES (2, N'name', 1)
INSERT [dbo].[ApiScopeClaims] ([Id], [Type], [ScopeId]) VALUES (3, N'profile', 2)
SET IDENTITY_INSERT [dbo].[ApiScopeClaims] OFF
SET IDENTITY_INSERT [dbo].[ApiScopes] ON 

INSERT [dbo].[ApiScopes] ([Id], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Enabled]) VALUES (1, N'skoruba_identity_admin_api', N'skoruba_identity_admin_api', NULL, 1, 0, 1, 1)
INSERT [dbo].[ApiScopes] ([Id], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Enabled]) VALUES (2, N'api1.read', N'Read Access to API #1', N'Read Access to API #1', 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[ApiScopes] OFF
SET IDENTITY_INSERT [dbo].[AuditLog] ON 

INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (1, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000145-0004-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 2,
    "PageSize": 10
  }
}', CAST(N'2021-06-07T18:25:11.7916086' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (2, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800004fa-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 2,
    "PageSize": 10
  }
}', CAST(N'2021-06-07T18:25:25.1381522' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (3, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000018-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-07T18:25:31.4147249' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (4, N'RolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000001e-0000-ef00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Roles",
  "HttpMethod": "GET"
}', N'{
  "Roles": {
    "PageSize": 10,
    "TotalCount": 1,
    "Roles": [
      {
        "Name": "SkorubaIdentityAdminAdministrator",
        "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
      }
    ]
  }
}', CAST(N'2021-06-07T18:25:48.1911772' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (5, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000093-0003-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 2,
    "PageSize": 10
  }
}', CAST(N'2021-06-07T18:28:04.4089711' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (6, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000a8-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-07T18:28:46.1497468' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (7, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000095-0003-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-07T18:28:54.6839386' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (8, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000aa-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-07T18:29:01.6117809' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (9, N'RolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800002a9-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Roles",
  "HttpMethod": "GET"
}', N'{
  "Roles": {
    "PageSize": 10,
    "TotalCount": 1,
    "Roles": [
      {
        "Name": "SkorubaIdentityAdminAdministrator",
        "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
      }
    ]
  }
}', CAST(N'2021-06-07T18:39:45.3131044' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (10, N'RolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "uB6GKWIknoZLSuHqbk5oRA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000074-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Roles",
  "HttpMethod": "GET"
}', N'{
  "Roles": {
    "PageSize": 10,
    "TotalCount": 1,
    "Roles": [
      {
        "Name": "SkorubaIdentityAdminAdministrator",
        "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
      }
    ]
  }
}', CAST(N'2021-06-07T18:39:54.1849680' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (11, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000a7-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 2,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T08:12:44.4545078' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (12, N'ApiResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000010e-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiResources",
  "HttpMethod": "GET"
}', N'{
  "ApiResources": {
    "PageSize": 10,
    "TotalCount": 1,
    "ApiResources": [
      {
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "Enabled": true,
        "UserClaims": [],
        "ShowInDiscoveryDocument": true,
        "AllowedAccessTokenSigningAlgorithms": [],
        "Scopes": []
      }
    ]
  }
}', CAST(N'2021-06-08T08:13:15.2834361' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (13, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000011-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 2,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T08:13:41.5179928' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (14, N'ClientAddedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001b1-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client",
  "HttpMethod": "POST"
}', N'{
  "Client": {
    "ClientType": "Web",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": false,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": true,
    "AlwaysIncludeUserClaimsInIdToken": false,
    "AlwaysSendClientClaims": false,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 0,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": false,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": true,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": false,
    "PostLogoutRedirectUris": [],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [],
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T08:24:01.9864196' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (15, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001b3-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": false,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": true,
    "AlwaysIncludeUserClaimsInIdToken": false,
    "AlwaysSendClientClaims": false,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": false,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": true,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": false,
    "PostLogoutRedirectUris": [],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [],
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T08:24:02.4551894' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (16, N'ClientSecretsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000007d-0004-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ClientSecrets/3",
  "HttpMethod": "GET"
}', N'{
  "ClientId": 3,
  "Secrets": []
}', CAST(N'2021-06-08T08:38:28.5107684' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (17, N'ClientSecretAddedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000504-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ClientSecrets/3",
  "HttpMethod": "POST"
}', N'{
  "Type": "SharedSecret",
  "Expiration": "2021-06-30T00:00:00",
  "ClientId": 3
}', CAST(N'2021-06-08T08:39:01.7356345' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (18, N'ClientSecretsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001b5-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ClientSecrets/3",
  "HttpMethod": "GET"
}', N'{
  "ClientId": 3,
  "Secrets": [
    {
      "Item1": 2,
      "Item2": "SharedSecret",
      "Item3": "2021-06-30T00:00:00"
    }
  ]
}', CAST(N'2021-06-08T08:39:01.8269738' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (19, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000b3-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": false,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": true,
    "AlwaysIncludeUserClaimsInIdToken": false,
    "AlwaysSendClientClaims": false,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": false,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": true,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": false,
    "PostLogoutRedirectUris": [],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T08:39:10.3624595' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (20, N'ClientSecretsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000b7-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ClientSecrets/3",
  "HttpMethod": "GET"
}', N'{
  "ClientId": 3,
  "Secrets": [
    {
      "Item1": 2,
      "Item2": "SharedSecret",
      "Item3": "2021-06-30T00:00:00"
    }
  ]
}', CAST(N'2021-06-08T08:39:19.0437452' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (21, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000bd-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T08:44:47.0869858' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (22, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001b9-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "updated_at",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "locale",
      "profile"
    ]
  }
}', CAST(N'2021-06-08T08:44:53.9301980' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (23, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001bb-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T08:45:06.8475722' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (24, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000097-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/2",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 2,
    "Name": "openid",
    "DisplayName": "Your user identifier",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": true,
    "Emphasize": false,
    "UserClaims": [
      "sub"
    ]
  }
}', CAST(N'2021-06-08T08:45:09.2571976' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (25, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000009b-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T08:45:16.6773280' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (26, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000009d-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/1",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 1,
    "Name": "roles",
    "DisplayName": "Roles",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "role"
    ]
  }
}', CAST(N'2021-06-08T08:45:19.7445733' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (27, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000c0-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T08:45:27.8672185' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (28, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000c2-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/4",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 4,
    "Name": "email",
    "DisplayName": "Your email address",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "email_verified",
      "email"
    ]
  }
}', CAST(N'2021-06-08T08:45:29.9989269' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (29, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000c4-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T08:45:36.8980883' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (30, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000009f-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/5",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 5,
    "Name": "address",
    "DisplayName": "Your address",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "address"
    ]
  }
}', CAST(N'2021-06-08T08:45:39.1858736' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (31, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000013-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T08:45:45.9247980' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (32, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000c8-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 1,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T08:45:58.1081176' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (33, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000016-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T08:48:40.8040208' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (34, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000a3-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "updated_at",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "locale",
      "profile"
    ]
  }
}', CAST(N'2021-06-08T08:48:43.4134368' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (35, N'ApiScopeAddedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000aa-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScope",
  "HttpMethod": "POST"
}', N'{
  "ApiScope": {
    "ShowInDiscoveryDocument": true,
    "Id": 0,
    "Name": "api1.read",
    "DisplayName": "Read Access to API #1",
    "Description": "Read Access to API #1",
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "profile"
    ],
    "UserClaimsItems": "[\"profile\"]",
    "Enabled": true
  }
}', CAST(N'2021-06-08T08:50:12.9977610' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (36, N'ApiScopeRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000000c-0000-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScope/2",
  "HttpMethod": "GET"
}', N'{
  "ApiScopes": {
    "ShowInDiscoveryDocument": true,
    "Id": 2,
    "Name": "api1.read",
    "DisplayName": "Read Access to API #1",
    "Description": "Read Access to API #1",
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "profile"
    ],
    "Enabled": true
  }
}', CAST(N'2021-06-08T08:50:13.1206798' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (37, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000081-0004-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": false,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": true,
    "AlwaysIncludeUserClaimsInIdToken": false,
    "AlwaysSendClientClaims": false,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": false,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": true,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": false,
    "PostLogoutRedirectUris": [],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T08:50:23.8232748' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (38, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000081-0004-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": false,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": true,
    "AlwaysIncludeUserClaimsInIdToken": false,
    "AlwaysSendClientClaims": false,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": false,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": true,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": false,
    "PostLogoutRedirectUris": [],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedGrantTypesItems": "[\"hybrid\",\"client_credentials\"]",
    "AllowedScopes": [
      "email",
      "profile",
      "openid",
      "api1.read"
    ],
    "AllowedScopesItems": "[\"email\",\"profile\",\"openid\",\"api1.read\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T08:50:27.6238127' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (39, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000156-0003-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "email",
      "profile",
      "openid",
      "api1.read"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T08:50:27.8970224' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (40, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000083-0004-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": true,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": false,
        "AlwaysIncludeUserClaimsInIdToken": true,
        "AlwaysSendClientClaims": true,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "net4mvcclient",
        "ClientName": ".NET 4 MVC website",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 3,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": true,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 3,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T08:50:42.8951130' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (41, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000085-0004-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "email",
      "profile",
      "openid",
      "api1.read"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T08:50:50.5600225' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (42, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000008b-0004-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": true,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": false,
        "AlwaysIncludeUserClaimsInIdToken": true,
        "AlwaysSendClientClaims": true,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "net4mvcclient",
        "ClientName": ".NET 4 MVC website",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 3,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": true,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 3,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T09:00:01.7962327' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (43, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000031c-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "email",
      "profile",
      "openid",
      "api1.read"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:00:06.2752305' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (44, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000b9-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "email",
      "profile",
      "openid",
      "api1.read"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:00:37.5432461' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (45, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000b9-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "email",
      "profile",
      "openid",
      "api1.read"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedGrantTypesItems": "[\"hybrid\",\"client_credentials\"]",
    "AllowedScopes": [
      "email",
      "profile",
      "openid",
      "api1.read"
    ],
    "AllowedScopesItems": "[\"email\",\"profile\",\"openid\",\"api1.read\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": true,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:00:38.5441491' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (46, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000015-0000-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "api1.read",
      "profile",
      "email",
      "openid"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": true,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:00:38.6400186' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (47, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000097-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "api1.read",
      "profile",
      "email",
      "openid"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": true,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:01:13.4073683' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (48, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000097-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "api1.read",
      "profile",
      "email",
      "openid"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": true,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedGrantTypesItems": "[\"hybrid\",\"client_credentials\"]",
    "AllowedScopes": [
      "api1.read",
      "profile",
      "email",
      "openid"
    ],
    "AllowedScopesItems": "[\"api1.read\",\"profile\",\"email\",\"openid\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:01:14.1757880' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (49, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000d7-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:01:14.4753933' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (50, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000050c-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": true,
        "AllowOfflineAccess": true,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": false,
        "AlwaysIncludeUserClaimsInIdToken": true,
        "AlwaysSendClientClaims": true,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "net4mvcclient",
        "ClientName": ".NET 4 MVC website",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 3,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": true,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 3,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T09:03:43.5177994' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (51, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000063-0001-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/1",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": false,
    "AllowOfflineAccess": false,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": true,
    "AlwaysIncludeUserClaimsInIdToken": false,
    "AlwaysSendClientClaims": false,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "skoruba_identity_admin",
    "ClientName": "skoruba_identity_admin",
    "ClientUri": "https://localhost:44303",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 1,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": false,
    "PostLogoutRedirectUris": [
      "https://localhost:44303/signout-callback-oidc"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44303/signin-oidc"
    ],
    "AllowedCorsOrigins": [
      "https://localhost:44303"
    ],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [
      "email",
      "profile",
      "roles",
      "openid"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 1,
        "Value": "tvzpwTHl+cZB7h0GjO+QlJ0Wy15z+quGoqLRWGMZjzM=",
        "Created": "2021-06-07T13:30:19.0806898"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:03:46.8056510' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (52, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000dd-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": true,
        "AllowOfflineAccess": true,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": false,
        "AlwaysIncludeUserClaimsInIdToken": true,
        "AlwaysSendClientClaims": true,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "net4mvcclient",
        "ClientName": ".NET 4 MVC website",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 3,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": true,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 3,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T09:03:59.2145995' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (53, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000050e-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:04:01.5837852' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (54, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000bf-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:05:06.4680313' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (55, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000bf-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid",
      "client_credentials"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedGrantTypesItems": "[\"authorization_code\"]",
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "AllowedScopesItems": "[\"openid\",\"profile\",\"api1.read\",\"email\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:05:06.6445040' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (56, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000322-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:05:06.7318720' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (57, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000c0-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:19:56.6556829' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (58, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000127-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:20:06.8566787' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (59, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000127-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "authorization_code"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedGrantTypesItems": "[\"hybrid\"]",
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "AllowedScopesItems": "[\"openid\",\"profile\",\"api1.read\",\"email\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:20:07.0378433' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (60, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000025-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:20:07.1546838' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (61, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000cd-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:25:57.0786117' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (62, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000e4-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:36:32.2844927' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (63, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000161-0003-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:36:44.8032768' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (64, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000161-0003-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedGrantTypesItems": "[\"implicit\"]",
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "AllowedScopesItems": "[\"openid\",\"profile\",\"api1.read\",\"email\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:36:45.0202268' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (65, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000035b-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:36:45.0890490' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (66, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000d7-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:38:47.7603078' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (67, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000e8-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:38:59.4382229' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (68, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000e8-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "api1.read",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedGrantTypesItems": "[\"implicit\"]",
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "AllowedScopesItems": "[\"openid\",\"profile\",\"email\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:38:59.6734463' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (69, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "HhWL3FtUOPdj0_DqJj9vlA"
    },
    {
      "Type": "sid",
      "Value": "C650C080EA7DDDCD31BD6AE53A9F52BA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623074074"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000001e-0000-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:38:59.7825980' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (70, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "jds3tXcDVATgatGKlPOhKg"
    },
    {
      "Type": "sid",
      "Value": "D71BA5379E5BD16BF2A3D50D79A945DA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129443"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000de-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T09:49:45.9873170' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (71, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "jds3tXcDVATgatGKlPOhKg"
    },
    {
      "Type": "sid",
      "Value": "D71BA5379E5BD16BF2A3D50D79A945DA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129443"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000013e-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T09:49:51.9919537' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (72, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "jds3tXcDVATgatGKlPOhKg"
    },
    {
      "Type": "sid",
      "Value": "D71BA5379E5BD16BF2A3D50D79A945DA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129443"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000033c-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T09:50:02.0511996' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (73, N'UserClaimsSavedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "jds3tXcDVATgatGKlPOhKg"
    },
    {
      "Type": "sid",
      "Value": "D71BA5379E5BD16BF2A3D50D79A945DA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129443"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003d-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "POST"
}', N'{
  "Claims": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimType": "Permisssions",
    "ClaimValue": "about,contactus",
    "ClaimId": 0,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T09:50:45.7218546' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (74, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "jds3tXcDVATgatGKlPOhKg"
    },
    {
      "Type": "sid",
      "Value": "D71BA5379E5BD16BF2A3D50D79A945DA"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129443"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003f-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "Permisssions",
        "ClaimValue": "about,contactus",
        "ClaimId": 2,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T09:50:45.8119257' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (75, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000033e-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": true,
        "AllowOfflineAccess": true,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": false,
        "AlwaysIncludeUserClaimsInIdToken": true,
        "AlwaysSendClientClaims": true,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "net4mvcclient",
        "ClientName": ".NET 4 MVC website",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 3,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": true,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 3,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T09:57:20.1314613' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (76, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000521-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T09:57:25.5659638' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (77, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000348-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "Permisssions",
        "ClaimValue": "about,contactus",
        "ClaimId": 2,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T10:42:28.9602294' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (78, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000006d-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T10:43:12.7725685' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (79, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000034c-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T10:43:40.3749462' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (80, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000071-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/1",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 1,
    "Name": "roles",
    "DisplayName": "Roles",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "role"
    ]
  }
}', CAST(N'2021-06-08T10:43:42.3091269' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (81, N'IdentityResourcePropertiesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000f9-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResourceProperties/1",
  "HttpMethod": "GET"
}', N'{
  "IdentityResourceProperties": {
    "IdentityResourcePropertyId": 0,
    "IdentityResourceId": 1,
    "IdentityResourceName": "roles",
    "IdentityResourceProperties": [],
    "TotalCount": 0,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T10:43:54.6473826' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (82, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000073-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/1",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 1,
    "Name": "roles",
    "DisplayName": "Roles",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "role"
    ]
  }
}', CAST(N'2021-06-08T10:44:00.3818854' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (83, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000fb-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T10:44:01.3655944' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (84, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000075-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "updated_at",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "locale",
      "profile"
    ]
  }
}', CAST(N'2021-06-08T10:44:07.7330353' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (85, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000077-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T10:44:17.6535339' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (86, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000f2-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 2,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      },
      {
        "ShowInDiscoveryDocument": true,
        "Id": 2,
        "Name": "api1.read",
        "DisplayName": "Read Access to API #1",
        "Description": "Read Access to API #1",
        "Required": false,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T10:44:31.5899524' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (87, N'ApiScopeRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003c5-0002-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopeDelete/2",
  "HttpMethod": "GET"
}', N'{
  "ApiScopes": {
    "ShowInDiscoveryDocument": true,
    "Id": 2,
    "Name": "api1.read",
    "DisplayName": "Read Access to API #1",
    "Description": "Read Access to API #1",
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "profile"
    ],
    "Enabled": true
  }
}', CAST(N'2021-06-08T10:44:41.6555993' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (88, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000350-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 2,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      },
      {
        "ShowInDiscoveryDocument": true,
        "Id": 2,
        "Name": "api1.read",
        "DisplayName": "Read Access to API #1",
        "Description": "Read Access to API #1",
        "Required": false,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T10:44:44.1729985' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (89, N'ApiResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000079-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiResources",
  "HttpMethod": "GET"
}', N'{
  "ApiResources": {
    "PageSize": 10,
    "TotalCount": 1,
    "ApiResources": [
      {
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "Enabled": true,
        "UserClaims": [],
        "ShowInDiscoveryDocument": true,
        "AllowedAccessTokenSigningAlgorithms": [],
        "Scopes": []
      }
    ]
  }
}', CAST(N'2021-06-08T10:44:50.3866180' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (90, N'RolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000f6-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Roles",
  "HttpMethod": "GET"
}', N'{
  "Roles": {
    "PageSize": 10,
    "TotalCount": 1,
    "Roles": [
      {
        "Name": "SkorubaIdentityAdminAdministrator",
        "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
      }
    ]
  }
}', CAST(N'2021-06-08T10:44:53.7067555' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (91, N'RoleUsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000004e-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/RoleUsers/8711c6ee-b8db-4c52-b202-82cc2e551878",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T10:44:59.7953256' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (92, N'RoleRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000004e-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/RoleUsers/8711c6ee-b8db-4c52-b202-82cc2e551878",
  "HttpMethod": "GET"
}', N'{
  "Role": {
    "Name": "SkorubaIdentityAdminAdministrator",
    "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
  }
}', CAST(N'2021-06-08T10:44:59.8604770' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (93, N'RolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000050-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Roles",
  "HttpMethod": "GET"
}', N'{
  "Roles": {
    "PageSize": 10,
    "TotalCount": 1,
    "Roles": [
      {
        "Name": "SkorubaIdentityAdminAdministrator",
        "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
      }
    ]
  }
}', CAST(N'2021-06-08T10:45:07.3836716' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (94, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000f8-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": true,
        "AllowOfflineAccess": true,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": false,
        "AlwaysIncludeUserClaimsInIdToken": true,
        "AlwaysSendClientClaims": true,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "net4mvcclient",
        "ClientName": ".NET 4 MVC website",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 3,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": true,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 3,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T10:48:46.0978845' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (95, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "hoB8eGeZvsFnciZSY3pOHw"
    },
    {
      "Type": "sid",
      "Value": "7FBF58B3996F5DE984092C62DBC33944"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623129725"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000007d-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T10:48:48.6016254' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (96, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "KKOrJe0wZD_r_AyA4I0lpw"
    },
    {
      "Type": "sid",
      "Value": "517704986EB992C53BF5061D73092DF8"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623133272"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000069-0001-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:06:46.1187329' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (97, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "KKOrJe0wZD_r_AyA4I0lpw"
    },
    {
      "Type": "sid",
      "Value": "517704986EB992C53BF5061D73092DF8"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623133272"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000494-0005-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 2,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      },
      {
        "ShowInDiscoveryDocument": true,
        "Id": 2,
        "Name": "api1.read",
        "DisplayName": "Read Access to API #1",
        "Description": "Read Access to API #1",
        "Required": false,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T11:07:28.6169514' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (98, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "KKOrJe0wZD_r_AyA4I0lpw"
    },
    {
      "Type": "sid",
      "Value": "517704986EB992C53BF5061D73092DF8"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623133272"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000496-0005-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T11:07:36.5085191' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (99, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "KKOrJe0wZD_r_AyA4I0lpw"
    },
    {
      "Type": "sid",
      "Value": "517704986EB992C53BF5061D73092DF8"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623133272"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000000e-0003-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": true,
        "AllowOfflineAccess": true,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": false,
        "AlwaysIncludeUserClaimsInIdToken": true,
        "AlwaysSendClientClaims": true,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "net4mvcclient",
        "ClientName": ".NET 4 MVC website",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 3,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": true,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 3,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T11:07:56.8336881' AS DateTime2))
GO
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (100, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "KKOrJe0wZD_r_AyA4I0lpw"
    },
    {
      "Type": "sid",
      "Value": "517704986EB992C53BF5061D73092DF8"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623133272"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000e6-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:07:58.7876328' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (101, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "XIWF6uPyg9PQ0jRteRzWNg"
    },
    {
      "Type": "sid",
      "Value": "F229AB42CF9A0DC35BC4A6C959AE8054"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623134416"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000ee-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:10:17.9532280' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (102, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "XIWF6uPyg9PQ0jRteRzWNg"
    },
    {
      "Type": "sid",
      "Value": "F229AB42CF9A0DC35BC4A6C959AE8054"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623134416"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000101-0005-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:10:27.8750272' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (103, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "XIWF6uPyg9PQ0jRteRzWNg"
    },
    {
      "Type": "sid",
      "Value": "F229AB42CF9A0DC35BC4A6C959AE8054"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623134416"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002d-0000-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:10:35.4195336' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (104, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "XIWF6uPyg9PQ0jRteRzWNg"
    },
    {
      "Type": "sid",
      "Value": "F229AB42CF9A0DC35BC4A6C959AE8054"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623134416"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002d-0000-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedGrantTypesItems": "[\"implicit\"]",
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "AllowedScopesItems": "[\"openid\",\"profile\",\"email\",\"roles\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:10:36.7996795' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (105, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "XIWF6uPyg9PQ0jRteRzWNg"
    },
    {
      "Type": "sid",
      "Value": "F229AB42CF9A0DC35BC4A6C959AE8054"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623134416"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000009-0001-f500-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:10:37.3507393' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (106, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "jNYI-gwZ6b4ys-uSioUq8Q"
    },
    {
      "Type": "sid",
      "Value": "E2CFB7F3F96FB2C0D1371E52497EA0EF"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623134629"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000036e-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:21:07.3581782' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (107, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "jNYI-gwZ6b4ys-uSioUq8Q"
    },
    {
      "Type": "sid",
      "Value": "E2CFB7F3F96FB2C0D1371E52497EA0EF"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623134629"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000155-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:21:16.4093267' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (108, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "jNYI-gwZ6b4ys-uSioUq8Q"
    },
    {
      "Type": "sid",
      "Value": "E2CFB7F3F96FB2C0D1371E52497EA0EF"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623134629"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000155-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedGrantTypesItems": "[\"hybrid\"]",
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "AllowedScopesItems": "[\"openid\",\"profile\",\"email\",\"roles\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:21:16.6908733' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (109, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "jNYI-gwZ6b4ys-uSioUq8Q"
    },
    {
      "Type": "sid",
      "Value": "E2CFB7F3F96FB2C0D1371E52497EA0EF"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623134629"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000035d-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:21:16.7842547' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (110, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800004a5-0005-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:28:11.0430804' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (111, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000076-0001-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:34:28.7214107' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (112, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000076-0001-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "hybrid"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedGrantTypesItems": "[\"implicit\"]",
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "AllowedScopesItems": "[\"openid\",\"profile\",\"email\",\"roles\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:34:29.7077183' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (113, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000376-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:34:30.1624682' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (114, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000378-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T11:34:45.8265179' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (115, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000033-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T11:34:57.8087577' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (116, N'IdentityResourceAddedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000037d-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource",
  "HttpMethod": "POST"
}', N'{
  "IdentityResource": {
    "Id": 0,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "permissions"
    ],
    "UserClaimsItems": "[\"permissions\"]"
  }
}', CAST(N'2021-06-08T11:35:46.3764957' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (117, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000038-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/6",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 6,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "permissions"
    ]
  }
}', CAST(N'2021-06-08T11:35:46.4790805' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (118, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003a-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 2,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      },
      {
        "ShowInDiscoveryDocument": true,
        "Id": 2,
        "Name": "api1.read",
        "DisplayName": "Read Access to API #1",
        "Description": "Read Access to API #1",
        "Required": false,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T11:35:59.5116228' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (119, N'ApiResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000383-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiResources",
  "HttpMethod": "GET"
}', N'{
  "ApiResources": {
    "PageSize": 10,
    "TotalCount": 1,
    "ApiResources": [
      {
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "Enabled": true,
        "UserClaims": [],
        "ShowInDiscoveryDocument": true,
        "AllowedAccessTokenSigningAlgorithms": [],
        "Scopes": []
      }
    ]
  }
}', CAST(N'2021-06-08T11:36:04.9357067' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (120, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001cd-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": true,
        "AllowOfflineAccess": true,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": false,
        "AlwaysIncludeUserClaimsInIdToken": true,
        "AlwaysSendClientClaims": true,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "net4mvcclient",
        "ClientName": ".NET 4 MVC website",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 3,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": true,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 3,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T11:36:13.9418861' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (121, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "ip-TfXTT40G7j0gvGCQWmg"
    },
    {
      "Type": "sid",
      "Value": "3868875BB691C9EBF8B447A999FB57E4"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623135489"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000387-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:36:16.0677932' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (122, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002a-0000-f300-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:37:34.7387299' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (123, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002e-0000-f300-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:37:42.3227042' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (124, N'ClientUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002e-0000-f300-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalClient": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  },
  "Client": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AccessTokenTypes": [
      {
        "Id": "0",
        "Text": "Jwt"
      },
      {
        "Id": "1",
        "Text": "Reference"
      }
    ],
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "ProtocolTypes": [
      {
        "Id": "oidc",
        "Text": "OpenID Connect"
      }
    ],
    "RefreshTokenExpiration": 1,
    "RefreshTokenExpirations": [
      {
        "Id": "0",
        "Text": "Sliding"
      },
      {
        "Id": "1",
        "Text": "Absolute"
      }
    ],
    "RefreshTokenUsage": 1,
    "RefreshTokenUsages": [
      {
        "Id": "0",
        "Text": "ReUse"
      },
      {
        "Id": "1",
        "Text": "OneTimeOnly"
      }
    ],
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "PostLogoutRedirectUrisItems": "[\"https://localhost:44327\"]",
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "RedirectUrisItems": "[\"https://localhost:44327/signin-oidc\"]",
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedGrantTypesItems": "[\"implicit\"]",
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles",
      "permissions"
    ],
    "AllowedScopesItems": "[\"openid\",\"profile\",\"email\",\"roles\",\"permissions\"]",
    "Claims": [],
    "ClientSecrets": [],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:37:42.4775234' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (125, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000030-0000-f300-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles",
      "permissions"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T11:37:42.5641029' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (126, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003e-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T11:37:46.5702292' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (127, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000035-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T11:37:48.2139580' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (128, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800004b4-0005-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "Permisssions",
        "ClaimValue": "about,contactus",
        "ClaimId": 2,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T11:37:53.3116495' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (129, N'UserClaimRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000040-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaimsDelete/0aad5dfe-7f62-4d7e-83fd-a799be356385?claimId=2",
  "HttpMethod": "GET"
}', N'{
  "UserClaims": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimType": "Permisssions",
    "ClaimValue": "about,contactus",
    "ClaimId": 2,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T11:38:11.1561444' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (130, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000040-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaimsDelete/0aad5dfe-7f62-4d7e-83fd-a799be356385?claimId=2",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T11:38:11.1735372' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (131, N'UserClaimsDeletedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001d1-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaimsDelete/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "POST"
}', N'{
  "Claim": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimId": 2,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T11:38:13.5267910' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (132, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800004b8-0005-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T11:38:13.5727954' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (133, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000039-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T11:38:36.6874014' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (134, N'AllRolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000042-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserRoles/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Roles": [
    {
      "Name": "SkorubaIdentityAdminAdministrator",
      "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
    }
  ]
}', CAST(N'2021-06-08T11:38:41.7079613' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (135, N'UserRolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000042-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserRoles/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Roles": {
    "UserName": "admin",
    "Roles": [
      {
        "Name": "SkorubaIdentityAdminAdministrator",
        "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
      }
    ],
    "PageSize": 10,
    "TotalCount": 1
  }
}', CAST(N'2021-06-08T11:38:42.0631835' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (136, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003b-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T11:38:45.3243433' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (137, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003d-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T11:38:58.5053574' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (138, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000015f-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 6,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T11:39:08.1586343' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (139, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003f-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T11:42:58.3468947' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (140, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000041-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T11:43:00.5614301' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (141, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000043-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T11:43:04.4069336' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (142, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000044-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T11:43:17.0010919' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (143, N'RolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000103-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Roles",
  "HttpMethod": "GET"
}', N'{
  "Roles": {
    "PageSize": 10,
    "TotalCount": 1,
    "Roles": [
      {
        "Name": "SkorubaIdentityAdminAdministrator",
        "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
      }
    ]
  }
}', CAST(N'2021-06-08T11:43:27.5269561' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (144, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001d3-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T11:46:29.6053100' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (145, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000075-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T11:46:32.9033215' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (146, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000399-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T11:46:34.7790463' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (147, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000007b-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T13:30:58.0419409' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (148, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000039d-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T13:32:11.8427812' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (149, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000122-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T13:32:14.2408982' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (150, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001d7-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T13:32:16.1613305' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (151, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000128-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 6,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T13:32:23.5043884' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (152, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000115-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResourceDelete/6",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 6,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "permissions"
    ]
  }
}', CAST(N'2021-06-08T13:32:28.2831096' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (153, N'IdentityResourceDeletedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003a6-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResourceDelete/6",
  "HttpMethod": "POST"
}', N'{
  "IdentityResource": {
    "Id": 6,
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": []
  }
}', CAST(N'2021-06-08T13:32:30.4738693' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (154, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000552-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T13:32:30.6664169' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (155, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000012c-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T13:32:44.2616844' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (156, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000408-0002-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T13:32:48.0660721' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (157, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000119-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T13:32:49.9178296' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (158, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003ae-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 2,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      },
      {
        "ShowInDiscoveryDocument": true,
        "Id": 2,
        "Name": "api1.read",
        "DisplayName": "Read Access to API #1",
        "Description": "Read Access to API #1",
        "Required": false,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T13:34:34.3182430' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (159, N'ApiScopeRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000558-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScope/2",
  "HttpMethod": "GET"
}', N'{
  "ApiScopes": {
    "ShowInDiscoveryDocument": true,
    "Id": 2,
    "Name": "api1.read",
    "DisplayName": "Read Access to API #1",
    "Description": "Read Access to API #1",
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "profile"
    ],
    "Enabled": true
  }
}', CAST(N'2021-06-08T13:34:38.7686943' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (160, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003b3-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T13:34:53.9049273' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (161, N'RolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000410-0002-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Roles",
  "HttpMethod": "GET"
}', N'{
  "Roles": {
    "PageSize": 10,
    "TotalCount": 1,
    "Roles": [
      {
        "Name": "SkorubaIdentityAdminAdministrator",
        "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
      }
    ]
  }
}', CAST(N'2021-06-08T13:35:04.0199150' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (162, N'RoleUsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000123-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/RoleUsers/8711c6ee-b8db-4c52-b202-82cc2e551878",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T13:35:07.4403435' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (163, N'RoleRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000123-0004-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/RoleUsers/8711c6ee-b8db-4c52-b202-82cc2e551878",
  "HttpMethod": "GET"
}', N'{
  "Role": {
    "Name": "SkorubaIdentityAdminAdministrator",
    "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
  }
}', CAST(N'2021-06-08T13:35:07.4511701' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (164, N'RolesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000006a-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Roles",
  "HttpMethod": "GET"
}', N'{
  "Roles": {
    "PageSize": 10,
    "TotalCount": 1,
    "Roles": [
      {
        "Name": "SkorubaIdentityAdminAdministrator",
        "Id": "8711c6ee-b8db-4c52-b202-82cc2e551878"
      }
    ]
  }
}', CAST(N'2021-06-08T13:35:16.8064958' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (165, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000055a-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T13:36:23.0918738' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (166, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003b6-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T13:36:24.7976204' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (167, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000055c-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T13:36:25.8954552' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (168, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000055e-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T13:36:28.3282512' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (169, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000132-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T13:36:46.5236750' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (170, N'UserClaimsSavedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000013a-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "POST"
}', N'{
  "Claims": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimType": "permissions",
    "ClaimValue": "about,contactus",
    "ClaimId": 0,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T13:37:03.8149968' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (171, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "Kj9trM0pQxM0czLWgIPzkw"
    },
    {
      "Type": "sid",
      "Value": "2D538B86D3CEE68763C788168181E04D"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623136053"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000161-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "permissions",
        "ClaimValue": "about,contactus",
        "ClaimId": 3,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T13:37:03.9158734' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (172, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000140-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T13:42:21.8449313' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (173, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000075-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "permissions",
        "ClaimValue": "about,contactus",
        "ClaimId": 3,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T13:42:24.2409989' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (174, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000035-0000-f300-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T13:43:32.5977213' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (175, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000142-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T13:43:36.3494815' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (176, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000037-0000-f300-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "updated_at",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "locale",
      "profile"
    ]
  }
}', CAST(N'2021-06-08T13:43:38.7604475' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (177, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800004be-0005-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T13:59:20.9974907' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (178, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000365-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/4",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 4,
    "Name": "email",
    "DisplayName": "Your email address",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "email_verified",
      "email"
    ]
  }
}', CAST(N'2021-06-08T13:59:24.1325668' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (179, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000007b-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T13:59:27.6616060' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (180, N'IdentityResourceAddedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000088-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource",
  "HttpMethod": "POST"
}', N'{
  "IdentityResource": {
    "Id": 0,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "permissions"
    ],
    "UserClaimsItems": "[\"permissions\"]"
  }
}', CAST(N'2021-06-08T14:00:10.1295935' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (181, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000001e-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/7",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 7,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "permissions"
    ]
  }
}', CAST(N'2021-06-08T14:00:10.1945929' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (182, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000022-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 7,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:00:12.2133097' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (183, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003c7-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/1",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 1,
    "Name": "roles",
    "DisplayName": "Roles",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "role"
    ]
  }
}', CAST(N'2021-06-08T14:00:13.9780288' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (184, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000024-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 7,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:00:26.4153242' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (185, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000bd-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T14:00:34.6895274' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (186, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000016c-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:00:36.4692913' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (187, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000028-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "permissions",
        "ClaimValue": "about,contactus",
        "ClaimId": 3,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:00:38.7499005' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (188, N'UserClaimRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000014e-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaimsDelete/0aad5dfe-7f62-4d7e-83fd-a799be356385?claimId=3",
  "HttpMethod": "GET"
}', N'{
  "UserClaims": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimType": "permissions",
    "ClaimValue": "about,contactus",
    "ClaimId": 3,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:00:47.9002290' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (189, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000014e-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaimsDelete/0aad5dfe-7f62-4d7e-83fd-a799be356385?claimId=3",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:00:47.9171612' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (190, N'UserClaimsDeletedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000150-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaimsDelete/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "POST"
}', N'{
  "Claim": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimId": 3,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:00:50.8061518' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (191, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000152-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:00:50.8781521' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (192, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000563-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:00:52.7995906' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (193, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003ca-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:00:54.1693617' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (194, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003cc-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T14:01:14.2460704' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (195, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000170-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 2,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      },
      {
        "ShowInDiscoveryDocument": true,
        "Id": 2,
        "Name": "api1.read",
        "DisplayName": "Read Access to API #1",
        "Description": "Read Access to API #1",
        "Required": false,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T14:01:19.7314698' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (196, N'ApiScopeRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000154-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScope/1",
  "HttpMethod": "GET"
}', N'{
  "ApiScopes": {
    "ShowInDiscoveryDocument": true,
    "Id": 1,
    "Name": "skoruba_identity_admin_api",
    "DisplayName": "skoruba_identity_admin_api",
    "Required": true,
    "Emphasize": false,
    "UserClaims": [
      "role",
      "name"
    ],
    "Enabled": true
  }
}', CAST(N'2021-06-08T14:01:22.1288915' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (197, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000bf-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 7,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:01:30.5716962' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (198, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002c-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 2,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      },
      {
        "ShowInDiscoveryDocument": true,
        "Id": 2,
        "Name": "api1.read",
        "DisplayName": "Read Access to API #1",
        "Description": "Read Access to API #1",
        "Required": false,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T14:01:39.1479563' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (199, N'ApiResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000090-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiResources",
  "HttpMethod": "GET"
}', N'{
  "ApiResources": {
    "PageSize": 10,
    "TotalCount": 1,
    "ApiResources": [
      {
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "Enabled": true,
        "UserClaims": [],
        "ShowInDiscoveryDocument": true,
        "AllowedAccessTokenSigningAlgorithms": [],
        "Scopes": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:01:43.4881085' AS DateTime2))
GO
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (200, N'ApiResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000567-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiResource/1",
  "HttpMethod": "GET"
}', N'{
  "ApiResourceId": 1,
  "ApiResource": {
    "Id": 1,
    "Name": "skoruba_identity_admin_api",
    "Enabled": true,
    "UserClaims": [],
    "ShowInDiscoveryDocument": true,
    "AllowedAccessTokenSigningAlgorithms": [],
    "Scopes": [
      "skoruba_identity_admin_api"
    ]
  }
}', CAST(N'2021-06-08T14:01:45.8638887' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (201, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000093-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 7,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:02:11.0149234' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (202, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003ce-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "updated_at",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "locale",
      "profile"
    ]
  }
}', CAST(N'2021-06-08T14:02:14.2147447' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (203, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000095-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 7,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:02:38.6565446' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (204, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000091-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T14:02:44.4875935' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (205, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000156-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:02:46.3406616' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (206, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000097-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:02:52.3504716' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (207, N'UserClaimsSavedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001e4-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "POST"
}', N'{
  "Claims": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimType": "profile",
    "ClaimValue": "about,contactus",
    "ClaimId": 0,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:03:15.1994777' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (208, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000041-0000-f300-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "profile",
        "ClaimValue": "about,contactus",
        "ClaimId": 4,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:03:15.3553462' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (209, N'UserClaimRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000009c-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaimsDelete/0aad5dfe-7f62-4d7e-83fd-a799be356385?claimId=4",
  "HttpMethod": "GET"
}', N'{
  "UserClaims": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimType": "profile",
    "ClaimValue": "about,contactus",
    "ClaimId": 4,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:03:22.8547744' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (210, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000009c-0000-f200-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaimsDelete/0aad5dfe-7f62-4d7e-83fd-a799be356385?claimId=4",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:03:22.8598967' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (211, N'UserClaimsDeletedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000158-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaimsDelete/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "POST"
}', N'{
  "Claim": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimId": 4,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:03:25.3424992' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (212, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000015a-0005-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:03:25.4152968' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (213, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003d1-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 7,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:07:53.6310959' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (214, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003d3-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResourceDelete/7",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 7,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "permissions"
    ]
  }
}', CAST(N'2021-06-08T14:08:09.3063965' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (215, N'IdentityResourceDeletedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001e6-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResourceDelete/7",
  "HttpMethod": "POST"
}', N'{
  "IdentityResource": {
    "Id": 7,
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": []
  }
}', CAST(N'2021-06-08T14:08:10.5085104' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (216, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000008d-0003-fc00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:08:10.6064848' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (217, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000569-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T14:08:23.5893816' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (218, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000036f-0001-f700-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:08:25.4373617' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (219, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000018-0002-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 1,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:08:28.6611868' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (220, N'UserClaimsSavedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000033-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "POST"
}', N'{
  "Claims": {
    "Claims": [],
    "TotalCount": 0,
    "PageSize": 0,
    "ClaimType": "permissions",
    "ClaimValue": "about,contactus",
    "ClaimId": 0,
    "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:08:42.5216967' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (221, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "wFuGtXmeNb3eycsPXzbeeQ"
    },
    {
      "Type": "sid",
      "Value": "668EC1FCB8A1FB2C289DC248496EA05C"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623143400"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800003d9-0004-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "permissions",
        "ClaimValue": "about,contactus",
        "ClaimId": 5,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:08:42.6061224' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (222, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "M9c5FFptoQYy8I6RGNpF7Q"
    },
    {
      "Type": "sid",
      "Value": "C58861A3778FCD012418892CDF44DF26"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146485"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002e-0000-f000-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:31:40.5176111' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (223, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "M9c5FFptoQYy8I6RGNpF7Q"
    },
    {
      "Type": "sid",
      "Value": "C58861A3778FCD012418892CDF44DF26"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146485"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000004f-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "updated_at",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "locale",
      "profile"
    ]
  }
}', CAST(N'2021-06-08T14:31:43.8256355' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (224, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "M9c5FFptoQYy8I6RGNpF7Q"
    },
    {
      "Type": "sid",
      "Value": "C58861A3778FCD012418892CDF44DF26"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146485"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000017a-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "POST"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "updated_at",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "locale",
      "profile"
    ]
  }
}', CAST(N'2021-06-08T14:31:57.5763870' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (225, N'IdentityResourceUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "M9c5FFptoQYy8I6RGNpF7Q"
    },
    {
      "Type": "sid",
      "Value": "C58861A3778FCD012418892CDF44DF26"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146485"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000017a-0002-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalIdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "updated_at",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "locale",
      "profile"
    ]
  },
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "updated_at",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "locale",
      "profile",
      "permissions"
    ],
    "UserClaimsItems": "[\"updated_at\",\"name\",\"family_name\",\"given_name\",\"middle_name\",\"nickname\",\"preferred_username\",\"picture\",\"website\",\"gender\",\"birthdate\",\"zoneinfo\",\"locale\",\"profile\",\"permissions\"]"
  }
}', CAST(N'2021-06-08T14:31:58.6762984' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (226, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "M9c5FFptoQYy8I6RGNpF7Q"
    },
    {
      "Type": "sid",
      "Value": "C58861A3778FCD012418892CDF44DF26"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146485"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000051-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "permissions",
      "locale",
      "zoneinfo",
      "birthdate",
      "gender",
      "website",
      "picture",
      "preferred_username",
      "nickname",
      "middle_name",
      "given_name",
      "family_name",
      "name",
      "profile",
      "updated_at"
    ]
  }
}', CAST(N'2021-06-08T14:31:59.1134335' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (227, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000574-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 5,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:41:53.4156246' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (228, N'IdentityResourceAddedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000a2-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource",
  "HttpMethod": "POST"
}', N'{
  "IdentityResource": {
    "Id": 0,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": []
  }
}', CAST(N'2021-06-08T14:42:20.8933975' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (229, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000005d-0005-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/8",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 8,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": []
  }
}', CAST(N'2021-06-08T14:42:20.9363213' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (230, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000c6-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T14:42:24.9613976' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (231, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000047-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:42:26.7809665' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (232, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000c8-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "permissions",
        "ClaimValue": "about,contactus",
        "ClaimId": 5,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin2",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:42:29.2099731' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (233, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000a7-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 8,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:42:59.5186417' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (234, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000a9-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "permissions",
      "locale",
      "zoneinfo",
      "birthdate",
      "gender",
      "website",
      "picture",
      "preferred_username",
      "nickname",
      "middle_name",
      "given_name",
      "family_name",
      "name",
      "profile",
      "updated_at"
    ]
  }
}', CAST(N'2021-06-08T14:43:01.4400142' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (235, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000ab-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "POST"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "permissions",
      "locale",
      "zoneinfo",
      "birthdate",
      "gender",
      "website",
      "picture",
      "preferred_username",
      "nickname",
      "middle_name",
      "given_name",
      "family_name",
      "name",
      "profile",
      "updated_at"
    ]
  }
}', CAST(N'2021-06-08T14:43:32.5982040' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (236, N'IdentityResourceUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000ab-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "POST"
}', N'{
  "OriginalIdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "permissions",
      "locale",
      "zoneinfo",
      "birthdate",
      "gender",
      "website",
      "picture",
      "preferred_username",
      "nickname",
      "middle_name",
      "given_name",
      "family_name",
      "name",
      "profile",
      "updated_at"
    ]
  },
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "locale",
      "zoneinfo",
      "birthdate",
      "gender",
      "website",
      "picture",
      "preferred_username",
      "nickname",
      "middle_name",
      "given_name",
      "family_name",
      "name",
      "profile",
      "updated_at"
    ],
    "UserClaimsItems": "[\"locale\",\"zoneinfo\",\"birthdate\",\"gender\",\"website\",\"picture\",\"preferred_username\",\"nickname\",\"middle_name\",\"given_name\",\"family_name\",\"name\",\"profile\",\"updated_at\"]"
  }
}', CAST(N'2021-06-08T14:43:33.5636963' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (237, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000038-0000-f000-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/3",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 3,
    "Name": "profile",
    "DisplayName": "User profile",
    "Description": "Your user profile information (first name, last name, etc.)",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": true,
    "UserClaims": [
      "locale",
      "profile",
      "name",
      "family_name",
      "given_name",
      "middle_name",
      "nickname",
      "preferred_username",
      "picture",
      "website",
      "gender",
      "birthdate",
      "zoneinfo",
      "updated_at"
    ]
  }
}', CAST(N'2021-06-08T14:43:33.6840164' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (238, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800001ee-0001-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 8,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:43:36.5342833' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (239, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000061-0005-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/8",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 8,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": []
  }
}', CAST(N'2021-06-08T14:43:39.5334593' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (240, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003a-0000-f000-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/8",
  "HttpMethod": "POST"
}', N'{
  "IdentityResource": {
    "Id": 8,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": []
  }
}', CAST(N'2021-06-08T14:43:49.0444730' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (241, N'IdentityResourceUpdatedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003a-0000-f000-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/8",
  "HttpMethod": "POST"
}', N'{
  "OriginalIdentityResource": {
    "Id": 8,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": []
  },
  "IdentityResource": {
    "Id": 8,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "permissions"
    ],
    "UserClaimsItems": "[\"permissions\"]"
  }
}', CAST(N'2021-06-08T14:43:49.0945699' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (242, N'IdentityResourceRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000063-0005-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResource/8",
  "HttpMethod": "GET"
}', N'{
  "IdentityResource": {
    "Id": 8,
    "Name": "permissions",
    "DisplayName": "permissions",
    "Description": "permissions of user",
    "Enabled": true,
    "ShowInDiscoveryDocument": true,
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "permissions"
    ]
  }
}', CAST(N'2021-06-08T14:43:49.1474709' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (243, N'ClientsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003c-0000-f000-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Clients",
  "HttpMethod": "GET"
}', N'{
  "ClientsDto": {
    "Clients": [
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": true,
        "AllowOfflineAccess": true,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": false,
        "AlwaysIncludeUserClaimsInIdToken": true,
        "AlwaysSendClientClaims": true,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "net4mvcclient",
        "ClientName": ".NET 4 MVC website",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 3,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": true,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin_api_swaggerui",
        "ClientName": "skoruba_identity_admin_api_swaggerui",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 2,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": false,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      },
      {
        "ClientType": "Empty",
        "AbsoluteRefreshTokenLifetime": 2592000,
        "AccessTokenLifetime": 3600,
        "AccessTokenType": 0,
        "AllowAccessTokensViaBrowser": false,
        "AllowOfflineAccess": false,
        "AllowPlainTextPkce": false,
        "AllowRememberConsent": true,
        "AlwaysIncludeUserClaimsInIdToken": false,
        "AlwaysSendClientClaims": false,
        "AuthorizationCodeLifetime": 300,
        "FrontChannelLogoutUri": "https://localhost:44303/signout-oidc",
        "FrontChannelLogoutSessionRequired": true,
        "BackChannelLogoutSessionRequired": true,
        "ClientId": "skoruba_identity_admin",
        "ClientName": "skoruba_identity_admin",
        "ClientUri": "https://localhost:44303",
        "Enabled": true,
        "EnableLocalLogin": true,
        "Id": 1,
        "IdentityTokenLifetime": 300,
        "IncludeJwtId": true,
        "ClientClaimsPrefix": "client_",
        "ProtocolType": "oidc",
        "RefreshTokenExpiration": 1,
        "RefreshTokenUsage": 1,
        "SlidingRefreshTokenLifetime": 1296000,
        "RequireClientSecret": true,
        "RequireConsent": false,
        "RequirePkce": true,
        "UpdateAccessTokenClaimsOnRefresh": false,
        "PostLogoutRedirectUris": [],
        "IdentityProviderRestrictions": [],
        "RedirectUris": [],
        "AllowedCorsOrigins": [],
        "AllowedGrantTypes": [],
        "AllowedScopes": [],
        "Claims": [],
        "ClientSecrets": [],
        "Properties": [],
        "DeviceCodeLifetime": 300,
        "NonEditable": false,
        "RequireRequestObject": false,
        "AllowedIdentityTokenSigningAlgorithms": []
      }
    ],
    "TotalCount": 3,
    "PageSize": 10
  }
}', CAST(N'2021-06-08T14:43:57.2872270' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (244, N'ClientRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000003e-0000-f000-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/Client/3",
  "HttpMethod": "GET"
}', N'{
  "ClientDto": {
    "ClientType": "Empty",
    "AbsoluteRefreshTokenLifetime": 2592000,
    "AccessTokenLifetime": 3600,
    "AccessTokenType": 0,
    "AllowAccessTokensViaBrowser": true,
    "AllowOfflineAccess": true,
    "AllowPlainTextPkce": false,
    "AllowRememberConsent": false,
    "AlwaysIncludeUserClaimsInIdToken": true,
    "AlwaysSendClientClaims": true,
    "AuthorizationCodeLifetime": 300,
    "FrontChannelLogoutSessionRequired": true,
    "BackChannelLogoutSessionRequired": true,
    "ClientId": "net4mvcclient",
    "ClientName": ".NET 4 MVC website",
    "Enabled": true,
    "EnableLocalLogin": true,
    "Id": 3,
    "IdentityTokenLifetime": 300,
    "IncludeJwtId": true,
    "ClientClaimsPrefix": "client_",
    "ProtocolType": "oidc",
    "RefreshTokenExpiration": 1,
    "RefreshTokenUsage": 1,
    "SlidingRefreshTokenLifetime": 1296000,
    "RequireClientSecret": true,
    "RequireConsent": false,
    "RequirePkce": true,
    "UpdateAccessTokenClaimsOnRefresh": true,
    "PostLogoutRedirectUris": [
      "https://localhost:44327"
    ],
    "IdentityProviderRestrictions": [],
    "RedirectUris": [
      "https://localhost:44327/signin-oidc"
    ],
    "AllowedCorsOrigins": [],
    "AllowedGrantTypes": [
      "implicit"
    ],
    "AllowedScopes": [
      "openid",
      "profile",
      "email",
      "roles",
      "permissions"
    ],
    "Claims": [],
    "ClientSecrets": [
      {
        "Type": "SharedSecret",
        "Id": 2,
        "Description": "for test",
        "Value": "4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=",
        "Expiration": "2021-06-30T00:00:00",
        "Created": "2021-06-08T04:09:01.6286038"
      }
    ],
    "Properties": [],
    "DeviceCodeLifetime": 300,
    "NonEditable": false,
    "RequireRequestObject": false,
    "AllowedIdentityTokenSigningAlgorithms": []
  }
}', CAST(N'2021-06-08T14:43:59.4266563' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (245, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000004d-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T14:44:54.8301636' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (246, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000060-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T14:44:56.3006274' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (247, N'UserClaimsRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000001b-0001-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserClaims/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "Claims": {
    "UserName": "admin",
    "Claims": [
      {
        "ClaimType": "permissions",
        "ClaimValue": "about,contactus",
        "ClaimId": 5,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "ClaimType": "name",
        "ClaimValue": "admin2",
        "ClaimId": 1,
        "UserId": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ],
    "TotalCount": 2,
    "PageSize": 10,
    "ClaimId": 0
  }
}', CAST(N'2021-06-08T14:44:58.5381199' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (248, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000576-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 2,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      },
      {
        "ShowInDiscoveryDocument": true,
        "Id": 2,
        "Name": "api1.read",
        "DisplayName": "Read Access to API #1",
        "Description": "Read Access to API #1",
        "Required": false,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T14:45:12.7870626' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (249, N'IdentityResourcesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000b1-0004-fa00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/IdentityResources",
  "HttpMethod": "GET"
}', N'{
  "IdentityResources": {
    "PageSize": 10,
    "TotalCount": 6,
    "IdentityResources": [
      {
        "Id": 1,
        "Name": "roles",
        "DisplayName": "Roles",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 3,
        "Name": "profile",
        "DisplayName": "User profile",
        "Description": "Your user profile information (first name, last name, etc.)",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 8,
        "Name": "permissions",
        "DisplayName": "permissions",
        "Description": "permissions of user",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 2,
        "Name": "openid",
        "DisplayName": "Your user identifier",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": true,
        "Emphasize": false,
        "UserClaims": []
      },
      {
        "Id": 4,
        "Name": "email",
        "DisplayName": "Your email address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      },
      {
        "Id": 5,
        "Name": "address",
        "DisplayName": "Your address",
        "Enabled": true,
        "ShowInDiscoveryDocument": true,
        "Required": false,
        "Emphasize": true,
        "UserClaims": []
      }
    ]
  }
}', CAST(N'2021-06-08T14:45:17.8408534' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (250, N'ApiScopesRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000065-0005-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScopes",
  "HttpMethod": "GET"
}', N'{
  "ApiScope": {
    "PageSize": 10,
    "TotalCount": 2,
    "Scopes": [
      {
        "ShowInDiscoveryDocument": true,
        "Id": 1,
        "Name": "skoruba_identity_admin_api",
        "DisplayName": "skoruba_identity_admin_api",
        "Required": true,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      },
      {
        "ShowInDiscoveryDocument": true,
        "Id": 2,
        "Name": "api1.read",
        "DisplayName": "Read Access to API #1",
        "Description": "Read Access to API #1",
        "Required": false,
        "Emphasize": false,
        "UserClaims": [],
        "Enabled": true
      }
    ]
  }
}', CAST(N'2021-06-08T14:45:26.3249864' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (251, N'ApiScopeRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "io-GAMibZiRmo5WpH40UJw"
    },
    {
      "Type": "sid",
      "Value": "8E97B5528A905CA5560829298010DD17"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623146773"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000063-0004-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Configuration/ApiScope/2",
  "HttpMethod": "GET"
}', N'{
  "ApiScopes": {
    "ShowInDiscoveryDocument": true,
    "Id": 2,
    "Name": "api1.read",
    "DisplayName": "Read Access to API #1",
    "Description": "Read Access to API #1",
    "Required": false,
    "Emphasize": false,
    "UserClaims": [
      "profile"
    ],
    "Enabled": true
  }
}', CAST(N'2021-06-08T14:45:28.3009648' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (252, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000002-0004-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T15:06:51.0768770' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (253, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000d8-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T15:06:57.4619502' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (254, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000005-0004-f900-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T15:07:01.1171969' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (255, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000070-0005-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 1,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      }
    ]
  }
}', CAST(N'2021-06-08T15:07:15.4217058' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (256, N'UserSavedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000db-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile",
  "HttpMethod": "POST"
}', N'{
  "User": {
    "UserName": "test2",
    "Email": "test2@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": false,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0
  }
}', CAST(N'2021-06-08T15:07:44.5259067' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (257, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000072-0005-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/09ffad23-1267-4c4a-a6dd-4cf5ca917ed2",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test2",
    "Email": "test2@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
  }
}', CAST(N'2021-06-08T15:07:44.5772139' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (258, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000057-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 2,
    "Users": [
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "UserName": "test2",
        "Email": "test2@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
      }
    ]
  }
}', CAST(N'2021-06-08T15:08:28.8106869' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (259, N'UserSavedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000028-0002-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile",
  "HttpMethod": "POST"
}', N'{
  "User": {
    "UserName": "test3",
    "Email": "test3@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": false,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0
  }
}', CAST(N'2021-06-08T15:08:50.7474424' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (260, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000059-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/a140d95b-45f0-4207-97a4-b361108ff9d3",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test3",
    "Email": "test3@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
  }
}', CAST(N'2021-06-08T15:08:50.9694759' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (261, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000005b-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 3,
    "Users": [
      {
        "UserName": "test3",
        "Email": "test3@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
      },
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "UserName": "test2",
        "Email": "test2@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
      }
    ]
  }
}', CAST(N'2021-06-08T15:08:52.7865462' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (262, N'UserSavedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000076-0005-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile",
  "HttpMethod": "POST"
}', N'{
  "User": {
    "UserName": "test4",
    "Email": "test4@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": false,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0
  }
}', CAST(N'2021-06-08T15:09:11.4756828' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (263, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000059-0000-f100-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/5fb44df5-1088-4e04-970f-a71b6a37c1fc",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test4",
    "Email": "test4@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
  }
}', CAST(N'2021-06-08T15:09:11.5546043' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (264, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000007-0004-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 4,
    "Users": [
      {
        "UserName": "test3",
        "Email": "test3@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
      },
      {
        "UserName": "test4",
        "Email": "test4@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
      },
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "UserName": "test2",
        "Email": "test2@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
      }
    ]
  }
}', CAST(N'2021-06-08T15:09:14.2687261' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (265, N'UserSavedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000005b-0000-f100-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile",
  "HttpMethod": "POST"
}', N'{
  "User": {
    "UserName": "test5",
    "Email": "test5@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": false,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0
  }
}', CAST(N'2021-06-08T15:09:41.3826092' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (266, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000005d-0000-f100-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/2cc6c3ff-5fe7-4122-86a1-ea53e9767f92",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test5",
    "Email": "test5@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
  }
}', CAST(N'2021-06-08T15:09:41.5792290' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (267, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002c-0002-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 5,
    "Users": [
      {
        "UserName": "test3",
        "Email": "test3@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
      },
      {
        "UserName": "test4",
        "Email": "test4@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
      },
      {
        "UserName": "test5",
        "Email": "test5@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
      },
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "UserName": "test2",
        "Email": "test2@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
      }
    ]
  }
}', CAST(N'2021-06-08T15:09:44.8787794' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (268, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000028-0001-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/0aad5dfe-7f62-4d7e-83fd-a799be356385",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "admin",
    "Email": "admin@skoruba.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
  }
}', CAST(N'2021-06-08T15:09:57.9655463' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (269, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000df-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 5,
    "Users": [
      {
        "UserName": "test3",
        "Email": "test3@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
      },
      {
        "UserName": "test4",
        "Email": "test4@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
      },
      {
        "UserName": "test5",
        "Email": "test5@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
      },
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "UserName": "test2",
        "Email": "test2@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
      }
    ]
  }
}', CAST(N'2021-06-08T15:09:59.8928909' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (270, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000078-0005-fb00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/09ffad23-1267-4c4a-a6dd-4cf5ca917ed2",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test2",
    "Email": "test2@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
  }
}', CAST(N'2021-06-08T15:10:03.2115804' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (271, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "800000e1-0003-fd00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/09ffad23-1267-4c4a-a6dd-4cf5ca917ed2",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test2",
    "Email": "test2@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
  }
}', CAST(N'2021-06-08T15:10:04.2364244' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (272, N'UserPasswordChangedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000000d-0004-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/09ffad23-1267-4c4a-a6dd-4cf5ca917ed2",
  "HttpMethod": "POST"
}', N'{
  "UserName": "test2"
}', CAST(N'2021-06-08T15:10:09.3787182' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (273, N'UserPasswordChangedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002a-0001-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/09ffad23-1267-4c4a-a6dd-4cf5ca917ed2",
  "HttpMethod": "POST"
}', N'{
  "UserName": "test2"
}', CAST(N'2021-06-08T15:10:35.1419028' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (274, N'UserPasswordChangedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002f-0002-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/09ffad23-1267-4c4a-a6dd-4cf5ca917ed2",
  "HttpMethod": "POST"
}', N'{
  "UserName": "test2"
}', CAST(N'2021-06-08T15:10:56.1395533' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (275, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002c-0001-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/09ffad23-1267-4c4a-a6dd-4cf5ca917ed2",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test2",
    "Email": "test2@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
  }
}', CAST(N'2021-06-08T15:10:56.2024304' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (276, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000000f-0004-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 5,
    "Users": [
      {
        "UserName": "test3",
        "Email": "test3@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
      },
      {
        "UserName": "test4",
        "Email": "test4@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
      },
      {
        "UserName": "test5",
        "Email": "test5@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
      },
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "UserName": "test2",
        "Email": "test2@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
      }
    ]
  }
}', CAST(N'2021-06-08T15:11:03.5710430' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (277, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000002e-0001-f400-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/a140d95b-45f0-4207-97a4-b361108ff9d3",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test3",
    "Email": "test3@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
  }
}', CAST(N'2021-06-08T15:11:07.2655701' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (278, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000057c-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/a140d95b-45f0-4207-97a4-b361108ff9d3",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test3",
    "Email": "test3@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
  }
}', CAST(N'2021-06-08T15:11:08.6860310' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (279, N'UserPasswordChangedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000057e-0003-ff00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/a140d95b-45f0-4207-97a4-b361108ff9d3",
  "HttpMethod": "POST"
}', N'{
  "UserName": "test3"
}', CAST(N'2021-06-08T15:11:18.7127345' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (280, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000011-0004-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/a140d95b-45f0-4207-97a4-b361108ff9d3",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test3",
    "Email": "test3@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
  }
}', CAST(N'2021-06-08T15:11:18.7367337' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (281, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000060-0000-f100-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 5,
    "Users": [
      {
        "UserName": "test3",
        "Email": "test3@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
      },
      {
        "UserName": "test4",
        "Email": "test4@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
      },
      {
        "UserName": "test5",
        "Email": "test5@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
      },
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "UserName": "test2",
        "Email": "test2@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
      }
    ]
  }
}', CAST(N'2021-06-08T15:11:20.7145952' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (282, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000013-0004-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/5fb44df5-1088-4e04-970f-a71b6a37c1fc",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test4",
    "Email": "test4@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
  }
}', CAST(N'2021-06-08T15:11:23.0108811' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (283, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000015-0004-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/5fb44df5-1088-4e04-970f-a71b6a37c1fc",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test4",
    "Email": "test4@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
  }
}', CAST(N'2021-06-08T15:11:26.6834458' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (284, N'UserPasswordChangedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000017-0004-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/5fb44df5-1088-4e04-970f-a71b6a37c1fc",
  "HttpMethod": "POST"
}', N'{
  "UserName": "test4"
}', CAST(N'2021-06-08T15:11:36.8326356' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (285, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000031-0002-fe00-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/5fb44df5-1088-4e04-970f-a71b6a37c1fc",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test4",
    "Email": "test4@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
  }
}', CAST(N'2021-06-08T15:11:36.8647751' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (286, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000062-0000-f100-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 5,
    "Users": [
      {
        "UserName": "test3",
        "Email": "test3@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
      },
      {
        "UserName": "test4",
        "Email": "test4@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
      },
      {
        "UserName": "test5",
        "Email": "test5@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
      },
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "UserName": "test2",
        "Email": "test2@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
      }
    ]
  }
}', CAST(N'2021-06-08T15:11:38.8614408' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (287, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000005d-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/2cc6c3ff-5fe7-4122-86a1-ea53e9767f92",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test5",
    "Email": "test5@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
  }
}', CAST(N'2021-06-08T15:11:42.3298313' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (288, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000019-0004-f800-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/2cc6c3ff-5fe7-4122-86a1-ea53e9767f92",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test5",
    "Email": "test5@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
  }
}', CAST(N'2021-06-08T15:11:46.9682977' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (289, N'UserPasswordChangedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "8000005f-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserChangePassword/2cc6c3ff-5fe7-4122-86a1-ea53e9767f92",
  "HttpMethod": "POST"
}', N'{
  "UserName": "test5"
}', CAST(N'2021-06-08T15:11:57.3388789' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (290, N'UserRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000064-0000-f100-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/UserProfile/2cc6c3ff-5fe7-4122-86a1-ea53e9767f92",
  "HttpMethod": "GET"
}', N'{
  "UserDto": {
    "UserName": "test5",
    "Email": "test5@test.com",
    "EmailConfirmed": true,
    "PhoneNumberConfirmed": false,
    "LockoutEnabled": true,
    "TwoFactorEnabled": false,
    "AccessFailedCount": 0,
    "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
  }
}', CAST(N'2021-06-08T15:11:57.4412346' AS DateTime2))
INSERT [dbo].[AuditLog] ([Id], [Event], [Source], [Category], [SubjectIdentifier], [SubjectName], [SubjectType], [SubjectAdditionalData], [Action], [Data], [Created]) VALUES (291, N'UsersRequestedEvent', N'IdentityServer.Admin.Web', NULL, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin2', N'User', N'{
  "RemoteIpAddress": "::1",
  "LocalIpAddress": "::1",
  "Claims": [
    {
      "Type": "s_hash",
      "Value": "c8PHWlaItgyZm3TSbXI0Rw"
    },
    {
      "Type": "sid",
      "Value": "07CAD4E1CC6F733A9C5AF7209BB92053"
    },
    {
      "Type": "sub",
      "Value": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
    },
    {
      "Type": "auth_time",
      "Value": "1623147453"
    },
    {
      "Type": "idp",
      "Value": "local"
    },
    {
      "Type": "amr",
      "Value": "pwd"
    },
    {
      "Type": "name",
      "Value": "admin2"
    },
    {
      "Type": "email",
      "Value": "admin@skoruba.com"
    },
    {
      "Type": "role",
      "Value": "SkorubaIdentityAdminAdministrator"
    }
  ]
}', N'{
  "TraceIdentifier": "80000061-0005-f600-b63f-84710c7967bb",
  "RequestUrl": "https://localhost:44303/Identity/Users",
  "HttpMethod": "GET"
}', N'{
  "Users": {
    "PageSize": 10,
    "TotalCount": 5,
    "Users": [
      {
        "UserName": "test3",
        "Email": "test3@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "a140d95b-45f0-4207-97a4-b361108ff9d3"
      },
      {
        "UserName": "test4",
        "Email": "test4@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "5fb44df5-1088-4e04-970f-a71b6a37c1fc"
      },
      {
        "UserName": "test5",
        "Email": "test5@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "2cc6c3ff-5fe7-4122-86a1-ea53e9767f92"
      },
      {
        "UserName": "admin",
        "Email": "admin@skoruba.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "0aad5dfe-7f62-4d7e-83fd-a799be356385"
      },
      {
        "UserName": "test2",
        "Email": "test2@test.com",
        "EmailConfirmed": true,
        "PhoneNumberConfirmed": false,
        "LockoutEnabled": true,
        "TwoFactorEnabled": false,
        "AccessFailedCount": 0,
        "Id": "09ffad23-1267-4c4a-a6dd-4cf5ca917ed2"
      }
    ]
  }
}', CAST(N'2021-06-08T15:11:59.6333125' AS DateTime2))
SET IDENTITY_INSERT [dbo].[AuditLog] OFF
SET IDENTITY_INSERT [dbo].[ClientCorsOrigins] ON 

INSERT [dbo].[ClientCorsOrigins] ([Id], [Origin], [ClientId]) VALUES (1, N'https://localhost:44302', 2)
INSERT [dbo].[ClientCorsOrigins] ([Id], [Origin], [ClientId]) VALUES (2, N'https://localhost:44303', 1)
SET IDENTITY_INSERT [dbo].[ClientCorsOrigins] OFF
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] ON 

INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (1, N'authorization_code', 2)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (2, N'authorization_code', 1)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (17, N'implicit', 3)
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] OFF
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] ON 

INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (1, N'https://localhost:44303/signout-callback-oidc', 1)
INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (12, N'https://localhost:44327', 3)
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] OFF
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] ON 

INSERT [dbo].[ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (1, N'https://localhost:44302/swagger/oauth2-redirect.html', 2)
INSERT [dbo].[ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (2, N'https://localhost:44303/signin-oidc', 1)
INSERT [dbo].[ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (13, N'https://localhost:44327/signin-oidc', 3)
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] OFF
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable], [AllowedIdentityTokenSigningAlgorithms], [RequireRequestObject]) VALUES (1, 1, N'skoruba_identity_admin', N'oidc', 1, N'skoruba_identity_admin', NULL, N'https://localhost:44303', NULL, 0, 1, 0, 1, 0, 0, N'https://localhost:44303/signout-oidc', 1, NULL, 1, 0, 300, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2021-06-07T13:30:19.0803639' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0, NULL, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable], [AllowedIdentityTokenSigningAlgorithms], [RequireRequestObject]) VALUES (2, 1, N'skoruba_identity_admin_api_swaggerui', N'oidc', 0, N'skoruba_identity_admin_api_swaggerui', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, NULL, 1, NULL, 1, 0, 300, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2021-06-07T13:30:19.2086361' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0, NULL, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable], [AllowedIdentityTokenSigningAlgorithms], [RequireRequestObject]) VALUES (3, 1, N'net4mvcclient', N'oidc', 1, N'.NET 4 MVC website', NULL, NULL, NULL, 0, 0, 1, 1, 0, 1, NULL, 1, NULL, 1, 1, 300, 3600, 300, NULL, 2592000, 1296000, 1, 1, 1, 0, 1, 1, 1, N'client_', NULL, CAST(N'2021-06-08T07:07:42.3132297' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[ClientScopes] ON 

INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1, N'email', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2, N'profile', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (3, N'roles', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (4, N'openid', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (5, N'skoruba_identity_admin_api', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (45, N'openid', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (46, N'profile', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (47, N'email', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (48, N'roles', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (49, N'permissions', 3)
SET IDENTITY_INSERT [dbo].[ClientScopes] OFF
SET IDENTITY_INSERT [dbo].[ClientSecrets] ON 

INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (1, NULL, N'tvzpwTHl+cZB7h0GjO+QlJ0Wy15z+quGoqLRWGMZjzM=', NULL, N'SharedSecret', CAST(N'2021-06-07T13:30:19.0806898' AS DateTime2), 1)
INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (2, N'for test', N'4NmsfTcZ0E09aLxGNJiwiJcjxOcMNUnUNoHdiZa3F38=', CAST(N'2021-06-30T00:00:00.0000000' AS DateTime2), N'SharedSecret', CAST(N'2021-06-08T04:09:01.6286038' AS DateTime2), 3)
SET IDENTITY_INSERT [dbo].[ClientSecrets] OFF
SET IDENTITY_INSERT [dbo].[DataProtectionKeys] ON 

INSERT [dbo].[DataProtectionKeys] ([Id], [FriendlyName], [Xml]) VALUES (1, N'key-4c6ef7f3-33e2-483e-9b65-c68cdbf402b0', N'<key id="4c6ef7f3-33e2-483e-9b65-c68cdbf402b0" version="1"><creationDate>2021-06-07T13:30:22.9772194Z</creationDate><activationDate>2021-06-07T13:30:22.8509552Z</activationDate><expirationDate>2021-09-05T13:30:22.8509552Z</expirationDate><descriptor deserializerType="Microsoft.AspNetCore.DataProtection.AuthenticatedEncryption.ConfigurationModel.AuthenticatedEncryptorDescriptorDeserializer, Microsoft.AspNetCore.DataProtection, Version=5.0.0.0, Culture=neutral, PublicKeyToken=adb9793829ddae60"><descriptor><encryption algorithm="AES_256_CBC" /><validation algorithm="HMACSHA256" /><masterKey p4:requiresEncryption="true" xmlns:p4="http://schemas.asp.net/2015/03/dataProtection"><!-- Warning: the key below is in an unencrypted form. --><value>JG/8LdHa3jhIy437aawr1lHqCayjGJ8ofzas7u2msIBunDJu33l/a1y3w9EQIJh0ihdY925qhsB/sKCZAs64aA==</value></masterKey></descriptor></descriptor></key>')
SET IDENTITY_INSERT [dbo].[DataProtectionKeys] OFF
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] ON 

INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (1, N'address', 5)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (2, N'email_verified', 4)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (4, N'sub', 2)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (10, N'email', 4)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (19, N'role', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (37, N'locale', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (38, N'profile', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (39, N'name', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (40, N'family_name', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (41, N'given_name', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (42, N'middle_name', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (43, N'nickname', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (44, N'preferred_username', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (45, N'picture', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (46, N'website', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (47, N'gender', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (48, N'birthdate', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (49, N'zoneinfo', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (50, N'updated_at', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (51, N'permissions', 8)
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] OFF
SET IDENTITY_INSERT [dbo].[IdentityResources] ON 

INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (1, 1, N'roles', N'Roles', NULL, 0, 0, 1, CAST(N'2021-06-07T13:30:18.7637740' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (2, 1, N'openid', N'Your user identifier', NULL, 1, 0, 1, CAST(N'2021-06-07T13:30:18.9099825' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (3, 1, N'profile', N'User profile', N'Your user profile information (first name, last name, etc.)', 0, 1, 1, CAST(N'2021-06-08T10:13:32.5962681' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (4, 1, N'email', N'Your email address', NULL, 0, 1, 1, CAST(N'2021-06-07T13:30:18.9142564' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (5, 1, N'address', N'Your address', NULL, 0, 1, 1, CAST(N'2021-06-07T13:30:18.9150208' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (8, 1, N'permissions', N'permissions', N'permissions of user', 0, 0, 1, CAST(N'2021-06-08T10:13:49.0407276' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[IdentityResources] OFF
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [ClientId], [CreationTime], [Expiration], [Data], [ConsumedTime], [Description], [SessionId]) VALUES (N'cxmV59gn87ytWgPb8Q+n3BD59bOj1/L8464dai6Nzdk=', N'authorization_code', N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'skoruba_identity_admin', CAST(N'2021-06-07T13:53:55.0000000' AS DateTime2), CAST(N'2021-06-07T13:58:55.0000000' AS DateTime2), N'{"CreationTime":"2021-06-07T13:53:55Z","Lifetime":300,"ClientId":"skoruba_identity_admin","Subject":{"AuthenticationType":"Identity.Application","Claims":[{"Type":"sub","Value":"0aad5dfe-7f62-4d7e-83fd-a799be356385","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress","Value":"admin@skoruba.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"AspNet.Identity.SecurityStamp","Value":"E47M2J3DWTIMBIS44JSJ73SHHE5CAJPM","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"admin","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"SkorubaIdentityAdminAdministrator","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"preferred_username","Value":"admin","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email","Value":"admin@skoruba.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email_verified","Value":"true","ValueType":"http://www.w3.org/2001/XMLSchema#boolean"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1623074035","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile","email","roles"],"RedirectUri":"https://localhost:44303/signin-oidc","Nonce":"637586697135356796.YTY3MTgwYjUtZjRjOC00YTI1LWEzODItOGRkYjUyYzU4YmJiNmVjYWRjOWMtMzg0YS00YzY0LTgzZjUtMjI3ZDJjNjQ0MTU0","StateHash":"SRu9OFRxF_4V2ohwdaDczg","WasConsentShown":false,"SessionId":"081DD188CD1DB8CA99817EC4B37A6463","CodeChallenge":"Nl9xI8leNvmvUE3SkBhV1mrL9htMTsMLdDNOS5GkWd4=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}', NULL, NULL, N'081DD188CD1DB8CA99817EC4B37A6463')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8711c6ee-b8db-4c52-b202-82cc2e551878', N'SkorubaIdentityAdminAdministrator', N'SKORUBAIDENTITYADMINADMINISTRATOR', N'a9e9be6d-af53-49d5-8037-f768ea2d3f5a')
SET IDENTITY_INSERT [dbo].[UserClaims] ON 

INSERT [dbo].[UserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'name', N'admin2')
INSERT [dbo].[UserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (5, N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'permissions', N'about,contactus')
SET IDENTITY_INSERT [dbo].[UserClaims] OFF
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'8711c6ee-b8db-4c52-b202-82cc2e551878')
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'09ffad23-1267-4c4a-a6dd-4cf5ca917ed2', N'test2', N'TEST2', N'test2@test.com', N'TEST2@TEST.COM', 1, N'AQAAAAEAACcQAAAAEBge20sQ6PZ4LoWbT63dXK4kN0Q4jKVLw0e8HzVJB7RjtpRjW/3lf0ogFgipoHoQVA==', N'M4OQZFDK6DJUJNVJYLBTHBTLLY62LCMP', N'3ce9bb89-7037-40eb-a84f-5a2b52c1e80f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0aad5dfe-7f62-4d7e-83fd-a799be356385', N'admin', N'ADMIN', N'admin@skoruba.com', N'ADMIN@SKORUBA.COM', 1, N'AQAAAAEAACcQAAAAEIqo50MU7nNCluUm1qiI1UNLgQl8JR4EOtRVlEF6JawOroopNSRih0cM6aQWZnH3BQ==', N'E47M2J3DWTIMBIS44JSJ73SHHE5CAJPM', N'58113839-1128-4262-b48e-d74c0ceaca5e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2cc6c3ff-5fe7-4122-86a1-ea53e9767f92', N'test5', N'TEST5', N'test5@test.com', N'TEST5@TEST.COM', 1, N'AQAAAAEAACcQAAAAEDh01pKR/V4KS5gMAc0DM668hTZ5onk37fpu8TDPKu0neWnxgnxH68R+TYgI5KoZNg==', N'WQBUXT6N62J63LMK7JO2NUM3CBV4NAZM', N'5d6169de-95f4-43a3-b681-32eef440688c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5fb44df5-1088-4e04-970f-a71b6a37c1fc', N'test4', N'TEST4', N'test4@test.com', N'TEST4@TEST.COM', 1, N'AQAAAAEAACcQAAAAEE4Ev60vNYxN4l6QFafRcTn256zaozrgvOypH85qM84c2Ia2HoM9P78liRIisl5kKQ==', N'T2WAKSGFWEBXXESYYI3DYIOZQVR3C7ZZ', N'cc5ac280-2d01-4247-a1d7-9b77efe917d1', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a140d95b-45f0-4207-97a4-b361108ff9d3', N'test3', N'TEST3', N'test3@test.com', N'TEST3@TEST.COM', 1, N'AQAAAAEAACcQAAAAELObe1hhq757+LGzyWB5mO5KDxUeGxxNSmKL0xyVwahl25Cdl6V5vLYKygRnjIkxZw==', N'RKT5FMXL3H5VD6TCCX5JUGZCWUSJ3M4Q', N'e357359f-3908-4478-be05-49991781c14f', NULL, 0, 0, NULL, 1, 0)
/****** Object:  Index [IX_ApiResourceClaims_ApiResourceId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceClaims_ApiResourceId] ON [dbo].[ApiResourceClaims]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceProperties_ApiResourceId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceProperties_ApiResourceId] ON [dbo].[ApiResourceProperties]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApiResources_Name]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiResources_Name] ON [dbo].[ApiResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceScopes_ApiResourceId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceScopes_ApiResourceId] ON [dbo].[ApiResourceScopes]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceSecrets_ApiResourceId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceSecrets_ApiResourceId] ON [dbo].[ApiResourceSecrets]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeClaims_ScopeId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeClaims_ScopeId] ON [dbo].[ApiScopeClaims]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeProperties_ScopeId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeProperties_ScopeId] ON [dbo].[ApiScopeProperties]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApiScopes_Name]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiScopes_Name] ON [dbo].[ApiScopes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientClaims_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientClaims_ClientId] ON [dbo].[ClientClaims]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientCorsOrigins_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientCorsOrigins_ClientId] ON [dbo].[ClientCorsOrigins]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientGrantTypes_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientGrantTypes_ClientId] ON [dbo].[ClientGrantTypes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientIdPRestrictions_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientIdPRestrictions_ClientId] ON [dbo].[ClientIdPRestrictions]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientPostLogoutRedirectUris_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[ClientPostLogoutRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientProperties_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientProperties_ClientId] ON [dbo].[ClientProperties]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientRedirectUris_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientRedirectUris_ClientId] ON [dbo].[ClientRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clients_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clients_ClientId] ON [dbo].[Clients]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientScopes_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientScopes_ClientId] ON [dbo].[ClientScopes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientSecrets_ClientId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientSecrets_ClientId] ON [dbo].[ClientSecrets]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DeviceCodes_DeviceCode]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DeviceCodes_DeviceCode] ON [dbo].[DeviceCodes]
(
	[DeviceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeviceCodes_Expiration]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_DeviceCodes_Expiration] ON [dbo].[DeviceCodes]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityResourceClaims_IdentityResourceId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityResourceClaims_IdentityResourceId] ON [dbo].[IdentityResourceClaims]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityResourceProperties_IdentityResourceId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityResourceProperties_IdentityResourceId] ON [dbo].[IdentityResourceProperties]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityResources_Name]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdentityResources_Name] ON [dbo].[IdentityResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersistedGrants_Expiration]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_Expiration] ON [dbo].[PersistedGrants]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_SessionId_Type]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_SessionId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[SessionId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [dbo].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[Users]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/9/2021 5:18:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Users]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApiResources] ADD  DEFAULT (CONVERT([bit],(0))) FOR [ShowInDiscoveryDocument]
GO
ALTER TABLE [dbo].[ApiScopeClaims] ADD  DEFAULT ((0)) FOR [ScopeId]
GO
ALTER TABLE [dbo].[ApiScopes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Enabled]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT (CONVERT([bit],(0))) FOR [RequireRequestObject]
GO
ALTER TABLE [dbo].[ApiResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceClaims] CHECK CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceProperties] CHECK CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceScopes]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceScopes] CHECK CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceSecrets] CHECK CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeClaims] CHECK CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ApiScopeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeProperties] CHECK CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypes] CHECK CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientProperties_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_ClientProperties_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopes] CHECK CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[IdentityResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceClaims] CHECK CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[IdentityResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceProperties] CHECK CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [IdentityManagement] SET  READ_WRITE 
GO
