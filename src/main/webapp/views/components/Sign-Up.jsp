<%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 4/5/2025
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="bg-white p-6 rounded-xl shadow-sm  w-full md:w-2/3 space-y-6">
    <!-- Tabs -->
    <div class="flex border-b mb-4">
        <button id="signInTab"
                class="flex-1 py-2 text-center text-gray-600 font-medium border-b-2 border-transparent hover:text-indigo-500 transition"
                onclick="showForm('signin')">
            Sign In
        </button>
        <button id="signUpTab"
                class="flex-1 py-2 text-center text-gray-600 font-medium border-b-2 border-transparent hover:text-indigo-500 transition"
                onclick="showForm('signup')">
            Sign Up
        </button>
    </div>

    <!-- Forms -->
    <div class="relative overflow-hidden min-h-[300px] transition-all">

        <div id="signinForm"
             class="form-content flex justify-center items-center transition-opacity duration-500 ease-in-out opacity-100">
            <form
                    action="/sign-in"
                    method="post"
                    class=" w-[80%] max-w-[400px] flex flex-col gap-6 justify-center items-center"
            >
                <h1 style="font-family:  'Outfit', 'sans-serif'" class=" font-bold  capitalize text-4xl mb-7 mt-7    ">
                    Welcome Back
                </h1>


                <div class="relative w-[100%] mb-4 ">
                    <input
                            class="w-full border border-gray-300 rounded-md py-4 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"

                    <%--                class="w-[100%] outline-none focus:border-2 rounded-md p-4 bg-white pl-5 border border-[#f3e322] focus:bg-transparent placeholder:text-black "--%>
                            type="email"
                            id="email"
                            placeholder="your email"
                            name="email"
                    />
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor"
                         class="size-6 w-6 h-6 left-auto right-12  cursor-pointer   absolute right-4 top-1/2 -translate-y-1/2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M16.5 12a4.5 4.5 0 1 1-9 0 4.5 4.5 0 0 1 9 0Zm0 0c0 1.657 1.007 3 2.25 3S21 13.657 21 12a9 9 0 1 0-2.636 6.364M16.5 12V8.25"/>
                    </svg>
                </div>
                <div class="relative w-[100%] mb-4 ">
                    <input
                            class="w-full border border-gray-300 rounded-md py-4 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                            type="password"
                            id="password"
                            placeholder="your password"
                            name="password"
                    />
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor"
                         class="size-6 w-6 h-6 left-auto right-12  cursor-pointer   absolute right-4 top-1/2 -translate-y-1/2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M15.75 5.25a3 3 0 0 1 3 3m3 0a6 6 0 0 1-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1 1 21.75 8.25Z"/>
                    </svg>
                </div>

                <button type="submit"
                        class=" cursor-pointer whitespace-nowrap bg-black text-white rounded-lg py-3 px-6 text-xl capitalize hover:bg-opacity-80 w-fit flex ">
                    Login
                </button>

                <div
                        class="relative w-full flex items-center my-5  uppercase text-black gap-2 font-bold ">
                    <hr class=" w-1/2 text-gray-900"/>
                    <p class="text-gray-500">or</p>
                    <hr class="w-1/2 text-gray-900"/>
                </div>

                <button class="cursor-pointer flex items-center justify-center gap-4 w-[90%] center whitespace-nowrap bg-black text-white rounded-lg py-3 px-6 text-xl capitalize hover:bg-opacity-80">
                    <img src="https://th.bing.com/th/id/OIP.AUmnbiLoI6qsNjlDmrJ3CwHaH5?w=860&h=918&rs=1&pid=ImgDetMain"
                         class="w-5 rounded-full " alt=""/>
                    Continue with Google
                </button>

                <p class="mt-6 text-dark-grey text-xl text-center">
                    Don't have a account ?
                    <span class=" underline cursor-pointer text-black">
                <a href="signup.jsp">Sign Up</a>
              </span>
                </p>
            </form>
        </div>

        <div id="signupForm"
             class="form-content flex justify-center items-center hidden transition-opacity duration-500 ease-in-out opacity-0">
            <form
                    class=" w-[80%] max-w-[400px] flex flex-col gap-6 justify-center items-center"
            >
                <h1 style="font-family:  'Outfit', 'sans-serif'"
                    class=" font-bold  font-gelasio capitalize text-4xl mb-14   ">
                    Join Us Today
                </h1>
                <div class="relative w-[100%] mb-4 ">
                    <input
                            class="w-full border border-gray-300 rounded-md py-4 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                            type="text"
                            id="name"
                            placeholder="your name"
                            name="name"
                    />
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor"
                         class="size-6 w-6 h-6 left-auto right-12  cursor-pointer   absolute right-4 top-1/2 -translate-y-1/2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
                    </svg>

                </div>

                <div class="relative w-[100%] mb-4 ">
                    <input
                            class="w-full border border-gray-300 rounded-md py-4 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                            type="email"
                            id="email"
                            placeholder="your email"
                            name="email"
                    />
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor"
                         class="size-6 w-6 h-6 left-auto right-12  cursor-pointer   absolute right-4 top-1/2 -translate-y-1/2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M16.5 12a4.5 4.5 0 1 1-9 0 4.5 4.5 0 0 1 9 0Zm0 0c0 1.657 1.007 3 2.25 3S21 13.657 21 12a9 9 0 1 0-2.636 6.364M16.5 12V8.25"/>
                    </svg>
                </div>
                <div class="relative w-[100%] mb-4 ">
                    <input
                            class="w-full border border-gray-300 rounded-md py-4 px-3 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500"
                            type="password"
                            id="password"
                            placeholder="your password"
                            name="password"
                    />
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor"
                         class="size-6 w-6 h-6 left-auto right-12  cursor-pointer   absolute right-4 top-1/2 -translate-y-1/2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M15.75 5.25a3 3 0 0 1 3 3m3 0a6 6 0 0 1-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1 1 21.75 8.25Z"/>
                    </svg>
                </div>

                <button onClick={HandeleSubmit}
                        class="cursor-pointer whitespace-nowrap bg-black text-white rounded-lg py-3 px-6 text-xl capitalize hover:bg-opacity-80 w-fit flex ">
                    Sign Up
                </button>

                <div class="relative w-full flex items-center my-5  uppercase text-black gap-2 font-bold ">
                    <hr class=" w-1/2 bg-black"/>
                    <p class="text-gray-500">or</p>
                    <hr class=" w-1/2 bg-black"/>
                </div>

                <button class="cursor-pointer flex items-center justify-center gap-4 w-[90%] center whitespace-nowrap bg-black text-white rounded-lg py-3 px-6 text-xl capitalize hover:bg-opacity-80">
                    <img src="https://th.bing.com/th/id/OIP.AUmnbiLoI6qsNjlDmrJ3CwHaH5?w=860&h=918&rs=1&pid=ImgDetMain"
                         class="w-5 rounded-full " alt=""/>
                    Continue with Google
                </button>

                <p class="mt-6 text-dark-grey text-xl text-center">
                    Already a member ?
                    <span class=" underline cursor-pointer text-black">
                <a href="login.jsp">Sign In</a>
              </span>
                </p>

            </form>
        </div>
    </div>

