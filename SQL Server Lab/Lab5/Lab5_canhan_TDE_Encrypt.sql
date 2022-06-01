/*----------------------------------------------------------
MASV: N17DCAT018
HO TEN: HOANG PHAN MINH DUC
LAB: 05
NGAY: 26/09/2020
----------------------------------------------------------*/ 

/*1. Back up Database*/
/*use master;
GO 
BACKUP DATABASE [QLBongDa] TO DISK = N'C:\Backup\QLBD.bak'
*/
/*2. Tao khoa chinh bao ve khoa ma hoa  */
/*RESET*/
/*
ALTER DATABASE QLBongDa
SET ENCRYPTION OFF;
GO
use [QLBongDa]
drop database encryption key
drop master key 
drop certificate MyServerCert
*/
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'n17dcat018';
GO

/*3. Tao khoa cong nhan bao ve khoa chinh*/
CREATE CERTIFICATE certLab5 WITH SUBJECT = 'certLab5';
GO

USE QLBongDa;
GO
/*4. Tao khoa ma hoa bao ve bang khoa cong nhan*/
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_128
ENCRYPTION BY SERVER CERTIFICATE certLab5;
GO

/*5. Backup Certificate*/
use master
go 
backup certificate certLab5
to file = 'C:\Backup\QLBD_cer.cer'
with private key (File= 'C:\Backup\QLBD_cer_key.pvk', ENCRYPTION BY PASSWORD = 'n17dcat018')
GO

/*6. Tao backup log file, neu k thi buoc 7 se bao loi */
BACKUP LOG QLBongDa 
TO DISK = 'C:\Backup\QLBD.TRN'
GO

/*7. Bat Ma hoa len*/
ALTER DATABASE V_League SET ENCRYPTION ON;
GO

/*8. Kiem tra cac khoa da tao*/
use master 
SELECT encryptor_type, key_length, key_algorithm, encryption_state, create_date
FROM sys.dm_database_encryption_keys
go

/*9. Xoa Database .bak de tao file bak moi da ma hoa */

/*10. Tao .bak file ma hoa */
/*
use master
BACKUP DATABASE [V_League] to DISK = N'C:\Backup\QLBD.bak'
WITH NOFORMAT, NOINIT, NAME = N'Client full Database Backup',
SKIP, NOREWIND, NOUNLOAD, STATS = 10
GO
*/






