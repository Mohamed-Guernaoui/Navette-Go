<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

<head>
    <title>JSP - Hello World</title>
</head>
<body class="bg-[#f5f4f2]">
<nav class="relative flex flex-row justify-between items-center w-full p-10 ">
    <div class="flex flex-row gap-20">
            <div>
                <h1 class="text-[30px] font-bold">NavetteToGo</h1>
            </div>
            <div class="flex flex-row justify-center items-center  ">
                <input type="text" class="w-full md:w-auto p-2 bg-white border h-full  rounded-l-lg outline-none focus:border-2 border-[#f3e322]" >
                <button class=" bg-[#f3e322]   h-full rounded-r-lg font-semibold  px-5">Search</button>
            </div>

    </div>
    <div>
        <div class="h-10 w-10 bg-gray-300 rounded-full"/>
    </div>
</nav>
<%--<h1 class="text-red-400"><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet" class="">Hello Servlet</a>--%>
</body>
</html>