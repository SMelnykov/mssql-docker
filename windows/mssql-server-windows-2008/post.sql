USE [master]
GO

/****** Object:  Login [BUILTIN\Administrators]    Script Date: 5/29/2015 2:46:48 PM ******/
CREATE LOGIN [BUILTIN\Administrators] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO

exec sp_addsrvrolemember @rolename = [sysadmin] , @loginame = 'BUILTIN\Administrators'
GO

CREATE LOGIN isqladmin WITH PASSWORD ='d7f8g9', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO

exec sp_addsrvrolemember @rolename = [sysadmin] , @loginame = 'isqladmin'
GO


ALTER DATABASE [tempdb] MODIFY FILE (
NAME = N'tempdev',
SIZE = 600MB );
GO

ALTER DATABASE [tempdb] MODIFY FILE (
NAME = N'templog',
SIZE = 60MB );
GO


exec sys.sp_configure @configname = 'show advanced options', @configvalue = 1
RECONFIGURE
exec sys.sp_configure @configname = 'min server memory (MB)', @configvalue = 2048
RECONFIGURE WITH OVERRIDE
GO

exec sp_configure 'min server memory (MB)', 1024
RECONFIGURE
exec sp_configure 'max server memory (MB)', 2147483647
RECONFIGURE
GO

