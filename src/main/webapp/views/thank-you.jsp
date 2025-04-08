<%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 4/5/2025
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String toastMessage = (String) request.getAttribute("toastMessage");
    String toastType = (String) request.getAttribute("toastType");
%>
<html>
<head>
    <head>
        <title>Thanks</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/style/indx.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Outfit:wght@100..900&display=swap"
              rel="stylesheet">
    </head>
</head>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

<body>
<jsp:include page="components/NavBar.jsp"/>

<% if (toastMessage != null) { %>
<script>
    window.onload = function () {
        showToast("<%= toastMessage %>", "<%= toastType %>");
    };
</script>
<% } %>
<!-- Toast container -->
<div id="toast"
     class="fixed top-5 right-5 z-50 px-4 py-2 text-white rounded shadow hidden transition-opacity duration-300"></div>

<script>
    function showToast(message, type) {
        const toast = document.getElementById('toast');
        toast.className = 'fixed top-5 right-5 z-50 px-4 py-2 text-white rounded shadow transition-opacity duration-300';

        if (type === 'success') {
            toast.classList.add('bg-green-500');
        } else {
            toast.classList.add('bg-red-500');
        }

        toast.textContent = message;
        toast.style.opacity = '1';
        toast.style.display = 'block';

        setTimeout(() => {
            toast.style.opacity = '0';
            setTimeout(() => {
                toast.style.display = 'none';
            }, 300);
        }, 3000);
    }
</script>


</body>
</html>
