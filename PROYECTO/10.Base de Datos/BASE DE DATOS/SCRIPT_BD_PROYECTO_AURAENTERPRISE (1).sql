Create Database BDAURAENTERPRISE;

Use BDAURAENTERPRISE;

Drop Database BDAURAENTERPRISE;

Create Table Equipo (
ID_Equipo Int Primary Key,
Nombre_Equipo Varchar(30) Not Null,
Tipo_Equipo Varchar(20) Not Null, 
ID_FalloFK Int Not Null,
ID_IncidenciaFK Int Not Null,
ID_ConectividadFK Int Not Null,
ID_SoftwareFK Int Not Null
);

Create table Software (
ID_Software Int Primary Key,
ID_SOFK Int Not Null,
ID_SOEspFK Int Not Null
);

Create Table Software_Especifico (
ID_SOEsp Int Primary Key,
Version_SOE Varchar(20) Not Null,
Tipo Varchar(20) Not Null,
Estado Varchar(20) Not Null
);

Create Table Sistema_Operativo (
ID_SO Int Primary Key,
Nombre_So Varchar(30) Not Null,
Licencia_S Varchar(20) Not Null,
Service_Pack Varchar(10) Not Null
);

Create Table Tipo_Conectividad (
ID_Conectividad Int Primary Key,
Conectividad Varchar(50) Not Null,
Estado Varchar(20) Not Null
);

Create Table Diagnostico_Fallo (
ID_Fallo Int Primary Key,
Fallo Varchar(140) Not Null,
Causa Varchar(140) Not Null,
Solucion Varchar(140) Not Null
);

Create Table Entrada (
ID_Entrada Int Primary Key,
FechaRecibido Date Not Null,
EstadoEntrada Varchar(20) Not Null,
ID_EquipoFK Int Not Null
);

Create Table Salida (
ID_Salida Int Primary Key,
FechaEntrega Date Not Null,
EstadoActual Varchar(50) Not Null,
ID_EquipoFK Int Not Null
);

Create Table Usuario (
ID_Usuario Int Primary Key,
Nombre_Cliente Varchar(30) Not Null,
Telefono_C Varchar(20) Not Null,
Email_C Varchar(50) Not Null,
Nombre_Usuario Varchar(30) Not Null,
Tipo Varchar(20) Not Null,
Password_U  Varchar(20) Not Null,
Estado Varchar(20) Not Null,
ID_EquipoFK Int Not Null
);

Create Table Informe_Incidencia (
ID_Incidencia Int Primary Key,
Marca_Equipo Varchar(50) Not Null,
Tipo_Equipo Varchar(30) Not Null,
Fecha_Recibido Date Not Null,
Nombre_Propietario Varchar(30) Not Null,
Incidencia Varchar(140) Not Null
);

Create Table Hardware (
ID_Hardware Int Primary Key,
ID_EquipoFK Int Not Null,
ID_DiscoDuroFK Int Not Null,
ID_BoardFK Int Not Null,
ID_ProcesadorFK Int Not Null,
ID_MRAMFK Int Not Null,
ID_CDFK Int Not Null,
ID_PuertoFK Int Not Null,
ID_MonitorFK Int Not Null,
ID_TredFK Int Not Null,
ID_TvideoFK Int Not Null,
ID_TsonidoFK Int Not Null,
ID_TecladoFK Int Not Null,
ID_AliFK Int Not Null,
ID_CableFK Int Not Null,
ID_MouseFK Int Not Null
);

Create Table Board (
ID_Board Int Primary Key,
Marca_Board Varchar(20) Not Null,
Referencia Varchar(20) Not Null,
Tipo_AnchoBus Varchar(30) Not Null
);

Create Table Procesador (
ID_Procesador Int Primary Key,
Marca_P Varchar(20) Not Null,
Nomenclatura Varchar(20) Not Null,
Velocidad Varchar(20) Not Null,
Numero_Nucleos Int Not Null
);

Create Table Memoria_RAM (
ID_MRAM Int Primary Key,
Marca_MR Varchar(20) Not Null,
Tipo Varchar(20) Not Null,
Velocidad Varchar(20) Not Null
);

