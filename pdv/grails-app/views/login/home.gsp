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
<meta name="login" content="home"/>

<title>Home</title>
<asset:stylesheet src="style.css" />
<asset:stylesheet src="style.scss" />
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
	<%@ page import="pdv.Produto"%>
	<% def produtos = Produto.list() %>

	<div class="container" style="border: 2px groove; border-color: gray; background-color: #f3f3f3; padding: 35px">
		<header>
			<div style="display: inline; width: 80%; float: left;">
		   		<h1> <g:if test="${flash.message}"> <div class="message"> ${flash.message} </div> </g:if> </h1>
			
			</div>

			<div style="display: inline; width: 20%; text-align: right; float: right;">
		   		<p class="submit"> <g:link action="logout">Logout</g:link> </p>
		 	  	<p class="submit"> <g:link elementId="link-bloqueio" controller="bloqueio" action="index">Bloquear</g:link> </p>
			</div>
		</header>

		<br><br><br><br>	
		
		<section>
			<b>Produtos Disponíveis:</b><br/>
			
			<table style="width:80%">
			  <tr>
			    <th style="width: 40%; text-align: left;">Produto/Preço</th>
			    <th style="width: 20%; text-align: left;">Quantidade</th>
			    <th style="width: 20%;"></th>
			  </tr>
			  <tr>
			    <td><g:select name="produto" id="produto" style="width: 90%;" from="${pdv.Produto.list()}" optionKey="valor"/> </td>
			    <td><g:field type="number" id="quantidade" name="quantidade" min="1" max="10" required="" value="1"/></td> 
			    <td><button type="button" onclick="incluirProduto()">Incluir</button></td>
			  </tr>
			</table>
		</section>

		<br><br><br>

		<div id="dialog-confirm" title="Bloquear o Caixa?">
			<p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>Se estiver realizando uma venda, os produtos selecionados serão perdidos. Tem certeza que deseja bloquear o caixa?</p>
		</div>

		<div style="height: 125px; overflow-y: scroll; border: 1px solid; background-color: azure;">
			<table bgcolor="white" style="width:100%; overflow-y: auto; height-max: 50px " >
				<thead>
				  <tr>
				    <th style="width: 40%; text-align: left;">Descrição</th>
				    <th style="width: 20%; text-align: left;">Valor Unitário </th>
				    <th style="width: 20%; text-align: left;">Quantidade </th>
				    <th style="width: 20%; text-align: left;">Valor Total </th> 
				  </tr>
				</thead>
			
				<tbody id="corpo-tabela" style="background-color: azure;">
				</tbody>
			</table>
		</div>

		<br/><br/>

		<label>Valor Total da Compra</label>
		<p> R$ <span id="valor-total-compra">0.00</span>
		</p>

		<br/><br/>

		<button onclick="finalizarVenda()" id="link-venda" type="button">Finalizar Venda</button>
		
		<div id="dialog-confirm-venda" title="Finalizar Venda">
			<p><span style="float:left; margin:12px 12px 20px 0;">
				<p> Valor total da compra R$ <span id="valor-total-compra-dialog">0.00</span>
			</p>
		</div>
	</div>

	<g:javascript>

		$( function() {
			var dialog = $("#dialog-confirm").dialog({
				autoOpen: false,
				height: "auto",
				width: 400,
				modal: true,
				buttons: {
					"Bloquear": function () {
						window.location.href = $("#link-bloqueio").attr('href');
					},
					"Cancelar": function () {
						dialog.dialog("close");
					}
				}
			});

			$("#link-bloqueio").on("click", function () {
				dialog.dialog("open");
				return false;
			});
		});
		
		$( function() {
				var dialog = $("#dialog-confirm-venda").dialog({
					autoOpen: false,
					height: "auto",
					width: 400,
					modal: true,
					buttons: {
						"Confirmar Venda": function () {
							$("#corpo-tabela tr").remove();
							var valorCompra = document.getElementById('valor-total-compra').innerHTML = '0.00';
							dialog.dialog("close");
						},
						"Voltar": function () {
							dialog.dialog("close");
						},
					}
				});
		
				$("#link-venda").on("click", function () {
					dialog.dialog("open");
					return false;
				});
		});

		function incluirProduto() {
			var selectProduto = document.getElementById('produto')
			var descricaoProdutoSelecionado = selectProduto.options[selectProduto.selectedIndex].text
			descricaoProdutoSelecionado = descricaoProdutoSelecionado.substr(0, descricaoProdutoSelecionado.indexOf('R$'));
			console.log("descrição produto", descricaoProdutoSelecionado)

			var valorUnitarioProduto = document.getElementById('produto').value;
			console.log('produto', valorUnitarioProduto);
			var quantidadeProduto = document.getElementById('quantidade').value;
			console.log('quantidade', quantidadeProduto);
			var valorTotalInclusaoProduto = valorUnitarioProduto * quantidadeProduto;
			console.log('total', valorTotalInclusaoProduto);

			var tr = document.createElement("tr");

			var tdDescricao = document.createElement("td");
			var tdVlUnitario = document.createElement("td");
			var tdQuantidade = document.createElement("td");
			var tdVlTotal = document.createElement("td");

			tdDescricao.appendChild(document.createTextNode(descricaoProdutoSelecionado));
			tdVlUnitario.appendChild(document.createTextNode(valorUnitarioProduto));
			tdQuantidade.appendChild(document.createTextNode(quantidadeProduto));
			tdVlTotal.appendChild(document.createTextNode(valorTotalInclusaoProduto));

			tr.appendChild(tdDescricao);
			tr.appendChild(tdVlUnitario);
			tr.appendChild(tdQuantidade);
			tr.appendChild(tdVlTotal);

			var corpoTabela = document.getElementById("corpo-tabela");
			corpoTabela.appendChild(tr);

			var valorCompra = document.getElementById('valor-total-compra').innerHTML;
			console.log('valorCompra', valorCompra)
			valorCompra = parseInt(valorCompra) + parseInt(valorTotalInclusaoProduto);

			valorCompra = parseFloat(Math.round(valorCompra * 100) / 100).toFixed(2);

			document.getElementById('valor-total-compra').innerHTML = valorCompra;
		}

		function finalizarVenda() {
			var a = document.getElementById('valor-total-compra').innerHTML;
			document.getElementById('valor-total-compra-dialog').innerHTML = a;
		}
		
		
	</g:javascript>

</body>
</html>
