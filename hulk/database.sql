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

/*Script de la tabla Roles*/
INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `created_at`, `update_at`) VALUES (NULL, 'Administrador', 'Derecho a todos los módulos del sistema, y a la creación de usuarios.', NULL, NULL);
INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `created_at`, `update_at`) VALUES (NULL, 'Estándar', 'Usuario básico.', NULL, NULL);

/*Script de la tabla Usuario*/
INSERT INTO `usuarios` (`id`, `usuario`, `nombres`, `apellidos`, `correo`, `password`, `rol`, `created_at`, `update_at`, `remember_token`) VALUES (NULL, 'admin', 'Jose David', 'Quintero Bernal', 'quinterobernaldavid@gmail.com', 'luci5610', '1', NULL, NULL, NULL);

/*Script de la tabla clientes*/
INSERT INTO `clientes` VALUES (NULL, 'TERPEL', NULL, NULL), (NULL, 'FLAMINGO', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'MEFIA', NULL, NULL), (NULL, 'VANTI', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'ASNET', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'COMFANDI', NULL, NULL), (NULL, 'VIRTUAL RIS', NULL, NULL)
INSERT INTO `clientes` VALUES (NULL, 'COOMEVA', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'VIRTUALRIS', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'GANA REDITOS', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'COLOMBINA', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'BANCOLOMBIA', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'COLTEJER', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'BANCO W', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'ALQUERIA', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'DANN', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'CONFIAR', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'FINESA', NULL, NULL);
INSERT INTO `clientes` VALUES (NULL, 'UPRA', NULL, NULL);

/*Script de la tabla host_clientes COOMEVA*/
INSERT INTO `host_clientes` VALUES (NULL, 'COLBOGSRVACL01', '10.220.0.147', 'TERPEL', 'Producción', 'Windows', 'Especialista Microsoft', NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'APPEBS', '10.11.36.23', 'COOMEVA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CDPWIN191', '10.11.36.30', 'COOMEVA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CDPWIN215', '10.11.36.223', 'COOMEVA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_AIX_EBSPROD', '10.150.1.140', 'COOMEVA', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_AIX_EBSPROD_DRP', '10.11.36.20', 'COOMEVA', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_AIX_EPMPROD', '10.150.1.145', 'COOMEVA', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_AIX_EPMPROD_DRP', '10.11.36.28', 'COOMEVA', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_AIX_PR_CDPAIX01', '10.11.36.126', 'COOMEVA', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_AIX_PR_CDPAIX02', '10.11.36.125', 'COOMEVA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_AIX_VIOS2_DRP', '10.11.36.17', 'COOMEVA', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_BLA_CMM_DRP', '10.11.36.10', 'COOMEVA', 'Producción', 'Blade', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_HMC_VHMC', '10.150.1.153', 'COOMEVA', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_LNX_APPEBS', '10.150.1.150', 'COOMEVA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_LNX_VCENTEREBS_DRP', '10.11.36.90', 'COOMEVA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_STG_V7k_DRP', '10.11.36.70', 'COOMEVA', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_STG_V7k_PROD', '10.150.1.130', 'COOMEVA', 'Producción', 'Storage', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_SWC_LAN_BLA_EN2092_A', '10.11.36.9', 'COOMEVA', 'Producción', 'Blade', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_SWC_LAN_BLA_EN2092_B', '10.11.36.8', 'COOMEVA', 'Producción', 'Blade', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_SWC_SAN_BLA_FC3171_A', '10.11.36.7', 'COOMEVA', 'Producción', 'Blade', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_SWC_SAN_BLA_FC3171_B', '10.11.36.6', 'COOMEVA', 'Producción', 'Blade', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_WIN_CDPWIN191', '10.150.1.151', 'COOMEVA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CMV_WIN_CDPWIN215', '10.150.1.152', 'COOMEVA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'PR-CDPWIN06', '10.11.36.27', 'COOMEVA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'PR-CDPWIN07', '10.11.36.123', 'COOMEVA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);

/*Script de la tabla host_clientes VIRTUALRIS*/
INSERT INTO `host_clientes` VALUES (NULL, 'VTR_CLT_NETEZZA_PROD', '10.60.91.37', 'VIRTUALRIS', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'VTR_LNX_NTZ_IBMNTZPRD01', '10.60.91.38', 'VIRTUALRIS', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'VTR_LNX_NTZ_IBMNTZPRD02', '10.60.91.39', 'VIRTUALRIS', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'VTR_WIN_COG_WDWHDES01', '172.22.85.192', 'VIRTUALRIS', 'Desarrollo', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'VTR_WIN_COG_WDWHPORTAL01', '172.22.85.173', 'VIRTUALRIS', 'Desarrollo', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'VTR_WIN_COG_WDWHPUB01', '172.23.3.84', 'VIRTUALRIS', 'Pruebas', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'VTR_WIN_COG_WINTSERV01', '172.22.83.70', 'VIRTUALRIS', 'Pruebas', 'Windows', NULL, NULL, NULL, NULL);

/*Script de la tabla host_clientes GANA REDITOS*/
INSERT INTO `host_clientes` VALUES (NULL, 'GANA_MATRIXTECH_AIX_ARLINGTON', '172.20.20.53', 'GANA REDITOS', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'GANA_MATRIXTECH_AIX_ASTI', '172.20.20.55', 'GANA REDITOS', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'GANA_MATRIXTECH_AIX_CLARKSVILLE', '172.17.101.11', 'GANA REDITOS', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'GANA_MATRIXTECH_AIX_LOUISVILLE', '172.17.101.12', 'GANA REDITOS', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'GRE_AIX_CORMORANDRP', '172.20.20.244', 'GANA REDITOS', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'GRE_AIX_KENWORTH', '172.17.103.120', 'GANA REDITOS', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'GRE_AIX_TORCAZADRP', '172.20.20.246', 'GANA REDITOS', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'GRE_AIX_WESTERN', '172.17.103.121', 'GANA REDITOS', 'Producción', 'AIX', NULL, NULL, NULL, NULL);

/*Script de la tabla host_clientes COLOMBINA*/
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_ARGOS', '192.168.106.50', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_HERMES', '10.125.15.12', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_DYSIS', '192.168.106.92', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_PERSEO2', '192.168.106.88', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_SAP-WAS-BCK', '192.168.106.91', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_LOKI', '192.168.106.87', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_ANUBIS', '192.168.106.86', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_LUMIRA', '192.168.106.82', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_FAUNO', '192.168.106.80', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_ZAGREO', '192.168.106.65', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_SPP_BD', '192.168.106.64', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_HIPNOS', '192.168.106.61', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_MES', '192.168.106.56', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_SAP-WAS', '192.168.106.51', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_SERVER02', '192.168.106.49', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_THOR2', '192.168.106.45', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_EROS', '192.168.106.41', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_MORFEO', '10.125.15.10', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_CERES', '192.168.106.66', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_ATON', '10.125.15.16', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_CDPCOLCLOUDCON', '10.125.15.17', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_CDPCOLCLOWEB', '10.125.15.19', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_CDPCOLWEBDISP', '10.125.15.18', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_CERES2', '10.125.15.20', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_PICUS', '10.125.15.3', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLOMBINA_QAS-LOC', '10.125.15.13', 'COLOMBINA', 'Producción', 'Windows', NULL, NULL, NULL, NULL);

