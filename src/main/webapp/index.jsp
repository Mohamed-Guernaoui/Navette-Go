<%@ page import="org.example.app.tonnavette.model.Navette" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/style/indx.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
</head>
<body class="bg-[#f5f4f2]">
<jsp:include page="views/components/NavBar.jsp"/>

<main class="  ">
    <section class="relative z-10 p-10 px-54  ">
        <div>
            <h1 style="font-family:  'Outfit', 'sans-serif'" class="font-bold text-[38px] ">
                Navettes Disponibles
            </h1>
        </div>
        <div class="w-full flex mt-5">
            <div class="flex flex-col gap-4">
                <%
                    List<Navette> navs = (List<Navette>) request.getAttribute("navettes");

                    if (navs != null && !navs.isEmpty()) {
                        for (Navette nav : navs) {

                %>
                <div
                        class="relative w-[480px] bg-white h-40 rounded-xl first:border-2 border-[#f3e322] cursor-pointer ">
                    <div  class="w-full h-full flex">
                                    <div class="w-2/3 flex  flex-col">
                                        <div class="h-[80%] flex p-5 gap-10 mt-3 ">
                                            <div class="flex flex-col items-center justify-center ">
                                                <p style="font-family:  'Outfit', 'sans-serif'"  class="font-light text-[.75rem]">Depart</p>
                                                <h2 style="font-family:  'Outfit', 'sans-serif'"  class="font-normal text-[1.375rem]"><%= nav.getHeureDepart()  %></h2>
                                                <p style="font-family:  'Outfit', 'sans-serif'"  class="font-light text-[.75rem]"><%= nav.getVilleDepart() %></p>
                                            </div>
                                            <div class="relative flex justify-center  items-center">
                                                <div class="z-10 w-1 h-1 p-1  rounded-full text-slate-700 ring-4 ring-black bg-white   ">
                                                </div>
                                                <div class="relative h-2  flex flex-col items-center justify-end relative ">
                                                <span style="font-family:  'Outfit', 'sans-serif'"
                                                      class="text-[10px] font-normal absolute -top-3  text-gray-700
                                                        "><%= "#NAV-"+ nav.getId()%></span>
                                                    <hr class="h-1 w-20 border-l-2 border-slate-500 border-dashed"/>
                                                </div>
                                                <div class="z-10 w-1 h-1 p-1  rounded-full text-slate-700 ring-4 ring-black bg-white   ">
                                                </div>

                                            </div>
                                            <div class="flex flex-col items-center justify-center">
                                                <p style="font-family:  'Outfit', 'sans-serif'"  class="font-light text-[.75rem]">Arrivee</p>
                                                <h2 style="font-family:  'Outfit', 'sans-serif'"  class="font-normal text-[1.375rem]"><%= nav.getHeureArrivee() %></h2>
                                                <p style="font-family:  'Outfit', 'sans-serif'"  class="font-light text-[.75rem]"><%= nav.getVilleArrivee() %></p>
                                            </div>
                                        </div>
                                        <div class="pl-5 h-[20%]">
                                            <%
                                                // Assuming nav.getCreatedAt() returns "2025-03-20 17:56:45"
                                                String createdAt = nav.getCreatedAt();

                                                // Define input and output date formats
                                                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                                SimpleDateFormat outputFormat = new SimpleDateFormat("MMM dd, yyyy");

                                                // Parse input string to Date object
                                                Date date = inputFormat.parse(createdAt);

                                                // Format date to desired output
                                                String formattedDate = outputFormat.format(date);
                                            %>
                                            <p style="font-family:  'Outfit', 'sans-serif'"
                                               class="text-[0.75rem] text-gray-500"
                                            >Created
                                                At:
                                                <%=
                                                formattedDate
                                             %></p>

                                        </div>
                                    </div>


                                    <div class="w-1/3  flex items-center justify-center ">
                                        <a style="font-family:  'Outfit', 'sans-serif'"
                                           class="whitespace-nowrap border-2 border-[#f3e322] text-black rounded-lg py-3 px-4  text-md capitalize hover:bg-opacity-80">
                                            Inscrivez
                                        </a>
                                    </div>
                            </div>
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
            <div class="w-2/3 flex justify-end">
                <div class=" h-[700px] w-[80%] bg-white h-40 border border-gray-200 rounded-xl box-shadow">

                </div>
            </div>
        </div>

    </section>
</main>


</body>
</html>
