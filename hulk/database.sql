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

ALTER TABLE `users` ADD CONSTRAINT `fk_rol_user` FOREIGN KEY (`rol`) REFERENCES `roles`(`nombre_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `host_clientes` ADD CONSTRAINT `fk_clientes` FOREIGN KEY (`cliente`) REFERENCES `clientes`(`nombre`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `hostservice_clientes` ADD CONSTRAINT `fk_host` FOREIGN KEY (`host`) REFERENCES `host_clientes`(`host_name`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `hostservice_clientes` ADD CONSTRAINT `fk_ip` FOREIGN KEY (`ip`) REFERENCES `host_clientes`(`ip`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `hostservice_clientes` ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente`) REFERENCES `host_clientes`(`cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

/*Script e la tabla Roles*/
INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `created_at`, `update_at`) VALUES (NULL, 'Administrador', 'Derecho a todos los módulos del sistema, y a la creación de usuarios.', NULL, NULL);
INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `created_at`, `update_at`) VALUES (NULL, 'Estándar', 'Usuario básico.', NULL, NULL);

/*Script de la tabla Usuario*/
INSERT INTO `usuarios` (`id`, `usuario`, `nombres`, `apellidos`, `correo`, `password`, `rol`, `created_at`, `update_at`, `remember_token`) VALUES (NULL, 'admin', 'Jose David', 'Quintero Bernal', 'quinterobernaldavid@gmail.com', 'luci5610', '1', NULL, NULL, NULL);

/*Script de la tabla clientes*/
INSERT INTO `clientes` (`id`, `nombre`, `created_at`, `update_at`) VALUES (NULL, 'TERPEL', NULL, NULL), (NULL, 'FLAMINGO', NULL, NULL);
INSERT INTO `clientes` (`id`, `nombre`, `created_at`, `update_at`) VALUES (NULL, 'MEFIA', NULL, NULL), (NULL, 'VANTI', NULL, NULL)

/*Script de la tabla host_clientes*/
INSERT INTO `host_clientes` (`id`, `host_name`, `ip`, `cliente`, `ambiente`, `sistema_operativo`, `escalamiento`, `notas`, `created_at`, `update_at`) VALUES (NULL, 'COLBOGSRVACL01', '10.220.0.147', 'TERPEL', 'Producción', 'Windows', 'Especialista Microsoft', NULL, NULL, NULL);