Create Table Unidad_CD_DVD (
ID_CD Int Primary Key,
Marca_CD Varchar(30) Not Null,
Serial_CD Varchar(20) Not Null,
Tipo Varchar(20) Not Null
);

Create Table Puerto (
ID_Puerto Int Primary Key,
Paralelo Varchar(20) Not Null,
Serie Varchar(20) Not Null,
USB Varchar(20) Not Null
);

Create Table Monitor (
ID_Monitor Int Primary Key,
Tiene Varchar(20) Not Null,
Marca_MN Varchar(20) Not Null,
Serial_MN Varchar(20) Not Null,
Tipo Varchar(20) Not Null
);

Create Table Tarjeta_Red (
ID_Tred Int Primary Key,
Cableada Varchar(20) Not Null,
Inalambrica Varchar(20) Not Null,
Marca_TD Varchar(20) Not Null
);

Create Table Tarjeta_Video (
ID_Tvideo Int Primary Key,
Integrada Varchar(20) Not Null,
Tamaño Varchar(20) Not Null
);

Create Table Tarjeta_Sonido (
ID_TSonido Int Primary Key,
Integrada Varchar(20) Not Null,
Marca_TS Varchar(20) Not Null
);

Create Table Disco_Duro (
ID_DiscoDuro Int Primary Key,
Marca_DD Varchar(20) Not Null,
Tipo Varchar(20) Not Null,
Serial_DD Varchar(20) Not Null,
Particiones_DD Int Not Null
);

Create Table Teclado (
ID_Teclado Int Primary Key,
Marca_T Varchar(20) Not Null,
Estado_T Varchar(20) Not Null
);

Create Table Mouse (
ID_Mouse Int Primary Key,
Marca_MS Varchar(20) Not Null,
Estado_MS Varchar(20) Not Null
);

Create Table Alimentacion (
ID_Ali Int Primary Key,
Tipo_Ali Varchar(20) Not Null,
Marca_Ali Varchar(20) Not Null,
Referencia Varchar(20) Not Null
);

Create Table Cable (
ID_Cable Int Primary Key,
C_Torre Varchar(20) Not Null,
C_Pantalla Varchar(20) Not Null,
C_VGA Varchar(20) Not Null
);

Alter Table Equipo
Add Constraint FKDiagnostico_FalloEquipo
Foreign Key (ID_FalloFK)
References Diagnostico_Fallo (ID_Fallo);

Alter Table Equipo
Add Constraint FKInforme_IncidenciaEquipo
Foreign Key (ID_IncidenciaFK)
References Informe_Incidencia (ID_Incidencia);

Alter Table Equipo
Add Constraint FKSoftwareEquipo
Foreign Key (ID_SoftwareFK)
References Software (ID_Software);

Alter Table Software
Add Constraint FKSoftware_EspecificoSoftware
Foreign Key (ID_SOEspFK)
References Software_Especifico (ID_SOEsp);

Alter Table Software
Add Constraint FKSistema_OperativoSoftware
Foreign Key (ID_SOFK)
References Sistema_Operativo (ID_SO);

Alter Table Equipo
Add Constraint FKTipo_ConectividadEquipo
Foreign Key (ID_ConectividadFK)
References Tipo_Conectividad (ID_Conectividad);

Alter Table Entrada
Add Constraint FKEntradaEquipo
Foreign Key (ID_EquipoFK)
References Equipo (ID_Equipo);

Alter Table Salida
Add Constraint FKSalidaEquipo
Foreign Key (ID_EquipoFK)
References Equipo (ID_Equipo);

Alter Table Usuario
Add Constraint FKUsuarioEquipo
Foreign Key (ID_EquipoFK)
References Equipo (ID_Equipo);

Alter Table Hardware
Add Constraint FKTarjeta_SonidoHardware
Foreign Key (ID_TsonidoFK)
References Tarjeta_Sonido (ID_Tsonido);

Alter Table Hardware
Add Constraint FKCableHardware
Foreign Key (ID_CableFK)
References Cable (ID_Cable);

