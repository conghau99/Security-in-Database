/*----------------------------------------------------------
MASV: N17DCAT018
HO TEN: HOANG PHAN MINH DUC
LAB: 05
NGAY: 26/09/2020
----------------------------------------------------------*/ 
USE master
DROP master KEY
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'n17dcat018'
USE master
GO 
select * from sys.certificates

CREATE CERTIFICATE QLBD_certificate2
FROM FILE = 'C:\Backup\QLBongDa_cer.cer'
WITH PRIVATE KEY (
  FILE = N'C:\Backup\QLBongDa_cer_key.pvk'
, DECRYPTION BY PASSWORD = 'n17dcat018'
)
GO



/*FIXED THANH CONG*/
