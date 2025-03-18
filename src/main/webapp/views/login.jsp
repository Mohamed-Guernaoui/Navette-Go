<%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 3/5/2025
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

  <head>
    <title>Login</title>
  </head>
  <body class="bg-[#f5f4f2]">
  <nav class="relative flex flex-row justify-between items-center w-full p-7 ">
    <div class="flex flex-row gap-20">
      <div>
        <a href="../index.jsp">
          <h1 class="text-[30px] font-bold">NavetteToGo</h1>
        </a>
      </div>
    </div>
  </nav>

  <section class=" h-cover flex w-full items-center justify-center flex-col">

    <form
            action="/sign-in"
            method="post"
            class=" w-[80%] max-w-[400px] flex flex-col gap-6 justify-center items-center"
    >
      <h1 class=" font-bold font-gelasio capitalize text-4xl mb-14   ">
        Welcome Back
      </h1>


      <div class="relative w-[100%] mb-4 ">
        <input 
                class="w-[100%] outline-none focus:border-2 rounded-md p-4 bg-white pl-5 border border-[#f3e322] focus:bg-transparent placeholder:text-black "
                type="email"
        id="email"
        placeholder="your email"
        name="email"
        />
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 w-6 h-6 left-auto right-12  cursor-pointer   absolute right-4 top-1/2 -translate-y-1/2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 12a4.5 4.5 0 1 1-9 0 4.5 4.5 0 0 1 9 0Zm0 0c0 1.657 1.007 3 2.25 3S21 13.657 21 12a9 9 0 1 0-2.636 6.364M16.5 12V8.25" />
        </svg>
      </div>
      <div class="relative w-[100%] mb-4 ">
        <input
                class="w-[100%] outline-none focus:border-2 rounded-md p-4 bg-white pl-5 border border-[#f3e322] focus:bg-transparent placeholder:text-black "
                type="password"
                id="password"
                placeholder="your password"
                name="password"
        />
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 w-6 h-6 left-auto right-12  cursor-pointer   absolute right-4 top-1/2 -translate-y-1/2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25a3 3 0 0 1 3 3m3 0a6 6 0 0 1-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1 1 21.75 8.25Z" />
        </svg>
      </div>

      <button type="submit" class=" cursor-pointer whitespace-nowrap bg-black text-white rounded-lg py-3 px-6 text-xl capitalize hover:bg-opacity-80 w-fit flex ">
        Login
      </button>

      <div class="relative w-full flex items-center my-5 opacity-10 uppercase text-black gap-2 font-bold ">
        <hr class=" w-1/2 bg-black" />
        <p>or</p>
        <hr class=" w-1/2 bg-black" />
      </div>

      <button class="cursor-pointer flex items-center justify-center gap-4 w-[90%] center whitespace-nowrap bg-black text-white rounded-lg py-3 px-6 text-xl capitalize hover:bg-opacity-80">
        <img src="https://th.bing.com/th/id/OIP.AUmnbiLoI6qsNjlDmrJ3CwHaH5?w=860&h=918&rs=1&pid=ImgDetMain" class="w-5 rounded-full " alt="" />
        Continue with Google
      </button>

      <p class="mt-6 text-dark-grey text-xl text-center">
        Don't have a account ?
        <span class=" underline cursor-pointer text-black">
                <a href="signup.jsp">Sign Up</a>
              </span>
      </p>
    </form>
  </section>
  </body>
</html>