/*Script de la tabla host_clientes BANCOLOMBIA*/
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBPWCC01', '10.8.0.141', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.137', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBPWCC05', '10.8.0.135', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.131', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBPWCC02', '10.8.0.142', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.138', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBPWCC06', '10.8.0.136', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.132', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBPWCC03', '10.8.0.143', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.139', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBPWCC07', '10.8.0.137', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.133', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBPWCC04', '10.8.0.144', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.140', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBPWCC08', '10.8.0.138', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.134', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WCCSTGOPDB00', '10.8.0.139', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.135', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WCCSTGOPDB01', '10.8.0.134', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.136', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'STAGINGWCC', '10.8.61.20', 'BANCOLOMBIA', 'Producción', 'Balanceador F5', NULL,'IP NAT : 172.31.128.190; Balanceador F5 para Servicio de Staging', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CONTRWCC', '10.8.61.17', 'BANCOLOMBIA', 'Producción', 'Balanceador F5', NULL,'IP NAT : 172.31.128.187; Balanceador F5 para Servicio de Contribucion', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CONSUMOWCC', '10.8.61.18', 'BANCOLOMBIA', 'Producción', 'Balanceador F5', NULL,'IP NAT : 172.31.128.188; Balanceador F5 para Servicio de Consumo', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'DAMWCC', '10.8.61.19', 'BANCOLOMBIA', 'Producción', 'Balanceador F5', NULL,'IP NAT : 172.31.128.189; Balanceador F5 para Servicio de DAM/IBR', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBDWCC01', '10.74.2.6', 'BANCOLOMBIA', 'Desarrollo', 'Solaris', NULL,'IP NAT : 174.20.2.71', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBDWCC02', '10.74.2.72', 'BANCOLOMBIA', 'Desarrollo', 'Solaris', NULL,'IP NAT : 174.20.2.72', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBDWCC03', '10.74.2.8', 'BANCOLOMBIA', 'Desarrollo', 'Solaris', NULL,'IP NAT : 174.20.2.74', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBQWCC01', '10.74.2.17', 'BANCOLOMBIA', 'Certificación', 'Solaris', NULL,'IP NAT : 174.20.2.77', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBQWCC02', '10.74.2.18', 'BANCOLOMBIA', 'Certificación', 'Solaris', NULL,'IP NAT : 174.20.2.81', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBQWCC03', '10.74.2.19', 'BANCOLOMBIA', 'Certificación', 'Solaris', NULL,'IP NAT : 174.20.2.83', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBQWCC04', '10.74.2.24', 'BANCOLOMBIA', 'Certificación', 'Solaris', NULL,'IP NAT : 174.20.2.84', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBQWCC06', '10.74.2.26', 'BANCOLOMBIA', 'Certificación', 'Solaris', NULL,'IP NAT : 174.20.2.102', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SBMDEBQWCC07', '10.74.2.27', 'BANCOLOMBIA', 'Certificación', 'Solaris', NULL,'IP NAT : 174.20.2.109', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WCCSTGOPDB03', '10.74.2.9', 'BANCOLOMBIA', 'Certificación', 'Solaris', NULL,'IP NAT : 174.20.2.170', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WCCTGOPDB04', '10.74.2.10', 'BANCOLOMBIA', 'Certificación', 'Solaris', NULL,'IP NAT : 174.20.2.36', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'TBMDEBPWCC01', '172.31.128.178', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.178', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'TBMDEBPWCC02', '172.31.128.179', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.179', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'TBMDEBPWCC03', '172.31.128.180', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.180', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'TBMDEBPWCC04', '172.31.128.181', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.181', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'TWCCSTGOPDB00', '172.31.128.182', 'BANCOLOMBIA', 'Producción', 'Solaris', NULL,'IP NAT : 172.31.128.182', NULL, NULL);

