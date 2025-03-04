<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.app.tonnavette.model.Utilisateur" %>

<html>
<head>
  <title>Liste des Utilisateurs</title>
</head>
<body>
<h2>Liste des Utilisateurs</h2>

<table border="1">
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
    <td><%= user.getId() %></td>
    <td><%= user.getNom() %></td>
    <td><%= user.getEmail() %></td>
    <td><%= user.getRole() %></td>
  </tr>
  <%
      }
    }
  %>
</table>
</body>
</html>
