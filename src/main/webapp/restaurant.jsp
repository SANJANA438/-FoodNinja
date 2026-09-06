<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Restaurant" %>
<%@ page import="com.tap.model.User" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>FoodNinja - Restaurants</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/restaurant.css">


</head>

<body>

<!-- =====================================================
     NAVBAR
===================================================== -->

<header class="navbar">

<div class="navbar-container">

    <!-- LOGO -->

    <a href="${pageContext.request.contextPath}/index.jsp"
       class="logo">

        <span class="logo-icon">🍴</span>

        <span class="logo-text">
            Food<span>Ninja</span>
        </span>

    </a>


    <!-- NAVIGATION -->

    <nav class="nav-links">

        <a href="${pageContext.request.contextPath}/home.jsp">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/restaurant"
           class="active">
            Restaurants
        </a>

        <a href="${pageContext.request.contextPath}/cart.jsp">
            🛒 Cart
        </a>

        <a href="${pageContext.request.contextPath}/order.jsp">
            Orders
        </a>

    </nav>


    <!-- RIGHT -->

    <div class="nav-right">

        <span class="search-nav"
              onclick="focusSearch()">
            🔍
        </span>


        <!-- ================= PROFILE ================= -->

        <%

            User loggedInUser =
                (User) session.getAttribute("user");

        %>


        <div class="profile-container">

            <button
                type="button"
                class="profile-button"
                onclick="toggleProfile(event)">

                <img
                    src="${pageContext.request.contextPath}/images/profile.png"
                    alt="Profile"
                    class="profile-image">

            </button>


            <!-- PROFILE BOX -->

            <div class="profile-box"
                 id="profileBox">


                <!-- PROFILE HEADER -->

                <div class="profile-header">

                    <img
                        src="${pageContext.request.contextPath}/images/profile.png"
                        alt="Profile"
                        class="profile-large-image">

                </div>


                <!-- PROFILE INFO -->

                <div class="profile-info">

                    <h3>
                        My Profile
                    </h3>


                    <%

                        if (loggedInUser != null) {

                    %>

                        <p>

                            👤

                            <strong>Name:</strong>

                            <%= loggedInUser.getUserName() %>

                        </p>


                        <p>

                            📧

                            <strong>Email:</strong>

                            <%= loggedInUser.getEmail() %>

                        </p>

                    <%

                        } else {

                    %>

                        <p style="text-align:center;">

                            Please login to view your profile.

                        </p>

                    <%

                        }

                    %>

                </div>


                <!-- PROFILE ACTIONS -->

                <div class="profile-actions">

                    <%

                        if (loggedInUser != null) {

                    %>

                        <a href="${pageContext.request.contextPath}/logout">

                            Logout

                        </a>

                    <%

                        } else {

                    %>

                        <a href="${pageContext.request.contextPath}/login.html">

                            Login

                        </a>

                    <%

                        }

                    %>

                </div>

            </div>

        </div>

    </div>

</div>

</header>

<!-- =====================================================
     GET RESTAURANTS
===================================================== -->

<%


List<Restaurant> allRestaurants =
    (List<Restaurant>)
    request.getAttribute("allrestaurant");

%>

<!-- =====================================================
     MAIN
===================================================== -->

<main class="main-container">


<!-- =================================================
     HERO
================================================== -->

<section class="hero">

    <div class="hero-content">


        <div class="hero-label">

            🍽️ FOODNINJA DELIVERY

        </div>


        <!-- SEARCH -->

        <div class="search-box">

            <span class="search-icon">
                🔍
            </span>


            <input
                type="text"
                id="searchInput"
                placeholder="Search restaurants or cuisines..."
                onkeyup="searchRestaurants()">


            <button
                type="button"
                id="clearBtn"
                onclick="clearSearch()">

                ×

            </button>

        </div>

    </div>


    <!-- HERO FOOD -->

    <div class="hero-image">

        <div class="floating-food food-one">
            🍕
        </div>

        <div class="floating-food food-two">
            🍔
        </div>

        <div class="floating-food food-three">
            🍛
        </div>

        <div class="main-food">
            🍽️
        </div>

    </div>

</section>



<!-- =================================================
     FILTERS
================================================== -->

<section class="filter-section">


    <div class="filter-heading">

        <h2>
            Restaurants near you
        </h2>


        <%

            int restaurantCount =
                allRestaurants != null
                ? allRestaurants.size()
                : 0;

        %>


        <span>
            <%= restaurantCount %> restaurants
        </span>

    </div>


    <div class="filters">


        <button
            class="filter-btn selected"
            onclick="filterRestaurants('all', this)">

            All

        </button>


        <button
            class="filter-btn"
            onclick="filterRestaurants('rating', this)">

            ⭐ 4.0+

        </button>


        <button
            class="filter-btn"
            onclick="filterRestaurants('fast', this)">

            ⚡ Fast Delivery

        </button>


        <button
            class="filter-btn"
            onclick="filterRestaurants('active', this)">

            🟢 Open Now

        </button>

    </div>

</section>



<!-- =================================================
     RESTAURANT HEADER
