<%@ page import="org.example.app.tonnavette.model.Utilisateur" %><%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Utilisateur userAuth = (Utilisateur) session.getAttribute("userAuth");
%>



<nav class="relative flex flex-row justify-between items-center w-full p-7 ">
  <div class="flex flex-row gap-20">
    <div>
      <a href="../../index.jsp">
        <h1 style="font-family:  'Outfit', 'sans-serif'" class="text-[30px] font-bold">NavetteToGo</h1>

      </a>
    </div>
    <div class="flex flex-row gap-8">
      <div class="flex relative flex-row justify-center items-center  ">
        <input
                type="text"
                class=" bg-white border py-3  w-[300px] md:pl-12  rounded-l-lg outline-none focus:border-2 border-[#f3e322]"
                placeholder="search for navettes..."
        >
        <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width={1.5}
                stroke="currentColor"
                class="w-6 h-6 absolute left-[10%] md:pointer-events-none md:left-5 top-1/2 -translate-y-1/2 text-xl text-dark-grey "
        >
          <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"
          />
        </svg>
        <button style="font-family:  'Outfit', 'sans-serif'"  class=" bg-[#f3e322] cursor-pointer hover:opacity-80 py-3 border border-[#f3e322]   rounded-r-lg font-semibold  px-5">Search</button>
      </div>
      <div class="flex flex-row justify-between items-center p-3 gap-2 w-52 h-full bg-gray-200 rounded-lg">
        <div class="flex gap-2">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
            <path strokeLinecap="round" strokeLinejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
            <path strokeLinecap="round" strokeLinejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
          </svg>
          <p  style="font-family:  'Outfit', 'sans-serif'"  class="font-semibold">Meknes,Fes</p>
        </div>

        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
          <path stroke-linecap="round" stroke-linejoin="round" d="m19.5 8.25-7.5 7.5-7.5-7.5" />
        </svg>

      </div>
    </div>

  </div>
  <div>
    <% if (userAuth != null) { %>
    <div class="relative flex gap-4">
      <button class="relative rounded-full mt-1 w-12 h-12 flex justify-center items-center bg-gray-200" >
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 ">
          <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0M3.124 7.5A8.969 8.969 0 0 1 5.292 3m13.416 0a8.969 8.969 0 0 1 2.168 4.5" />
        </svg>
      </button>
      <button class="w-12 h-12 mt-1 rounded-full" onclick="toggleUserNav()">
        <img class="rounded-full object-cover w-full h-full"
             src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.FiqQVZ9jc1WyZpJXcOa1MQHaE8%26pid%3DApi&f=1" alt="User"/>
      </button>

<%--      <div id="userNavPanel" class="hidden">--%>
<%--        <jsp:include page="user-navigation.jsp"/>--%>
<%--      </div>--%>
    </div>
    <% } else { %>
    <div class="rounded-full flex flex-row justify-center items-center gap-3">
      <a style="font-family:  'Outfit', 'sans-serif'"  class="whitespace-nowrap bg-black text-white rounded-lg py-3 px-6 text-xl capitalize hover:bg-opacity-80">
        Sign in
      </a>
      <a style="font-family:  'Outfit', 'sans-serif'"  href="../../views/login.jsp" class="whitespace-nowrap rounded-lg py-3 px-6 text-xl capitalize hover:bg-opacity-80 bg-gray-200">
        Login
      </a>

    </div>
    <% } %>

  </div>
</nav>
<script>

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