/*Script de la tabla host_clientes ASNET*/
INSERT INTO `host_clientes` VALUES (NULL, 'SERVIDOR-APLICACIONES-TERREMARK', '172.20.20.60', 'ASNET', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SERVIDOR-NODO2-TERREMARK', '172.20.20.67', 'ASNET', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BALANCEADOR-TERREMARK', '172.20.20.65', 'ASNET', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SERVIDOR-NODO1-TERREMARK', '172.20.20.63', 'ASNET', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SERVIDOR -FTP-TERREMARK', '172.20.20.62', 'ASNET', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SERVIDOR_FTP_TRIARA', '174.20.2.122', 'ASNET', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SERVIDOR-ISERIES-TERREMARK-MIMIX', '172.20.20.61', 'ASNET', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'ISERIES-TRIARA-MIMIX', '174.20.2.121', 'ASNET', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'ASIC_BTA_TMFW', '172.20.20.1', 'ASNET', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SERVIDOR-NODO3-TERREMARK', '172.20.20.69', 'ASNET', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'ISERIES-TERREMARK-INTERFAZ-2', '172.20.20.68', 'ASNET', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'FW_EQUINIX_ASNET', '10.90.101.1', 'ASNET', 'Pruebas', 'Firewall', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'FW_TRIARA_ASNET', '', 'ASNET', 'Pruebas', 'Firewall', NULL, 'validar IP con ASNET', NULL, NULL);

/*Script de la tabla host_clientes COLTEJER*/
INSERT INTO `host_clientes` VALUES (NULL, 'COLTEJER_ATENEA', '174.20.2.52', 'COLTEJER', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLTEJER_CLBOGPROVCOLTJERP', '174.20.2.53', 'COLTEJER', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLTEJER_POSEIDON', '174.20.2.54', 'COLTEJER', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLTEJER_WIN_FENIX', '174.20.2.51', 'COLTEJER', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLTEJER_ZEUS', '174.20.2.55', 'COLTEJER', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLTEJER_NEPTUNO', '174.20.2.82', 'COLTEJER', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COLTEJER_APOLO', '174.20.2.206', 'COLTEJER', 'Producción', 'Windows', NULL, NULL, NULL, NULL);

/*Script de la tabla host_clientes COMFANDI*/
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SRVCARTAGORECRE ', '10.121.1.82', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SRVTABLONRECRE', '10.82.100.100', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SRVCALIPSORECRE', '10.7.100.3', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SRVPANCERECRE', '10.52.1.200', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SVRSOCIALRECRE', '10.37.100.232', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SRVBUGARECRE', '10.35.3.138', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SRVDELICIARECRE', '10.34.1.7', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SRVARROYORECRE', '10.31.1.79', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SVRCULTURALEDU', '10.16.0.131', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SRVELEROSRECRE', '10.15.1.110', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_SQL_SRVLAGORECRE', '10.13.1.101', 'COMFANDI', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_AS400_DESA', '174.20.2.50', 'COMFANDI', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_AS400_VIVIENDA', '174.20.2.40', 'COMFANDI', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_AS400_TITAN', '174.20.2.30', 'COMFANDI', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_AS400_MERC', '174.20.2.20', 'COMFANDI', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_AS400_ADMI', '174.20.2.100', 'COMFANDI', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_AS400_ADMIT', '174.20.2.10', 'COMFANDI', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'COM_LIN_LINUX', '10.210.100.143', 'COMFANDI', 'Producción', 'Linux', NULL, NULL, NULL, NULL);

/*Script de la tabla host_clientes BANCO W*/
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_P9_WWBCTGVIOS01 ', '10.116.14.31', 'BANCO W', 'Producción', 'VIOS', NULL, 'Plataforma Virtualización -  Power Base de Datos', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_P9_WWBCTGVIOS02', '10.116.14.32', 'BANCO W', 'Producción', 'VIOS', NULL,'Plataforma Virtualización -  Power Base de Datos', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWBACKUPAIX01', '172.10.10.100', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWDEAPBTT01', '172.16.29.248', 'BANCO W', 'Desarrollo', 'AIX', NULL, 'Servidor Aplicación Bantotal ambiente desarrollo', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWMIAPBTT01', '172.16.29.247', 'BANCO W', 'Pruebas', 'AIX', NULL, 'Servidor Aplicación Bantotal ambiente de pruebas', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWMIDBBTT01', '172.16.29.249', 'BANCO W', 'Pruebas', 'AIX', NULL, 'Servidor principal de bases de datos', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWMIDBP01', '172.16.29.250', 'BANCO W', 'Pruebas', 'AIX', NULL, 'Servidor Migración de bases de datos principal', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWNOAPBTT01', '172.16.29.237', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWNODBBTT01', '172.16.29.239', 'BANCO W', 'Producción', 'AIX', NULL, 'Servidor Base de Datos para Bantotal Normativo', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWPRAPESB01_B', '10.116.10.124', 'BANCO W', 'Contigencia', 'AIX', NULL, 'Servidor de contingencia Bogotá de Desarrollo', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWPRDBESB01_B', '10.116.10.126', 'BANCO W', 'Contigencia', 'AIX', NULL, 'Servidor de contingencia Bogotá de Base de Datos', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWPUAPBTT02', '172.16.29.252', 'BANCO W', 'Pruebas', 'AIX', NULL, 'Servidor Aplicación Bantotal ambiente de pruebas', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWPUAPP02', '172.16.29.227', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWPUDBBTT02', '172.16.29.251', 'BANCO W', 'Pruebas', 'AIX', NULL, 'Servidor Base de Datos para Bantotal ambiente de pruebas', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWPUDBP01', '172.16.29.196', 'BANCO W', 'Pruebas', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWPUDBP02', '172.16.29.229', 'BANCO W', 'Pruebas', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWPUINP01', '172.16.29.195', 'BANCO W', 'Pruebas', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWPUINP02', '172.16.29.228', 'BANCO W', 'Pruebas', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBAPP01', '172.10.10.54', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBAPP01_B', '10.116.10.123', 'BANCO W', 'Contogencia', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBCAAP', '172.16.29.234', 'BANCO W', 'Capacitación', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBCAAP02', '172.16.29.233', 'BANCO W', 'Capacitación', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBDBP01', '172.10.10.50', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBDBP02', '172.10.10.51', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBDBP03', '10.116.10.32', 'BANCO W', 'Contigencia', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBDEAP', '172.16.29.200', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBDEAP02', '172.16.29.201', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBDEBD', '172.16.29.197', 'BANCO W', 'Desarrollo', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBDEIN', '172.16.29.199', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBINP01', '172.10.10.62', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBINP01_B', '10.116.10.125', 'BANCO W', 'Contigencia', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBREP01', '172.10.10.58', 'BANCO W', 'Producción', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_SRVWWBTEBD', '10.116.10.30', 'BANCO W', 'Desarrollo', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_VIOS01_APP', '172.10.16.100', 'BANCO W', 'Producción', 'AIX', NULL, 'Plataforma Virtualización -  Power Aplicación', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_VIOS01_BD', '172.10.16.98', 'BANCO W', 'Producción', 'AIX', NULL, 'Plataforma Virtualización -  Power Base de Datos', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_VIOS01_DLLO', '172.10.16.102', 'BANCO W', 'Desarrollo', 'AIX', NULL, 'Plataforma Virtualización -  Power Desarrollo', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_VIOS02_APP', '172.10.16.101', 'BANCO W', 'Producción', 'AIX', NULL, 'Plataforma Virtualización -  Power Aplicación', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_VIOS02_BD', '172.10.16.99', 'BANCO W', 'Producción', 'VIOS', NULL, 'Plataforma Virtualización -  Power Base de Datos', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_AIX_VIOS02_DLLO', '172.10.16.103', 'BANCO W', 'Desarrollo', 'VIOS', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_HMC_BOGOTA', '10.116.14.30', 'BANCO W', 'Contigencia', 'HMC', NULL, 'Administracion Servidores Power - DataCenter CUNI', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_HMC_CALI', '172.10.16.70', 'BANCO W', 'Desarrollo', 'HMC', NULL, 'Administracion Servidores Power - DataCenter Santa Monica', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWDEDBLNX02', '172.16.29.10', 'BANCO W', 'Desarrollo', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWPOWERVC', '172.10.10.99', 'BANCO W', 'Producción', 'Linux', NULL, 'Administración POWERVC', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWPRDBLNX01', '172.10.15.28', 'BANCO W', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWPRINTRA01', '172.10.15.115', 'BANCO W', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWPUAPFIN01', '172.16.31.51', 'BANCO W', 'Pruebas', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWPUDBLNX02', '172.16.31.30', 'BANCO W', 'Pruebas', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWPUINTRA02', '172.16.31.28', 'BANCO W', 'Pruebas', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWWBDBBI01', '172.16.31.32', 'BANCO W', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWWBMIG01', '172.10.15.75', 'BANCO W', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWWBTSM01', '172.10.10.68', 'BANCO W', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_LNX_SRVWWBTSMBOG', '10.116.10.82', 'BANCO W', 'Contigencia', 'Linux', NULL, 'IBM Spectrum Protect - Plataforma de Backups Bogota', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_PURE_SYSTEM', '172.10.16.143', 'BANCO W', 'Desarrollo', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVPRINVMVC01', '172.10.15.68', 'BANCO W', 'Producción', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVPRINVMVC06', '172.10.15.69', 'BANCO W', 'Desarrollo', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVWPRINESX01', '172.10.16.130', 'BANCO W', 'Contigencia', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVWPRINESX02', '172.10.16.131', 'BANCO W', 'Desarrollo', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVWPRINESX03', '172.10.16.132', 'BANCO W', 'Contigencia', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVWPRINESX04', '172.10.16.133', 'BANCO W', 'Desarrollo', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVWPRINESX05', '172.10.16.134', 'BANCO W', 'Contigencia', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVWPRINESX06', '172.10.16.135', 'BANCO W', 'Desarrollo', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVWPRINESX07', '172.10.16.136', 'BANCO W', 'Contigencia', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVWPRINESX08', '172.10.16.137', 'BANCO W', 'Desarrollo', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_STG_FLASH900_AIX_CTG', '10.116.14.33', 'BANCO W', 'Contigencia', 'Storage', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_STG_FLASH900_AIX_PRD', '172.10.16.71', 'BANCO W', 'Producción', 'Storage', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_STG_V5010_Backup', '172.10.16.147', 'BANCO W', 'Contigencia', 'Storage', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_STG_V5100_PRD_VMWARE', '172.10.16.145', 'BANCO W', 'Producción', 'Storage', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_STG_V7K_G1_VMWARE_ADMIN', '172.16.150.113', 'BANCO W', 'Contigencia', 'Storage', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_STG_V7K_G2_AIX_CTG', '10.116.14.29', 'BANCO W', 'Producción', 'Storage', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_STG_V7K_G2_AIX_PRD', '172.10.16.69', 'BANCO W', 'Producción', 'Storage', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_LAN_PURE_A', '172.10.16.139', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_LAN_PURE_B', '172.10.16.140', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_SAN_AIX_CALI_FA', '172.10.16.73', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_SAN_AIX_CALI_FB', '172.10.16.74', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_SAN_AIX_CTG_FA', '10.116.14.27', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_SAN_AIX_CTG_FB', '10.116.14.28', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_SAN_PURE_A', '172.10.16.141', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_SAN_PURE_B', '172.10.16.142', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_SAN_VMWARE_CTG_FA', '10.116.14.23', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SWC_SAN_VMWARE_CTG_FB', '10.116.14.24', 'BANCO W', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_WIN_SRVWPRASIC01', '192.168.0.54', 'BANCO W', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_WIN_SRVWPRINTPC01', '172.10.10.91', 'BANCO W', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_WIN_SRVWPRINVMVC02', '192.168.0.82', 'BANCO W', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_WIN_SRVWPRINVMVC05', '10.116.10.29', 'BANCO W', 'Contigencia', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_WIN_UDP_CONT', '10.116.10.79', 'BANCO W', 'Producción', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWCAAPESB01', '172.16.29.242', 'BANCO W', 'Capacitación', 'AIX', NULL, 'Oracle Middleware Tire 12.2.1.3.0    - Oracle SOA Suite - WL 12.2.1.3.0', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWCADBESB01', '172.16.29.243', 'BANCO W', 'Capacitación', 'AIX', NULL, 'Oracle Database Standard  12.2.1.0', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWDEAPESB01', '172.16.29.235', 'BANCO W', 'Desarrollo', 'AIX', NULL, 'Oracle Middleware Tire   - Oracle SOA Suite 12.2.1.3.0   - WL 12.2.1.3.0 ', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWDEDBESB01', '172.16.29.236', 'BANCO W', 'Desarrollo', 'AIX', NULL, 'Oracle Database Standard  12.2.1.0', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWPRAPESB01', '172.10.10.70', 'BANCO W', 'Producción', 'AIX', NULL, 'Oracle Middleware Tire 1 (HA) - Oracle SOA 12.2.1.3.0  Suite - WL 12.2.1.3.0', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWPRAPESB02', '172.10.10.71', 'BANCO W', 'Producción', 'AIX', NULL, 'Oracle Middleware Tire 1 (HA) - Oracle SOA 12.2.1.3.0  Suite - WL 12.2.1.3.0', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWPRDBESB01', '172.10.10.72', 'BANCO W', 'Producción', 'AIX', NULL, 'Oracle Database Standard 1 (HA) 12.2.1.0', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWPRDBESB02', '172.10.10.73', 'BANCO W', 'Producción', 'AIX', NULL, 'Oracle Database Standard 1 (HA) 12.2.1.0', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BCW_SRVWPUAPESB02', '172.16.29.240', 'BANCO W', 'Pruebas', 'AIX', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WWB_SRVWPRINVWESX05', '172.16.150.114', 'BANCO W', 'Producción', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WWB_SRVWPRINVWESX06', '172.16.150.115', 'BANCO W', 'Producción', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WWB_SRVWDRINVMESX01', '10.116.10.111', 'BANCO W', 'Contigencia', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WWB_SRVWDRINVMESX02', '10.116.10.112', 'BANCO W', 'Contigencia', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WWB_SRVWDRINVMESX03', '10.116.10.113', 'BANCO W', 'Contigencia', 'VMWARE', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWPUDBESB02', '172.16.29.241', 'BANCO W', 'Pruebas', 'AIX', NULL, 'Oracle Database Standard  12.2.1.0', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SRVWPYAPESB01', '172.16.29.244', 'BANCO W', 'Proyectos', 'AIX', NULL, NULL, NULL, NULL);

/*Script de la tabla host_clientes ALQUERIA*/
INSERT INTO `host_clientes` VALUES (NULL, 'Particion_BACK9', '10.159.147.9', 'ALQUERIA', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'Particion_CBU9', '10.158.78.39', 'ALQUERIA', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'Particion_PROD9', '10.159.147.7', 'ALQUERIA', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'Particion_TST9', '10.159.147.8', 'ALQUERIA', 'Producción', 'AS400', NULL, NULL, NULL, NULL);

/*Script de la tabla host_clientes DANN*/
INSERT INTO `host_clientes` VALUES (NULL, 'DANNCBU', '10.202.20.45', 'DANN', 'Producción', 'AS400', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'DANN_HMC', '10.202.20.43', 'DANN', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'DANN_WIN_LETO', '10.202.20.230  ', 'DANN', 'Producción', 'Windows', NULL, 'Controlador de Dominio', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'DANN_WIN_DIONISO', '10.202.20.235', 'DANN', 'Producción', 'Windows', NULL, 'Aplicación', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'DANN_WIN_CERES', '10.202.20.235', 'DANN', 'Producción', 'Windows', NULL, 'Base de datos', NULL, NULL);

/*Script de la tabla host_clientes MEFIA*/
INSERT INTO `host_clientes` VALUES (NULL, 'AP08CMPROD.flamingo.com.co:7003', '172.16.231.198', 'MEFIA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'AP07CMPROD.flamingo.com.co:7003', '172.16.231.199', 'MEFIA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'AP06CMPROD.flamingo.com.co:7003', '172.16.231.99', 'MEFIA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'AP04CMPROD.flamingo.com.co:7003', '172.16.231.130', 'MEFIA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'AP03CMPROD.flamingo.com.co:7003', '172.16.231.129', 'MEFIA', 'Producción', 'Linux', NULL,NUll, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_APP02QA', '172.16.231.127', 'MEFIA', 'Pruebas', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP01-NOPROD', '172.16.88.51', 'MEFIA', 'Pruebas', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP02-PROD', '172.16.231.57', 'MEFIA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP01-PROD', '172.16.231.55', 'MEFIA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LNX_AP01REPPRO', '172.16.231.118', 'MEFIA', 'Producción', 'Linux', NULL,NUll, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP01PRUDLLO', '172.16.231.119', 'MEFIA', 'Desarrollo', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP01OVMM', '172.16.231.131', 'MEFIA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_WEB LOGIC 11G - CAPACITACION', '172.16.231.105', 'MEFIA', 'Capacitación', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP01CMPROD', '172.16.231.110', 'MEFIA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP02CMPROD', '172.16.231.111', 'MEFIA', 'Producción', 'Linux', NULL,NUll, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_WEB LOGIC 11G - PRUEBAS', '172.16.231.104', 'MEFIA', 'Pruebas', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP01ASR', '172.16.231.128', 'MEFIA', 'Capacitación', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP11PROD', '172.16.231.148', 'MEFIA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_APP01DLLO', '172.16.88.103', 'MEFIA', 'Desarrollo', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_APP01QA', '172.16.88.104', 'MEFIA', 'Pruebas', 'Linux', NULL,NUll, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_APP01CA', '172.16.88.105', 'MEFIA', 'Capacitación', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_LIN_AP01CMCONT', '172.16.88.110', 'MEFIA', 'Contigencia', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_AP02CMCONT ', '172.16.88.111', 'MEFIA', 'Contigencia', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_DBN1PROD', '172.16.231.107', 'MEFIA', 'Producción', 'Solaris', NULL,'MEF_SOL_BD ORACLE RAC PRODUCCION NODO 2', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_DBN2PROD', '172.16.231.109', 'MEFIA', 'Producción', 'Solaris', NULL,'MEF_SOL_BD ORACLE RAC PRODUCCION NODO 1', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_DBN1CONT', '172.16.88.107', 'MEFIA', 'Contigencia', 'Solaris', NULL,'MEF_SOL_BD ORACLE RAC PRODUCCION NODO 1', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'DB02-PROD - Control LDOM DB02PROD', '172.16.231.54', 'MEFIA', 'Contigencia', 'Solaris', NULL,NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'DB01PROD - Control LDOM DB01PROD', '172.16.231.53', 'MEFIA', 'Contigencia', 'Solaris', NULL,NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'AP01OPS - LDOM Control y Monitoreo ', '172.16.231.108', 'MEFIA', 'Producción', 'Solaris', NULL,NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_WIN_DB01PROD', '172.16.231.112', 'MEFIA', 'Producción', 'Windows', NULL, 'MEF_SQL_SQL Server Nodo 1', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_WIN_DB02PROD', '172.16.231.113 ', 'MEFIA', 'Producción', 'Windows', NULL, 'MEF_SQL_SQL Server Nodo 2', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_WIN_DB02CONT', '172.16.88.113', 'MEFIA', 'Contigencia', 'Windows', NULL, 'MEF_SQL_Server_DB02CONT', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_WIN_BD01NOPROD ', '172.16.231.145', 'MEFIA', 'Pruebas', 'Windows', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_WIN_BD02NOPROD', '172.16.231.146', 'MEFIA', 'Capacitación', 'Windows', NULL, 'MEF_SQL_Server_DB01NOPROD', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_WIN_AP10PROD ', '172.16.231.147', 'MEFIA', 'Producción', 'Windows', NULL, 'MEF_SQL_Server_DB02NOPROD', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_SOL_BD CAPACITACION', '172.16.88.102', 'MEFIA', 'Capacitación', 'Solaris', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_SOL_BD DESARROLLO', '172.16.88.100', 'MEFIA', 'Desarrollo', 'Solaris', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_SOL_BD PRUEBAS', '172.16.88.101', 'MEFIA', 'Pruebas', 'Solaris', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_SOL_LDOM DE CONTROL NO PRD', '172.16.88.50', 'MEFIA', 'Desarrollo', 'Solaris', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'MEF_SOL_ORACLE SECURE BACKUP 12C', '172.16.231.60', 'MEFIA', 'Producción', 'Solaris', NULL, NULL, NULL, NULL);

/*Script de la tabla host_clientes CONFIAR*/
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTCARONTE', '10.5.4.112', 'CONFIAR', 'Producción', 'Windows', NULL, 'Servidor TRANSACCIONAL', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTCRONOS', '10.5.4.68', 'CONFIAR', 'Producción', 'Windows', NULL, 'Instalado aplicativo de Gestión Mesa de Servicio Organizacional', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTMERCURIO', '10.5.4.56', 'CONFIAR', 'Producción', 'Windows', NULL, 'Controlador de Dominio', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTEOLO', '192.168.2.1', 'CONFIAR', 'Producción', 'Windows', NULL, 'Smartchannel fachada Agencia Virtual', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTAPOLO', '10.5.4.53', 'CONFIAR', 'Producción', 'Windows', NULL, 'Aplicativo Axon - Transaccional Empresas', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTHEREBO', '10.5.5.29', 'CONFIAR', 'Producción', 'Windows', NULL, 'Aplicativo Vigia ( Sarlaf - Saro)', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTHADES', '10.5.4.52', 'CONFIAR', 'Producción', 'Windows', NULL, 'Smartchannel aplicación agencia virtual', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTCORAL', '10.5.4.67', 'CONFIAR', 'Producción', 'Windows', NULL, 'Compilacion de programas - Totalreport', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTPOSEIDON', '10.5.4.77', 'CONFIAR', 'Producción', 'Windows', NULL, 'WSUS', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTMINERVA', '10.5.4.113', 'CONFIAR', 'Producción', 'Windows', NULL, 'Controlador Dominio Principal', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTERIS', '10.5.4.157', 'CONFIAR', 'Producción', 'Windows', NULL, 'WorkManager', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTHERA', '10.5.5.72', 'CONFIAR', 'Producción', 'Windows', NULL, 'Consola EPO', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTLISA', '10.5.4.150', 'CONFIAR', 'Producción', 'Windows', NULL, 'Adin, Sistemas de Información, Gestión del disponible', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTMORFEO', '10.5.4.70', 'CONFIAR', 'Producción', 'Windows', NULL, 'Fileserver-Isolucion', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTDIONISIO', '10.5.4.81', 'CONFIAR', 'Producción', 'Windows', NULL, 'Balanceador del WAS', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTCRIO', '10.5.5.28', 'CONFIAR', 'Producción', 'Windows', NULL, 'Motor de bases de datos MSSQL 2008', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTDEMETER', '10.5.4.28', 'CONFIAR', 'Producción', 'Windows', NULL, 'Motor de bases de datos MSSQL 2014', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTATLAS', '10.100.4.24', 'CONFIAR', 'Producción', 'Windows', NULL, 'RPS BOGOTA', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTHEFESTO', '10.5.4.91', 'CONFIAR', 'Producción', 'Windows', NULL, 'Motor de bases de datos MSSQL 2016', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTTANATOS', '10.5.5.24', 'CONFIAR', 'Producción', 'Windows', NULL, 'Servidor RPS Arcserve Datacenter principal', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTEURO', '10.5.4.58', 'CONFIAR', 'Producción', 'Windows', NULL, 'Aplicativo UNOEE', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTGEA', '10.5.4.72', 'CONFIAR', 'Producción', 'Windows', NULL, 'Ambiente Produccion DetectID', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTCERES', '10.5.4.85', 'CONFIAR', 'Producción', 'Windows', NULL, 'Aplicación TSPlus', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'BK-HOSTDNS-MAIL-FILTER', '192.168.1.4', 'CONFIAR', 'Producción', 'Linux', NULL, 'Servidor Dns externo', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTATE', '10.5.5.70', 'CONFIAR', 'Producción', 'Linux', NULL, 'Versionamiento IDT', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'WEBMAIL', '192.168.1.10', 'CONFIAR', 'Producción', 'Linux', NULL, 'Control de navegación', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTAFRODITA', '10.5.4.118', 'CONFIAR', 'Producción', 'Linux', NULL, 'Bases de datos MariaDB', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTCASTOR', '10.5.4.140', 'CONFIAR', 'Producción', 'Linux', NULL, 'App producción', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTCORREO', '10.5.4.17', 'CONFIAR', 'Producción', 'Linux', NULL, 'Servidor de correo posfix', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTREA', '10.5.4.168', 'CONFIAR', 'Producción', 'Linux', NULL, 'Módulo de Soluciones', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTWEB', '192.168.1.6', 'CONFIAR', 'Producción', 'Linux', NULL, 'Sitio Web Confiar', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSINTRANET', '10.5.5.116', 'CONFIAR', 'Producción', 'Linux', NULL, 'Servidor Intranet', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTVENUS', '10.5.4.116', 'CONFIAR', 'Producción', 'Linux', NULL, 'Módulo de Soluciones', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTPGP', '192.168.1.2', 'CONFIAR', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'VCENTER.CONFIAR.COM.CO', '10.5.7.20', 'CONFIAR', 'Producción', 'Linux', NULL, 'VCENTER', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CONF_AIX_HOSTPRINCIPAL', '10.5.4.10', 'CONFIAR', 'Producción', 'AIX', NULL, 'Base de Datos Progress', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CONF_AIX_APPSERVER', '10.5.4.7', 'CONFIAR', 'Producción', 'AIX', NULL, 'Servidor de Aplicaciones de la BD- WAS Produccion', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CONF_AIX_HOSTSECUNDARIO', '10.5.4.6', 'CONFIAR', 'Producción', 'AIX', NULL, 'Base de Datos Espejo', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CONF_AIX_APPSECUNDARIO', '10.5.4.8', 'CONFIAR', 'Producción', 'AIX', NULL, 'Was Secundario', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'CONF_AIX_HOSTDESARROLLO', '10.5.4.23', 'CONFIAR', 'Desarrollo', 'AIX', NULL, 'Base de Datos Pruebas - Was Pruebas', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTVIRTUALIZACION', '10.5.7.25', 'CONFIAR', 'Producción', 'ESXi 6.5', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTVIRTUALIZACION_1', '10.5.5.20', 'CONFIAR', 'Producción', 'ESXi 6.5', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOSTVIRTUALIZACION_2', '10.5.7.24', 'CONFIAR', 'Producción', 'ESXi 6.5', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSStorage V7000', '10.5.8.7', 'CONFIAR', 'Producción', 'Storwize V7000', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSAtalla Medellín', '10.5.4.26', 'CONFIAR', 'Producción', 'Atalla_cifrado de transacciones', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSAtalla Centro Alterno', '10.100.4.25', 'CONFIAR', 'Producción', 'Atalla_cifrado de transacciones', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSSW Core', '10.5.4.48', 'CONFIAR', 'Producción', 'Enrutamiento y Vlan s DG', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSPower 8_1', '10.5.8.14', 'CONFIAR', 'Producción', 'BD_APPSERVER', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSPower 8_2', '10.5.8.15', 'CONFIAR', 'Desarrollo', 'Desarrollo', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSPower 8_3', '10.5.8.16', 'CONFIAR', 'Principal', 'Principal', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSPower 7_1', '10.5.8.3', 'CONFIAR', 'BD_ESPEJO', 'BD_ESPEJO', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSPower 7_2', '10.5.8.2', 'CONFIAR', 'APPSERVER', 'APPSERVER', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'HOTSPower 7_3', '10.5.8.17', 'CONFIAR', 'SECUNDARIO', 'SECUNDARIO', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SW UNE', '172.31.5.2', 'CONFIAR', 'Producción', 'Switch', NULL, 'Swiche Principal MPLS Agencias', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SW SAN de Fibra', '10.5.8.8', 'CONFIAR', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SW SAN de Fibra_2', '10.5.8.9', 'CONFIAR', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SW ENLACES TRANSACCIONALES', '10.5.5.49', 'CONFIAR', 'Producción', 'Switch', NULL, 'Afectación: Enlaces Redeban, Servibanca, Processa, Banrepublica', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'SW Fortinet', '10.5.5.48', 'CONFIAR', 'Producción', 'Switch', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'Router BanRepublica', '10.5.4.3', 'CONFIAR', 'Producción', 'Router', NULL, 'Transmisión Banco de la Republica', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'Planta telefónica', '10.5.100.3', 'CONFIAR', 'Producción', 'Planta', NULL, 'Planta telefónica_ Medellín', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'GW_Planta telefónica', '10.5.100.4', 'CONFIAR', 'Producción', 'Planta', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'Redbox Medellin', '10.5.100.90', 'CONFIAR', '', '', NULL, 'Grabación de Llamadas', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'Redbox Bogotá', '10.98.0.90', 'CONFIAR', '', '', NULL, 'Grabación de Llamadas', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'Internet Century Link', '190.217.28.57', 'CONFIAR', '', '', NULL, 'Afectación: morfo, lasc, olivos, solidaria, televigia, correo', NULL, NULL);

