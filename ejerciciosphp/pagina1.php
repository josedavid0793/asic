<!DOCTYPE html>
<html>
<head>
	<title>Ejercicio 1</title>
	<link rel="stylesheet" type="text/css" href="ejercicio1.css">
	<link href="https://fonts.googleapis.com/css?family=Public+Sans&display=swap" rel="stylesheet">
</head>
<body>
<div class="formulario">
	<h3>Formulario ejemplo sexo,edad,nombres,apellidos y telefono</h3>


	<form action="conexion.php" method="post" target="_blank">
	<input class="texto" type="text" name="nombre" placeholder="Nombres">
	<input class="texto" type="text" name="apellido" placeholder="Apellidos">
	<input class="texto" type="text" name="telefono" placeholder="Telefono">
	<p> Sexo:<br>
	<label><input class="radio" type="radio" name="sexo" value="masculino" checked="">Masculino</label><br>
	<label><input class="radio" type="radio" name="sexo" value="femenino">Femenino</label><br>
	</p>
	<br>
	<label>Edad:
	<select class="edad" name="edad">
		<option value="18">18</option>
		<option value="19">19</option>
		<option value="20">20</option>
	</select>
	</label>
	<br>
	<input class="submit" type="submit" value="Enviar">
	</form>
	
</div>
</body>
</html>