<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="Fli Agencia" content="aca debe ir la description de la pagina servicios no mayor a 156">
	<title>Operador-Logistico-FLI</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="icon" type="image/png" href="imagenes/embarcacion.png">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="estilos.css">
	<link href="https://fonts.googleapis.com/css?family=Oxygen|Libre+Baskerville|Rubik|Ubuntu&display=swap" rel="stylesheet">
</head>
<body>
<header class="header">
	<div class="menu">
	     <div class="row contenedor">

			         <p class="logo">Fli SAS</p>
			         <img src="imagenes/menu.png" class="menu-icon" alt="">

			        <nav>
				       <ul>
				          <li><a href="index.php">Inicio</a></li>
				          <li><a href="nosotros.php" target="_black">Nosotros</a></li>
				          <li><a href="servicios.php" target="_black">Servicios</a></li>			  
				          <li><a href="">Contacto</a></li>
			          </ul>
			        </nav>
		        <!--</div>-->
		        <div class="btn-group boton-registro">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Acceso
                     </button>
                       <div class="dropdown-menu">
                         <a class="dropdown-item" href="#">Registrese</a>
                         <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Ingrese</a>
                        </div>
                 </div>

	      </div>
	      
   </div>
   	<div id="contenedor-titulo-flex">
		<div class="contenedor-titulo">
				<h1>Operador Logistico</h1>
				<h2>lema</h2>
		</div>
	</div>
</header>
<section id="sobre-nosotros">
	<div class="sobre-nosotros-text">
		<h2>Un poco de nosotros</h2>
		<hr>
		<p>Somos una compañía de emprendedores con conocimientos en comercio internacional, la cual se especializa en 
        la nacionalización de todo tipo de mercancías, provenientes del exterior; manejo de carga, bodegaje etc. Con sede en la ciudad de Bogota, Cartagena.Somos una compañía de emprendedores con conocimientos en comercio internacional, la cual se especializa en 
        la nacionalización de todo tipo de mercancías, provenientes del exterior; manejo de carga, bodegaje etc. Con sede en la ciudad de Bogota, Cartagena.
		</p>
	</div>

</section>

<section id="services">
		<div class="contenedor">
			<div class="titular">
				<h2>Nuestros Servicios</h2>
				<h3> Queremos brindarte un portafolio de servicios según tus necesidades</h3>
				<a class="boton" href="">SERVICIOS</a>
			</div>
			<div id="service-uno" class="service">
				<img src="imagenes/camion.png" alt="carga">
				<h4>Transporte Internacional</h4>
				<p>Como operador logístico dimensionamos y diseñamos operaciones a la medida de las necesidades de cada cliente; levantamos información valiosa para gestionar procesos de almacenamiento, administración y distribución de mercancías, operaciones de comercio exterior a través de nuestra agencia de aduanas y la coordinación de transporte de carga nacional e internacional en diferentes modalidades.</p>
			     <a href="mailto:comercial@flisas.com.co?Subject=Mas%20Informacion%20Fletes">conoce mas</a>
			</div>
		</div>
		<div class="contenedor contenedor-services-2">
			<div class="service">
				<img src="imagenes/grua.png" alt="importar">
				<h4>Aduanas</h4>
				<p>Tenemos la capacidad de gestión integrada y coordinada de distintas líneas de servicios necesarias para el éxito en el proceso de internacionalización</p>
			     <a href="mailto:comercial@flisas.com.co?Subject=Mas%20Informacion%20Nacionalización">conoce mas</a>
			 </div>
			<div class="service" id="dos">
			    <img src="imagenes/proveedor.png" alt="Bodegaje">
				<h4>Menaje|Viajeros</h4>
				<p>Your content goes here. Edit or remove this text  inline or in the module content settings.
				You can also style every aspect of this content in the module design settings and every  apply custom CSS to this text
			     in the module Advanced settings.</p>
			     <a href="mailto:comercial@flisas.com.co?Subject=Mas%20Informacion%20Bodegajes">conoce mas</a>
			</div>
			<div class="service" id="service-cuatro">
				<img src="imagenes/exterior.png" alt="exportar">
				<h4>Operación Portuaria</h4>
				<p>Te ayudamos a potenciar tu iniciativa, deseo de logro y de realización de tus proyectos. En especial, aquellos que se orientan al desarrollo y penetración de nuevos mercados con la región de Latino-América.</p>
			      <a href="mailto:comercial@flisas.com.co?Subject=Mas%20Informacion%20Aduanas">conoce mas</a>
			</div>

		</div>
</section>