Alter Table Hardware
Add Constraint FKAlimentacionHardware
Foreign Key (ID_AliFK)
References Alimentacion (ID_Ali);

Alter Table Hardware
Add Constraint FKMouseHardware
Foreign Key (ID_MouseFK)
References Mouse (ID_Mouse);

Alter Table Hardware
Add Constraint FKTecladoHardware
Foreign Key (ID_TecladoFK)
References Teclado (ID_Teclado);

Alter Table Hardware
Add Constraint FKDisco_DuroHardware
Foreign Key (ID_DiscoDuroFK)
References Disco_Duro (ID_DiscoDuro);

Alter Table Hardware
Add Constraint FKTarjeta_videoHardware
Foreign Key (ID_TvideoFK)
References Tarjeta_Video (ID_Tvideo);

Alter Table Hardware
Add Constraint FKTarjeta_RedHardware
Foreign Key (ID_TredFK)
References Tarjeta_Red (ID_Tred);

Alter Table Hardware
Add Constraint FKMonitorHardware
Foreign Key (ID_MonitorFK)
References Monitor (ID_Monitor);

Alter Table Hardware
Add Constraint FKPuertoHardware
Foreign Key (ID_PuertoFK)
References Puerto (ID_Puerto);

Alter Table Hardware
Add Constraint FKUnidadCDHardware
Foreign Key (ID_CDFK)
References Unidad_CD_DVD (ID_CD);

Alter Table Hardware
Add Constraint FKMemoria_RAMHardware
Foreign Key (ID_MRAMFK)
References Memoria_RAM (ID_MRAM);

Alter Table Hardware
Add Constraint FKProcesadorHardware
Foreign Key (ID_ProcesadorFK)
References Procesador (ID_Procesador);

Alter Table Hardware
Add Constraint FKBoardHardware
Foreign Key (ID_BoardFK)
References Board (ID_Board);

Describe  Equipo;

Insert Into Entrada (ID_Entrada,FechaRecibido,EstadoEntrada,ID_EquipoFK)
Values (1456,2021-04-22,'Defectuoso',1477),
(9786,2021-04-22,'Defectuoso',4698);

Select*From Entrada;

Insert Into Salida (ID_Salida,FechaEntrega,EstadoActual,ID_EquipoFK)
Values (8976,2021-04-23,'Funcional',1477),
(3256,2021-04-23,'Funcional',4698);

Select*From Equipo;

Insert Into Equipo (ID_Equipo,Nombre_Equipo,Tipo_Equipo,ID_FalloFK,ID_IncidenciaFK,ID_ConectividadFK,ID_SoftwareFK)
Values (1477,'DESKTOP-CGLKK85','Mesa',68934,21,698,11),
(4698,'DESKTOP-S6HV4RC','Mesa',65987,74,365,22);

Insert Into Diagnostico_Fallo (ID_Fallo,Fallo,Causa,Solucion)
Values (68934,'No reconocia la red Wifi','La configuaracion estaba desconectada','Se activo la configuarion de wifi'),
(65987,'Calentamiento en la torre','La pasta termica estaba seca','Se cambio la pasta termica');

Insert Into Informe_Incidencia (ID_Incidencia,Marca_Equipo,Tipo_Equipo,Fecha_Recibido,Nombre_Propietario,Incidencia)
Values (21,'ASUS','Mesa',2021-04-22,'Carlos Rodriguez','Medio'),
(74,'ASUS','Mesa',2021-04-22,'Juan Hernandez','Alto');

Insert Into Tipo_Conectividad (ID_Conectividad,Conectividad,Estado)
Values (698,'Cableada e Inalambrica','Funcional'),
(365,'Cableada','Funcional');

Insert Into Usuario (ID_Usuario,Nombre_Cliente,Telefono_C,Email_C,Nombre_Usuario,Tipo,Password_U,Estado,ID_EquipoFK)
Values (1,'Carlos Rodriguez','+57 32245897637','CarR0009@gmail.com','Carlos_Rodriguez','Programador','CaR45698','Activo',1477),
(2,'Juan Hernandez','+57 3136987658','JuanH3421@gmail.com','Juan_Hernandez','Diseñador','Ju4m9876','Activo',4698);

