CREATE DATABASE IF NOT EXISTS hulk;
USE hulk;




CREATE TABLE roles (
id_rol     int (200) auto_increment not null,
nombre_rol  varchar (20) not null,
descripcion text,
created_at    datetime DEFAULT NULL,
update_at     datetime DEFAULT NULL,

CONSTRAINT pk_roles PRIMARY KEY (id_rol),
CONSTRAINT unic_rol_nombre UNIQUE (nombre_rol)
)ENGINE=InnoDB;


CREATE TABLE users (
id   int(200) auto_increment not null,
usuario     varchar (20) not null,
nombres     varchar (50) not null,
apellidos   varchar (100) not null,
correo      varchar (200) not null,
password  varchar (20) not null,
rol           int (200),
created_at    datetime DEFAULT NULL,
update_at     datetime DEFAULT NULL,
remember_token  varchar (255),

CONSTRAINT pk_usuarios PRIMARY KEY (id),
CONSTRAINT usuario_unic UNIQUE (usuario)


)ENGINE=InnoDB;


CREATE TABLE clientes (
id   int (11) auto_increment not null,
nombre  varchar (200) not null,
created_at    datetime DEFAULT NULL,
update_at     datetime DEFAULT NULL,

CONSTRAINT pk_clientes PRIMARY KEY (id),
CONSTRAINT cliente_unique UNIQUE (nombre)
)ENGINE=InnoDB;


CREATE TABLE host_clientes(
id int(10) auto_increment not null,
host_name varchar (200) not null,
ip varchar(20) not null,
cliente varchar (200) not null,
ambiente varchar (100) not null,
sistema_operativo varchar(100) not null,
escalamiento varchar (100),
notas varchar(500),
created_at    datetime DEFAULT NULL,
update_at     datetime DEFAULT NULL,

CONSTRAINT pk_host_cliente PRIMARY KEY (id),
CONSTRAINT host_name_unique UNIQUE (host_name),
CONSTRAINT host_ip_unique UNIQUE (ip)

)ENGINE=InnoDB;

CREATE TABLE hostService_clientes(
id int(10) auto_increment not null,
service_name varchar(200)not null,
host varchar (200) not null,
ip varchar(20) not null,
cliente varchar (200) not null,
ambiente varchar (100) not null,
sistema_operativo varchar(100) not null,
escalamiento varchar (100),
notas varchar(500),
created_at    datetime DEFAULT NULL,
update_at     datetime DEFAULT NULL,

CONSTRAINT pk_hostService_cliente PRIMARY KEY (id),
CONSTRAINT service_host_name_unique UNIQUE (service_name)

)ENGINE=InnoDB;

CREATE TABLE especialistas(
es_id int(10) AUTO_INCREMENT PRIMARY KEY,
es_nombres varchar (100) not null,
es_apellidos varchar(150)not null,
es_correo varchar (500),
es_celular_coorporativo varchar (10),
es_celular_personal varchar (10),
es_especialidad varchar (500),
created_at    datetime DEFAULT NULL,
update_at     datetime DEFAULT NULL
)ENGINE=INNODB;

CREATE TABLE gerentes_proyectos(
gp_id int(10) AUTO_INCREMENT PRIMARY KEY,
gp_nombres varchar (100) not null,
gp_apellidos varchar(150)not null,
gp_correo varchar (500),
gp_celular_coorporativo varchar (10),
gp_celular_personal varchar (10),
gp_cliente varchar (200),
gp_centro_costos varchar(20),
created_at    datetime DEFAULT NULL,
update_at     datetime DEFAULT NULL
)ENGINE=INNODB;

