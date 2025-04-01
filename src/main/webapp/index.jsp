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
<script>

    document.addEventListener("DOMContentLoaded", function () {
        const Nodelist = document.querySelectorAll(".navette-item");
        const firstItem = Nodelist[0];
        const navetteId = firstItem.getAttribute("data-id");
        let selectedId = null;
        if (!navetteId) {
            return;
        }
        fetchFirstNavette(navetteId);


        function displayNavetteDetails(navette) {
            if (!navette || Object.keys(navette).length === 0) {
                document.getElementById("selected_navette").innerHTML = `<p class="text-red-500">Problem Occured</p>`;
            } else {
                console.log(navette)
                document.getElementById("selected_navette").innerHTML = `
                <div class="w-full mx-auto bg-white shadow-xs rounded-lg p-6">
                    <div class="flex justify-between text-gray-500 text-sm">
                        <span>Order #123456</span>
                        <span>March 20, 2025</span>
                    </div>
                    <h2 class="text-xl font-semibold text-center my-2">B 21:25</h2>
                    <p class="text-center text-gray-500 text-sm">Estimated Arrival</p>

                    <div class="flex justify-center my-4 space-x-4">
                        <button class="bg-yellow-400 p-2 rounded-full shadow-md">
                            ✅
                        </button>
                        <button class="bg-yellow-400 p-2 rounded-full shadow-md">
                            📅
                        </button>
                        <button class="bg-gray-300 p-2 rounded-full shadow-md">
                            ⚙️
                        </button>
                        <button class="bg-gray-300 p-2 rounded-full shadow-md">
                            🅿️
                        </button>
                    </div>

                    <div class="flex justify-between text-gray-600 text-sm">
                        <button class="border border-gray-300 py-1 px-4 rounded-lg">Support</button>
                        <button class="border border-gray-300 py-1 px-4 rounded-lg">View on Map ➡️</button>
                    </div>

                    <div class="my-4 border-t border-gray-300 pt-4">
                        <h3 class="text-gray-700 font-semibold">Address</h3>
                        <p class="text-gray-500">Geologicheskaya Street, 50</p>
                    </div>

                    <div class="my-4 border-t border-gray-300 pt-4">
                        <h3 class="text-gray-700 font-semibold">Order Summary</h3>
                        <div class="flex justify-between items-center text-gray-500 text-sm mt-2">
                            <img src="https://via.placeholder.com/40" alt="product" class="w-10 h-10 rounded-lg">
                            <p>Chips "San COCT" Original</p>
                            <span>2.3₽</span>
                        </div>
                    </div>

                    <div class="my-4 border-t border-gray-300 pt-4">
                        <h3 class="text-gray-700 font-semibold">Summary</h3>
                        <div class="flex justify-between text-gray-500 text-sm">
                            <p>Item Cost</p>
                            <span>2.3₽</span>
                        </div>
                        <div class="flex justify-between text-gray-500 text-sm">
                            <p>Delivery Fee</p>
                            <span>9₽</span>
                        </div>
                        <div class="flex justify-between text-gray-500 text-sm">
                            <p>Service Charge</p>
                            <span>0.8₽</span>
                        </div>
                        <div class="flex justify-between font-semibold text-lg mt-2">
                            <p>Total</p>
                            <span>12.3₽</span>
                        </div>
                    </div>
                </div>`

            }


        }

        function fetchFirstNavette(navetteId) {
            if (selectedId === navetteId) {
                return;
            }
            for (let i = 0; i < Nodelist.length; i++) {
                const navId = Nodelist[i].getAttribute("data-id");

                if (parseInt(navetteId) === parseInt(navId)) {
                    // Add the border class to the matched element
                    Nodelist[i].classList.add("border");
                } else {
                    // Remove the border class from other elements
                    Nodelist[i].classList.remove("border");
                }
            }
            document.getElementById("selected_navette").innerHTML = `
                    <div class="absolute right-1/2 bottom-1/2  transform translate-x-1/2 translate-y-1/2 ">
                        <div class="border-t-transparent border-solid animate-spin  rounded-full border-yellow-400 border-3 h-14 w-14"></div>
                    </div>`
            setTimeout(() => {
                fetch(`/nav?id=` + navetteId)
                    .then(response => {
                        return response.json()
                    }).then((data) => {

                    if (data.error) {
                        document.getElementById("selected_navette").innerHTML = `<p class="text-red-500">${data.error}</p>`;
                    } else {
                        selectedId = navetteId
                        displayNavetteDetails(data)
                    }

                })

                    .catch(error => console.error("Error fetching first navette:", error));
            }, 2000)

        }


        document.querySelectorAll(".navette-item").forEach(item => {
            item.addEventListener("click", function () {
                let navetteId = this.getAttribute("data-id");

                fetchFirstNavette(navetteId)
            });
        });
    });
