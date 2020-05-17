<?php
$serverdb = 'localhost';
$username = 'root';
$password = '';
$db  = 'formularios_prueba';

$con = mysqli_connect($serverdb,$username,$password,$db);

if (!$con) {
	die("No se pudo conectar a la base de datos".mysqli_connect_error());
} else{
	echo "Conexión exitosa";
}

$nombres = $_POST['nombre'];
$apellidos = $_POST['apellido'];
$telefono = $_POST['telefono'];
$sexo = $_POST['sexo'];
$edad =$_POST['edad'];


 $query = "INSERT INTO ejemplo1 (nombres,apellidos,telefono,edad,sexo) values ('$nombres','$apellidos','$telefono','$sexo','$edad')";

$resultado = $con->query($resultado);

if(!$resultado){
  	echo "No se guardaron datos<br><a href='conexion.php'>Volver</a>".$query."<br>". mysqli_error($con);
     mysqli_close($con);
  }else{
  	echo "Datos Guardados correctamente<br><a href='conexion.php'>Volver</a>";
  	mysqli_close($con);
    
  }
?>