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
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Outfit:wght@100..900&display=swap"
          rel="stylesheet">
</head>
<body class="bg-[#f5f4f2]">

<jsp:include page="components/NavBar.jsp"/>

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
            function toggleDetails(button) {
                console.log("DDDDDDD")
                const detailsSection = button.nextElementSibling;
                const arrow = button.querySelector('svg');

                detailsSection.classList.toggle('hidden');
                arrow.classList.toggle('rotate-180');
            }

            if (!navette || Object.keys(navette).length === 0) {
                document.getElementById("selected_navette").innerHTML = `<p class="text-red-500">Problem Occured</p>`;
            } else {
                console.log(navette)
                document.getElementById("selected_navette").innerHTML = `

<div class="w-full mx-auto bg-white shadow-xs rounded-lg p-6">
                    <div class="flex justify-between items-center text-gray-500 text-sm">
                       <span style="font-family:  'Outfit', 'sans-serif'" class="text-[13px] font-normal text-gray-500">
                            #NT-` + navette.id + `
                        </span>
                       <div class="bg-blue-50 text-blue-700 px-3 py-1 rounded-full text-sm font-medium flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                            </svg>
                            Active
                        </div>
                    </div>
                    <div class="w-full flex justify-center p-4 ">
                        <div class="flex items-center justify-center gap-5">
                                 <div class="flex flex-col items-center justify-center ">
                                    <p style="font-family:  'Outfit', 'sans-serif'" class="font-normal text-[1rem]">
                                        Depart</p>
                                    <h2 style="font-family:  'Outfit', 'sans-serif'" class="font-semibold text-[2rem]">` + navette.heureDepart + `
                                    </h2>
                                    <p style="font-family:  'Outfit', 'sans-serif'" class="font-normal text-[1rem]">` + navette.villeDepart + `
                                    </p>
                                </div>
                                <div class="z-10 w-4 h-4 rounded-full bg-green-500 ring-4 ring-green-100 flex items-center justify-center">
                                      <div class="w-2 h-2 rounded-full bg-white"></div>
                                </div>
                        </div>

                        <div class="relative flex justify-center items-center py-8">
                           <!-- Position 1 (Completed) -->
                           <div class="relative mx-4">
                                <div class="h-0.5 w-60 bg-gray-200">
                                    <!-- Progress Bar -->
                                    <div class="h-full w-1/2 bg-green-500"></div>

                                    <!-- Journey Info -->
                                    <div class="absolute -top-4 left-1/2 -translate-x-1/2 bg-white px-3 rounded-full border border-gray-100 shadow-sm">
                                        <div class="flex items-center gap-3 py-2">
                                            <!-- Seats Info -->
                                            <div class="flex items-center gap-1">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
                                                </svg>
                                                <span style="font-family:  'Inter', 'sans-serif'" class="text-sm text-gray-600 text-nowrap">` + navette.nombreAbonnes + ` / ` + navette.nombreSieges + `</span>
                                            </div>
                                            <!-- Duration -->
                                            <div class="flex items-center gap-1">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                                                </svg>
                                                <span style="font-family:  'Inter', 'sans-serif'" class="text-sm text-gray-600 text-nowrap">1h 30m</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                              </div>

                        <div class="flex items-center justify-center gap-5">
                                   <div class="z-10 w-4 h-4 rounded-full bg-red-500 ring-4 ring-red-100 flex items-center justify-center">
                                       <div class="w-2 h-2 rounded-full bg-white"></div>
                                  </div>
                                 <div class="flex flex-col items-center justify-center ">
                                    <p style="font-family:  'Outfit', 'sans-serif'" class="font-normal text-[1rem]">
                                        Arrivee</p>
                                    <h2 style="font-family:  'Outfit', 'sans-serif'" class="font-semibold text-[2rem]">` + navette.heureArrivee + `
                                    </h2>
                                    <p style="font-family:  'Outfit', 'sans-serif'" class="font-normal text-[1rem]">` + navette.villeArrivee + `
                                    </p>
                                </div>

                        </div>
                    </div>

                    <div class="flex items-center justify-center gap-6 text-sm">
                            <!-- Subscription Period -->
                            <div class="flex items-center gap-2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                </svg>
                                <div>
                                    <p style="font-family:  'Outfit', 'sans-serif'"   class="text-md text-gray-500">Subscription Period</p>
                                    <p style="font-family:  'Inter', 'sans-serif'"  class="text-md font-medium text-gray-700">` + new Date(navette.debutAbonnement).toLocaleDateString() +
                    ` - ` + new Date(navette.finAbonnement).toLocaleDateString() + `</p>
                                </div>
                            </div>

                            <!-- Route ID -->
                            <div class="flex items-center gap-2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                                </svg>
                                <div>
                                    <p  style="font-family:  'Outfit', 'sans-serif'" class="text-md text-gray-500">Route ID</p>

                                    <p style="font-family:  'Inter', 'sans-serif'"  class="text-md font-medium text-gray-700">#RT-2</p>
                                </div>
                            </div>
                     </div>
                     <div class="mt-6 border-t border-gray-100 pt-4">
        <button id="detailsBtn" class="w-full cursor-pointer flex justify-between items-center text-gray-600
                hover:text-gray-800 transition-colors duration-200">
            <span style="font-family: 'Outfit', 'sans-serif'" class="font-medium">View Details</span>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 transform transition-transform duration-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
        </button>
        <div class="hidden mt-4 space-y-4">
            <!-- Additional Details Content -->
            <div class="grid grid-cols-2 gap-4">
                <div class="flex items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    <div>
                        <p style="font-family: 'Outfit', 'sans-serif'" class="text-sm text-gray-500">Pickup Point</p>
                        <p style="font-family: 'Inter', 'sans-serif'" class="text-sm font-medium text-gray-700">Central Station</p>
                    </div>
                </div>
                <div class="flex items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    <div>
                        <p style="font-family: 'Outfit', 'sans-serif'" class="text-sm text-gray-500">Drop-off Point</p>
                        <p style="font-family: 'Inter', 'sans-serif'" class="text-sm font-medium text-gray-700">University Campus</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Action Buttons -->
    <div class="mt-6 flex justify-end gap-3">
<!--        <button class="px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition-colors duration-200 flex items-center gap-2">-->
<!--            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">-->
<!--                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />-->
<!--                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />-->
<!--            </svg>-->
<!--            View-->
<!--        </button>-->

 <button style="font-family:  'Outfit', 'sans-serif'"  id="subscribe" class="px-5 py-3 bg-[#f3e322] cursor-pointer text-gray-800 rounded-lg hover:bg-[#e6d41f] transition-colors duration-200 flex items-center gap-2 min-w-[120px] justify-center">
    <!-- Default button content -->
    <span class="button-content flex items-center gap-2">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3m-1 4l-3 3m0 0l-3-3m3 3V4" />
        </svg>
        Subscribe
    </span>

    <!-- Loading spinner (hidden by default) -->
    <span class="loading-spinner hidden flex items-center gap-2">
        <svg class="animate-spin h-5 w-5 text-gray-800" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" fill="none"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
        </svg>
        <span class="animate-pulse">Redirecting..</span>
    </span>
</button>

    </div>

                </div>`

                function resetButtonState() {
                    const button = document.getElementById("subscribe");
                    if (!button) return; // Guard clause in case button doesn't exist

                    const buttonContent = button.querySelector('.button-content');
                    const loadingSpinner = button.querySelector('.loading-spinner');

                    // Reset button to initial state
                    button.disabled = false;
                    button.classList.remove('opacity-75', 'cursor-not-allowed');
                    buttonContent.classList.remove('hidden');
                    loadingSpinner.classList.add('hidden');
                }

                // Reset button when page loads
                document.addEventListener('DOMContentLoaded', resetButtonState);

                // Reset button when navigating back
                window.addEventListener('pageshow', function (event) {
                    if (event.persisted) {
                        resetButtonState();
                    }
                });

                document.getElementById("detailsBtn").addEventListener("click", function () {
                    toggleDetails(this)
                })
                document.getElementById("subscribe").addEventListener("click", function (event) {
                    event.preventDefault();

                    // Get button elements
                    const button = this;
                    const buttonContent = button.querySelector('.button-content');
                    const loadingSpinner = button.querySelector('.loading-spinner');

                    // Disable button and show loading state
                    button.disabled = true;
                    button.classList.add('opacity-75', 'cursor-not-allowed');
                    buttonContent.classList.add('hidden');
                    loadingSpinner.classList.remove('hidden');

                    // Redirect with loading state
                    setTimeout(() => {
                        window.location.href = `/subscription?navetteId=` + navette.id;
                        // loadingSpinner.classList.add('hidden');

                    }, 500); // Add a small delay to show the loading state (optional)
                });

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
                    console.log(navId, parseInt(navetteId))
                    console.log(Nodelist)
                    Nodelist[i].classList.add("border");
                } else {
                    // Remove the border class from other elementsx
                    Nodelist[i].classList.remove("border");
                }
            }
            document.getElementById("selected_navette").innerHTML = `
                    <div class="absolute right-1/2 top-20  transform translate-x-1/2 translate-y-1/2 ">
                        <div class="border-t-transparent border-solid animate-spin  rounded-full border-blue-400 border-3 h-14 w-14"></div>
                    </div>`
            setTimeout(() => {
                fetch(`/nav?id=` + navetteId)
                    .then(response => {
                        return response.json();
                    }).then((data) => {
                    console.log(data)
                    if (data.error) {
                        document.getElementById("selected_navette").innerHTML = `<p class="text-red-500">${data.error}</p>`;
                    } else {
                        selectedId = navetteId
                        displayNavetteDetails(data)
                    }

                })

                    .catch(error => console.error("Error fetching navette:", error));
            }, 1000)

        }

        document.querySelectorAll(".navette-item").forEach(item => {
            item.addEventListener("click", function () {
                let navetteId = this.getAttribute("data-id");

                fetchFirstNavette(navetteId)
            });
        });

    });

    function createTripCard(trip) {
        const template = document.querySelector('#trip-card-template').content.cloneNode(true);

        // Fill in the data
        template.querySelector('.company-name').textContent = trip.societe.Nom;
        template.querySelector('.trip-id').textContent = `#RT-${trip.id}`;
        template.querySelector('.departure-city').textContent = trip.villeDepart;
        template.querySelector('.departure-time').textContent = trip.heureDepart;
        template.querySelector('.arrival-city').textContent = trip.villeArrivee;
        template.querySelector('.arrival-time').textContent = trip.heureArrivee;
        template.querySelector('.seats-info').textContent = `${trip.nombreSieges}/${trip.nombreAbonnes} seats`;

        // Format and set the date
        const endDate = new Date(trip.finAbonnement).toLocaleDateString('en-US', {
            month: 'short',
            day: 'numeric',
            year: 'numeric'
        });
        template.querySelector('.subscription-date').textContent = `Until ${endDate}`;

        return template;
    }

    // Usage:
    const tripsContainer = document.querySelector('.trips-container');
    trips.forEach(trip => {
        const tripCard = createTripCard(trip);
        tripsContainer.appendChild(tripCard);
    });
