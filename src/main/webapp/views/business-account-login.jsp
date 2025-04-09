<%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 4/8/2025
  Time: 11:30 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shuttle Partners - Business Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8fafc;
        }

        .partner-gradient {
            background: linear-gradient(135deg, #fef08a 0%, #ffffff 50%, #e2e8f0 100%);
        }

        .form-card {
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .form-card:hover {
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .input-focus:focus {
            border-color: #facc15;
            box-shadow: 0 0 0 3px rgba(250, 204, 21, 0.2);
        }

        .btn-primary {
            background: linear-gradient(135deg, #facc15 0%, #eab308 100%);
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(250, 204, 21, 0.3);
        }

        .tab-active {
            border-bottom: 3px solid #facc15;
            color: #1e293b;
            font-weight: 600;
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="partner-gradient py-4 border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-shuttle-van text-yellow-500 text-2xl mr-2"></i>
            <span class="text-xl font-bold text-gray-800">Shuttle<span class="text-yellow-500">Partners</span></span>
        </div>
        <nav class="hidden md:flex space-x-8">
            <a href="#" class="text-gray-700 hover:text-yellow-500">Why Partner?</a>
            <a href="#" class="text-gray-700 hover:text-yellow-500">Pricing</a>
            <a href="#" class="text-gray-700 hover:text-yellow-500">Resources</a>
            <a href="#" class="text-gray-700 hover:text-yellow-500">Contact</a>
        </nav>
        <a href="/" class="text-sm font-medium text-yellow-600 hover:text-yellow-700">
            <i class="fas fa-arrow-left mr-1"></i> Back to main site
        </a>
    </div>
</header>

<!-- Main Content -->
<main class="min-h-screen py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12">
            <h1 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">Grow Your Transportation Business</h1>
            <p class="text-lg text-gray-600 max-w-3xl mx-auto">
                Join our network of trusted shuttle providers and gain access to thousands of daily commuters.
            </p>
        </div>

        <!-- Tab Navigation -->
        <div class="max-w-md mx-auto mb-8">
            <div class="flex border-b border-gray-200">
                <button id="login-tab" class="flex-1 py-4 px-1 text-center font-medium text-sm tab-active">
                    <i class="fas fa-sign-in-alt mr-2"></i> Partner Login
                </button>
                <button id="register-tab"
                        class="flex-1 py-4 px-1 text-center font-medium text-sm text-gray-500 hover:text-gray-700">
                    <i class="fas fa-user-plus mr-2"></i> Become a Partner
                </button>
            </div>
        </div>

        <div class="relative overflow-hidden min-h-[300px] transition-all">

            <!-- Login Form -->
            <div id="login-form"
                 class="max-w-md mx-auto bg-white rounded-xl shadow-md overflow-hidden form-card p-8 transition-opacity duration-500 ease-in-out opacity-100">
                <div class="text-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-800">Partner Login</h2>
                    <p class="text-gray-600">Access your business dashboard</p>
                </div>

                <form class="space-y-6" action="/partner-login" method="post">
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Business Email</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400"></i>
                            </div>
                            <input id="email" name="business-email" type="email" autocomplete="email" required
                                   class="input-focus outline-none pl-10 block w-full rounded-md border-gray-300 shadow-sm  py-3 border">
                        </div>
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400"></i>
                            </div>
                            <input id="password" name="password" type="password" autocomplete="current-password"
                                   required
                                   class="input-focus outline-none pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                        </div>
                    </div>

                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <input id="remember-me" name="remember-me" type="checkbox"
                                   class="h-4 w-4 text-yellow-600 focus:ring-yellow-500 border-gray-300 rounded">
                            <label for="remember-me" class="ml-2 block text-sm text-gray-700">Remember me</label>
                        </div>

                        <div class="text-sm">
                            <a href="#" class="font-medium text-yellow-600 hover:text-yellow-500">Forgot password?</a>
                        </div>
                    </div>

                    <div>
                        <button type="submit"
                                class="btn-primary w-full flex justify-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500">
                            Sign in to dashboard
                        </button>
                    </div>
                </form>

                <div class="mt-6">
                    <div class="relative">
                        <div class="absolute inset-0 flex items-center">
                            <div class="w-full border-t border-gray-300"></div>
                        </div>
                        <div class="relative flex justify-center text-sm">
                            <span class="px-2 bg-white text-gray-500">Or continue with</span>
                        </div>
                    </div>

                    <div class="mt-6 grid grid-cols-2 gap-3">

                        <a href="#"
                           class="w-full inline-flex justify-center items-center py-2 px-4 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                            <i class="fab fa-google text-red-500 mr-2"></i> Google
                        </a>

                        <a href="#"
                           class="w-full inline-flex justify-center items-center py-2 px-4 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                            <i class="fab fa-microsoft text-blue-500 mr-2"></i> Microsoft
                        </a>
                    </div>
                </div>
            </div>

            <!-- Registration Form (Hidden by default) -->
            <div id="register-form"
                 class="max-w-2xl mx-auto bg-white rounded-xl shadow-md overflow-hidden form-card p-8 hidden transition-opacity duration-500 ease-in-out opacity-0">
                <div class="text-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-800">Become a Shuttle Partner</h2>
                    <p class="text-gray-600">Join our network and grow your business</p>
                </div>

                <form class="space-y-6" action="/create-partner-account" method="post">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="companyName" class="block text-sm font-medium text-gray-700 mb-1">Company Name
                                *</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-building text-gray-400"></i>
                                </div>
                                <input id="companyName" name="company-name" type="text" required
                                       class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                            </div>
                        </div>

                        <div>
                            <label for="companyType" class="block text-sm font-medium text-gray-700 mb-1">Company Type
                                *</label>
                            <select id="companyType" name="companyType"
                                    class="input-focus px-4 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                                <option value="">Select your business type</option>
                                <option value="transport">Transportation Company</option>
                                <option value="school">School/University</option>
                                <option value="corporate">Corporate Shuttle</option>
                                <option value="municipal">Municipal Service</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="contactPerson" class="block text-sm font-medium text-gray-700 mb-1">Contact
                                Person
                                *</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-user text-gray-400"></i>
                                </div>
                                <input id="contactPerson" name="contactPerson" type="text" required
                                       class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                            </div>
                        </div>

                        <div>
                            <label for="contactPhone" class="block text-sm font-medium text-gray-700 mb-1">Phone Number
                                *</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-phone text-gray-400"></i>
                                </div>
                                <input id="contactPhone" name="contactPhone" type="tel" required
                                       class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                            </div>
                        </div>
                    </div>

                    <div>
                        <label for="businessEmail" class="block text-sm font-medium text-gray-700 mb-1">Business Email
                            *</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400"></i>
                            </div>
                            <input id="businessEmail" name="businessEmail" type="email" required
                                   class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="newPassword" class="block text-sm font-medium text-gray-700 mb-1">Create
                                Password
                                *</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-lock text-gray-400"></i>
                                </div>
                                <input id="newPassword" name="newPassword" type="Password" required
                                       class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                            </div>
                            <p class="mt-1 text-xs text-gray-500">Minimum 8 characters</p>
                        </div>

                        <div>
                            <label for="confirm-password" class="block text-sm font-medium text-gray-700 mb-1">Confirm
                                Password *</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-lock text-gray-400"></i>
                                </div>
                                <input id="confirm-password" name="confirm-password" type="password" required
                                       class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                            </div>
                        </div>
                    </div>

                    <div>
                        <label for="fleetSize" class="block text-sm font-medium text-gray-700 mb-1">Approximate Fleet
                            Size</label>
                        <select id="fleetSize" name="fleetSize"
                                class="input-focus px-4 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                            <option value="">Select fleet size</option>
                            <option value="1-5">1-5 vehicles</option>
                            <option value="6-10">6-10 vehicles</option>
                            <option value="11-20">11-20 vehicles</option>
                            <option value="21-50">21-50 vehicles</option>
                            <option value="50+">50+ vehicles</option>
                        </select>
                    </div>

                    <div>
                        <label for="operatingAreas" class="block text-sm font-medium text-gray-700 mb-1">Primary
                            Operating
                            Areas</label>
                        <textarea id="operatingAreas" name="operatingAreas" rows="3"
                                  class="input-focus block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border"></textarea>
                        <p class="mt-1 text-xs text-gray-500">List cities or regions where you operate</p>
                    </div>

                    <div class="flex items-start">
                        <div class="flex items-center h-5">
                            <input id="terms" name="terms" type="checkbox"
                                   class="focus:ring-yellow-500 h-4 w-4 text-yellow-600 border-gray-300 rounded"
                                   required>
                        </div>
                        <div class="ml-3 text-sm">
                            <label for="terms" class="font-medium text-gray-700">I agree to the <a href="#"
                                                                                                   class="text-yellow-600 hover:text-yellow-500">Terms
                                of Service</a> and <a href="#" class="text-yellow-600 hover:text-yellow-500">Privacy
                                Policy</a></label>
                        </div>
                    </div>

                    <div>
                        <button type="submit"
                                class="btn-primary w-full flex justify-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500">
                            Apply to Become a Partner
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>

<!-- Benefits Section -->
<section class="py-16 bg-gray-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12">
            <h2 class="text-2xl font-bold text-gray-900 mb-4">Benefits of Becoming a Partner</h2>
            <p class="text-gray-600 max-w-3xl mx-auto">Why transportation businesses choose to partner with us</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                <div class="w-12 h-12 rounded-full bg-yellow-100 flex items-center justify-center mb-4">
                    <i class="fas fa-chart-line text-yellow-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Increased Revenue</h3>
                <p class="text-gray-600">Access thousands of potential customers and fill empty seats in your
                    vehicles.</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                <div class="w-12 h-12 rounded-full bg-blue-100 flex items-center justify-center mb-4">
                    <i class="fas fa-cogs text-blue-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Powerful Tools</h3>
                <p class="text-gray-600">Manage your fleet, routes, and bookings with our easy-to-use dashboard.</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                <div class="w-12 h-12 rounded-full bg-green-100 flex items-center justify-center mb-4">
                    <i class="fas fa-shield-alt text-green-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Reliable Payments</h3>
                <p class="text-gray-600">Get paid on time with our secure payment system and transparent reporting.</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-white border-t border-gray-200 py-8">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="md:flex md:items-center md:justify-between">
            <div class="flex justify-center md:order-2 space-x-6">
                <a href="#" class="text-gray-400 hover:text-gray-500">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#" class="text-gray-400 hover:text-gray-500">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#" class="text-gray-400 hover:text-gray-500">
                    <i class="fab fa-linkedin-in"></i>
                </a>
            </div>
            <div class="mt-8 md:mt-0 md:order-1">
                <p class="text-center text-sm text-gray-500">
                    &copy; 2023 Shuttle Partners. All rights reserved.
                </p>
            </div>
        </div>
    </div>
</footer>

<script>
    const current_action = "<%= request.getParameter("action") != null ? request.getParameter("action") : "" %>";

    const loginTab = document.getElementById('login-tab');
    const registerTab = document.getElementById('register-tab');
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');

    // Function to activate login tab
    function activateLoginTab() {
        loginTab.classList.add('tab-active');
        loginTab.classList.remove('text-gray-500');
        registerTab.classList.remove('tab-active');
        registerTab.classList.add('text-gray-500');
        loginForm.classList.remove('hidden');
        registerForm.classList.add('hidden');

        setTimeout(() => {
            loginForm.classList.add('opacity-100');
            loginForm.classList.remove('opacity-0');
            registerForm.classList.add('opacity-0');
            registerForm.classList.remove('opacity-100');
        }, 10);
    }

    // Function to activate register tab
    function activateRegisterTab() {
        registerTab.classList.add('tab-active');
        registerTab.classList.remove('text-gray-500');
        loginTab.classList.remove('tab-active');
        loginTab.classList.add('text-gray-500');
        registerForm.classList.remove('hidden');
        loginForm.classList.add('hidden');
        setTimeout(() => {
            registerForm.classList.add('opacity-100');
            registerForm.classList.remove('opacity-0');
            loginForm.classList.add('opacity-0');
            loginForm.classList.remove('opacity-100');
        }, 10);
    }

    // On initial page load: check action param
    window.addEventListener('DOMContentLoaded', () => {
        if (current_action === 'sign-up') {
            activateRegisterTab();
        } else {
            activateLoginTab();
        }
    });

    // Add click listeners
    loginTab.addEventListener('click', activateLoginTab);
    registerTab.addEventListener('click', activateRegisterTab);
</script>

</body>
</html>