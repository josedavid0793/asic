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


CREATE TABLE usuarios (
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

ALTER TABLE `users` ADD CONSTRAINT `fk_rol_user` FOREIGN KEY (`rol`) REFERENCES `roles`(`nombre_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
/*Script e la tabla Roles*/
INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `created_at`, `update_at`) VALUES (NULL, 'Administrador', 'Derecho a todos los módulos del sistema, y a la creación de usuarios.', NULL, NULL);
INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `created_at`, `update_at`) VALUES (NULL, 'Estándar', 'Usuario básico.', NULL, NULL);

/*Script e la tabla Usuario*/
INSERT INTO `usuarios` (`id`, `usuario`, `nombres`, `apellidos`, `correo`, `password`, `rol`, `created_at`, `update_at`, `remember_token`) VALUES (NULL, 'admin', 'Jose David', 'Quintero Bernal', 'quinterobernaldavid@gmail.com', 'luci5610', '1', NULL, NULL, NULL);

