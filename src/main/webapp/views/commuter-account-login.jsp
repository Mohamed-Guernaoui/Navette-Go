<%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 4/8/2025
  Time: 11:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String toastMessage = (String) request.getAttribute("toastMessage");
    String toastType = (String) request.getAttribute("toastType");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shuttle - User Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8fafc;
        }

        .user-gradient {
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
            /*transform: translateY(-2px);*/
            box-shadow: 0 10px 15px -3px rgba(250, 204, 21, 0.3);
        }

        .tab-active {
            border-bottom: 3px solid #facc15;
            color: #1e293b;
            font-weight: 600;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Parse URL parameters
            const urlParams = new URLSearchParams(window.location.search);
            const action = urlParams.get('action');
            const error = urlParams.get('error');
            if (action === 'sign-up' && error) {

                showSignUpError(error);
            }

            function showSignUpError(errorType) {
                const errorMessages = {
                    'email_exists': 'This email is already registered. Please use a different email or log in.',
                    'registration_failed': 'Registration failed. Please try again.',
                    'server_error': 'A server error occurred. Please try again later.',
                    'missing_fields': 'Please fill in all required fields.'
                };

                const message = errorMessages[errorType] || 'An error occurred during registration.';
                console.log(message)

                const errorDiv = document.createElement('div');
                errorDiv.className = 'auth-error';
                errorDiv.innerHTML = `
            <div class="error-content">
                <i class="error-icon">!</i>
                <span class="error-message">` + message + `</span>
            </div>
        `;

                const form = document.querySelector('form[id="signupform"]');
                if (form) {
                    form.insertBefore(errorDiv, form.firstChild);
                    console.log(form)
                }

                // Highlight problematic fields
                if (errorType === 'email_exists') {
                    const emailInput = document.querySelector('input[id="commuter-email"]');
                    console.log(emailInput)
                    if (emailInput) {
                        emailInput.classList.add('input-error');
                        emailInput.addEventListener('input', () => {
                            emailInput.classList.remove('input-error');
                        });
                    }
                }
            }

            function showAuthError() {
                // Create error message element
                const errorDiv = document.createElement('div');
                errorDiv.className = 'auth-error';
                errorDiv.innerHTML = `
            <div class="error-content">
                <i class="error-icon">!</i>
                <span class="error-message">Invalid email or password. Please try again.</span>
            </div>
        `;

                // Insert it near your login form
                const form = document.querySelector('form[id="signinform"]');

                if (form) {
                    form.insertBefore(errorDiv, form.firstChild);
                }

                // Optionally highlight the email/password fields
                const emailInput = document.querySelector('input[name="email"]');
                const passwordInput = document.querySelector('input[name="password"]');

                if (emailInput && passwordInput) {
                    emailInput.classList.add('input-error');
                    passwordInput.classList.add('input-error');

                    // Clear error on input
                    emailInput.addEventListener('input', () => {
                        emailInput.classList.remove('input-error');
                    });

                    passwordInput.addEventListener('input', () => {
                        passwordInput.classList.remove('input-error');
                    });
                }
            }

            // Check if there's an authentication error
            if (action === 'sign-in' && error === 'True') {
                showAuthError();
            }


        });

        // Add this CSS to your page
        const errorStyles = document.createElement('style');
        errorStyles.textContent = `
.auth-error {
    background-color: #ffeeee;
    border: 1px solid #ffcccc;
    border-radius: 4px;
    padding: 12px 15px;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    animation: fadeIn 0.3s ease-out;
}

.error-content {
    display: flex;
    align-items: center;
    width: 100%;
}

.error-icon {
    background-color: #ff4d4f;
    color: white;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 10px;
    font-weight: bold;
    font-size: 14px;
}

.error-message {
    color: #ff4d4f;
    font-size: 14px;
}

.input-error {
    border-color: #ff4d4f !important;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}
`;
        document.head.appendChild(errorStyles);
    </script>
