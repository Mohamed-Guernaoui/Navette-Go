<%@ page import="org.example.app.tonnavette.model.Navette" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/style/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
</head>
<body class="bg-[#f5f4f2]">
<jsp:include page="views/components/NavBar.jsp"/>

<main class=" p-10 px-63 ">
    <section class=" ">
        <div>
            <h1 style="font-family:  'Outfit', 'sans-serif'" class="font-bold text-[38px] ">
                Navettes Disponibles
            </h1>
        </div>
        <div class="flex mt-5">
            <div class="w-full flex flex-col gap-4">
                <%
                    List<Navette> navs = (List<Navette>) request.getAttribute("navettes");

                    if (navs != null && !navs.isEmpty()) {
                        for (Navette nav : navs) {
                %>
                <div class="w-[500px] bg-white h-40 rounded-xl border-2 border-[#f3e322] cursor-pointer p-4">
                    <p  class="text-lg font-semibold text-gray-800">
                        Destination: <%= nav.getVilleArrivee() %>
                    </p>
                </div>
                <%
                    }
                } else {
                %>
                <p class="text-gray-600 text-center">Aucune navette disponible.</p>
                <%
                    }
                %>
            </div>


            <div class="h-full w-full flex  ">
                <div class="w-full h-[700px] bg-white h-40 border border-gray-200 rounded-xl box-shadow">

                </div>
            </div>
        </div>

    </section>
</main>


</body>
</html>




















<%--<h1 class="text-red-400"><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet" class="">Hello Servlet</a>--%>