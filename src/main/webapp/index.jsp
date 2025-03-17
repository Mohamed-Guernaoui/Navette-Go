<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/style/index.css">

</head>
<body class="bg-[#f5f4f2]">
<jsp:include page="views/components/NavBar.jsp"/>

<%--<h1 class="text-red-400"><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet" class="">Hello Servlet</a>--%>
</body>
</html>