</head>
<body>
<!-- Header -->
<header class="user-gradient py-4 border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-shuttle-van text-yellow-500 text-2xl mr-2"></i>
            <span class="text-xl font-bold text-gray-800">NavTo<span class="text-yellow-500">Go</span></span>
        </div>
        <nav class="hidden md:flex space-x-8">
            <a href="#" class="text-gray-700 hover:text-yellow-500">Find Shuttles</a>
            <a href="#" class="text-gray-700 hover:text-yellow-500">Pricing</a>
            <a href="#" class="text-gray-700 hover:text-yellow-500">How It Works</a>
        </nav>
        <a href="index.jsp" class="text-sm font-medium text-yellow-600 hover:text-yellow-700">
            <i class="fas fa-home mr-1"></i> Home
        </a>
    </div>
</header>

<!-- Main Content -->
<main class="min-h-screen py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-8">
            <h1 class="text-3xl font-bold text-gray-900 mb-2">Your Daily Commute Made Simple</h1>
            <p class="text-gray-600">Find and book shuttles in seconds</p>
        </div>

        <!-- Tab Navigation -->
        <div class="max-w-md mx-auto mb-8">
            <div class="flex border-b border-gray-200">
                <a href="/views/commuter-account-login.jsp?action=sign-in" id="login-tab"
                   class="flex-1 py-4 px-1 text-center font-medium text-sm tab-active">
                    <i class="fas fa-sign-in-alt mr-2"></i> Sign In
                </a>
                <a href="/views/commuter-account-login.jsp?action=sign-up" id="register-tab"
                   class="flex-1 py-4 px-1 text-center font-medium text-sm text-gray-500 hover:text-gray-700">
                    <i class="fas fa-user-plus mr-2"></i> Create Account
                </a>
            </div>
        </div>
        <div class="relative overflow-hidden min-h-[300px] transition-all">

            <!-- Login Form -->
            <div id="login-form"
                 class="max-w-lg mx-auto bg-white rounded-xl shadow-md overflow-hidden form-card p-8 hidden transition-opacity duration-500 ease-in-out opacity-0">

                <div class="text-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-800">Welcome Back</h2>
                    <p class="text-gray-600">Sign in to book your next ride</p>
                </div>

                <form id="signinform" class="space-y-6" method="post" action="/sign-in">
                    <div>
                        <label for="user-email" class="block text-sm font-medium text-gray-700 mb-1">Email
                            Address</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400"></i>
                            </div>
                            <input id="user-email" name="email" type="email" autocomplete="email" required
                                   class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                        </div>
                    </div>

                    <div>
                        <label for="user-password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400"></i>
                            </div>
                            <input id="user-password" name="password" type="password" autocomplete="current-password"
                                   required
                                   class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
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
                                class="btn-primary hover:opacity-80 w-full flex justify-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500">
                            Sign In
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
                            <i class="fab fa-apple text-gray-800 mr-2"></i> Apple
                        </a>
                    </div>
                </div>
            </div>

            <!-- Registration Form (Hidden by default) -->
            <div id="register-form"
                 class="max-w-2xl mx-auto bg-white rounded-xl shadow-md overflow-hidden form-card p-8 hidden transition-opacity duration-500 ease-in-out opacity-0">

                <div class="text-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-800">Create Your Account</h2>
                    <p class="text-gray-600">Join thousands of happy commuters</p>
                </div>

                <form id="signupform" class="space-y-6" action="/create-commuter-account" method="post">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="firstName" class="block text-sm font-medium text-gray-700 mb-1">First Name
                                *</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-user text-gray-400"></i>
                                </div>
                                <input id="firstName" name="firstName" type="text" required
                                       class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                            </div>
                        </div>

                        <div>
                            <label for="lastName" class="block text-sm font-medium text-gray-700 mb-1">Last Name
                                *</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-user text-gray-400"></i>
                                </div>
                                <input id="lastName" name="lastName" type="text" required
                                       class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                            </div>
                        </div>
                    </div>

                    <div>
                        <label for="commuter-email" class="block text-sm font-medium text-gray-700 mb-1">Email
                            Address
                            *</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400"></i>
                            </div>
                            <input id="commuter-email" name="email" type="email" required
                                   class="input-focus outline-none pl-10 block w-full rounded-md border-gray-300 shadow-sm  py-3 border">
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="user-password-register" class="block text-sm font-medium text-gray-700 mb-1">Create
                                Password *</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-lock text-gray-400"></i>
                                </div>
                                <input id="user-password-register" name="password" type="password" required
                                       class="input-focus outline-none pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
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
                        <label for="phoneNumber" class="block text-sm font-medium text-gray-700 mb-1">Phone
                            Number</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-phone text-gray-400"></i>
                            </div>
                            <input id="phoneNumber" name="phoneNumber" type="tel"
                                   class="input-focus pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                        </div>
                        <p class="mt-1 text-xs text-gray-500">For ride notifications</p>
                    </div>

                    <div>
                        <label for="prof" class="block text-sm font-medium text-gray-700 mb-1">I'm a</label>
                        <select id="prof" name="prof"
                                class="input-focus outline-none px-4 block w-full rounded-md border-gray-300 shadow-sm focus:ring-yellow-500 focus:border-yellow-500 py-3 border">
                            <option value="student">Student</option>
                            <option value="professional">Working Professional</option>
                            <option value="frequent-traveler">Frequent Traveler</option>
                            <option value="other">Other</option>
                        </select>
                    </div>

                    <div class="flex items-start">
                        <div class="flex items-center h-5">
                            <input id="user-terms" name="terms" type="checkbox"
                                   class="focus:ring-yellow-500 h-4 w-4 text-yellow-600 border-gray-300 rounded"
                                   required>
                        </div>
                        <div class="ml-3 text-sm">
                            <label for="user-terms" class="font-medium text-gray-700">I agree to the <a href="#"
                                                                                                        class="text-yellow-600 hover:text-yellow-500">Terms
                                of Service</a> and <a href="#" class="text-yellow-600 hover:text-yellow-500">Privacy
                                Policy</a></label>
                        </div>
                    </div>

                    <div>
                        <button type="submit"
                                class="btn-primary w-full flex justify-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500">
                            Create Account
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
            <h2 class="text-2xl font-bold text-gray-900 mb-4">Why Ride With Shuttle?</h2>
            <p class="text-gray-600 max-w-3xl mx-auto">Benefits for our valued riders</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                <div class="w-12 h-12 rounded-full bg-yellow-100 flex items-center justify-center mb-4">
                    <i class="fas fa-clock text-yellow-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Save Time</h3>
                <p class="text-gray-600">No more waiting - book shuttles that match your exact schedule.</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                <div class="w-12 h-12 rounded-full bg-blue-100 flex items-center justify-center mb-4">
                    <i class="fas fa-wallet text-blue-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Save Money</h3>
                <p class="text-gray-600">Affordable fares that beat driving or rideshares.</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                <div class="w-12 h-12 rounded-full bg-green-100 flex items-center justify-center mb-4">
                    <i class="fas fa-leaf text-green-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Eco-Friendly</h3>
                <p class="text-gray-600">Reduce your carbon footprint by sharing rides.</p>
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
                    <i class="fab fa-instagram"></i>
                </a>
            </div>
            <div class="mt-8 md:mt-0 md:order-1">
                <p class="text-center text-sm text-gray-500">
                    &copy; 2025 NavToGO. All rights reserved.
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
    // loginTab.addEventListener('click', activateLoginTab);
    // registerTab.addEventListener('click', activateRegisterTab);
</script>
<% if (toastMessage != null) { %>
<script>
    window.onload = function () {
        showToast("<%= toastMessage %>", "<%= toastType %>");
    };
</script>
<% } %>
<!-- Toast container -->
<div id="toast"
     class="fixed top-5 right-5 z-50 px-4 py-2 text-white rounded shadow hidden transition-opacity duration-300"></div>

<script>
    function showToast(message, type) {
        const toast = document.getElementById('toast');
        toast.className = 'fixed top-5 right-5 z-50 px-4 py-2 text-white rounded shadow transition-opacity duration-300';

        if (type === 'success') {
            toast.classList.add('bg-green-500');
        } else {
            toast.classList.add('bg-red-500');
        }

        toast.textContent = message;
        toast.style.opacity = '1';
        toast.style.display = 'block';

        setTimeout(() => {
            toast.style.opacity = '0';
            setTimeout(() => {
                toast.style.display = 'none';
            }, 300);
        }, 3000);
    }
</script>
</body>
</html>