/*ALTER TABLE PARA LAS TABLAS*/
ALTER TABLE `hulk`.`especialistas` ADD UNIQUE `unique_email` (`es_correo`);
ALTER TABLE `users` ADD CONSTRAINT `fk_rol_user` FOREIGN KEY (`rol`) REFERENCES `roles`(`nombre_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `host_clientes` ADD CONSTRAINT `fk_clientes` FOREIGN KEY (`cliente`) REFERENCES `clientes`(`nombre`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `hostservice_clientes` ADD CONSTRAINT `fk_host` FOREIGN KEY (`host`) REFERENCES `host_clientes`(`host_name`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `hostservice_clientes` ADD CONSTRAINT `fk_ip` FOREIGN KEY (`ip`) REFERENCES `host_clientes`(`ip`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `hostservice_clientes` ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente`) REFERENCES `host_clientes`(`cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `gerentes_proyectos` ADD FOREIGN KEY (`gp_cliente`) REFERENCES `clientes`(`nombre`) ON DELETE RESTRICT ON UPDATE RESTRICT;

/*Script e la tabla Roles*/
INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `created_at`, `update_at`) VALUES (NULL, 'Administrador', 'Derecho a todos los módulos del sistema, y a la creación de usuarios.', NULL, NULL);
INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `created_at`, `update_at`) VALUES (NULL, 'Estándar', 'Usuario básico.', NULL, NULL);

/*Script de la tabla Usuario*/
INSERT INTO `usuarios` (`id`, `usuario`, `nombres`, `apellidos`, `correo`, `password`, `rol`, `created_at`, `update_at`, `remember_token`) VALUES (NULL, 'admin', 'Jose David', 'Quintero Bernal', 'quinterobernaldavid@gmail.com', 'luci5610', '1', NULL, NULL, NULL);

/*Script de la tabla clientes*/
INSERT INTO `clientes` (`id`, `nombre`, `created_at`, `update_at`) VALUES (NULL, 'TERPEL', NULL, NULL), (NULL, 'FLAMINGO', NULL, NULL);
INSERT INTO `clientes` (`id`, `nombre`, `created_at`, `update_at`) VALUES (NULL, 'MEFIA', NULL, NULL), (NULL, 'VANTI', NULL, NULL);
INSERT INTO `clientes` (`id`, `nombre`, `created_at`, `update_at`) VALUES (NULL, 'ASNET', NULL, NULL);

/*Script de la tabla host_clientes*/
INSERT INTO `host_clientes` (`id`, `host_name`, `ip`, `cliente`, `ambiente`, `sistema_operativo`, `escalamiento`, `notas`, `created_at`, `update_at`) VALUES (NULL, 'COLBOGSRVACL01', '10.220.0.147', 'TERPEL', 'Producción', 'Windows', 'Especialista Microsoft', NULL, NULL, NULL);


INSERT INTO `especialistas` VALUES (NULL, 'FELIPE', 'ALVAREZ PEDRAZA', 'Felipe.Alvarez@asicamericas.com', '3164654092', NULL, 'AIX, Linux, Storage, TSM,backup exec, Veeam, Networker y Vmware');
INSERT INTO `especialistas` VALUES (NULL, 'HERNAN ARTURO', 'BEJARANO ROJAS', 'Hernan.Bejarano@asicamericas.com', '3185167136', NULL, 'Storage IBM  y TSM');
/*Script de la tabla especialistas*/
INSERT INTO `especialistas` VALUES (NULL, 'JORGE HUMBERTO', 'CESPEDES VASCOS', 'Jorge.Cespedes@asicamericas.com', '3164702697', NULL, 'Storage IBM, DELL, HP, TSM, backup exec, Avamar, Networker, Datadomain');
INSERT INTO `especialistas` VALUES (NULL, 'FRANCISCO JAVIER', 'CORREA ZAPATA', 'Francisco.Correa@asicamericas.com', '3152199234', '3113884907', 'Solaris, Storage Oracle, Sparc');
INSERT INTO `especialistas` VALUES (NULL, 'DANILO ARMANDO', 'DIAZ NARVAEZ', 'Danilo.Diaz@asicamericas.com', '3174397258', NULL, 'AS400,Power, Mimix, Icluster, BRMS');
INSERT INTO `especialistas` VALUES (NULL, 'DIEGO ALEJANDRO', 'DIAZ PARRA', 'Diego.Diaz@asicamericas.com', '3166920529', NULL, 'AIX, Linux, Storage, TSM, backup exec,VMware ');
INSERT INTO `especialistas` VALUES (NULL, 'OSCAR EDUARDO', 'GARCIA JIMENEZ', 'Oscar.GarciaJ@asicamericas.com', '3186229211', NULL, 'Windows Server, exchange, Office 365, Antivirus');
INSERT INTO `especialistas` VALUES (NULL, 'OSCAR JAVIER', 'GARCIA FERNANDEZ', 'Oscar.GarciaF@asicamericas.com', '3187151443', NULL, 'Windows Server, exchange, Office 365, Antivirus, Azure, Vmware');
INSERT INTO `especialistas` VALUES (NULL, 'CESAR DAVID', 'GOMEZ ARISTIZABAL', 'Cesar.Gomez@asicamericas.com', '3162351154', NULL, 'AS400,Power, Mimix, Icluster, BRMS');
INSERT INTO `especialistas` VALUES (NULL, 'MAURICIO', 'GOMEZ', 'Mauricio.Gomez@asicamericas.com', '3174351409', NULL, 'AIX, Linux, PowerVC, Linux Suse Hana');
INSERT INTO `especialistas` VALUES (NULL, 'FRANCISCO', 'GUTIERREZ RAMIREZ', 'Francisco.Gutierrez@asicamericas.com', '3184094097', NULL, 'AIX y Storage IBM');
INSERT INTO `especialistas` VALUES (NULL, 'FELIX MANUEL', 'HERNANDEZ MAZA', 'Felix.Hernandez@asicamericas.com', '3185214464', NULL, 'Weblogic y WCC - OCI ');
INSERT INTO `especialistas` VALUES (NULL, 'ALFONSO JOSE', 'JIMENEZ MEDICIS', 'Alfonso.Jimenez@asicamericas.com', '3164737807', NULL, 'AIX, Linux,Solaris, Sparc, Storage y Vmware');
INSERT INTO `especialistas` VALUES (NULL, 'JOHN', 'FRESNO', 'John.Fresno@asicamericas.com', '3157564957', NULL, 'SOA (WAS, MQ, BROKER) Rational, Weblogic, IIS, Apache, Tomcat, JBOSS');
INSERT INTO `especialistas` VALUES (NULL, 'FRANCISCO ANTONIO', 'MARTINEZ LOZANO', 'Francisco.Martinez@asicamericas.com', '3158273884', NULL, 'AIX y Linux');
INSERT INTO `especialistas` VALUES (NULL, 'NICOLAS FABRIZI', 'NARVAEZ ACOSTA', 'Nicolas.Narvaez@asicamericas.com', '3176698268', NULL, 'Storage IBM , TSM, backup exec,Networker y Datadomain');
INSERT INTO `especialistas` VALUES (NULL, 'LEONARDO RAFAEL', 'ORTIZ STHORMES', 'Leonardo.Ortiz@asicamericas.com', '3153437910', NULL, 'Base de datos (Oracle, Sql, Mysql, EBS), Solaris, Storage Oracle, Sparc,Oracle Linux, Oracle VM, OBS Oracle, OCI ');
INSERT INTO `especialistas` VALUES (NULL, 'JACKSON', 'PALACIOS PADILLA', 'Jackson.Palacios@asicamericas.com', '3175157305', NULL, 'Linux , EBS, hyperion');
INSERT INTO `especialistas` VALUES (NULL, 'LAURA ALEJANDRA', 'PRIETO CARDENAS', 'Laura.Prieto@asicamericas.com', '3164784366', NULL, 'AS400,Power, Mimix, Icluster, BRMS');
INSERT INTO `especialistas` VALUES (NULL, 'MAXIMINO', 'RAMOS PALACIOS', 'Maximino.Ramos@asicamericas.com', '3163052279', NULL, 'Lider tecnico , Storage IBM  y Vmware ');


INSERT INTO `especialistas` VALUES (NULL, 'JUAN DIEGO', 'ROMAN BEDOYA', 'Juan.Roman@asicamericas.com', '3174351438', NULL, 'Storage IBM , TSM, Networker y OBS Oracle');
INSERT INTO `especialistas` VALUES (NULL, 'JOSE CRISTHIAN', 'VARELA CARABALI', 'Jose.Varela@asicamericas.com', '3176475098', NULL, 'TSM, Veeam y hyperion');
INSERT INTO `especialistas` VALUES (NULL, 'JUAN CAMILO', 'CARRERO VALENZUELA', 'Juan.ValenzuelaC@asicamericas.com', '3182061892', NULL, 'Base de datos (Oracle, Sql, Mysql, postgresql)');
INSERT INTO `especialistas` VALUES (NULL, 'NICOLAS ALBERTO', 'SANTISTEBAN', 'Nicolas.Santisteban@asicamericas.com', '3152444647', NULL, 'Linux, Aplicaciones Web ( IIS, Apache, Tomcat, JBOSS), AWS, Docker, Base de datos Oracle y Postgresql');
INSERT INTO `especialistas` VALUES (NULL, 'ALEJANDRO', 'CORTEZ MARIN', 'Alejandro.Cortez@asicamericas.com', '3184094106', NULL, 'Lider tecnico, Windows server y Office 365');
INSERT INTO `especialistas` VALUES (NULL, 'RAFAEL GIOVANNI', 'FLOREZ ARANGO', 'Rafael.Florez@asicamericas.com', '3184094018', NULL, 'Aplicaciones Web ( IIS, Apache, Tomcat, JBOSS)');
INSERT INTO `especialistas` VALUES (NULL, 'JORGE ELI', 'JARAMILLO OSPINA', 'Jorge.Jaramillo@asicamericas.com', '3153589862', NULL, 'Base de datos (Oracle, Sql, Mysql) y Weblogic');
INSERT INTO `especialistas` VALUES (NULL, 'ELIZABETH', 'JARAMILLO RIVERA', 'Elizabeth.Jaramillo@asicamericas.com', '3156705453', NULL, 'Weblogic y WCC - OCI');
INSERT INTO `especialistas` VALUES (NULL, 'LINA', 'JARAMILLO URRUTIA', 'Lina.Jaramillo@asicamericas.com', '3164675263', NULL, 'Lider Tecnico - SOA (WAS, MQ, BROKER,PORTAL )');
INSERT INTO `especialistas` VALUES (NULL, 'JUAN FRANCISCO', 'MAYORGA', 'Juan.Mayorga@asicamericas.com', '3187188230', NULL, 'Base de datos (Oracle, Sql, Mysql, postgresql y DB2)');
INSERT INTO `especialistas` VALUES (NULL, 'OMAR HERNANDO', 'MENDEZ GIL', 'Omar.Mendez@asicamericas.com', '3183364371', NULL, 'Base de datos DB2  y AS400');
INSERT INTO `especialistas` VALUES (NULL, 'CARLOS JAVIER', 'MESA', 'Carlos.Mesa@asicamericas.com', '3164661773', NULL, 'TSM, Storage y Linux');
INSERT INTO `especialistas` VALUES (NULL, 'JULIAN ANDRES', 'MILLAN ASCENCIO', 'Julian.Millan@asicamericas.com', '3174300197', NULL, ' Solaris, Storage Oracle, Sparc, Oracle Linux, Oracle VM, OBS Oracle, Weblogic - OCI');
INSERT INTO `especialistas` VALUES (NULL, 'CHRISTIAN ALEJANDRO', 'NIÑO PEÑA', 'Christian.Nino@asicamericas.com', '3183126058', NULL, 'Lider tecnico - Base de datos (Oracle, Sql, Mysql, EBS)  - OCI');
INSERT INTO `especialistas` VALUES (NULL, 'INES LILIANA', 'PEREZ DUARTE', 'Ines.Perez@asicamericas.com', '3152942501', NULL, 'Rational');
INSERT INTO `especialistas` VALUES (NULL, 'MARIA EUGENIA', 'QUISOBONI VILLA', 'Maria.Quisoboni@asicamericas.com', '3176568494', NULL, 'AS400, BRMS');
INSERT INTO `especialistas` VALUES (NULL, 'CARLOS', 'MONTOYA', 'Carlos.Montoya@asicamericas.com', '3173188227', '3105726773', 'AIX, Linux, Storage IBM, Vmware');
INSERT INTO `especialistas` VALUES (NULL, 'JERSON', 'GOMEZ AMON', 'Jerson.Gomez@asicamericas.com', '3012660615', NULL, 'Windows Server, exchange, Antivirus , Vmware, SCCM');


INSERT INTO `especialistas` VALUES (NULL, 'DELIO FABIAN', 'GOMEZ MONTIEL', 'Delio.Gomez@asicamericas.com', '3174003465', NULL, 'Coordinador de especialistas - Windows server, Vmware y Veeam');
INSERT INTO `especialistas` VALUES (NULL, 'DAVID', 'NIÑO', 'David.Nino@asicamericas.com', '3165284816', NULL, 'Base de datos (Oracle, Sql, Mysql) ');
INSERT INTO `especialistas` VALUES (NULL, 'RUTH', 'FLORIDO', 'Ruth.Florido@asicamericas.com', '3176364798', NULL, 'Coordinador NOC - Nagios, Solar, APP Manager');
INSERT INTO `especialistas` VALUES (NULL, 'DANNY FABIÁN', 'DAZA CASTIBLANCO', 'Danny.daza.ext@terpel.com', '3182256585', NULL, 'Windows y SCOM ');
INSERT INTO `especialistas` VALUES (NULL, 'HAROLD GIOVANNY', 'PELAEZ RAMIREZ', 'harold.pelaez.ext@terpel.com', '3152199233', NULL, 'Windows Server, exchange, Office 365, Antivirus');
INSERT INTO `especialistas` VALUES (NULL, 'OSCAR ANTONIO', 'BELTRAN HERNÁNDEZ', 'oscar.beltran.ext@terpel.com', '3153184603', NULL, 'Windows server - Control de accesos');
INSERT INTO `especialistas` VALUES (NULL, 'JUAN FELIPE SEBASTIÁN', 'MUÑOZ RUEDA', 'juan.munoz.ext@terpel.com', '3173834270', NULL, ' Base de datos (Oracle, Sql, Mysql) ');
INSERT INTO `especialistas` VALUES (NULL, 'RONALD JOSÉ', 'ARÉVALO FONSECA', 'ronald.arevalo.ext@terpel.com', '3166910003', NULL, 'Base de datos (Oracle, Sql, Mysql, EBS)  - OCI ');
INSERT INTO `especialistas` VALUES (NULL, 'JOSE LUIS', 'ÁLAMO', 'jose.alamo@heartbit.com.co', '3153676144', NULL, 'SAP');
INSERT INTO `especialistas` VALUES (NULL, 'CARLOS HERNADO', 'OLAYA AGUIRRE', 'carlos.olaya.ext@terpel.com', '3153541942', NULL, 'Windows Server, exchange, Office 365, Antivirus, Veeam');
INSERT INTO `especialistas` VALUES (NULL, 'OSCAR ', 'PULIDO ABELLA', 'oscar.pulido@asicamericas.com', '3158278474', NULL, 'Windows Server, exchange, Office 365, Antivirus, Vmware, Citrix');
INSERT INTO `especialistas` VALUES (NULL, 'MAURICIO', 'TOCHOY', 'mauricio.tochoy@asicamericas.com', '3164661773', NULL, 'Windows Server, exchange, Office 365, Antivirus, Vmware.');
INSERT INTO `especialistas` VALUES (NULL, 'FABIO', 'ROJAS', 'fabio.rojas@asicamericas.com', '3187895253', NULL, 'Linux, Redhat Virtualization, Nagios');
INSERT INTO `especialistas` VALUES (NULL, 'ELIAS DAVID', 'ROMERO PEREZ', 'elias.romero@asicamericas.com', '3216226508', NULL, 'SuseHana, Linux y AIX');
INSERT INTO `especialistas` VALUES (NULL, 'MIGUEL GIOVANNI', 'SILVA BELTRAN', 'miguel.silva@asicamericas.com', '3187127925', NULL, 'Windows Server, exchange, Office 365, Antivirus, Azure, Vmware');
INSERT INTO `especialistas` VALUES (NULL, 'ESNEIDER ALEXANDER', 'CANENCIO DOMINGUEZ', 'esneider.canencio@asicamericas.com', '3173834270', '3017302317', 'WAS, Aplicaciones web, Windows, AIX y base de datos SQL');
INSERT INTO `especialistas` VALUES (NULL, 'FRANKLY NOE', 'TORO TORO', 'frankly.toro@asicamericas.com', '3103070924', NULL, 'AIX, Linux');


/*Script para la tabla gerente_proyectos*/
INSERT INTO `gerentes_proyectos` VALUES (NULL, 'Sor Shirlena', 'Bedoya Martinez', 'Sor.Bedoya@asicamericas.com', '3187904780', '3176457041', 'FLAMINGO', 'FLA007', NULL, NULL)
INSERT INTO `gerentes_proyectos` VALUES (NULL, 'Robert Antuan', 'García Sanchez', 'Robert.Garcia@asicamericas.com', '3164225972', NULL, 'ASNET', 'ASN004', NULL, NULL);
INSERT INTO `gerentes_proyectos` VALUES (NULL, 'Sor Shirlena', 'Bedoya Martinez', 'Sor.Bedoya@asicamericas.com', '3187904780', '3176457041', 'MEFIA', 'FLA007', NULL, NULL)