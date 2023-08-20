<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carta</title>

<%@ include file="navbar.jsp"%>

<!-- Importaciones para los estilos -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css" />
<link rel="stylesheet" type="text/css"
	href="/sushipe/res/css/styles.css">
	
</head>

<body class="carta">

	<!-- Contenedor general -->

	<div class="container carta">
		<div class="row">
			<div class="col-lg-12 text-center my-2">
				<h4>Nuestra Carta</h4>
			</div>
		</div>

		<!-- Menú para los filtros -->

		<div class="portfolio-menu mt-2 mb-4">
			<ul>
				<li class="btn btn-outline-dark" data-filter=".pij">Picoteo
					Japonés</li>
				<li class="btn btn-outline-dark" data-filter=".pip">Picoteo Pe</li>
				<li class="btn btn-outline-dark" data-filter=".cro">California
					Rolls</li>
				<li class="btn btn-outline-dark" data-filter=".epa">Envueltos
					en Palta</li>
				<li class="btn btn-outline-dark" data-filter=".esa">Envueltos
					en Salmón</li>
				<li class="btn btn-outline-dark" data-filter=".nik">Nikkei</li>
				<li class="btn btn-outline-dark text" data-filter=".ppe">Platos
					Pe</li>
				<li class="btn btn-outline-dark text" data-filter=".item">Todos</li>
			</ul>
		</div>

		<!-- Galería de imágenes -->

		<div class="portfolio-item row">
			<div class="item pij col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/gyosas.jpg" class="fancylight popup-btn"
					data-fancybox-group="light"
					data-caption="Gyosas - De cerdo, verduras o camarón. 6 unidades - $4.200">
					<img class="img-fluid" src="/sushipe/res/img/gyosas.jpg"
					alt="Gyosas">
				</a>
			</div>

			<div class="item pij col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/hosomaki.jpg" class="fancylight popup-btn"
					data-fancybox-group="light"
					data-caption="Hosomaki - Salmón, camarón o atún. 6 unidades - $4.200">
					<img class="img-fluid" src="/sushipe/res/img/hosomaki.jpg"
					alt="Hosomaki">
				</a>
			</div>

			<div class="item pij col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/nigiri.jpg" class="fancylight popup-btn"
					data-fancybox-group="light"
					data-caption="Nigiri - Salmón o camarón. 2 unidades - $4.200">
					<img class="img-fluid" src="/sushipe/res/img/nigiri.jpg"
					alt="Nigiri">
				</a>
			</div>

			<div class="item pij col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/sakana-tataki.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Sakana Tataki - Atún, salmón, camarón y pulpo, marinado con aceite de sésamo - $5.200">
					<img class="img-fluid" src="/sushipe/res/img/sakana-tataki.jpg"
					alt="Sakana Tataki">
				</a>
			</div>

			<div class="item pij col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/sashimi.jpg" class="fancylight popup-btn"
					data-fancybox-group="light"
					data-caption="Sashimi - Salmón, atún, pulpo o mixto. 6 cortes - $5.200">
					<img class="img-fluid" src="/sushipe/res/img/sashimi.jpg"
					alt="Sashimi">
				</a>
			</div>

			<div class="item pij col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/temaki.jpg" class="fancylight popup-btn"
					data-fancybox-group="light"
					data-caption="Temaki - Salmón, palta y cebollín - $4.200"> <img
					class="img-fluid" src="/sushipe/res/img/temaki.jpg" alt="Temaki">
				</a>
			</div>

			<div class="item pip col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/ceviche-tradicional.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Ceviche Tradicional - Ceviche tradicional peruano con camarón, pulpo y salmón - $7.200">
					<img class="img-fluid"
					src="/sushipe/res/img/ceviche-tradicional.jpg"
					alt="Ceviche Tradicional">
				</a>
			</div>

			<div class="item pip col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/chicharron-criollo.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Chicharrón criollo - Receta tradicional de salmón apanado y salsa criolla - $5.200">
					<img class="img-fluid"
					src="/sushipe/res/img/chicharron-criollo.jpg"
					alt="Chicharrón criollo">
				</a>
			</div>

			<div class="item pip col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/pulpo-al-olivo.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Pulpo al olivo - Finos cortes de pulpo bañados en salsa al olivo - $5.200">
					<img class="img-fluid" src="/sushipe/res/img/pulpo-al-olivo.jpg"
					alt="Pulpo al Olivo">
				</a>
			</div>

			<div class="item pip col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/empanadas-pe.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Empanaditas Pe - De camarón o ají de gallina. 3 unidades - $4.200">
					<img class="img-fluid" src="/sushipe/res/img/empanadas-pe.jpg"
					alt="Empanadas Pe">
				</a>
			</div>

			<div class="item cro col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/california.ebi.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="California Ebi - Camarón y palta - $6.800"> <img
					class="img-fluid" src="/sushipe/res/img/california.ebi.jpg"
					alt="California Ebi">
				</a>
			</div>

			<div class="item cro col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/california-pe.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="California Pe - Queso crema, salmón y palta - $6.800">
					<img class="img-fluid" src="/sushipe/res/img/california-pe.jpg"
					alt="California Pe">
				</a>
			</div>

			<div class="item cro col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/california-roll.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="California Roll - Queso crema, kanikama y palta - $6.800">
					<img class="img-fluid" src="/sushipe/res/img/california-roll.jpg"
					alt="California Roll">
				</a>
			</div>

			<div class="item cro col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/california-sake.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="California Sake - Salmón y palta - $6.800"> <img
					class="img-fluid" src="/sushipe/res/img/california-sake.jpg"
					alt="California Sake">
				</a>
			</div>

			<div class="item cro col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/california-ebi-cheese.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="California Ebi Cheese - Camarón, queso crema y palta - $6.800">
					<img class="img-fluid"
					src="/sushipe/res/img/california-ebi-cheese.jpg"
					alt="California Ebi Cheese">
				</a>
			</div>

			<div class="item epa col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/avocado-roll.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Avocado Roll - Salmón y queso crema - $7.200"> <img
					class="img-fluid" src="/sushipe/res/img/avocado-roll.jpg"
					alt="Avocado Roll">
				</a>
			</div>

			<div class="item epa col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/Tai-roll.jpg" class="fancylight popup-btn"
					data-fancybox-group="light"
					data-caption="Tai Roll - Pollo, almendras y queso crema, con topping de salsa de mango - $7.200">
					<img class="img-fluid" src="/sushipe/res/img/Tai-roll.jpg"
					alt="Tai Roll">
				</a>
			</div>

			<div class="item epa col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/ebi-furai.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Ebi Furai - Camarón furai, palta, queso crema - $7.200">
					<img class="img-fluid" src="/sushipe/res/img/ebi-furai.jpg"
					alt="Ebi Furai">
				</a>
			</div>

			<div class="item esa col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/Cai roll.JPG" class="fancylight popup-btn"
					data-fancybox-group="light"
					data-caption="Cai Roll - Cebollín, palta, camarón furai - $7.200">
					<img class="img-fluid" src="/sushipe/res/img/Cai roll.JPG"
					alt="Cai Roll">
				</a>
			</div>

			<div class="item esa col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/salmon-roll.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Salmon Roll - Camarón y palta - $7.200"> <img
					class="img-fluid" src="/sushipe/res/img/salmon-roll.jpg"
					alt="Salmon Roll">
				</a>
			</div>

			<div class="item esa col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/salmon-cheese-roll.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Salmon Cheese - Camarón, queso crema y palta - $7.200">
					<img class="img-fluid"
					src="/sushipe/res/img/salmon-cheese-roll.jpg"
					alt="Salmon Cheese Roll">
				</a>
			</div>

			<div class="item esa col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/sayonara-roll.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Sayonara Roll- Pulpo, palta, queso crema - $7.200">
					<img class="img-fluid" src="/sushipe/res/img/sayonara-roll.jpg"
					alt="Sayonara Roll">
				</a>
			</div>

			<div class="item nik col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/acevichado-roll.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Acevichado Roll - Palta, camarón furai, topping de ceviche - $7.200">
					<img class="img-fluid" src="/sushipe/res/img/acevichado-roll.jpg"
					alt="Acevichado Roll">
				</a>
			</div>

			<div class="item nik col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/huancaina-roll.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Huancaína Roll - Salmón, palta, con topping de salsa criolla y huancaína - $6.200">
					<img class="img-fluid" src="/sushipe/res/img/huancaina-roll.jpg"
					alt="Huancaína Roll">
				</a>
			</div>

			<div class="item nik col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/aji-de-gallina-roll.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Ají de Gallina Roll - Pollo, queso crema, palta, con topping de ají de gallina - $6.200">
					<img class="img-fluid"
					src="/sushipe/res/img/aji-de-gallina-roll.jpg"
					alt="Ají de Gallina Roll">
				</a>
			</div>

			<div class="item nik col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/pe-nikkei.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Pe Nikkei- Camarón, palta, queso crema, con topping de salsa criolla - $6.200">
					<img class="img-fluid" src="/sushipe/res/img/pe-nikkei.jpg"
					alt="Pe Nikkei">
				</a>
			</div>

			<div class="item ppe col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/aji-de-gallina.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Ají de Gallina - Pechuga de pollo cocida con salsa huancaína, acompañado de papas, huevo, arroz y aceituna - $6.200">
					<img class="img-fluid" src="/sushipe/res/img/aji-de-gallina.jpg"
					alt="Ají de Gallina">
				</a>
			</div>

			<div class="item ppe col-lg-3 col-md-4 col-6 col-sm">
				<a href="/sushipe/res/img/arroz chaufa.jpg"
					class="fancylight popup-btn" data-fancybox-group="light"
					data-caption="Arroz chaufa - Arroz frito en salsa de soya con pollo, huevo y cebollín - $6.200">
					<img class="img-fluid" src="/sushipe/res/img/arroz chaufa.jpg"
					alt="Arroz Chaufa">
				</a>
			</div>


		</div>
	</div>

	<!-- Scripts necesarios para efectos visuales -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/3.0.6/isotope.pkgd.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.js"></script>

	<script src="/sushipe/res/js/carta.js"></script>



</body>
</html>

