<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <asset:stylesheet src="style.css"/>
  <asset:stylesheet src="style.scss"/>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
    <section class="container">
    <div class="login">
      <h1>Login</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form controller="login" action="autenticar" method="post" >
        <p><g:field type="text" name="username" value="${usuario?.username}" placeholder="Usuário"/></p>
        <p><g:field type="password" name="password" value="${usuario?.password}" placeholder="Senha"/></p>

        <p class="submit"><g:submitButton type="submit" name="login"/></p>
      </g:form>
    </div>
  </section>

</body>
</html>