================================================== -->

<section class="restaurant-header">

    <div>

        <h2>
            Popular restaurants
        </h2>

        <p>
            Explore top-rated restaurants and discover
            something delicious today.
        </p>

    </div>


    <div class="sort-box">

        <label>
            Sort by
        </label>


        <select id="sortSelect"
                onchange="sortRestaurants()">

            <option value="recommended">
                Recommended
            </option>

            <option value="rating">
                Rating
            </option>

            <option value="name">
                Name
            </option>

            <option value="delivery">
                Delivery Time
            </option>

        </select>

    </div>

</section>



<!-- =================================================
     RESTAURANT GRID
================================================== -->

<section class="restaurant-grid"
         id="restaurantGrid">


    <%

        if (allRestaurants != null &&
            !allRestaurants.isEmpty()) {


            for (Restaurant restaurant : allRestaurants) {


                /*
                 * GET IMAGE FROM DATABASE
                 */

                String imageName =
                    restaurant.getImageUrl();


                /*
                 * DEFAULT IMAGE
                 */

                if (imageName == null ||
                    imageName.trim().isEmpty()) {

                    imageName = "restaurant.jpg";

                }


                /*
                 * IMAGE SOURCE
                 *
                 * LOCAL:
                 * udupi.jpg
                 * meghana.jpg
                 *
                 * ONLINE:
                 * https://...
                 */

                String imageSrc;


                if (imageName.startsWith("http://") ||
                    imageName.startsWith("https://")) {

                    // ONLINE IMAGE

                    imageSrc = imageName;

                } else {

                    // LOCAL IMAGE FROM ECLIPSE IMAGES FOLDER

                    imageSrc =
                        request.getContextPath()
                        + "/images/"
                        + imageName;

                }

    %>


    <!-- =================================================
         RESTAURANT CARD
    ================================================== -->

    <article class="restaurant-card"

             data-name="<%= restaurant.getName() %>"

             data-cuisine="<%= restaurant.getCuisineType() %>"

             data-rating="<%= restaurant.getRating() %>"

             data-delivery="<%= restaurant.getDeliveryTime() %>"

             data-active="<%= restaurant.isActive() %>">


        <!-- IMAGE -->

        <div class="restaurant-image">


            <img

                src="<%= imageSrc %>"

                alt="<%= restaurant.getName() %>"

                onerror="this.style.display='none';
                         this.nextElementSibling.style.display='flex';">


            <!-- IMAGE FALLBACK -->

            <div class="image-fallback">

                🍽️

            </div>


            <!-- DARK OVERLAY -->

            <div class="image-overlay"></div>


            <!-- STATUS -->

            <%

                if (restaurant.isActive()) {

            %>

                <span class="status open">

                    ● Open

                </span>

            <%

                } else {

            %>

                <span class="status closed">

                    ● Closed

                </span>

            <%

                }

            %>


            <!-- OFFER -->

            <span class="offer">

                20% OFF

            </span>


            <!-- FAVORITE -->

            <button
                type="button"
                class="favorite"
                onclick="toggleFavorite(this)">

                ♡

            </button>

        </div>



        <!-- INFORMATION -->

        <div class="restaurant-info">


            <!-- NAME -->

            <div class="restaurant-name">

                <h3>

                    <%= restaurant.getName() %>

                </h3>


                <p>

                    <%= restaurant.getCuisineType() %>

                </p>

            </div>



            <!-- RATING -->

            <div class="restaurant-details">


                <span class="rating">

                    ★

                    <%= String.format(
                        "%.1f",
                        restaurant.getRating()
                    ) %>

                </span>


                <span class="dot">

                    •

                </span>


                <span class="delivery">

                    ⚡

                    <%= restaurant.getDeliveryTime() %>

                    mins

                </span>

            </div>



            <!-- ADDRESS -->

            <div class="restaurant-address">

                <span>
                    📍
                </span>


                <span>

                    <%= restaurant.getAddress() %>

                </span>

            </div>



            <!-- MENU BUTTON -->

            <a

                href="${pageContext.request.contextPath}/menu?restaurantID=<%= restaurant.getRestaurantID() %>"

                class="menu-btn">

                <span>

                    View Menu

                </span>


                <span class="arrow">

                    →

                </span>

            </a>

        </div>

    </article>


    <%

            }

        } else {

    %>


    <!-- =================================================
         EMPTY
    ================================================== -->

    <div class="empty-restaurants">


        <div class="empty-icon">

            🍽️

        </div>


        <h2>

            No restaurants available

        </h2>


        <p>

            We couldn't find any restaurants at the moment.

        </p>


        <button onclick="location.reload()">

            Refresh

        </button>

    </div>


    <%

        }

    %>

</section>



<!-- =================================================
     SEARCH EMPTY
================================================== -->

<div class="search-empty"
     id="searchEmpty">


    <div>

        🔍

    </div>


    <h2>

        No restaurants found

    </h2>


    <p>

        Try searching for another restaurant or cuisine.

    </p>


    <button onclick="clearSearch()">

        Clear Search

    </button>

</div>


</main>