/*Script de la tabla host_clientes FINESA*/
INSERT INTO `host_clientes` VALUES (NULL, 'FINESA_APOTEOSYS', '10.150.1.6', 'FINESA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'FINESA_ASBOGPROVVEEAM', '174.20.2.140', 'FINESA', 'Producción', 'Windows', NULL, 'SERVIDOR VEEAM BACKUP FINESA', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'FINESA_CLBOGPROVFINDC', '10.150.1.5', 'FINESA', 'Producción', 'Linux', NULL, 'Servidor Domain controler', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'FINESA_CLBOGPROVFSONBASE', '10.150.1.10', 'FINESA', 'Producción', 'Linux', NULL, 'Servidor Son Base', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'FINESA_CLBOGPROVGHDB', '10.150.1.11', 'FINESA', 'Producción', 'Linux', NULL, 'Servidor Base de Datos', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'FINESA_CLBOGPROVONBASE', '10.150.1.9', 'FINESA', 'Producción', 'Linux', NULL, 'Servidor ON Base de Datos', NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'FINESABK_MIMIX', '174.20.2.78', 'FINESA', 'Producción', 'AS400', NULL, 'MIMIX AS400', NULL, NULL);

/*Script de la tabla host_clientes UPRA*/
INSERT INTO `host_clientes` VALUES (NULL, 'UPRA_OSASBOGPROVWAF', '10.10.151.254', 'UPRA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'UPRA_SRVNPARCSERV0', '10.10.151.36', 'UPRA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'UPRA_SRVNPPORTALAPP0', '10.10.151.27', 'UPRA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'UPRA_SRVNPPORTALAPP1', '10.10.151.29', 'UPRA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'UPRA_SRVNPPORTALBD0', '10.10.151.28', 'UPRA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'UPRA_SRVNPPORTALBD1', '10.10.151.30', 'UPRA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'UPRA_SRVNPSIPRAAPP0', '10.10.151.38', 'UPRA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'UPRA_SRVNPSIPRABD0', '10.10.151.39', 'UPRA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);
INSERT INTO `host_clientes` VALUES (NULL, 'UPRA_SRVNPWADARC0', '10.10.151.37', 'UPRA', 'Producción', 'Linux', NULL, NULL, NULL, NULL);


/*Script de la tabla especialistas*/
INSERT INTO `especialistas` VALUES (NULL, 'FELIPE', 'ALVAREZ PEDRAZA', 'Felipe.Alvarez@asicamericas.com', '3164654092', NULL, 'AIX, Linux, Storage, TSM,backup exec, Veeam, Networker y Vmware', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'HERNAN ARTURO', 'BEJARANO ROJAS', 'Hernan.Bejarano@asicamericas.com', '3185167136', NULL, 'Storage IBM  y TSM', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JORGE HUMBERTO', 'CESPEDES VASCOS', 'Jorge.Cespedes@asicamericas.com', '3164702697', NULL, 'Storage IBM, DELL, HP, TSM, backup exec, Avamar, Networker, Datadomain', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'FRANCISCO JAVIER', 'CORREA ZAPATA', 'Francisco.Correa@asicamericas.com', '3152199234', '3113884907', 'Solaris, Storage Oracle, Sparc', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'DANILO ARMANDO', 'DIAZ NARVAEZ', 'Danilo.Diaz@asicamericas.com', '3174397258', NULL, 'AS400,Power, Mimix, Icluster, BRMS', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'DIEGO ALEJANDRO', 'DIAZ PARRA', 'Diego.Diaz@asicamericas.com', '3166920529', NULL, 'AIX, Linux, Storage, TSM, backup exec,VMware ', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'OSCAR EDUARDO', 'GARCIA JIMENEZ', 'Oscar.GarciaJ@asicamericas.com', '3186229211', NULL, 'Windows Server, exchange, Office 365, Antivirus', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'OSCAR JAVIER', 'GARCIA FERNANDEZ', 'Oscar.GarciaF@asicamericas.com', '3187151443', NULL, 'Windows Server, exchange, Office 365, Antivirus, Azure, Vmware', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'CESAR DAVID', 'GOMEZ ARISTIZABAL', 'Cesar.Gomez@asicamericas.com', '3162351154', NULL, 'AS400,Power, Mimix, Icluster, BRMS', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'MAURICIO', 'GOMEZ', 'Mauricio.Gomez@asicamericas.com', '3174351409', NULL, 'AIX, Linux, PowerVC, Linux Suse Hana', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'FRANCISCO', 'GUTIERREZ RAMIREZ', 'Francisco.Gutierrez@asicamericas.com', '3184094097', NULL, 'AIX y Storage IBM', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'FELIX MANUEL', 'HERNANDEZ MAZA', 'Felix.Hernandez@asicamericas.com', '3185214464', NULL, 'Weblogic y WCC - OCI ', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'ALFONSO JOSE', 'JIMENEZ MEDICIS', 'Alfonso.Jimenez@asicamericas.com', '3164737807', NULL, 'AIX, Linux,Solaris, Sparc, Storage y Vmware', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JOHN', 'FRESNO', 'John.Fresno@asicamericas.com', '3157564957', NULL, 'SOA (WAS, MQ, BROKER) Rational, Weblogic, IIS, Apache, Tomcat, JBOSS', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'FRANCISCO ANTONIO', 'MARTINEZ LOZANO', 'Francisco.Martinez@asicamericas.com', '3158273884', NULL, 'AIX y Linux', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'NICOLAS FABRIZI', 'NARVAEZ ACOSTA', 'Nicolas.Narvaez@asicamericas.com', '3176698268', NULL, 'Storage IBM , TSM, backup exec,Networker y Datadomain', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'LEONARDO RAFAEL', 'ORTIZ STHORMES', 'Leonardo.Ortiz@asicamericas.com', '3153437910', NULL, 'Base de datos (Oracle, Sql, Mysql, EBS), Solaris, Storage Oracle, Sparc,Oracle Linux, Oracle VM, OBS Oracle, OCI ', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JACKSON', 'PALACIOS PADILLA', 'Jackson.Palacios@asicamericas.com', '3175157305', NULL, 'Linux , EBS, hyperion', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'LAURA ALEJANDRA', 'PRIETO CARDENAS', 'Laura.Prieto@asicamericas.com', '3164784366', NULL, 'AS400,Power, Mimix, Icluster, BRMS', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'MAXIMINO', 'RAMOS PALACIOS', 'Maximino.Ramos@asicamericas.com', '3163052279', NULL, 'Lider tecnico , Storage IBM  y Vmware ', NULL, NULL);


INSERT INTO `especialistas` VALUES (NULL, 'JUAN DIEGO', 'ROMAN BEDOYA', 'Juan.Roman@asicamericas.com', '3174351438', NULL, 'Storage IBM , TSM, Networker y OBS Oracle', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JOSE CRISTHIAN', 'VARELA CARABALI', 'Jose.Varela@asicamericas.com', '3176475098', NULL, 'TSM, Veeam y hyperion', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JUAN CAMILO', 'CARRERO VALENZUELA', 'Juan.ValenzuelaC@asicamericas.com', '3182061892', NULL, 'Base de datos (Oracle, Sql, Mysql, postgresql)', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'NICOLAS ALBERTO', 'SANTISTEBAN', 'Nicolas.Santisteban@asicamericas.com', '3152444647', NULL, 'Linux, Aplicaciones Web ( IIS, Apache, Tomcat, JBOSS), AWS, Docker, Base de datos Oracle y Postgresql', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'ALEJANDRO', 'CORTEZ MARIN', 'Alejandro.Cortez@asicamericas.com', '3184094106', NULL, 'Lider tecnico, Windows server y Office 365', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'RAFAEL GIOVANNI', 'FLOREZ ARANGO', 'Rafael.Florez@asicamericas.com', '3184094018', NULL, 'Aplicaciones Web ( IIS, Apache, Tomcat, JBOSS)', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JORGE ELI', 'JARAMILLO OSPINA', 'Jorge.Jaramillo@asicamericas.com', '3153589862', NULL, 'Base de datos (Oracle, Sql, Mysql) y Weblogic', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'ELIZABETH', 'JARAMILLO RIVERA', 'Elizabeth.Jaramillo@asicamericas.com', '3156705453', NULL, 'Weblogic y WCC - OCI', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'LINA', 'JARAMILLO URRUTIA', 'Lina.Jaramillo@asicamericas.com', '3164675263', NULL, 'Lider Tecnico - SOA (WAS, MQ, BROKER,PORTAL )');
INSERT INTO `especialistas` VALUES (NULL, 'JUAN FRANCISCO', 'MAYORGA', 'Juan.Mayorga@asicamericas.com', '3187188230', NULL, 'Base de datos (Oracle, Sql, Mysql, postgresql y DB2)', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'OMAR HERNANDO', 'MENDEZ GIL', 'Omar.Mendez@asicamericas.com', '3183364371', NULL, 'Base de datos DB2  y AS400', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'CARLOS JAVIER', 'MESA', 'Carlos.Mesa@asicamericas.com', '3164661773', NULL, 'TSM, Storage y Linux', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JULIAN ANDRES', 'MILLAN ASCENCIO', 'Julian.Millan@asicamericas.com', '3174300197', NULL, ' Solaris, Storage Oracle, Sparc, Oracle Linux, Oracle VM, OBS Oracle, Weblogic - OCI', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'CHRISTIAN ALEJANDRO', 'NIÑO PEÑA', 'Christian.Nino@asicamericas.com', '3183126058', NULL, 'Lider tecnico - Base de datos (Oracle, Sql, Mysql, EBS)  - OCI', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'INES LILIANA', 'PEREZ DUARTE', 'Ines.Perez@asicamericas.com', '3152942501', NULL, 'Rational', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'MARIA EUGENIA', 'QUISOBONI VILLA', 'Maria.Quisoboni@asicamericas.com', '3176568494', NULL, 'AS400, BRMS', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'CARLOS', 'MONTOYA', 'Carlos.Montoya@asicamericas.com', '3173188227', '3105726773', 'AIX, Linux, Storage IBM, Vmware', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JERSON', 'GOMEZ AMON', 'Jerson.Gomez@asicamericas.com', '3012660615', NULL, 'Windows Server, exchange, Antivirus , Vmware, SCCM', NULL, NULL);


INSERT INTO `especialistas` VALUES (NULL, 'DELIO FABIAN', 'GOMEZ MONTIEL', 'Delio.Gomez@asicamericas.com', '3174003465', NULL, 'Coordinador de especialistas - Windows server, Vmware y Veeam', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'DAVID', 'NIÑO', 'David.Nino@asicamericas.com', '3165284816', NULL, 'Base de datos (Oracle, Sql, Mysql) ', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'RUTH', 'FLORIDO', 'Ruth.Florido@asicamericas.com', '3176364798', NULL, 'Coordinador NOC - Nagios, Solar, APP Manager', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'DANNY FABIÁN', 'DAZA CASTIBLANCO', 'Danny.daza.ext@terpel.com', '3182256585', NULL, 'Windows y SCOM ', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'HAROLD GIOVANNY', 'PELAEZ RAMIREZ', 'harold.pelaez.ext@terpel.com', '3152199233', NULL, 'Windows Server, exchange, Office 365, Antivirus', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'OSCAR ANTONIO', 'BELTRAN HERNÁNDEZ', 'oscar.beltran.ext@terpel.com', '3153184603', NULL, 'Windows server - Control de accesos', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JUAN FELIPE SEBASTIÁN', 'MUÑOZ RUEDA', 'juan.munoz.ext@terpel.com', '3173834270', NULL, ' Base de datos (Oracle, Sql, Mysql) ', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'RONALD JOSÉ', 'ARÉVALO FONSECA', 'ronald.arevalo.ext@terpel.com', '3166910003', NULL, 'Base de datos (Oracle, Sql, Mysql, EBS)  - OCI ', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'JOSE LUIS', 'ÁLAMO', 'jose.alamo@heartbit.com.co', '3153676144', NULL, 'SAP', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'CARLOS HERNADO', 'OLAYA AGUIRRE', 'carlos.olaya.ext@terpel.com', '3153541942', NULL, 'Windows Server, exchange, Office 365, Antivirus, Veeam', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'OSCAR ', 'PULIDO ABELLA', 'oscar.pulido@asicamericas.com', '3158278474', NULL, 'Windows Server, exchange, Office 365, Antivirus, Vmware, Citrix', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'MAURICIO', 'TOCHOY', 'mauricio.tochoy@asicamericas.com', '3164661773', NULL, 'Windows Server, exchange, Office 365, Antivirus, Vmware.', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'FABIO', 'ROJAS', 'fabio.rojas@asicamericas.com', '3187895253', NULL, 'Linux, Redhat Virtualization, Nagios', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'ELIAS DAVID', 'ROMERO PEREZ', 'elias.romero@asicamericas.com', '3216226508', NULL, 'SuseHana, Linux y AIX', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'MIGUEL GIOVANNI', 'SILVA BELTRAN', 'miguel.silva@asicamericas.com', '3187127925', NULL, 'Windows Server, exchange, Office 365, Antivirus, Azure, Vmware', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'ESNEIDER ALEXANDER', 'CANENCIO DOMINGUEZ', 'esneider.canencio@asicamericas.com', '3173834270', '3017302317', 'WAS, Aplicaciones web, Windows, AIX y base de datos SQL', NULL, NULL);
INSERT INTO `especialistas` VALUES (NULL, 'FRANKLY NOE', 'TORO TORO', 'frankly.toro@asicamericas.com', '3103070924', NULL, 'AIX, Linux', NULL, NULL);


/*Script para la tabla gerente_proyectos*/
INSERT INTO `gerentes_proyectos` VALUES (NULL, 'Sor Shirlena', 'Bedoya Martinez', 'Sor.Bedoya@asicamericas.com', '3187904780', '3176457041', 'FLAMINGO', 'FLA007', NULL, NULL);
INSERT INTO `gerentes_proyectos` VALUES (NULL, 'Robert Antuan', 'García Sanchez', 'Robert.Garcia@asicamericas.com', '3164225972', NULL, 'ASNET', 'ASN004', NULL, NULL);
INSERT INTO `gerentes_proyectos` VALUES (NULL, 'Sor Shirlena', 'Bedoya Martinez', 'Sor.Bedoya@asicamericas.com', '3187904780', '3176457041', 'MEFIA', 'FLA007', NULL, NULL);