<%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 4/8/2025
  Time: 12:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shuttle - Smart Commute Solutions</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/style/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Outfit:wght@100..900&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            scroll-behavior: smooth;
        }

        h1, h2, h3 {
            font-family: 'Outfit', sans-serif;

        }

        .hero-gradient {
            background: linear-gradient(135deg, #fef08a 0%, #ffffff 50%, #e2e8f0 100%);
        }

        .card-hover {
            transition: all 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 18px;
            margin-bottom: 1.5rem;
        }

        .swiper-slide {
            transition: all 0.3s ease;
        }

        .swiper-slide:hover {
            transform: scale(1.03);
        }

        .testimonial-card {
            background: linear-gradient(145deg, #ffffff 0%, #f8fafc 100%);
            border-radius: 16px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }

        .btn-primary {
            background: linear-gradient(135deg, #facc15 0%, #eab308 100%);
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(250, 204, 21, 0.3);
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

</head>
<body>
<!-- Navigation -->
<div class=" backdrop-blur-md fixed w-full z-50 border-b  border-gray-100">
    <jsp:include page="components/NavBar.jsp"/>
</div>

<!-- Hero Section -->
<section class="hero-gradient pt-24 pb-16 md:pt-60 md:pb-34 " id="home">
    <div class="max-w-7xl mx-auto px-6 sm:px-8 lg:px-10">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
            <div class="order-2 md:order-1">
                <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold leading-tight mb-4 text-gray-800">
                    Smarter <span class="text-yellow-500">Commute</span>,<br>Simpler Life
                </h1>
                <p class="text-lg text-gray-600 mb-8 max-w-lg">
                    Whether you're a student rushing to class or an employee heading to work, find the perfect shuttle
                    service tailored to your schedule. For organizations, manage your fleet with ease.
                </p>
                <div class="flex flex-col sm:flex-row gap-4">
                    <a href="/find-navettes"
                       class="btn-primary px-8 py-3 rounded-full font-semibold shadow text-center">
                        <i class="fas fa-search mr-2"></i> Find a Shuttle
                    </a>
                    <a href="./business-account-login.jsp"
                       class="border-2 border-yellow-400 text-yellow-500 hover:bg-yellow-50 transition px-8 py-3 rounded-full font-semibold text-center">
                        <i class="fas fa-plus mr-2"></i> Create a Shuttle
                    </a>
                </div>
                <div class="mt-8 flex items-center">
                    <div class="flex -space-x-2">
                        <img class="inline-block h-10 w-10 rounded-full ring-2 ring-white"
                             src="https://randomuser.me/api/portraits/women/12.jpg" alt="User">
                        <img class="inline-block h-10 w-10 rounded-full ring-2 ring-white"
                             src="https://randomuser.me/api/portraits/men/32.jpg" alt="User">
                        <img class="inline-block h-10 w-10 rounded-full ring-2 ring-white"
                             src="https://randomuser.me/api/portraits/women/44.jpg" alt="User">
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-600">Trusted by <span class="font-bold text-yellow-500">5,000+</span>
                            daily commuters</p>
                    </div>
                </div>
            </div>
            <div class="order-1 md:order-2 relative">
                <img src="https://img.freepik.com/free-vector/city-driver-concept-illustration_114360-18159.jpg"
                     alt="Shuttle illustration" class="w-full rounded-2xl shadow-xl">
                <div class="absolute -bottom-6 -left-6 bg-white p-4 rounded-xl shadow-lg hidden md:block">
                    <div class="flex items-center">
                        <div class="bg-yellow-100 p-3 rounded-lg mr-3">
                            <i class="fas fa-clock text-yellow-500 text-xl"></i>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500">Average time saved</p>
                            <p class="font-bold text-gray-800">45 minutes/day</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-16 bg-gray-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-900 mb-2">Popular Commuter Routes</h2>
            <p class="text-lg text-gray-600">Frequent shuttle services for students and professionals</p>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <!-- Route 1 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden border-t-4 border-yellow-400 transition-transform hover:scale-105">
                <div class="p-6 text-center">
                    <div class="mx-auto w-12 h-12 rounded-full bg-yellow-100 flex items-center justify-center mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-yellow-500" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M12 14l9-5-9-5-9 5 9 5z"/>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z"/>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222"/>
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold text-gray-900 mb-2">
                        <span>University Uit</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-2 inline text-gray-400" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                        </svg>
                        <span>Meknes</span>
                    </h3>
                    <p class="text-sm text-gray-500 mb-4">Multiple daily departures</p>
                    <a href="/find-navettes"
                       class="inline-block px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">
                        View Schedule
                    </a>
                </div>
            </div>

            <!-- Route 2 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden border-t-4 border-blue-400 transition-transform hover:scale-105">
                <div class="p-6 text-center">
                    <div class="mx-auto w-12 h-12 rounded-full bg-blue-100 flex items-center justify-center mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-blue-500" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold text-gray-900 mb-2">
                        <span>Temara</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-2 inline text-gray-400" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                        </svg>
                        <span>Rabat</span>
                    </h3>
                    <p class="text-sm text-gray-500 mb-4">Express routes available</p>
                    <a href="/find-navettes"
                       class="inline-block px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">
                        View Schedule
                    </a>
                </div>
            </div>

            <!-- Route 3 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden border-t-4 border-green-400 transition-transform hover:scale-105">
                <div class="p-6 text-center">
                    <div class="mx-auto w-12 h-12 rounded-full bg-green-100 flex items-center justify-center mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-500" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold text-gray-900 mb-2">
                        <span>Casa</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-2 inline text-gray-400" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                        </svg>
                        <span>Mohemmadia</span>
                    </h3>
                    <p class="text-sm text-gray-500 mb-4">Weekday service only</p>
                    <a href="/find-navettes"
                       class="inline-block px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">
                        View Schedule
                    </a>
                </div>
            </div>

            <!-- Route 4 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden border-t-4 border-purple-400 transition-transform hover:scale-105">
                <div class="p-6 text-center">
                    <div class="mx-auto w-12 h-12 rounded-full bg-purple-100 flex items-center justify-center mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-purple-500" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold text-gray-900 mb-2">
                        <span>Fes</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-2 inline text-gray-400" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                        </svg>
                        <span>Meknes</span>
                    </h3>
                    <p class="text-sm text-gray-500 mb-4">Peak hours service</p>
                    <a href="/find-navettes"
                       class="inline-block px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">
                        View Schedule
                    </a>
                </div>
            </div>
        </div>
        <div class="text-center mt-10">
            <a href="/find-navettes" class="inline-flex items-center text-yellow-500 font-medium hover:underline">
                View all destinations <i class="fas fa-arrow-right ml-2"></i>
            </a>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section class="py-12 bg-white">
    <div class="max-w-7xl mx-auto px-6 sm:px-8 lg:px-10">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
            <div class="p-6 rounded-xl bg-gray-50">
                <p class="text-3xl font-bold text-yellow-500">250+</p>
                <p class="text-gray-600">Active Shuttles</p>
            </div>
            <div class="p-6 rounded-xl bg-gray-50">
                <p class="text-3xl font-bold text-yellow-500">15K+</p>
                <p class="text-gray-600">Daily Commuters</p>
            </div>
            <div class="p-6 rounded-xl bg-gray-50">
                <p class="text-3xl font-bold text-yellow-500">98%</p>
                <p class="text-gray-600">On-time Rate</p>
            </div>
            <div class="p-6 rounded-xl bg-gray-50">
                <p class="text-3xl font-bold text-yellow-500">50+</p>
                <p class="text-gray-600">Cities Covered</p>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-16 bg-white" id="features">
    <div class="max-w-7xl mx-auto px-6 sm:px-8 lg:px-10">
        <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-3">Why Choose Shuttle?</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">Experience the future of daily commuting with our innovative
                features</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Feature 1 -->
            <div class="bg-gray-50 p-8 rounded-xl card-hover">
                <div class="feature-icon bg-yellow-100 text-yellow-500">
                    <i class="fas fa-route text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Smart Route Matching</h3>
                <p class="text-gray-600">Our algorithm finds the most efficient routes based on real-time traffic and
                    passenger locations.</p>
            </div>

            <!-- Feature 2 -->
            <div class="bg-gray-50 p-8 rounded-xl card-hover">
                <div class="feature-icon bg-blue-100 text-blue-500">
                    <i class="fas fa-bell text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Real-time Alerts</h3>
                <p class="text-gray-600">Get instant notifications about delays, schedule changes, or special
                    announcements.</p>
            </div>

            <!-- Feature 3 -->
            <div class="bg-gray-50 p-8 rounded-xl card-hover">
                <div class="feature-icon bg-green-100 text-green-500">
                    <i class="fas fa-shield-alt text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Safety First</h3>
                <p class="text-gray-600">All drivers are verified and vehicles undergo regular safety inspections.</p>
            </div>

            <!-- Feature 4 -->
            <div class="bg-gray-50 p-8 rounded-xl card-hover">
                <div class="feature-icon bg-purple-100 text-purple-500">
                    <i class="fas fa-calendar-alt text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Flexible Scheduling</h3>
                <p class="text-gray-600">Choose from multiple time slots that fit your daily routine perfectly.</p>
            </div>

            <!-- Feature 5 -->
            <div class="bg-gray-50 p-8 rounded-xl card-hover">
                <div class="feature-icon bg-red-100 text-red-500">
                    <i class="fas fa-wifi text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Onboard Amenities</h3>
                <p class="text-gray-600">Many shuttles offer WiFi, charging ports, and comfortable seating.</p>
            </div>

            <!-- Feature 6 -->
            <div class="bg-gray-50 p-8 rounded-xl card-hover">
                <div class="feature-icon bg-indigo-100 text-indigo-500">
                    <i class="fas fa-chart-line text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Usage Analytics</h3>
                <p class="text-gray-600">For enterprises, track ridership patterns and optimize your fleet.</p>
            </div>
        </div>
    </div>
</section>

<!-- How It Works Section -->
<section class="py-16 bg-gray-50">
    <div class="max-w-7xl mx-auto px-6 sm:px-8 lg:px-10">
        <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-3">How It Works</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">Get started with Shuttle in just a few simple steps</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Step 1 -->
            <div class="text-center">
                <div class="bg-white w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6 shadow-md border-2 border-yellow-400">
                    <span class="text-2xl font-bold text-yellow-500">1</span>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Find Your Route</h3>
                <p class="text-gray-600">Enter your starting point and destination to see available shuttle options.</p>
            </div>

            <!-- Step 2 -->
            <div class="text-center">
                <div class="bg-white w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6 shadow-md border-2 border-yellow-400">
                    <span class="text-2xl font-bold text-yellow-500">2</span>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Book Your Seat</h3>
                <p class="text-gray-600">Select your preferred time slot and confirm your booking with secure
                    payment.</p>
            </div>

            <!-- Step 3 -->
            <div class="text-center">
                <div class="bg-white w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6 shadow-md border-2 border-yellow-400">
                    <span class="text-2xl font-bold text-yellow-500">3</span>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Ride & Relax</h3>
                <p class="text-gray-600">Arrive at your pickup point and enjoy a comfortable ride to your
                    destination.</p>
            </div>
        </div>

        <%--        <div class="mt-12 bg-white rounded-xl shadow-md overflow-hidden">--%>
        <%--            <div class="grid grid-cols-1 md:grid-cols-2">--%>
        <%--                <div class="p-8 md:p-12">--%>
        <%--                    <h3 class="text-2xl font-bold text-gray-800 mb-4">Download Our App</h3>--%>
        <%--                    <p class="text-gray-600 mb-6">Get the full Shuttle experience with our mobile app. Book rides, get--%>
        <%--                        real-time updates, and manage your subscriptions on the go.</p>--%>
        <%--                    <div class="flex flex-col sm:flex-row gap-4">--%>
        <%--                        <a href="#"--%>
        <%--                           class="bg-gray-800 hover:bg-gray-900 text-white px-6 py-3 rounded-lg flex items-center justify-center">--%>
        <%--                            <i class="fab fa-apple text-2xl mr-2"></i>--%>
        <%--                            <div>--%>
        <%--                                <p class="text-xs">Download on the</p>--%>
        <%--                                <p class="font-medium">App Store</p>--%>
        <%--                            </div>--%>
        <%--                        </a>--%>
        <%--                        <a href="#"--%>
        <%--                           class="bg-gray-800 hover:bg-gray-900 text-white px-6 py-3 rounded-lg flex items-center justify-center">--%>
        <%--                            <i class="fab fa-google-play text-2xl mr-2"></i>--%>
        <%--                            <div>--%>
        <%--                                <p class="text-xs">Get it on</p>--%>
        <%--                                <p class="font-medium">Google Play</p>--%>
        <%--                            </div>--%>
        <%--                        </a>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--                <div class="hidden md:block bg-gray-100 flex items-center justify-center p-8">--%>
        <%--                    <img src="https://cdn.dribbble.com/users/1787323/screenshots/11310802/media/7c0d1a1f5e7b1bd6c2c5d4e8e4e4e4e4.png"--%>
        <%--                         alt="Mobile App" class="h-64 object-contain">--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>
</section>


<!-- CTA Section -->
<section class="py-16 bg-yellow-500" id="subscribe">
    <div class="max-w-4xl mx-auto px-6 sm:px-8 lg:px-10 text-center">
        <h2 class="text-3xl md:text-4xl font-bold text-white mb-6">Ready to Transform Your Commute?</h2>
        <p class="text-white/90 mb-8 text-lg max-w-2xl mx-auto">Join thousands of happy commuters who save time and
            money every day with Shuttle.</p>

        <div class="bg-white rounded-lg shadow-xl p-1 max-w-md mx-auto">
            <div class="flex flex-col sm:flex-row">
                <input type="email" placeholder="Enter your email"
                       class="flex-grow px-4 py-3 border-0 focus:ring-2 focus:ring-yellow-400 rounded-lg">
                <button class="btn-primary px-6 py-3 rounded-lg font-semibold whitespace-nowrap">
                    Get Started
                </button>
            </div>
        </div>

        <p class="text-white/80 text-sm mt-4">By signing up, you agree to our Terms of Service and Privacy Policy.</p>
    </div>
</section>

<!-- Dual Path Section -->
<section class="py-16 bg-gray-50" id="organize">
    <div class="max-w-7xl mx-auto px-6 sm:px-8 lg:px-10">
        <div class="text-center mb-12">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-3">Shuttle For Everyone</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">Whether you're a daily commuter or managing transportation for an
                organization</p>
        </div>

        <div class="grid md:grid-cols-2 gap-8">
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-8">
                    <div class="bg-yellow-100 w-16 h-16 rounded-lg flex items-center justify-center mb-6">
                        <i class="fas fa-user text-yellow-500 text-2xl"></i>
                    </div>
                    <h3 class="text-2xl font-semibold text-gray-800 mb-3">For Commuters</h3>
                    <p class="text-gray-600 mb-6">Find and book shuttle services that match your daily route. Save time,
                        reduce stress, and enjoy a comfortable ride.</p>
                    <ul class="space-y-3 mb-8">
                        <li class="flex items-center">
                            <i class="fas fa-check-circle text-yellow-500 mr-2"></i>
                            <span class="text-gray-700">Real-time tracking</span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-check-circle text-yellow-500 mr-2"></i>
                            <span class="text-gray-700">Flexible payment options</span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-check-circle text-yellow-500 mr-2"></i>
                            <span class="text-gray-700">Subscription plans</span>
                        </li>
                    </ul>
                    <a href="/subscribe" class="btn-primary px-6 py-3 rounded-lg font-semibold inline-block">
                        Find Your Shuttle
                    </a>
                </div>
            </div>

            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-8">
                    <div class="bg-blue-100 w-16 h-16 rounded-lg flex items-center justify-center mb-6">
                        <i class="fas fa-building text-blue-500 text-2xl"></i>
                    </div>
                    <h3 class="text-2xl font-semibold text-gray-800 mb-3">For Enterprises</h3>
                    <p class="text-gray-600 mb-6">Easily manage your company's transportation needs. Optimize routes,
                        track usage, and reduce costs.</p>
                    <ul class="space-y-3 mb-8">
                        <li class="flex items-center">
                            <i class="fas fa-check-circle text-blue-500 mr-2"></i>
                            <span class="text-gray-700">Fleet management</span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-check-circle text-blue-500 mr-2"></i>
                            <span class="text-gray-700">Employee shuttle programs</span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-check-circle text-blue-500 mr-2"></i>
                            <span class="text-gray-700">Advanced analytics</span>
                        </li>
                    </ul>
                    <a href="/enterprise/register"
                       class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-3 rounded-lg font-semibold inline-block">
                        Create Your Shuttle Service
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- FAQ Section -->
<section class="py-16 bg-white">
    <div class="max-w-4xl mx-auto px-6 sm:px-8 lg:px-10">
        <div class="text-center mb-12">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-3">Frequently Asked Questions</h2>
            <p class="text-gray-500">Find answers to common questions about Shuttle</p>
        </div>

        <div class="space-y-4">
            <!-- FAQ Item 1 -->
            <div class="border border-gray-200 rounded-lg overflow-hidden">
                <button class="w-full flex justify-between items-center p-4 text-left hover:bg-gray-50 focus:outline-none">
                    <span class="font-medium text-gray-800">How do I book a shuttle?</span>
                    <i class="fas fa-chevron-down text-yellow-500 transition-transform"></i>
                </button>
                <div class="p-4 pt-0 text-gray-600 hidden">
                    <p>Booking a shuttle is simple! Just enter your pickup and drop-off locations in our app or website,
                        select your preferred time slot, and confirm your booking. You'll receive all the details
                        including pickup point and shuttle number.</p>
                </div>
            </div>

            <!-- FAQ Item 2 -->
            <div class="border border-gray-200 rounded-lg overflow-hidden">
                <button class="w-full flex justify-between items-center p-4 text-left hover:bg-gray-50 focus:outline-none">
                    <span class="font-medium text-gray-800">What payment methods do you accept?</span>
                    <i class="fas fa-chevron-down text-yellow-500 transition-transform"></i>
                </button>
                <div class="p-4 pt-0 text-gray-600 hidden">
                    <p>We accept all major credit/debit cards, mobile payment options, and cash payments to the driver
                        for some routes. You can also purchase subscription packages for regular commutes.</p>
                </div>
            </div>

            <!-- FAQ Item 3 -->
            <div class="border border-gray-200 rounded-lg overflow-hidden">
                <button class="w-full flex justify-between items-center p-4 text-left hover:bg-gray-50 focus:outline-none">
                    <span class="font-medium text-gray-800">Can I cancel or change my booking?</span>
                    <i class="fas fa-chevron-down text-yellow-500 transition-transform"></i>
                </button>
                <div class="p-4 pt-0 text-gray-600 hidden">
                    <p>Yes, you can cancel or modify your booking up to 2 hours before the scheduled pickup time through
                        the app or website. Cancellation fees may apply depending on the timing.</p>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>