</div>

<!-- JS for tab switching -->
<script>
    const signInTab = document.getElementById('signInTab');
    const signUpTab = document.getElementById('signUpTab');
    const signinForm = document.getElementById('signinForm');
    const signupForm = document.getElementById('signupForm');

    function showForm(type) {
        if (type === 'signin') {
            signInTab.classList.add('border-yellow-400', 'text-yellow-500');
            signUpTab.classList.remove('border-yellow-400', 'text-yellow-500');

            signinForm.classList.remove('hidden');
            signupForm.classList.add('hidden');

            setTimeout(() => {
                signinForm.classList.add('opacity-100');
                signinForm.classList.remove('opacity-0');
                signupForm.classList.add('opacity-0');
                signupForm.classList.remove('opacity-100');
            }, 10);

        } else {
            signUpTab.classList.add('border-yellow-400', 'text-yellow-500');
            signInTab.classList.remove('border-yellow-400', 'text-yellow-500');

            signupForm.classList.remove('hidden');
            signinForm.classList.add('hidden');

            setTimeout(() => {
                signupForm.classList.add('opacity-100');
                signupForm.classList.remove('opacity-0');
                signinForm.classList.add('opacity-0');
                signinForm.classList.remove('opacity-100');
            }, 10);
        }
    }


    // Default tab
    showForm('signin');
</script>


