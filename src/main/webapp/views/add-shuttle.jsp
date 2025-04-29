<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Shuttle | Shuttle Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            /*background-color: #f8fafc;*/
            background: linear-gradient(to bottom right, #ffffff, #fef9e6);

        }

        .form-container {
            background: linear-gradient(to bottom right, #ffffff, #fef9e6);
            border-radius: 12px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .dashboard-header {
            background: linear-gradient(135deg, #fef08a 0%, #ffffff 50%, #e2e8f0 100%);
        }

        .input-focus:focus {
            border-color: #facc15;
            box-shadow: 0 0 0 3px rgba(250, 204, 21, 0.2);
        }

        .btn-primary {
            background: linear-gradient(to right, #facc15, #eab308);
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(250, 204, 21, 0.3);
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


<div class="flex-1 flex flex-col overflow-hidden">
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
        <h1 class="text-2xl font-bold text-gray-800">Create New Shuttle </h1>
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
    <main class="flex-1 overflow-y-auto mx-auto p-4 md:p-6">
        <div class="w-full max-w-5xl">
            <!-- Form Container -->
            <form action="${pageContext.request.contextPath}/addNavette" method="post"
                  class="form-container p-8 space-y-6">
                <!-- Route Information Card -->
                <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                    <div class="flex items-center mb-4">
                        <div class="bg-yellow-100 p-3 rounded-full mr-4">
                            <i class="fas fa-route text-yellow-500 text-xl"></i>
                        </div>
                        <h2 class="text-xl font-semibold text-gray-800">Route Information</h2>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="fas fa-map-marker-alt text-yellow-500 mr-2"></i>
                                Departure City
                            </label>
                            <input type="text" name="villeDepart" required
                                   class="input-focus w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="fas fa-map-marker-alt text-yellow-500 mr-2"></i>
                                Arrival City
                            </label>
                            <input type="text" name="villeArrivee" required
                                   class="input-focus w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="far fa-clock text-yellow-500 mr-2"></i>
                                Departure Time
                            </label>
                            <input type="time" name="heureDepart" required
                                   class="input-focus w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="far fa-clock text-yellow-500 mr-2"></i>
                                Arrival Time
                            </label>
                            <input type="time" name="heureArrivee" required
                                   class="input-focus w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                        </div>
                    </div>
                </div>

                <!-- Pricing & Distance Card -->
                <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                    <div class="flex  items-center mb-4">
                        <div class="bg-blue-100  p-3 mr-4 rounded-full ">
                            <i class="fas fa-tag text-blue-500 text-xl mx-1"></i>
                        </div>
                        <h2 class="text-xl font-semibold text-gray-800">Pricing & Distance</h2>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="fas fa-money-bill-wave text-green-500 mr-2"></i>
                                Price (MAD)
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <span class="text-gray-500">MAD</span>
                                </div>
                                <input type="number" name="price" step="0.01" min="0" required
                                       class="input-focus pl-16 w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                            </div>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="fas fa-road text-gray-500 mr-2"></i>
                                Distance (km)
                            </label>
                            <div class="relative">
                                <input type="number" name="kilometers" min="1" required
                                       class="input-focus w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                                <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                                    <span class="text-gray-500">km</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Vehicle Details Card -->
                <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                    <div class="flex items-center mb-4">
                        <div class="bg-purple-100 p-3 rounded-full mr-4">
                            <i class="fas fa-car text-purple-500 text-xl"></i>
                        </div>
                        <h2 class="text-xl font-semibold text-gray-800">Vehicle Details</h2>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="fas fa-users text-gray-500 mr-2"></i>
                                Seats Capacity
                            </label>
                            <input type="number" name="seatsNumber" min="1" max="50" required
                                   class="input-focus w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="fas fa-car text-gray-500 mr-2"></i>
                                Vehicle Model
                            </label>
                            <input type="text" name="carModel" required
                                   class="input-focus w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="fas fa-id-card text-gray-500 mr-2"></i>
                                License Plate
                            </label>
                            <input type="text" name="carPlate" required
                                   class="input-focus w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">
                                <i class="fas fa-info-circle text-gray-500 mr-2"></i>
                                Status
                            </label>
                            <select name="status" required
                                    class="input-focus w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none">
                                <option value="OPEN">Available for Booking</option>
                                <option value="CLOSED">Temporarily Unavailable</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Form Actions -->
                <div class="flex flex-col sm:flex-row justify-between items-center pt-4 space-y-4 sm:space-y-0">
                    <a href="${pageContext.request.contextPath}/dashboard"
                       class="flex items-center text-gray-600 hover:text-gray-800">
                        <i class="fas fa-arrow-left mr-2"></i>
                        Back to Dashboard
                    </a>
                    <button type="submit"
                            class="btn-primary px-8 py-3 text-white rounded-lg font-semibold w-full sm:w-auto">
                        <i class="fas fa-plus mr-2"></i> Create Shuttle Service
                    </button>
                </div>
            </form>
        </div>
    </main>
</div>

</body>
</html>