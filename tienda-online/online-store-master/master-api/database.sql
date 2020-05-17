CREATE DATABASE IF NOT EXISTS store_online;
USE store_online;

CREATE TABLE tipo_documentos(
id_tipo_documento int (10) auto_increment not null,
codigo_tp varchar (20) not null,
nombre_tp varchar (100) not null,
created_at   DATETIME DEFAULT NULL,
update_at     DATETIME DEFAULT NULL,

constraint pk_id_tp primary key (id_tipo_documento)
)ENGINE=InnoDb;

CREATE TABLE users(
email varchar (200) not null,
nombres varchar (100) not null,
apellidos varchar(150) not null,
password varchar (50) not null,
password_confirmation varchar(50)not null,
documento int (10) not null,
tipo_documento varchar(20) not null,
fecha_nacimiento date not null,
created_at   DATETIME DEFAULT NULL,
update_at     DATETIME DEFAULT NULL,

constraint pk_register_email primary key  (email),
constraint  fk_tp_docu foreign key (tipo_documento) references tipo_documentos(codigo_tp),
constraint uniq_pass unique (password),
CONSTRAINT uniq_confir unique (password_confirmation)
    
)ENGINE=InnoDb;

CREATE TABLE login_usuario(
email varchar (200) not null,
contrasena varchar(50) not null,

constraint pk_login_email primary key (email),
constraint fk_login_email foreign key (email) references registro_usuario(email),
constraint fk_login_pass foreign key (contrasena) references registro_usuario(contrasena)
)ENGINE=InnoDb;

create table productos ( 
id_producto int (10) AUTO_INCREMENT not null,
nombre_producto varchar (200) not null,
descripcion_producto text, 
precio_producto int (12) not null, 
imagen_producto text, 
created_at DATETIME DEFAULT NULL, 
update_at DATETIME DEFAULT NULL, 
constraint fk_id_producto primary key (id_producto), 
constraint uniq_nombre_producto unique (nombre_producto), 
constraint uniq_imagen_producto unique (imagen_producto) 

)ENGINE=INNODB

create table categorias(
id_categoria int (10) AUTO_INCREMENT not null,
nombre_categoria varchar (100) not null,
descripcion_categoria varchar (500),
created_at DATETIME DEFAULT NULL, 
update_at DATETIME DEFAULT NULL,
    
constraint pk_categorias primary key (id_categoria),
constraint uniq_nombre unique (nombre_categoria)
   
)ENGINE=INNODB;