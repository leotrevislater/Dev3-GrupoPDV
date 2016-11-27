<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Logout</title>
<asset:stylesheet src="style.css" />
<asset:stylesheet src="style.scss" />
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
	<section class="container">
		<div class="login">
			<h1>Logout</h1>

			<h2>Total do Caixa</h2>
			<br>
			<div class="message">
				${flash.message}
			</div>
			<p class="submit">
				<g:form controller="logout">
					<g:actionSubmit action="sair" value="Sair" />
				</g:form>
				<g:form controller="logout">
					<g:actionSubmit action="cancelar" value="Cancelar" />
				</g:form>

			</p>



		</div>
	</section>

</body>
</html>
