/*----------------------------------------------------------
MASV: N17DCAT023
HO TEN: CHE CONG HAU
LAB: 04
NGAY: 27/09/2020
----------------------------------------------------------*/ 
CREATE PROC SP_SEL_ENCRYPT_NHANVIEN
AS
BEGIN
	SELECT MANV, HOTEN, EMAIL, CONVERT(VARCHAR(256),LUONG) AS LUONG
	FROM NHANVIEN
END

--EXEC SP_SEL_ENCRYPT_NHANVIEN