<!-- =====================================================
     FOOTER
===================================================== -->

<footer class="footer">

<div class="footer-container">


    <div class="footer-logo">

        🍴 Food<span>Ninja</span>

        <p>

            Delicious food. Delivered fast.

        </p>

    </div>


    <div class="footer-links">


        <a href="${pageContext.request.contextPath}/home.jsp">

            Home

        </a>


        <a href="${pageContext.request.contextPath}/restaurant">

            Restaurants

        </a>


        <a href="${pageContext.request.contextPath}/cartServlet">

            Cart

        </a>


        <a href="${pageContext.request.contextPath}/orderHistory">

            Orders

        </a>

    </div>

</div>


<div class="footer-bottom">

    © 2026 FoodNinja. All Rights Reserved.

</div>

</footer>

<!-- =====================================================
     JAVASCRIPT
===================================================== -->

<script>


/* =====================================================
   SEARCH
===================================================== */

function searchRestaurants() {

    const input =
        document.getElementById("searchInput");


    const value =
        input.value.toLowerCase().trim();


    const cards =
        document.querySelectorAll(".restaurant-card");


    const empty =
        document.getElementById("searchEmpty");


    const clear =
        document.getElementById("clearBtn");


    let count = 0;


    if (value.length > 0) {

        clear.style.display = "block";

    } else {

        clear.style.display = "none";

    }


    cards.forEach(function(card) {


        const name =
            card.dataset.name.toLowerCase();


        const cuisine =
            card.dataset.cuisine.toLowerCase();


        if (
            name.includes(value) ||
            cuisine.includes(value)
        ) {

            card.style.display = "";

            count++;

        } else {

            card.style.display = "none";

        }

    });


    if (count === 0 && value !== "") {

        empty.style.display = "block";

    } else {

        empty.style.display = "none";

    }

}



/* =====================================================
   CLEAR SEARCH
===================================================== */

function clearSearch() {

    const input =
        document.getElementById("searchInput");


    input.value = "";


    searchRestaurants();


    input.focus();

}



/* =====================================================
   FOCUS SEARCH
===================================================== */

function focusSearch() {

    const search =
        document.getElementById("searchInput");


    search.focus();


    search.scrollIntoView({

        behavior: "smooth",

        block: "center"

    });

}



/* =====================================================
   FILTER
===================================================== */

function filterRestaurants(type, button) {


    const cards =
        document.querySelectorAll(".restaurant-card");


    document
        .querySelectorAll(".filter-btn")
        .forEach(function(btn) {

            btn.classList.remove("selected");

        });


    button.classList.add("selected");


    cards.forEach(function(card) {


        const rating =
            parseFloat(card.dataset.rating);


        const active =
            card.dataset.active === "true";


        if (type === "all") {

            card.style.display = "";

        }


        else if (type === "rating") {

            card.style.display =
                rating >= 4.0
                    ? ""
                    : "none";

        }


        else if (type === "fast") {


            const delivery =
                parseInt(card.dataset.delivery);


            card.style.display =
                delivery > 0 &&
                delivery <= 30
                    ? ""
                    : "none";

        }


        else if (type === "active") {

            card.style.display =
                active
                    ? ""
                    : "none";

        }

    });

}



/* =====================================================
   FAVORITE
===================================================== */

function toggleFavorite(button) {


    button.classList.toggle("liked");


    if (button.classList.contains("liked")) {

        button.innerHTML = "♥";

    } else {

        button.innerHTML = "♡";

    }

}



/* =====================================================
   PROFILE
===================================================== */

function toggleProfile(event) {

    event.stopPropagation();


    const box =
        document.getElementById("profileBox");


    box.classList.toggle("show");

}


document.addEventListener("click", function(event) {


    const container =
        document.querySelector(".profile-container");


    const box =
        document.getElementById("profileBox");


    if (
        container &&
        !container.contains(event.target)
    ) {

        box.classList.remove("show");

    }

});



/* =====================================================
   SORT
===================================================== */

function sortRestaurants() {


    const grid =
        document.getElementById("restaurantGrid");


    const cards =
        Array.from(
            grid.querySelectorAll(".restaurant-card")
        );


    const value =
        document.getElementById("sortSelect").value;


    cards.sort(function(a, b) {


        if (value === "rating") {

            return (
                parseFloat(b.dataset.rating) -
                parseFloat(a.dataset.rating)
            );

        }


        if (value === "name") {

            return a.dataset.name
                .localeCompare(b.dataset.name);

        }


        if (value === "delivery") {

            return (
                parseInt(a.dataset.delivery) -
                parseInt(b.dataset.delivery)
            );

        }


        return 0;

    });


    cards.forEach(function(card) {

        grid.appendChild(card);

    });

}



/* =====================================================
   CARD LOAD ANIMATION
===================================================== */

document.addEventListener(
    "DOMContentLoaded",
    function() {


        const cards =
            document.querySelectorAll(".restaurant-card");


        cards.forEach(function(card, index) {


            card.style.animationDelay =
                (index * 0.08) + "s";

        });

    }
);

</script>

</body>

</html>
