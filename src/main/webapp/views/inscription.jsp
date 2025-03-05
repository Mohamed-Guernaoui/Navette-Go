<%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 3/5/2025
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>  Inscription    </title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/style/style.css">
</head>
<body>
<div class="navbar">
    <a href="${pageContext.request.contextPath}/dashboard">Accueil</a>
    <a href="${pageContext.request.contextPath}/utilisateurs">Utilisateurs</a>
    <a href="${pageContext.request.contextPath}/views/inscription.jsp">Inscription</a>
</div>
<form action="inscription" method="post">
    Nom: <input type="text" name="nom" required><br>
    Email: <input type="email" name="email" required><br>
    Mot de passe: <input type="password" name="motDePasse" required><br>
    Type:
    <select name="role">
        <option value="Client">Client</option>
        <option value="Société">Société</option>
    </select><br>
    <button type="submit">S'inscrire</button>
</form>
</body>
</html>
