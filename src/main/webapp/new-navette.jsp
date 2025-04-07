<%--
  Created by IntelliJ IDEA.
  User: Ordinateur
  Date: 4/7/2025
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Navette </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
</head>
<body>
<form action="${pageContext.request.contextPath}/addNavette" method="post"
      class="max-w-2xl mx-auto bg-white p-6 rounded-lg shadow-md space-y-6">
    <h2 class="text-2xl font-semibold text-center text-gray-800">Add New Navette</h2>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-700">Departure City</label>
            <input type="text" name="villeDepart" required
                   class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Arrival City</label>
            <input type="text" name="villeArrivee" required
                   class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Departure Time</label>
            <input type="time" name="heureDepart" required
                   class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Arrival Time</label>
            <input type="time" name="heureArrivee" required
                   class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Price (MAD)</label>
            <input type="number" name="price" step="0.01" required
                   class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Kilometers</label>
            <input type="number" name="kilometers" required
                   class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Seats Number</label>
            <input type="number" name="seatsNumber" required
                   class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Car Model</label>
            <input type="text" name="carModel" required
                   class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Car Plate</label>
            <input type="text" name="carPlate" required
                   class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Status</label>
            <select name="status" required
                    class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-400">
                <option value="OPEN">OPEN</option>
                <option value="CLOSED">CLOSED</option>
            </select>
        </div>
    </div>

    <div class="flex justify-center pt-4">
        <button type="submit"
                class="px-6 py-2 bg-yellow-400 text-white rounded-lg hover:bg-yellow-500 transition duration-300">
            Add Navette
        </button>
    </div>
</form>

</body>
</html>
