<%@ page import="org.example.app.tonnavette.model.Subscription" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.app.tonnavette.model.Navette" %>
<%@ page import="org.example.app.tonnavette.model.Utilisateur" %><%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 4/13/2025
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Subscription> subs = (List<Subscription>) request.getAttribute("subscription");
    Utilisateur userAuth = (Utilisateur) session.getAttribute("userAuth");

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NavToGO - My Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8fafc;
        }

        .dashboard-header {
            background: linear-gradient(135deg, #fef08a 0%, #ffffff 50%, #e2e8f0 100%);
        }

        .active-tab {
            border-bottom: 3px solid #facc15;
            color: #1e293b;
            font-weight: 600;
        }

        .subscription-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background: linear-gradient(135deg, #facc15 0%, #eab308 100%);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(250, 204, 21, 0.3);
        }
    </style>
</head>
<body class="min-h-screen">
<!-- Header -->
<header class="dashboard-header border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center">
        <div class="flex items-center">
            <a class="flex items-center" href="/">
                <i class="fas fa-shuttle-van text-yellow-500 text-2xl mr-2"></i>
                <span class="text-xl font-bold text-gray-800">NavTo<span class="text-yellow-500">Go</span></span>
            </a>
        </div>
        <div class="flex items-center space-x-4">
            <button class="p-2 text-gray-600 hover:text-yellow-500">
                <i class="fas fa-bell"></i>
            </button>
            <div class="flex items-center">
                <img class="h-8 w-8 rounded-full"
                     src="https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg"
                     alt="User">
                <span class="ml-2 text-sm font-medium"><%= userAuth.getNom() %></span>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <!-- Welcome & Stats -->
    <div class="mb-8">
        <h1 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">Welcome back, <%= userAuth.getNom() %>!</h1>
        <p class="text-gray-600">Manage your shuttle subscriptions and upcoming rides.</p>

        <!-- Quick Stats -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-6">
            <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                <p class="text-sm font-medium text-gray-500">Active Subscriptions</p>
                <p class="text-2xl font-bold text-gray-900 mt-1"><%= subs.size() %>
                </p>
            </div>
            <%--            <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">--%>
            <%--                <p class="text-sm font-medium text-gray-500">Next Ride</p>--%>
            <%--                <p class="text-2xl font-bold text-gray-900 mt-1">Tomorrow, 8:30 AM</p>--%>
            <%--            </div>--%>
            <%--            <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">--%>
            <%--                <p class="text-sm font-medium text-gray-500">Total Saved</p>--%>
            <%--                <p class="text-2xl font-bold text-gray-900 mt-1">$45.60</p>--%>
            <%--            </div>--%>
        </div>
    </div>

    <!-- Tabs Navigation -->
    <div class="border-b border-gray-200 mb-6">
        <nav class="flex space-x-8">
            <button class="py-4 px-1 text-center font-medium text-sm active-tab">
                <i class="fas fa-calendar-alt mr-2"></i> My Subscriptions
            </button>
            <button class="py-4 px-1 text-center font-medium text-sm text-gray-500 hover:text-gray-700">
                <i class="fas fa-ticket-alt mr-2"></i> Upcoming Rides
            </button>
            <button class="py-4 px-1 text-center font-medium text-sm text-gray-500 hover:text-gray-700">
                <i class="fas fa-receipt mr-2"></i> Payment History
            </button>
            <button class="py-4 px-1 text-center font-medium text-sm text-gray-500 hover:text-gray-700">
                <i class="fas fa-cog mr-2"></i> Settings
            </button>
        </nav>
    </div>

    <!-- Subscription Management -->
    <div class="mb-8">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-bold text-gray-800">My Subscriptions</h2>
            <a href="/find-navettes" class="btn-primary px-4 py-2 rounded-md text-sm font-medium text-white">
                <i class="fas fa-plus mr-2"></i> Add Subscription
            </a>
        </div>

        <!-- Subscription Cards Container -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <%
                if ( subs != null && !subs.isEmpty()) {

                for (Subscription sub : subs) {
            %>
            <!-- Subscription Card -->

            <div class="subscription-card bg-white rounded-lg shadow-sm border border-gray-100 p-6 transition-all duration-300">
                <div class="flex justify-between items-start mb-4">
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">Subscription #<%= sub.getId() %>
                        </h3>
                        <p class="text-gray-600">
                            <%= sub.getNavette().getVilleDepart() %> → <%= sub.getNavette().getVilleArrivee() %>
                        </p>
                    </div>
                    <span class="px-3 py-1 rounded-full text-xs font-medium
      <%= sub.getNavette().getStatus() == Navette.NavetteStatus.OPEN ? "bg-green-100 text-green-800" :
         sub.getNavette().getStatus() == Navette.NavetteStatus.CLOSED ? "bg-red-100 text-red-800" :
         "bg-gray-100 text-gray-800" %>">
    <%= sub.getNavette().getStatus() %>
</span>
                </div>

                <div class="space-y-3">
                    <div class="flex items-center">
                        <i class="fas fa-calendar-day text-gray-400 mr-3 w-5"></i>
                        <span class="text-sm text-gray-700">
             <%= sub.getSubscribedAt().format(java.time.format.DateTimeFormatter.ofPattern("MMM d, yyyy h:mm a")) %>
            </span>
                    </div>
                    <div class="flex items-center">
                        <i class="fas fa-clock text-gray-400 mr-3 w-5"></i>
                        <span class="text-sm text-gray-700">
                <%= sub.getNavette().getHeureDepart() %> - <%= sub.getNavette().getHeureArrivee() %>
            </span>
                    </div>
                    <div class="flex items-center">
                        <i class="fas fa-shuttle-van text-gray-400 mr-3 w-5"></i>
                        <span class="text-sm text-gray-700">
                Shuttle #<%= sub.getNavette().getId() %> (<%= sub.getNavette().getCarModel() != null ?
                                sub.getNavette().getCarModel() : "" %>)
            </span>
                    </div>
                    <div class="flex items-center">
                        <i class="fas fa-map-marker-alt text-gray-400 mr-3 w-5"></i>
                        <span class="text-sm text-gray-700">
                Pickup: <%= sub.getPickupPoint() %>
            </span>
                    </div>
                </div>

                <div class="mt-6 flex space-x-3">
                    <button class="flex-1 border border-gray-300 rounded-md py-2 text-sm font-medium text-gray-700 hover:bg-gray-50"
                            onclick="showEditModal(<%= sub.getId() %>)">
                        <i class="fas fa-pencil-alt mr-2"></i> Edit
                    </button>
                    <button class="flex-1 border border-gray-300 rounded-md py-2 text-sm font-medium text-red-600 hover:bg-red-50"
                            onclick="confirmCancel(<%= sub.getId() %>)">
                        <i class="fas fa-times mr-2"></i> Cancel
                    </button>
                </div>
            </div>

                <%
                            }
                        }
                    %>
            <!-- Upcoming Rides Preview -->
            <%--            <div class="bg-white rounded-lg shadow-sm border border-gray-100 p-6 mb-8">--%>
            <%--                <div class="flex justify-between items-center mb-4">--%>
            <%--                    <h2 class="text-xl font-bold text-gray-800">Next Scheduled Ride</h2>--%>
            <%--                    <a href="#" class="text-sm font-medium text-yellow-600 hover:text-yellow-500">View All</a>--%>
            <%--                </div>--%>
            <%--                <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg">--%>
            <%--                    <div>--%>
            <%--                        <p class="font-medium text-gray-800">Downtown → Tech Park</p>--%>
            <%--                        <p class="text-sm text-gray-600">Mon, May 20 · 7:30 AM</p>--%>
            <%--                    </div>--%>
            <%--                    <button class="btn-primary px-4 py-2 rounded-md text-sm font-medium text-white">--%>
            <%--                        <i class="fas fa-qrcode mr-2"></i> View Ticket--%>
            <%--                    </button>--%>
            <%--                </div>--%>
            <%--            </div>--%>