Insert Into Software (ID_Software,ID_SOFK,ID_SOEspFK)
Values (11,48,47),
(22,69,65);

Insert Into Software_Especifico (ID_SOEsp,Version_SOE,Tipo,Estado)
Values (47,'','Libre','Activo'),
(65,'','Licenciado','Activo');

Insert Into Sistema_Operativo (ID_SO,Nombre_So,Licencia_S,Service_Pack)
Values (48,'Windows Server','Activa','6'),
(69,'Windows Server','Activa','6');

Insert Into Hardware (ID_Hardware,ID_EquipoFK,ID_DiscoDuroFK,ID_BoardFK,ID_ProcesadorFK,ID_MRAMFK,ID_CDFK,ID_PuertoFK,ID_MonitorFK,ID_TredFK,ID_TvideoFK,ID_TsonidoFK,ID_TecladoFK,ID_AliFK,ID_CableFK,ID_MouseFK)
Values (2243,1477,234,123,175,12,1,80,56,65,150,45,900,55,38,1),
(1520,4698,788,456,745,35,2,44,45,802,390,38,500,35,34,2);

Select*From Hardware;

Insert Into Board (ID_Board,Marca_Board,Referencia,Tipo_AnchoBus)
Values (123,'ASUS',' Prime A320m K','bus frontal a 1066 MHz'),
(456,'ASUS',' Prime A320m K','bus frontal a 1066 MHz');

Insert Into Procesador (ID_Procesador,Marca_P,Nomenclatura,Velocidad,Numero_Nucleos)
Values (175,'Intel','i7-7Y75','3,6 GHz',4),
(745,'AMD','A8','3,6 GHz',6);

Insert Into Memoria_RAM (ID_MRAM,Marca_MR,Tipo,Velocidad)
Values (12,'Hyper x','ddr4','2133'),
(35,'Corsair','ddr4','2133');

Insert Into Unidad_CD_DVD (ID_CD,Marca_CD,Serial_CD,Tipo)
Values (1,'LG','500039LX','CD'),
(2,'LG','310299RZ','CD');

Insert Into Puerto (ID_Puerto,Paralelo,Serie,USB)
Values (80,'si','si','si'),
(44,'si','si','si');

Insert Into Monitor (ID_Monitor,Tiene,Marca_MN,Serial_MN,Tipo)
Values (56,'Si','LG','568012MRX','LCD'),
(45,'Si','LG','700942LRF','LCD');

Insert Into Tarjeta_Red (ID_Tred,Cableada,Inalambrica,Marca_TD)
Values (65,'Si','Si','Tp-link Pci Express'),
(802,'Si','No','Tp-link Pci Express');

Insert Into Tarjeta_Video (ID_Tvideo,Integrada,Tamaño)
Values (150,'Gigabyte','8gb'),
(390,'msi','2gb');


Insert Into Tarjeta_Sonido (ID_TSonido,Integrada,Marca_TS)
Values (45,'Si','Creative Sound Blaster Audigy Fx'),
(38,'Si','Creative Sound Blaster Audigy Fx');

Insert Into  Teclado (ID_Teclado,Marca_T,Estado_T)
Values (900,'Genius','Funcional'),
(500,'Genius','Funcional');


Insert Into Mouse (ID_Mouse,Marca_MS,Estado_MS)
Values (1,'Genius','Funcional'),
(2,'Genius','Funcional');

Insert Into Alimentacion (ID_Ali,Tipo_Ali,Marca_Ali,Referencia)
Values (55,'Fuente de poder','Vissionatx','650w'),
(35,'Fuente de poder','Vissionatx','650w');

Insert Into Cable (ID_Cable,C_Torre,C_Pantalla,C_VGA)
Values (38,'Si','Si','si'),
(34,'Si','Si','si');

Insert Into  Disco_Duro (ID_DiscoDuro,Marca_DD,Tipo,Serial_DD,Particiones_DD)
Values (234,'Hitachi','HDD','50026b7',1),
(788,'Hitachi','HDD','50026b7',2);







																																							
																																				