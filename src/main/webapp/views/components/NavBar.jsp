<%@ page
        import="org.example.app.tonnavette.model.Utilisateur" %>
<%@ page
        import="org.example.app.tonnavette.model.Entreprise" %><%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Utilisateur userAuth = (Utilisateur) session.getAttribute("userAuth");
    Entreprise currentPartner = (Entreprise) session.getAttribute("loggedPartner");
%>
<%
    if (currentPartner != null || userAuth != null) {

%>
<div
        id="userNavPanel"
        class=" hidden absolute right-0 bottom-5  z-50"
>
    <div class=" bg-white absolute right-0 shadow-lg border border-grey w-60 overflow-hidden duration-200  ">
        <a class=" flex gap-2 link pl-8 py-4 " href="<%= currentPartner != null ? "/partner-dashboard" :
        "/commuter-dashboard" %>">
            <p>profile</p>
        </a>
        <a class=" flex gap-2 link pl-8 py-4 " href="<%= currentPartner != null ? "/partner-dashboard" :
        "/commuter-dashboard" %>">
            <p>Dashboard</p>
        </a>
        <% if (userAuth != null) { %>

        <a class=" flex gap-2 link pl-8 py-4 " href="/views/RequestCreationForm.jsp">
            <p>Demand Shuttle</p>
        </a>
        <% } %>
        <span class=" border-t border-grey w-[100%]  absolute"></span>
        <form action="/sign-out" method="post">
            <button
                    class=" text-left p-4 hover:bg-grey w-full pl-8 py-4 "
            >
                <h1 class=" font-semibold mr-20 text-xl ">Sign out</h1>
                <p class=" text-dark-grey"><%= currentPartner != null ? "@" + currentPartner.getName() :
                        "@" + userAuth.getNom() %>
                </p>
            </button>
        </form>

    </div>
</div>
<%
    }
%>


<nav class="relative flex flex-row justify-between items-center w-full px-8 py-6 bg-white shadow-sm  ">
    <div class="flex flex-row items-center gap-16">
        <div>
            <a href="/views/index.jsp" class="hover:opacity-80 transition-opacity">
                <h1 style="font-family: 'Outfit', sans-serif"
                <%--                    class="text-3xl font-bold bg-gradient-to-r from-[#f3e322] to-[#f3a322] bg-clip-text text-transparent">--%>
                    class="text-3xl font-bold text-[#f4b322]">
                    NaveToGo
                </h1>
            </a>
        </div>
        <div class="flex flex-row items-center gap-8">
            <form id="searchForm" method="get" action="/search-navette" class="relative">
                <div class="flex items-center">
                    <div class="relative">
                        <input
                                id="searchInput"
                                type="text"
                                class="bg-gray-100 border-0 py-3.5 w-[320px] pl-12 pr-4 rounded-lg outline-none focus:ring-2 ring-[#f3e322] transition-all duration-200"
                                placeholder="Find your destination"
                        >
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                fill="none"
                                viewBox="0 0 24 24"
                                stroke-width={1.5}
                                stroke="currentColor"
                                class="w-5 h-5 absolute left-4 top-1/2 -translate-y-1/2 text-gray-400"
                        >
                            <path
                                    strokeLinecap="round"
                                    strokeLinejoin="round"
                                    d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"
                            />
                        </svg>
                    </div>
                    <button
                            type="submit"
                            style="font-family: 'Outfit', sans-serif"
                            class="ml-2 bg-[#f3e322] hover:bg-[#e6d41f] transition-colors duration-200 py-3.5 px-6 rounded-lg font-semibold text-gray-800 shadow-sm"
                    >
                        Search
                    </button>
                </div>
            </form>
            <div class="flex items-center gap-2 px-4 py-2.5 bg-gray-50 rounded-lg cursor-pointer hover:bg-gray-100 transition-colors duration-200">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="w-5 h-5 text-gray-600">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
                    <path strokeLinecap="round" strokeLinejoin="round"
                          d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z"/>
                </svg>
                <p style="font-family: 'Outfit', sans-serif" class="font-medium text-gray-700">We Can't locate you</p>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="w-4 h-4 text-gray-500">
                    <path stroke-linecap="round" stroke-linejoin="round" d="m19.5 8.25-7.5 7.5-7.5-7.5"/>
                </svg>
            </div>
        </div>
    </div>
    <div>
        <%--   PROFILE FOR USER     --%>
        <% if (userAuth != null) { %>
        <div class="flex items-center gap-4">
            <button class="relative rounded-full w-11 h-11 flex justify-center items-center bg-gray-50 hover:bg-gray-100 transition-colors duration-200">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="w-5 h-5 text-gray-600">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0M3.124 7.5A8.969 8.969 0 0 1 5.292 3m13.416 0a8.969 8.969 0 0 1 2.168 4.5"/>
                </svg>
            </button>

            <button class="w-11 h-11 rounded-full overflow-hidden hover:ring-2 ring-[#f3e322] transition-all duration-200"
                    onclick="toggleUserNav()">
                <img class="w-full h-full object-cover"
                     src="https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg"
                     alt="User"/>
            </button>


        </div>
        <%--  PROFILE FOR PARTNER  --%>
        <% } else if (currentPartner != null) { %>
        <div class="flex items-center gap-4">
            <button class="relative rounded-full w-11 h-11 flex justify-center items-center bg-gray-50 hover:bg-gray-100 transition-colors duration-200">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="w-5 h-5 text-gray-600">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0M3.124 7.5A8.969 8.969 0 0 1 5.292 3m13.416 0a8.969 8.969 0 0 1 2.168 4.5"/>
                </svg>
            </button>
            <button class="w-11 h-11 rounded-full overflow-hidden hover:ring-2 ring-[#f3e322] transition-all duration-200"
                    onclick="toggleUserNav()">
                <img class="w-full h-full object-cover"
                     src="https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg"
                     alt="User"/>
            </button>
        </div>

        <% } else { %>
        <div class="flex items-center gap-4">
            <a style="font-family: 'Outfit', sans-serif"
               href="../../views/commuter-account-login.jsp?action=sign-up"
               class="whitespace-nowrap bg-gray-900 text-white rounded-lg py-3 px-6 text-md font-medium hover:bg-gray-800 transition-colors duration-200">
                For Commuters
            </a>
            <a style="font-family: 'Outfit', sans-serif" href="../../views/business-account-login.jsp?action=sign-up"
               class="whitespace-nowrap rounded-lg py-3 px-6 text-md font-medium bg-gray-50 hover:bg-gray-100 transition-colors duration-200">
                Become Partner
            </a>
        </div>
        <% } %>
    </div>
</nav>

<script>
    document.getElementById("searchForm").addEventListener("submit", function (event) {
        event.preventDefault(); // Prevent default form submission

        let inputValue = document.getElementById("searchInput").value.trim();
        if (inputValue !== "") {
            window.location.href = `/search-navette?q=` + encodeURIComponent(inputValue);
        }
    });

    function toggleUserNav() {
        document.getElementById("userNavPanel").classList.toggle("hidden");
    }

    function toggleSearch() {
        document.getElementById("searchBar").classList.toggle("hidden");
    }

    function handleKeyDown(event) {
        if (event.key === "Enter") {
            window.location.href = "search.jsp?query=" + event.target.value;
        }
    }
</script>