</main>

<!-- Footer -->
<footer class="bg-white border-t border-gray-200 py-6">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center text-sm text-gray-500">
        © 2025 NavToGO. All rights reserved.
    </div>
</footer>

<script>
    // Tab switching functionality
    console.log('ghis what ', <%= subs.getFirst() %>)
    const tabs = document.querySelectorAll('nav button');
    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active-tab'));
            tabs.forEach(t => t.classList.add('text-gray-500'));
            tab.classList.add('active-tab');
            tab.classList.remove('text-gray-500');
        });
    });

    function showEditModal(subscriptionId) {
        // Implement edit modal logic
        console.log("Editing subscription:", subscriptionId);
    }

    function confirmCancel(subscriptionId) {
        if (confirm("Are you sure you want to cancel this subscription?")) {
            window.location.href = '/user/subscriptions/cancel?id=' + subscriptionId;
        }
    }
</script>
</body>
</html>


<%--        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">--%>
<%--            <!-- Subscription 1 -->--%>
<%--            <div class="subscription-card bg-white rounded-lg shadow-sm border border-gray-100 p-6 transition-all duration-300">--%>
<%--                <div class="flex justify-between items-start mb-4">--%>
<%--                    <div>--%>
<%--                        <h3 class="text-lg font-bold text-gray-800">Morning Commute</h3>--%>
<%--                        <p class="text-gray-600">Downtown → Tech Park</p>--%>
<%--                    </div>--%>
<%--                    <span class="px-3 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">Active</span>--%>
<%--                </div>--%>
<%--                <div class="space-y-3">--%>
<%--                    <div class="flex items-center">--%>
<%--                        <i class="fas fa-calendar-day text-gray-400 mr-3 w-5"></i>--%>
<%--                        <span class="text-sm text-gray-700">Mon, Wed, Fri</span>--%>
<%--                    </div>--%>
<%--                    <div class="flex items-center">--%>
<%--                        <i class="fas fa-clock text-gray-400 mr-3 w-5"></i>--%>
<%--                        <span class="text-sm text-gray-700">7:30 AM - 8:15 AM</span>--%>
<%--                    </div>--%>
<%--                    <div class="flex items-center">--%>
<%--                        <i class="fas fa-shuttle-van text-gray-400 mr-3 w-5"></i>--%>
<%--                        <span class="text-sm text-gray-700">Shuttle #SP-1024</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="mt-6 flex space-x-3">--%>
<%--                    <button class="flex-1 border border-gray-300 rounded-md py-2 text-sm font-medium text-gray-700 hover:bg-gray-50">--%>
<%--                        <i class="fas fa-pencil-alt mr-2"></i> Edit--%>
<%--                    </button>--%>
<%--                    <button class="flex-1 border border-gray-300 rounded-md py-2 text-sm font-medium text-red-600 hover:bg-red-50">--%>
<%--                        <i class="fas fa-times mr-2"></i> Cancel--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Subscription 2 -->--%>
<%--            <div class="subscription-card bg-white rounded-lg shadow-sm border border-gray-100 p-6 transition-all duration-300">--%>
<%--                <div class="flex justify-between items-start mb-4">--%>
<%--                    <div>--%>
<%--                        <h3 class="text-lg font-bold text-gray-800">Evening Return</h3>--%>
<%--                        <p class="text-gray-600">Tech Park → Downtown</p>--%>
<%--                    </div>--%>
<%--                    <span class="px-3 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">Active</span>--%>
<%--                </div>--%>
<%--                <div class="space-y-3">--%>
<%--                    <div class="flex items-center">--%>
<%--                        <i class="fas fa-calendar-day text-gray-400 mr-3 w-5"></i>--%>
<%--                        <span class="text-sm text-gray-700">Mon, Wed, Fri</span>--%>
<%--                    </div>--%>
<%--                    <div class="flex items-center">--%>
<%--                        <i class="fas fa-clock text-gray-400 mr-3 w-5"></i>--%>
<%--                        <span class="text-sm text-gray-700">5:30 PM - 6:15 PM</span>--%>
<%--                    </div>--%>
<%--                    <div class="flex items-center">--%>
<%--                        <i class="fas fa-shuttle-van text-gray-400 mr-3 w-5"></i>--%>
<%--                        <span class="text-sm text-gray-700">Shuttle #SP-1024</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="mt-6 flex space-x-3">--%>
<%--                    <button class="flex-1 border border-gray-300 rounded-md py-2 text-sm font-medium text-gray-700 hover:bg-gray-50">--%>
<%--                        <i class="fas fa-pencil-alt mr-2"></i> Edit--%>
<%--                    </button>--%>
<%--                    <button class="flex-1 border border-gray-300 rounded-md py-2 text-sm font-medium text-red-600 hover:bg-red-50">--%>
<%--                        <i class="fas fa-times mr-2"></i> Cancel--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>