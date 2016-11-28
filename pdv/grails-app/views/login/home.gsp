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
<title>Home</title>
<asset:stylesheet src="style.css" />
<asset:stylesheet src="style.scss" />
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
	<%@ page import="pdv.Produto"%>
	<% def produtos = Produto.list() %>

	<div class="content_container">
		<div class="content">
			<g:each in="${produtos}" var="produto">
				<tr>
					<td>
						${produto.descricao}
					</td>
				</tr>
			</g:each>
		</div>
	</div>

		<section class="container">
			<div>
				<h1>
					<g:if test="${flash.message}">
						<div class="message">
							${flash.message}
						</div>
					</g:if>
				</h1>

				<p class="submit">
					<g:link action="logout">Logout</g:link>
				</p>
				<p class="submit">
					<g:link controller="bloqueio" action="index">Bloquear</g:link>
				</p>

			</div>
		</section>
</body>
</html>
