<%@ page import="org.example.app.tonnavette.model.Navette" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 4/8/2025
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Navette> navettes = (List<Navette>) request.getAttribute("shuttles");

%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>--%>

<%--<body>--%>


<%--<div class="grid grid-cols-1 md:grid-cols-3 gap-6">--%>

<%--    <div class="bg-white rounded-lg p-6 shadow-md">--%>
<%--        <div class="flex items-center justify-between mb-4">--%>
<%--            <div class="p-2 bg-blue-100 rounded-lg">--%>
<%--                &lt;%&ndash;      <Icon class="h-6 w-6 text-blue-600" />&ndash;%&gt;--%>
<%--                Icon--%>
<%--            </div>--%>
<%--            <span class="text-sm font-medium text-green-600">--%>
<%--      32--%>
<%--&lt;%&ndash;        {change > 0 ? '+' : ''}{change}%&ndash;%&gt;--%>
<%--      </span>--%>
<%--        </div>--%>
<%--        <h3 class="text-gray-500 text-sm mb-1">label</h3>--%>
<%--        <p class="text-2xl font-bold text-gray-900">value</p>--%>
<%--    </div>--%>

<%--    <div class="bg-white rounded-lg p-6 shadow-md">--%>
<%--        <div class="flex items-center justify-between mb-4">--%>
<%--            <div class="p-2 bg-blue-100 rounded-lg">--%>
<%--                &lt;%&ndash;      <Icon class="h-6 w-6 text-blue-600" />&ndash;%&gt;--%>
<%--                Icon--%>
<%--            </div>--%>
<%--            <span class="text-sm font-medium text-green-600">--%>
<%--      32--%>
<%--&lt;%&ndash;        {change > 0 ? '+' : ''}{change}%&ndash;%&gt;--%>
<%--      </span>--%>
<%--        </div>--%>
<%--        <h3 class="text-gray-500 text-sm mb-1">label</h3>--%>
<%--        <p class="text-2xl font-bold text-gray-900">value</p>--%>
<%--    </div>--%>

<%--    <div class="bg-white rounded-lg p-6 shadow-md">--%>
<%--        <div class="flex items-center justify-between mb-4">--%>
<%--            <div class="p-2 bg-blue-100 rounded-lg">--%>
<%--                &lt;%&ndash;      <Icon class="h-6 w-6 text-blue-600" />&ndash;%&gt;--%>
<%--                Icon--%>
<%--            </div>--%>
<%--            <span class="text-sm font-medium text-green-600">--%>
<%--      32--%>
<%--&lt;%&ndash;        {change > 0 ? '+' : ''}{change}%&ndash;%&gt;--%>
<%--      </span>--%>
<%--        </div>--%>
<%--        <h3 class="text-gray-500 text-sm mb-1">label</h3>--%>
<%--        <p class="text-2xl font-bold text-gray-900">value</p>--%>
<%--    </div>--%>


