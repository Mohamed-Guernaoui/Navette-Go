<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.app.tonnavette.model.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des Utilisateurs</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/style/style.css">
</head>
<body>

<div class="navbar">
    <a href="${pageContext.request.contextPath}/dashboard">Accueil</a>
    <a href="${pageContext.request.contextPath}/utilisateurs">Utilisateurs</a>
    <a href="${pageContext.request.contextPath}/views/inscription.jsp">Inscription</a>
</div>

<h2>Liste des Utilisateurs</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Email</th>
        <th>Rôle</th>
    </tr>
    <%
        List<Utilisateur> utilisateurs = (List<Utilisateur>) request.getAttribute("utilisateurs");
        if (utilisateurs != null) {
            for (Utilisateur user : utilisateurs) {
    %>
    <tr>
        <td><%= user.getId() %>
        </td>
        <td><%= user.getNom() %>
        </td>
        <td><%= user.getEmail() %>
        </td>
        <td><%= user.getRole() %>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>