</script>


<main class="  ">
    <section class="relative z-10 p-10 px-54  ">
        <div>
            <h1 style="font-family:  'Outfit', 'sans-serif'" class="font-bold text-[38px] ">
                Navettes Disponibles
            </h1>
        </div>
        <div class="w-full flex flex-row gap-10 mt-5">
            <div class="flex flex-col gap-5">
                <%
                    List<Navette> navs = (List<Navette>) request.getAttribute("navettes");
                    System.out.println(navs);
                    if (navs != null && !navs.isEmpty()) {
                        for (Navette nav : navs) {

                %>
                <div
                        class="relative w-[480px] shadow-xs mx-auto p-6 bg-white rounded-lg border border-yellow-400 cursor-pointer navette-item"
                        data-id="<%= nav.getId() %>">

                    <div class="w-full h-full flex">
                        <div class="w-full flex  flex-col">
                            <div class="h-[80%] w-full flex items-center justify-between px-5">
                                <div class="flex flex-col items-center justify-center ">
                                    <p style="font-family:  'Outfit', 'sans-serif'" class="font-light text-[.75rem]">
                                        Depart</p>
                                    <h2 style="font-family:  'Outfit', 'sans-serif'"
                                        class="font-semibold text-[1.375rem]"><%= nav.getHeureDepart()  %>
                                    </h2>
                                    <p style="font-family:  'Outfit', 'sans-serif'"
                                       class="font-light text-[.75rem]"><%= nav.getVilleDepart() %>
                                    </p>
                                </div>
                                <div class="relative flex justify-center  items-center">
                                    <div class="z-10 w-1 h-1 p-1  rounded-full text-slate-700 ring-4 ring-black bg-white   ">
                                    </div>
                                    <div class="relative h-2  flex flex-col items-center justify-end relative ">
                                                <span style="font-family:  'Outfit', 'sans-serif'"
                                                      class="text-[10px] font-normal absolute -top-3  text-gray-700
                                                        "><%= "#NAV-" + nav.getId()%></span>
                                        <hr class="h-1 w-20 border-l-2 border-slate-500 border-dashed"/>
                                    </div>
                                    <div class="z-10 w-1 h-1 p-1  rounded-full text-slate-700 ring-4 ring-black bg-white   ">
                                    </div>

                                </div>
                                <div class="flex flex-col items-center justify-center">
                                    <p style="font-family:  'Outfit', 'sans-serif'" class="font-light text-[.75rem]">
                                        Arrivee</p>
                                    <h2 style="font-family:  'Outfit', 'sans-serif'"
                                        class="font-semibold text-[1.375rem]"><%= nav.getHeureArrivee() %>
                                    </h2>
                                    <p style="font-family:  'Outfit', 'sans-serif'"
                                       class="font-light text-[.75rem]"><%= nav.getVilleArrivee() %>
                                    </p>
                                </div>
                            </div>
                            <div class="pl-5 h-[20%] flex justify-between items-center mt-5 ">
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
                                    <span class="text-black">
                                                      <%=
                                                      formattedDate
                                                      %>
                                                </span>
                                </p>
                                <button style="font-family:  'Outfit', 'sans-serif'"
                                        class=" cursor-pointer px-6 py-2 border-2 border-yellow-400 text-yellow-500 font-medium rounded-lg hover:bg-yellow-400 hover:text-white transition-all">
                                    Inscrivez
                                </button>

                            </div>
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

            <div id="selected_navette" class="relative w-2/3 flex justify-end">
            </div>
        </div>

    </section>
</main>


</body>
</html>