</script>


<main class="  ">
    <section class="relative z-10 p-10 px-54  ">
        <div>
            <h1 style="font-family:  'Outfit', 'sans-serif'" class="font-bold text-[38px] ">
                Navettes Disponibles
            </h1>
        </div>
        <div class="w-full flex flex-row justify-between  gap-5 mt-5">
            <%--            <div class="flex flex-col gap-5">--%>
            <div class="w-[43%] space-y-4">

                <%
                    List<Navette> navs = (List<Navette>) request.getAttribute("navettes");
                    System.out.println(navs);
                    if (navs != null && !navs.isEmpty()) {
                        for (Navette nav : navs) {

                %>

                <!-- Single Trip Card -->
                <div
                        data-id="<%= nav.getId() %>"
                        class="navette-item  bg-white rounded-lg shadow-sm border border-lime-500 p-4 hover:shadow-md transition-shadow">
                    <!-- Header with Company and Trip ID -->
                    <div class="flex justify-between items-center mb-3">
                        <div class="flex items-center gap-3">
                            <%--                <span class="bg-blue-50 text-blue-700 px-3 py-1 rounded-full text-sm font-medium">--%>
                            <%--                    MedMks--%>
                            <%--                </span>--%>
                            <span class="text-xs text-gray-500 bg-gray-50 px-2 py-1 rounded-full">
                        <%= "#NT- " + nav.getId() %>
                    </span>
                        </div>
                        <div class="flex items-center gap-2">
                            <span class="bg-green-50 text-green-600 text-xs px-2 py-1 rounded-full flex items-center gap-1">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-3 w-3" fill="none" viewBox="0 0 24 24"
                                     stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M5.636 18.364a9 9 0 010-12.728m12.728 0a9 9 0 010 12.728m-9.9-2.829a5 5 0 010-7.07m7.072 0a5 5 0 010 7.07M13 12a1 1 0 11-2 0 1 1 0 012 0z"/>
                                </svg>
                                Active
                            </span>
                        </div>
                    </div>

                    <!-- Route Information -->
                    <div class="flex items-center gap-4 my-4">
                        <!-- Departure -->
                        <div class="flex-1">
                            <div class="flex items-start gap-3">
                                <div class="mt-2">
                                    <div class="w-3 h-3 rounded-full bg-green-500 ring-2 ring-green-100"></div>
                                </div>
                                <div>
                                    <h3 style="font-family:  'Outfit', 'sans-serif'"
                                        class="font-semibold text-[1rem]"><%= nav.getVilleDepart() %>
                                    </h3>
                                    <p style="font-family:  'Inter', 'sans-serif'"
                                       class="font-light text-[.85rem]"><%= nav.getHeureDepart() %>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Journey Info -->
                        <div class="flex-1 flex flex-col items-center">
                            <span class="text-xs text-gray-500 bg-gray-50 px-3 py-1 rounded-full mb-1">
                            1h 30m
                            </span>
                            <div class="w-full h-0.5 bg-gray-100 relative">
                                <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-400" fill="none"
                                         viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                                    </svg>
                                </div>
                            </div>
                        </div>

                        <!-- Arrival -->
                        <div class="flex-1">
                            <div class="flex items-start gap-3 justify-end">
                                <div>
                                    <h3 style="font-family:  'Outfit', 'sans-serif'"
                                        class="font-semibold text-[1rem]"><%= nav.getVilleArrivee() %>
                                    </h3>
                                    <p style="font-family:  'Inter', 'sans-serif'"
                                       class="font-light text-[.85rem]"><%= nav.getHeureArrivee() %>
                                    </p>
                                </div>
                                <div class="mt-2">
                                    <div class="w-3 h-3 rounded-full bg-red-500 ring-2 ring-red-100"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Footer Information -->
                    <div class="flex items-center justify-between pt-3 border-t border-gray-200">
                        <!-- Left Side Info -->
                        <div class="flex items-center gap-4">
                            <!-- Seats -->
                            <div class="flex items-center gap-2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-400" fill="none"
                                     viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                                </svg>
                                <span class="text-sm text-gray-600"><%= nav.getNombreSieges() + " seats" %></span>
                            </div>

                            <!-- Date -->
                            <div class="flex items-center gap-2">
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
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-400" fill="none"
                                     viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                </svg>
                                <span style="font-family:  'Inter', 'sans-serif'"
                                      class="text-sm text-gray-600"><%= formattedDate %></span>
                            </div>
                        </div>

                        <!-- Action Button -->
                        <button
                                class="text-blue-600 cursor-pointer hover:text-blue-700 text-sm font-medium flex items-center gap-1">
                            View Details
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24"
                                 stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- You can duplicate this card for multiple trips -->


                <%
                    }
                } else {
                %>
                <p class="text-gray-600 text-center">Aucune navette disponible.</p>
                <%
                    }
                %>
            </div>

            <div id="selected_navette" class="w-[57%] sticky top-4">
            </div>
        </div>

    </section>
</main>
</body>
</html>

