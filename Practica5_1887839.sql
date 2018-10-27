USE CONSULTORIO_LSTI 
GO

Select Street_Number as "Numero Calle", Neighborhood as "Vecindario", NAME as "Nombre"
from Address, Patient
ORDER BY Street_Number
Select ID_Specialty AS "ID_ESPECIALIDAD", Role AS "Role" 
from Doctor,Role
order by  Role
Select Height as "Peso",Name AS "Nombre"  
from Health_Care, Patient
order by Name
Select ID_Expedient as "Identificador_paciente", Diagnosis as "Diagnostico"
from Expedient,Prescription
order by ID_Expedient
Select ID_Booth as "Cubiculo", Name AS "Nombre", First_Surname as "Apellido", Birthdate as "Edad"
from Booth, Patient,Expedient
order by Birthdate


SELECT m.ID_Doctor,m.ID_Employee,m.ID_Specialty,v.ID_Prescription
FROM Doctor m INNER JOIN Prescription_Product v ON v.ID_Product = m.ID_Doctor
SELECT m.Name,m.Birthdate,m.First_Surname, m.Age, v.ID_Prescription_Product
FROM Patient m LEFT JOIN Prescription_Product v ON v.ID_Prescription_Product = m.Age
SELECT m.Height, v.Name, v.Age, v.Birthdate, v.First_Surname, v.Second_Surname
FROM Health_Care m RIGHT JOIN Patient v ON v.Age = m.BMI
SELECT *
FROM Doctors_Office CROSS JOIN Patient


SELECT Weight As Peso, Height As Altura
FROM Health_Care
WHERE Height>=1.30

SELECT Neighborhood, Street_Number
FROM Address
WHERE Neighborhood='Vienna';

SELECT Gender, name, First_Surname, Second_Surname
FROM Employee
WHERE Gender='M'

SELECT ID_Booth, Booth
FROM Booth
WHERE Booth='Cardiologia'

SELECT Name, First_Surname, Second_Surname, Gender, Age
FROM Employee
WHERE Age>=30 AND Gender=' F'


SELECT m.ID_Specialty, m.ID_Employee, SUM(b.Age) AS "Años pacientes"
FROM Doctor m INNER JOIN Patient b ON m.ID_Employee = b.Patient_num
GROUP BY m.ID_Specialty, m.ID_Employee
SELECT m.ID_Branch, m.ID_Booth, SUM(b.ID_Employee) AS "Especialidades"
FROM Doctors_Office m INNER JOIN Doctor b ON m.ID_Branch=b.ID_Employee
GROUP BY m.ID_Booth, m.ID_Branch
SELECT m.Street_Number, m.Neighborhood,AVG(b.Patient_num) AS "Identificador Paciente"
FROM Address m INNER JOIN Patient b ON m.ID_Address=b.Patient_num
GROUP BY m.Street_Number, m.Neighborhood


SELECT COUNT(Phone_Number)
FROM Employee
SELECT AVG(Age)
From Employee
SELECT SUM(Age)
From Patient 
WHERE Age=26
SELECT MIN(Age)
From Patient
SELECT MAX(Age)
From Employee


