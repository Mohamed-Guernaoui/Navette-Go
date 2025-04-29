<%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 4/29/2025
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


    .active-nav-item {
        background-color: #fef9c3;
        border-left: 4px solid #facc15;
        color: #854d0e;
    }

</style>
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

