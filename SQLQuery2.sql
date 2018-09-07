create database Practica_1_LBDO_Version4

	use Practica_1_LBDO

		create table Receta
		(Folio varchar(100),
		 Fecha datetime,
		 Cedula_Prof varchar(30),
		 Nombre_medic varchar(50),
		 Nombre_Pacien varchar(50),
		 Edad_paciente TINYINT,
		 Direccion varchar(50),
		 Telefeno int,
		 Medicamentos varchar(200),
		 )
		
		 
		create table Personal
		(Fecha_Naci date,
		 RFC varchar(30),
		 idCurp varchar(50) primary key,
		 IFEINE image,
		 NumSeg int,
		 Nombre varchar(50),
		 Edad TINYINT,
		 Direccion varchar(50),
		 Telefeno int,
		 Antecedentes varchar(200)
		)

		create table Vehiculos
		(Fecha_Comp date,
		 idModelo varchar(50) primary key,
		 Placas_imag image,
		 NumSeg int,
		 Encargado varchar(50),
		 Años_Uso TINYINT,
		 Direccion_resguardo varchar(50),
		 Telefeno_asignado int,
		 Incidentes text,
		 Kilometros bigint)

		create table Tratamiento
		(Fecha_Asignacion date,
		 nombre_paciente varchar(30),
		 años_paciente TINYINT,
		 Descripccion varchar(2000),
		 Medicamentos_usado varchar(50),
		 Concretado bit,
		 Medico_Asign int,
		 Costo_trat money,
		)

		create table Costos
		(Fecha_pago date,
		 nombre_paciente varchar(30),
		 Folio_paciente TINYINT,
		 Medicamentos_usado varchar(50),
		 Precio_Med money,
		 Pago_Medico money,
		)

			alter table Costos
		add CostoTotal as ( Precio_Med + Pago_Medico)