<section id="registro-login">
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<h2 class="titulo-registro brb">Nuevos Clientes</h2>
            <p class="pto">Registrate y hazle seguimiento a tu carga</p>
			<form class="register" id="form-registro" method="post" action="registro.php" target="_black">
				<div class="div_form">
					<div class="label-float label-size">
					   <label class="mtm">Nombres:
                            <span class="requerido">*</span>
				        </label>
					</div>
					<div class="label-float input-size">
						<input type="text" name="nombres" placeholder="Nombres">
					</div>
				</div>
				<div class="div_form">
                     <div class="label-float label-size">
                          <label class="mtm">Apellidos:
                              <span class="requerido">*</span>
                          </label>
                     </div>
                     <div class="label-float input-size">
                         <input type="text" name="apellidos" id="" placeholder="Ingrese sus apellidos" required="">
                      </div>
                </div>
				<div class="div_form">
                    <div class="label-float label-size">
                        <label class="mtm" form="registro-contraseña">Contraseña:
                              <span class="requerido">*</span>
                        </label>
                    </div>
                    <div class="label-float input-size">
                        <input type="password" name="contrasena" id="contrasena" placeholder="Ingrese su contraseña" required="">
                    </div>
                </div>
                <div class="div_form">
                    <div class="label-float label-size">
                        <label class="mtm" form="registro-contraseña">Email:
                              <span class="requerido">*</span>
                        </label>
                    </div>
                    <div class="label-float input-size">
                        <input type="email" name="contrasena" id="contrasena" placeholder="Correo Electronico" required="">
                    </div>
                </div>
                <div class="div_form">
                	<div class="label-float">
                	   <label class="mtm">Tipo persona:</label>
                	        Natural<input type="radio" name="tpersona" value="N">
                            Juridico<input type="radio" name="tpersona" value="J">
                	</div>
                </div>
                <div class="div_form">
                     <div class="label-float label-size">
                          <label class="mtm">Empresa:
                          </label>
                     </div>
                     <div class="label-float input-size">
                         <input type="text" name="apellidos" id="" placeholder="Empresa" required="">
                      </div>
                </div>
           
				
				

				<input type="submit" value="Enviar">

			</form>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<h2 class="titulo-registro brb">Ingreso clientes</h2>
            <p class="pto">Ingresa y monitorea tu carga</p>
			<form class="login" id="form-login" method="post" action="registro.php" target="_black">
				<div class="div_form">
                    <div class="label-float label-size">
                        <label class="mtm" form="registro-contraseña">Email:
                              <span class="requerido">*</span>
                        </label>
                    </div>
                    <div class="label-float input-size">
                        <input type="email" name="contrasena" id="contrasena" placeholder="Correo Electronico" required="">
                    </div>
                </div>
                <div class="div_form">
                    <div class="label-float label-size">
                        <label class="mtm" form="registro-contraseña">Contraseña:
                              <span class="requerido">*</span>
                        </label>
                    </div>
                    <div class="label-float input-size">
                        <input type="password" name="contrasena" id="contrasena" placeholder="Ingrese su contraseña" required="">
                    </div>
                </div>
                <input type="submit" value="Ingresar">
			</form>
			<div class="izquierda">
			   <h2>Horario de atención</h2>
			      <ul>
				      <li>LUN - VIE</li>
				      <li>08:00am - 12:00pm</li>
				      <li>02:00pm - 06:00pm</li>
			      </ul>
			      <ul id="tercera" style="border-bottom: 0px ">
				   <li>SAB-DOM</li>
				   <li>Cerrado</li>
			      </ul>
			      <a href="#whatsapp">ESCRIBENOS</a>

			      <h3 class="news" style="margin-top: 44px;">Conosca nuestos servicios</h3>
			      <p class="izp">Estamos interesados en manejar tu carga</p>
		    </div>
		</div>
		
	</div>
	
</div>

</section>

<footer>
	<section id="socialmedia">
		<div class="contenedor">
			<div class="redes">
			      <a href="https://www.facebook.com/miah.pasteleria/" target="_blank"><img src="imagenes/facebook.png"></a>
			      <a href="https://www.instagram.com/miah.pasteleria/" target="_blank"><img src="imagenes/instagram.png"></a>
			      <a href="link de linkedd" target="_blank"><img src="imagenes/linkedin.png"></a>
			</div>
			<div class="parrafo">
				<p>2020 FLI SAS | Agencia de carga. Todos los derechos reservados</p>
			</div>
		</div>
	</section>
</footer>






<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<script src="https://kit.fontawesome.com/d7f8911c59.js"></script>

<script >
		$(document).ready(function(){

	$(window).scroll(function(){
		scroll = $(window).scrollTop();

			if (scroll > 100) {
				$('.menu').css({"background":"#fff"});
				$('.menu').css({"position":"fixed"});
				$('.menu').css({"width":"100%"});
				$('.menu').css({"top":"0"});
				$('.menu a').css({"color":"#000"});
				$('.menu a').css({"text-decoration":"none"});
				$('.logo').css({"color":"#000"});
				$('.menu').css({"box-shadow":"rgba(0,0,0,0.22) 4px 1px 1px"});
				$('.menu').css({"z-index":"100"});
				$('.menu ul').css({"list-style":"none"});

			}else{
				$('.menu').css({"position":"relative"});
				$('.menu').css({"background":"transparent"});
				$('.menu').css({"width":"100%"});
				$('.menu').css({"top":"0"});
				$('.menu').css({"box-shadow":"0 0 0"});
				$('.menu a').css({"color":"#E11A29"});
				$('.logo').css({"color":"#E11A29"});
				$('..dropdown-menu').css({"color":"#000"});
			}
	})	

 $('.menu-icon').click(function(){
    $('header nav').slideToggle();
 })
              
			})
</script>
</body>
</html>