Use CONSULTORIO_LSTI
GO

SELECT Patient_num, COUNT(Patient_num) AS 'Cantidad Pacientes'
FROM Patient
GROUP BY Patient_num
HAVING COUNT(Patient_num) > 0

select  First_Surname,Second_Surname from Patient where Name in  (select Neighborhood from Address where District != Street_Number);
select * from Patient where Patient_num in (select ID_Address from Address where ID_Address != Patient_num);

WITH Customers AS (
SELECT CompanyName, SUM(CompanyName) AS 'Nombre de la compañia'
FROM Patient
GROUP BY  CompanyName
)
SELECT *
FROM Customers  WHERE Customers.CompanyName > 0

/****** Object:  View [dbo].[AddressView]    Script Date: 27/10/2018 9:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AddressView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[AddressView] as select ID_Address, Street_Number, Neighborhood, District from Address where ID_Address >= 34;' 
GO

/****** Object:  View [dbo].[BoothView]    Script Date: 27/10/2018 9:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BoothView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[BoothView] as select ID_Booth, Booth from Booth where ID_Booth !=10;' 
GO

/****** Object:  View [dbo].[CertificateView]    Script Date: 27/10/2018 9:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CertificateView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[CertificateView] as select ID_Certificate, Certificate from Certificate where ID_Certificate !=18;' 
GO

/****** Object:  View [dbo].[Doctor_OfficeView]    Script Date: 27/10/2018 9:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Doctor_OfficeView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[Doctor_OfficeView] as select ID_Doctors_Office, ID_Branch, ID_Booth from Doctors_Office where ID_Schedule= 4;' 
GO

/****** Object:  View [dbo].[Doctor_OfficeView]    Script Date: 27/10/2018 9:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Doctor_OfficeView]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[Doctor_OfficeView] as select ID_Doctors_Office, ID_Branch, ID_Booth from Doctors_Office where ID_Schedule= 4;' 
GO
