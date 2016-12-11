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

	<br>
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

		<br/>

		<b>Produtos Disponíveis:</b><br/>

		<br/>

		<label>Produto/Preço</label><br/>
		<g:select name="produto"
				id="produto"
			  from="${pdv.Produto.list()}"
			  optionKey="valor"
		/><br/>

		<br/>

		<label>Quantidade</label><br/>
		<g:field type="number"
				id="quantidade"
				 name="quantidade"
				 min="1"
				 max="10"
				 required=""
		/>

		</br></br>

		<button type="button" onclick="incluirProduto()">Incluir</button>

		<br/><br/>

		<table bgcolor="white" width="400px">
			<thead>
				<tr>
					<th>
						Descrição
					</th>
					<th>
						Valor Unitário
					</th>
					<th>
						Quantidade
					</th>
					<th>
						Valor Total
					</th>
				</tr>
			</thead>
			<tbody id="corpo-tabela">
			</tbody>
		</table>

		<br/><br/>

		<label>Valor Total da Compra</label>
		<p>
			R$
			<span id="valor-total-compra">0</span>
		</p>

	</div>

	<g:javascript>

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
			valorCompra += valorTotalInclusaoProduto;
			document.getElementById('valor-total-compra').innerHTML = valorCompra;
		}

	</g:javascript>

</body>
</html>