<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shuttle Partner Dashboard</title>
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

        .sidebar {
            transition: all 0.3s ease;
        }

        .card-hover {
            transition: all 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .active-nav-item {
            background-color: #fef9c3;
            border-left: 4px solid #facc15;
            color: #854d0e;
        }

        .btn-primary {
            background: linear-gradient(135deg, #facc15 0%, #eab308 100%);
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(250, 204, 21, 0.3);
        }

        .status-active {
            background-color: #dcfce7;
            color: #166534;
        }

        .status-inactive {
            background-color: #fee2e2;
            color: #991b1b;
        }

        .status-pending {
            background-color: #fef9c3;
            color: #854d0e;
        }
    </style>
</head>
<body class="flex h-screen overflow-hidden">
<!-- Sidebar -->
<div class="hidden md:flex md:flex-shrink-0">
    <div class="sidebar flex flex-col w-64 border-r border-gray-200 bg-white">
        <div class="flex items-center h-16 px-4 border-b border-gray-200">
            <i class="fas fa-shuttle-van text-yellow-500 text-2xl mr-2"></i>
            <span class="text-xl font-bold text-gray-800">Shuttle<span class="text-yellow-500">Partner</span></span>
        </div>
        <div class="flex flex-col flex-grow px-4 py-4 overflow-y-auto">
            <nav class="flex-1 space-y-2">
                <a href="/partner-dashboard"
                   class="active-nav-item flex items-center px-4 py-3 text-sm font-medium rounded-lg">
                    <i class="fas fa-tachometer-alt mr-3"></i>
                    Dashboard
                </a>
                <a href="./views/add-shuttle.jsp"
                   class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-yellow-50 rounded-lg">
                    <i class="fas fa-shuttle-van mr-3"></i>
                    New Shuttle
                </a>
                <a href="#"
                   class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-yellow-50 rounded-lg">
                    <i class="fas fa-route mr-3"></i>
                    Routes
                </a>
                <a href="#"
                   class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-yellow-50 rounded-lg">
                    <i class="fas fa-calendar-alt mr-3"></i>
                    Schedule
                </a>
                <a href="#"
                   class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-yellow-50 rounded-lg">
                    <i class="fas fa-users mr-3"></i>
                    Bookings
                </a>
                <a href="#"
                   class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-yellow-50 rounded-lg">
                    <i class="fas fa-chart-line mr-3"></i>
                    Analytics
                </a>
                <a href="#"
                   class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-yellow-50 rounded-lg">
                    <i class="fas fa-wallet mr-3"></i>
                    Payments
                </a>
                <a href="#"
                   class="flex items-center px-4 py-3 text-sm font-medium text-gray-600 hover:bg-yellow-50 rounded-lg">
                    <i class="fas fa-cog mr-3"></i>
                    Settings
                </a>
            </nav>
        </div>
        <div class="p-4 border-t border-gray-200">
            <div class="flex items-center">
                <img class="h-10 w-10 rounded-full" src="https://randomuser.me/api/portraits/men/32.jpg"
                     alt="User profile">
                <div class="ml-3">
                    <p class="text-sm font-medium text-gray-700">John Smith</p>
                    <p class="text-xs text-gray-500">Premium Partner</p>
                </div>
            </div>
            <button class="mt-4 w-full flex items-center justify-center px-4 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                <i class="fas fa-sign-out-alt mr-2"></i> Sign out
            </button>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="flex-1 flex flex-col overflow-hidden">
    <!-- Mobile Header -->
    <header class="md:hidden flex items-center justify-between px-4 py-3 bg-white border-b border-gray-200">
        <button class="text-gray-500 focus:outline-none">
            <i class="fas fa-bars"></i>
        </button>
        <div class="flex items-center">
            <i class="fas fa-shuttle-van text-yellow-500 text-xl mr-2"></i>
            <span class="text-lg font-bold text-gray-800">Dashboard</span>
        </div>
        <div class="w-6"></div> <!-- Spacer for balance -->
    </header>

    <!-- Desktop Header -->
    <header class="dashboard-header hidden md:flex items-center justify-between px-6 py-4 border-b border-gray-200">
        <h1 class="text-2xl font-bold text-gray-800">Partner Dashboard</h1>
        <div class="flex items-center space-x-4">
            <button class="p-2 text-gray-500 hover:text-gray-700 focus:outline-none">
                <i class="fas fa-bell"></i>
            </button>
            <button class="p-2 text-gray-500 hover:text-gray-700 focus:outline-none">
                <i class="fas fa-question-circle"></i>
            </button>
            <div class="flex items-center">
                <img class="h-8 w-8 rounded-full" src="https://randomuser.me/api/portraits/men/32.jpg"
                     alt="User profile">
                <span class="ml-2 text-sm font-medium text-gray-700">John Smith</span>
            </div>
        </div>
    </header>

    <!-- Main Content Area -->
    <main class="flex-1 overflow-y-auto p-4 md:p-6">
        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
            <div class="bg-white rounded-lg shadow-sm p-6 card-hover">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-gray-500">Active Shuttles</p>
                        <p class="text-2xl font-bold text-gray-900 mt-1"><%= navettes.size() %>
                        </p>
                    </div>
                    <div class="p-3 rounded-full bg-yellow-100 text-yellow-500">
                        <i class="fas fa-shuttle-van text-xl"></i>
                    </div>
                </div>
                <div class="mt-4">
                    <span class="text-green-600 text-sm font-medium">+2 from last month</span>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-sm p-6 card-hover">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-gray-500">Today's Bookings</p>
                        <p class="text-2xl font-bold text-gray-900 mt-1">84</p>
                    </div>
                    <div class="p-3 rounded-full bg-blue-100 text-blue-500">
                        <i class="fas fa-ticket-alt text-xl"></i>
                    </div>
                </div>
                <div class="mt-4">
                    <span class="text-green-600 text-sm font-medium">+15% from yesterday</span>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-sm p-6 card-hover">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-gray-500">Monthly Revenue</p>
                        <p class="text-2xl font-bold text-gray-900 mt-1">$8,420</p>
                    </div>
                    <div class="p-3 rounded-full bg-green-100 text-green-500">
                        <i class="fas fa-dollar-sign text-xl"></i>
                    </div>
                </div>
                <div class="mt-4">
                    <span class="text-green-600 text-sm font-medium">+22% from last month</span>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-sm p-6 card-hover">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-medium text-gray-500">Customer Rating</p>
                        <p class="text-2xl font-bold text-gray-900 mt-1">4.8</p>
                    </div>
                    <div class="p-3 rounded-full bg-purple-100 text-purple-500">
                        <i class="fas fa-star text-xl"></i>
                    </div>
                </div>
                <div class="mt-4">
                    <span class="text-green-600 text-sm font-medium">+0.2 from last quarter</span>
                </div>
            </div>
        </div>

        <!-- Recent Bookings & Shuttle Status -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
            <!-- Recent Bookings -->
            <div class="lg:col-span-2 bg-white rounded-lg shadow-sm overflow-hidden">
                <div class="px-6 py-4 border-b border-gray-200">
                    <div class="flex items-center justify-between">
                        <h2 class="text-lg font-medium text-gray-900">Recent Bookings</h2>
                        <a href="#" class="text-sm font-medium text-yellow-600 hover:text-yellow-500">View All</a>
                    </div>
                </div>
                <div class="overflow-x-auto mx-auto">
                    <%
                        if (navettes != null && !navettes.isEmpty()) {

                    %>
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                        <tr>
                            <th scope="col"
                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Booking ID
                            </th>
                            <th scope="col"
                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Route
                            </th>
                            <th scope="col"
                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Time
                            </th>
                            <th scope="col"
                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Status
                            </th>
                            <th scope="col" class="relative px-6 py-3"></th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">

                        <%
                            for (Navette nav : navettes) {
                        %>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                #BK-<%= nav.getId() %>>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= nav.getVilleDepart() %>
                                → <%= nav.getVilleArrivee() %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= nav.getNombreAbonnes() %>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800"> <%= nav.getStatus() %></span>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <a href="#" class="text-yellow-600 hover:text-yellow-900">Details</a>
                            </td>
                        </tr>
                        <%
                            }

                        %>
                        </tbody>
                    </table>
                    <%
                    } else {
                    %>
                    <div class="flex justify-center items-center">
                        <%--ADD: some GIF HERE --%>
                        <a href="#" class="p-4  rounded-lg text-center hover:bg-gray-50">
                            <div class="mx-auto h-10 w-10 rounded-full bg-yellow-100 flex items-center justify-center text-yellow-500 mb-2">
                                <i class="fas fa-plus"></i>
                            </div>
                            <span class="text-sm font-medium text-gray-700">Add Shuttle</span>
                        </a>

                    </div>
                    <%
                        }
                    %>

            </div>
            </div>
            <!-- Shuttle Status -->
            <div class="bg-white rounded-lg shadow-sm overflow-hidden">
                <div class="px-6 py-4 border-b border-gray-200">
                    <div class="flex items-center justify-between">
                        <h2 class="text-lg font-medium text-gray-900">Shuttle Status</h2>
                        <a href="#" class="text-sm font-medium text-yellow-600 hover:text-yellow-500">Manage Fleet</a>
                    </div>
                </div>
                <div class="p-6">
                    <div class="space-y-4">
                        <div class="flex items-start">
                            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-green-100 flex items-center justify-center text-green-500">
                                <i class="fas fa-shuttle-van"></i>
                            </div>
                            <div class="ml-4">
                                <h3 class="text-sm font-medium text-gray-900">Shuttle #SP-1024</h3>
                                <p class="text-sm text-gray-500">Currently on route: Downtown → Tech Park</p>
                                <div class="mt-1 flex items-center">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full status-active">Active</span>
                                    <span class="ml-2 text-xs text-gray-500">Driver: Michael R.</span>
                                </div>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-green-100 flex items-center justify-center text-green-500">
                                <i class="fas fa-shuttle-van"></i>
                            </div>
                            <div class="ml-4">
                                <h3 class="text-sm font-medium text-gray-900">Shuttle #SP-1025</h3>
                                <p class="text-sm text-gray-500">Currently on route: University → Airport</p>
                                <div class="mt-1 flex items-center">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full status-active">Active</span>
                                    <span class="ml-2 text-xs text-gray-500">Driver: Sarah K.</span>
                                </div>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-yellow-100 flex items-center justify-center text-yellow-500">
                                <i class="fas fa-shuttle-van"></i>
                            </div>
                            <div class="ml-4">
                                <h3 class="text-sm font-medium text-gray-900">Shuttle #SP-1026</h3>
                                <p class="text-sm text-gray-500">Next route: Residential → Business District</p>
                                <div class="mt-1 flex items-center">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full status-pending">Standby</span>
                                    <span class="ml-2 text-xs text-gray-500">Driver: James L.</span>
                                </div>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-red-100 flex items-center justify-center text-red-500">
                                <i class="fas fa-shuttle-van"></i>
                            </div>
                            <div class="ml-4">
                                <h3 class="text-sm font-medium text-gray-900">Shuttle #SP-1027</h3>
                                <p class="text-sm text-gray-500">Maintenance until 05/15</p>
                                <div class="mt-1 flex items-center">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full status-inactive">Inactive</span>
                                    <span class="ml-2 text-xs text-gray-500">Needs service</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions & Performance -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- Quick Actions -->
            <div class="bg-white rounded-lg shadow-sm overflow-hidden">
                <div class="px-6 py-4 border-b border-gray-200">
                    <h2 class="text-lg font-medium text-gray-900">Quick Actions</h2>
                </div>
                <div class="p-6 grid grid-cols-2 gap-4">
                    <a href="./views/add-shuttle.jsp"
                       class="p-4 border border-gray-200 rounded-lg text-center hover:bg-gray-50">
                        <div class="mx-auto h-10 w-10 rounded-full bg-yellow-100 flex items-center justify-center text-yellow-500 mb-2">
                            <i class="fas fa-plus"></i>
                        </div>
                        <span class="text-sm font-medium text-gray-700">Add Shuttle</span>
                    </a>
                    <a href="#" class="p-4 border border-gray-200 rounded-lg text-center hover:bg-gray-50">
                        <div class="mx-auto h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-500 mb-2">
                            <i class="fas fa-route"></i>
                        </div>
                        <span class="text-sm font-medium text-gray-700">Create Route</span>
                    </a>
                    <a href="#" class="p-4 border border-gray-200 rounded-lg text-center hover:bg-gray-50">
                        <div class="mx-auto h-10 w-10 rounded-full bg-green-100 flex items-center justify-center text-green-500 mb-2">
                            <i class="fas fa-calendar-plus"></i>
                        </div>
                        <span class="text-sm font-medium text-gray-700">Add Schedule</span>
                    </a>
                    <a href="#" class="p-4 border border-gray-200 rounded-lg text-center hover:bg-gray-50">
                        <div class="mx-auto h-10 w-10 rounded-full bg-purple-100 flex items-center justify-center text-purple-500 mb-2">
                            <i class="fas fa-file-invoice-dollar"></i>
                        </div>
                        <span class="text-sm font-medium text-gray-700">Generate Report</span>
                    </a>
                </div>
            </div>

            <!-- Performance Metrics -->
            <div class="lg:col-span-2 bg-white rounded-lg shadow-sm overflow-hidden">
                <div class="px-6 py-4 border-b border-gray-200">
                    <div class="flex items-center justify-between">
                        <h2 class="text-lg font-medium text-gray-900">Performance Metrics</h2>
                        <select class="border border-gray-300 rounded-md px-3 py-1 text-sm focus:outline-none focus:ring-yellow-500 focus:border-yellow-500">
                            <option>Last 7 Days</option>
                            <option>Last 30 Days</option>
                            <option selected>Last 90 Days</option>
                            <option>This Year</option>
                        </select>
                    </div>
                </div>
                <div class="p-6">
                    <div class="h-64 bg-gray-50 rounded-lg flex items-center justify-center">
                        <p class="text-gray-500">Performance charts would display here</p>
                    </div>
                    <div class="mt-6 grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div class="p-4 bg-gray-50 rounded-lg">
                            <p class="text-sm font-medium text-gray-500">Avg. Occupancy Rate</p>
                            <p class="text-2xl font-bold text-gray-900 mt-1">78%</p>
                            <p class="text-xs text-gray-500 mt-1">+5% from last period</p>
                        </div>
                        <div class="p-4 bg-gray-50 rounded-lg">
                            <p class="text-sm font-medium text-gray-500">On-Time Performance</p>
                            <p class="text-2xl font-bold text-gray-900 mt-1">92%</p>
                            <p class="text-xs text-gray-500 mt-1">+2% from last period</p>
                        </div>
                        <div class="p-4 bg-gray-50 rounded-lg">
                            <p class="text-sm font-medium text-gray-500">Customer Satisfaction</p>
                            <p class="text-2xl font-bold text-gray-900 mt-1">4.7/5</p>
                            <p class="text-xs text-gray-500 mt-1">+0.1 from last period</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script>
    // Mobile menu toggle functionality would go here
    // This is just a placeholder for the actual implementation
    document.addEventListener('DOMContentLoaded', function () {
        // You would add mobile menu toggle logic here
    });
</script>
</body>
</html>
