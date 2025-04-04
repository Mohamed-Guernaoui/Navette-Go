<%@ page import="org.example.app.tonnavette.model.Navette" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trip Subscription Checkout</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
</head>
<body class="bg-gray-50 font-sans text-gray-800">
<div class="container mx-auto px-4 py-8 max-w-6xl">
    <h1 class="text-2xl font-semibold">Complete Your Trip Subscription</h1>

    <div class="flex flex-col md:flex-row gap-8">
        <!-- Payment section -->
        <div class="w-full md:w-2/3 space-y-6">

            <!-- Credit card form -->
            <form action="${pageContext.request.contextPath}/processSubscription" method="post" class="space-y-4">
                <!-- Hidden fields to pass trip data -->
                <%
                    Navette selectedNavette = (Navette) request.getAttribute("selectedNavette");
                %>
                <input type="hidden" name="tripId" value="<%= selectedNavette.getId() %>">
                <input type="hidden" name="tripPrice" value="<%= request.getParameter("tripPrice") %>">
                <input type="hidden" name="passengers" value="<%= request.getParameter("passengers") %>">

                <!-- User Information -->
                <div class="bg-white p-5 rounded-lg shadow-sm border border-gray-100 space-y-4">
                    <h2 class="font-medium text-lg">Personal Information</h2>

                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email address</label>
                        <input type="email" id="email" name="email"
                               class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                               required>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label for="firstName" class="block text-sm font-medium text-gray-700 mb-1">First
                                Name</label>
                            <input type="text" id="firstName" name="firstName"
                                   class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                                   required>
                        </div>
                        <div>
                            <label for="lastName" class="block text-sm font-medium text-gray-700 mb-1">Last Name</label>
                            <input type="text" id="lastName" name="lastName"
                                   class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                                   required>
                        </div>
                    </div>

                    <div>
                        <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                        <input type="tel" id="phone" name="phone"
                               class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                               required>
                    </div>

                    <div>
                        <label for="pickupPoint" class="block text-sm font-medium text-gray-700 mb-1">Pickup
                            Point</label>
                        <input type="text" id="pickupPoint" name="pickupPoint"
                               class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                               required>
                    </div>
                </div>

                <!-- Payment Information -->
                <div class="bg-white p-5 rounded-lg shadow-sm border border-gray-100 space-y-4">
                    <h2 class="font-medium text-lg">Payment Information</h2>

                    <div>
                        <label for="cardName" class="block text-sm font-medium text-gray-700 mb-1">Name on card</label>
                        <input type="text" id="cardName" name="cardName"
                               class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                               required>
                    </div>

                    <div>
                        <label for="cardNumber" class="block text-sm font-medium text-gray-700 mb-1">Card number</label>
                        <input type="text" id="cardNumber" name="cardNumber"
                               class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                               required>
                    </div>

                    <div class="flex gap-4">
                        <div class="w-1/2">
                            <label for="expiration" class="block text-sm font-medium text-gray-700 mb-1">Expiration date
                                (MM/YY)</label>
                            <input type="text" id="expiration" name="expiration"
                                   class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                                   required>
                        </div>
                        <div class="w-1/2">
                            <label for="cvc" class="block text-sm font-medium text-gray-700 mb-1">CVC</label>
                            <input type="text" id="cvc" name="cvc"
                                   class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                                   required>
                        </div>
                    </div>
                </div>

                <!-- Billing Address -->
                <div class="bg-white p-5 rounded-lg shadow-sm border border-gray-100 space-y-4">
                    <h2 class="font-medium text-lg">Billing Address</h2>

                    <div>
                        <label for="address" class="block text-sm font-medium text-gray-700 mb-1">Address</label>
                        <input type="text" id="address" name="address"
                               class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                               required>
                    </div>

                    <div class="flex gap-4">
                        <div class="w-1/3">
                            <label for="city" class="block text-sm font-medium text-gray-700 mb-1">City</label>
                            <input type="text" id="city" name="city"
                                   class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                                   required>
                        </div>
                        <div class="w-1/3">
                            <label for="state" class="block text-sm font-medium text-gray-700 mb-1">State /
                                Province</label>
                            <input type="text" id="state" name="state"
                                   class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                                   required>
                        </div>
                        <div class="w-1/3">
                            <label for="postal" class="block text-sm font-medium text-gray-700 mb-1">Postal code</label>
                            <input type="text" id="postal" name="postal"
                                   class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                                   required>
                        </div>
                    </div>
                </div>

                <button type="submit"
                        class="w-full bg-[#f3e322] text-gray-800 font-medium py-3 rounded-md hover:bg-[#e6d41f] transition-colors">
                    Complete Subscription
                </button>

                <div class="flex items-center justify-center text-gray-500 text-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" viewBox="0 0 20 20"
                         fill="currentColor">
                        <path fill-rule="evenodd"
                              d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 116 0z"
                              clip-rule="evenodd"/>
                    </svg>
                    Payment information secure and encrypted
                </div>
            </form>
            <div class="text-center">
                <p class="text-gray-500">or</p>
            </div>
            <button class="w-full bg-black text-white font-medium py-3 rounded-md flex items-center justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M17.05 20.28c-.98.95-2.05.88-3.08.44-1.07-.46-2.08-.48-3.24 0-1.44.62-2.2.44-3.06-.41C2.32 15.16 3.13 7.95 8.53 7.64c1.36.05 2.28.66 3.06.68 1.14-.1 2.24-.73 3.44-.62 1.48.12 2.56.63 3.25 1.57-2.8 1.77-2.35 5.5.05 6.78-.65 1.57-1.47 3.01-2.28 4.23zM12.76 7.42c-.15-2.12 1.76-4.04 4.11-4.42.4 2.31-1.77 4.19-4.11 4.42z"></path>
                </svg>
                Pay
            </button>

        </div>

        <!-- Order summary section -->
        <div class="w-full md:w-1/3">
            <div class="bg-white rounded-lg p-6 shadow-sm border border-gray-100 sticky top-4">
                <h2 class="font-medium text-lg mb-4">Trip Summary</h2>

                <!-- Trip Details -->
                <div class="mb-6">
                    <div class="w-full flex justify-center p-4 border-b border-gray-100">
                        <div class="flex items-center justify-center gap-5">
                            <div class="flex flex-col items-center justify-center">
                                <p style="font-family: 'Outfit', sans-serif;" class="font-normal text-[1rem]">Depart</p>
                                <h2 style="font-family: 'Outfit', sans-serif;"
                                    class="font-semibold text-[1.5rem]"><%= selectedNavette.getHeureDepart() %>
                                </h2>
                                <p style="font-family: 'Outfit', sans-serif;"
                                   class="font-normal text-[1rem]"><%= selectedNavette.getVilleDepart() %>
                                </p>
                            </div>
                            <div class="z-10 w-3 h-3 rounded-full bg-green-500 ring-4 ring-green-100 flex items-center justify-center">
                                <div class="w-1.5 h-1.5 rounded-full bg-white"></div>
                            </div>
                        </div>

                        <div class="relative flex justify-center items-center py-4">
                            <div class="relative mx-4">
                                <div class="h-0.5 w-20 bg-gray-200">
                                    <div class="h-full w-full bg-green-500"></div>
                                </div>
                            </div>
                        </div>

                        <div class="flex items-center justify-center gap-5">
                            <div class="z-10 w-3 h-3 rounded-full bg-red-500 ring-4 ring-red-100 flex items-center justify-center">
                                <div class="w-1.5 h-1.5 rounded-full bg-white"></div>
                            </div>
                            <div class="flex flex-col items-center justify-center">
                                <p style="font-family: 'Outfit', sans-serif;" class="font-normal text-[1rem]">Arrive</p>
                                <h2 style="font-family: 'Outfit', sans-serif;"
                                    class="font-semibold text-[1.5rem]"><%= selectedNavette.getHeureArrivee() %>
                                </h2>
                                <p style="font-family: 'Outfit', sans-serif;"
                                   class="font-normal text-[1rem]"><%= selectedNavette.getVilleArrivee() %>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Subscription Info -->
                <div class="space-y-3 mb-6">
                    <div class="flex justify-between">
                        <p class="text-gray-600">Trip ID</p>
                        <p class="font-medium">#NT-<%= selectedNavette.getId() %>
                        </p>
                    </div>
                    <div class="flex justify-between">
                        <p class="text-gray-600">Subscription Period</p>
                        <%--                        <p class="font-medium"><%= request.getParameter("subscriptionPeriod") %></p>--%>
                    </div>
                    <div class="flex justify-between">
                        <p class="text-gray-600">Passengers</p>
                        <%--                        <p class="font-medium"><%= request.getParameter("passengers") %></p>--%>
                    </div>
                </div>

                <!-- Discount code -->
                <div class="pt-4 border-t border-gray-100 mb-6">
                    <div class="flex gap-2">
                        <input type="text" placeholder="Discount code" name="discountCode"
                               class="flex-1 border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500">
                        <button id="applyDiscountBtn"
                                class="bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md hover:bg-gray-300 transition-colors">
                            Apply
                        </button>
                    </div>
                </div>

                <!-- Order summary -->
                <div class="pt-4 border-t border-gray-100 space-y-3">
                    <div class="flex justify-between">
                        <p class="text-gray-600">Trip price</p>
                        <%--                        <p>$<%= request.getParameter("tripPrice") %></p>--%>
                    </div>
                    <div class="flex justify-between">
                        <p class="text-gray-600">Passengers</p>
                        <%--                        <p><%= request.getParameter("passengers") %></p>--%>
                    </div>
                    <div id="discountRow" class="flex justify-between hidden">
                        <div class="flex gap-2 items-center">
                            <p class="text-gray-600">Discount</p>
                            <span id="discountCode" class="bg-gray-100 text-gray-600 text-xs px-2 py-1 rounded"></span>
                        </div>
                        <p id="discountAmount">-$0.00</p>
                    </div>
                    <div class="flex justify-between">
                        <p class="text-gray-600">Service fee</p>
                        <p>$4.99</p>
                    </div>
                </div>

                <!-- Total -->
                <div class="pt-4 border-t border-gray-100 mt-4">
                    <div class="flex justify-between">
                        <p class="font-semibold text-lg">Total</p>
                        <%--                        <p class="font-semibold text-lg" id="totalAmount">$<%= Double.parseDouble(request.getParameter("tripPrice")) * Integer.parseInt(request.getParameter("passengers")) + 4.99 %></p>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<script>--%>
<%--    // Handle discount code application--%>
<%--    document.getElementById('applyDiscountBtn').addEventListener('click', function() {--%>
<%--        const discountInput = document.querySelector('input[name="discountCode"]');--%>
<%--        const discountCode = discountInput.value.trim();--%>

<%--        if (discountCode) {--%>
<%--            // Show discount in summary--%>
<%--            document.getElementById('discountRow').classList.remove('hidden');--%>
<%--            document.getElementById('discountCode').textContent = discountCode.toUpperCase();--%>

<%--            // For demo - apply 10% discount--%>
<%--            const tripPrice = <%= Double.parseDouble(request.getParameter("tripPrice")) %>;--%>
<%--            const passengers = <%= Integer.parseInt(request.getParameter("passengers")) %>;--%>
<%--            const subtotal = tripPrice * passengers;--%>
<%--            const discount = subtotal * 0.1; // 10% discount--%>

<%--            document.getElementById('discountAmount').textContent = '-$' + discount.toFixed(2);--%>

<%--            // Update total--%>
<%--            const total = subtotal - discount + 4.99;--%>
<%--            document.getElementById('totalAmount').textContent = '$' + total.toFixed(2);--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>