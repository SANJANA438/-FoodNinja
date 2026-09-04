<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.model.User" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodNinja | Menu</title>

<style>

/* =====================================================
   RESET
===================================================== */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}


/* =====================================================
   BODY
===================================================== */

body {

    min-height: 100vh;

    color: #ffffff;

    background:
        radial-gradient(
            circle at 10% 0%,
            rgba(255, 91, 34, 0.15),
            transparent 30%
        ),
        radial-gradient(
            circle at 90% 80%,
            rgba(255, 120, 20, 0.10),
            transparent 35%
        ),
        #080808;

    overflow-x: hidden;
}


/* =====================================================
   FLOATING BACKGROUND GLOW
===================================================== */

body::before,
body::after {

    content: "";

    position: fixed;

    width: 250px;
    height: 250px;

    border-radius: 50%;

    background: rgba(255, 85, 20, 0.08);

    filter: blur(70px);

    pointer-events: none;

    z-index: -1;

    animation: floatingGlow 8s ease-in-out infinite alternate;
}

body::before {

    top: 10%;
    left: -100px;
}

body::after {

    bottom: 5%;
    right: -100px;

    animation-delay: 2s;
}


@keyframes floatingGlow {

    from {
        transform: translateY(0) scale(1);
    }

    to {
        transform: translateY(-50px) scale(1.2);
    }
}


/* =====================================================
   NAVBAR
===================================================== */

.navbar {

    width: 100%;

    height: 66px;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 32px;

    background: rgba(15, 15, 15, 0.94);

    border-bottom: 1px solid #292929;

    position: sticky;

    top: 0;

    z-index: 1000;

    backdrop-filter: blur(15px);

    box-shadow: 0 5px 25px rgba(0,0,0,0.35);
}


/* =====================================================
   LOGO
===================================================== */

.logo {

    font-size: 23px;

    font-weight: 900;

    letter-spacing: -0.7px;

    white-space: nowrap;

    animation: logoAppear 0.8s ease;
}

.logo span {

    color: #ff6422;

    text-shadow:
        0 0 10px rgba(255,100,34,0.4),
        0 0 25px rgba(255,100,34,0.2);
}


@keyframes logoAppear {

    from {
        opacity: 0;
        transform: translateX(-25px);
    }

    to {
        opacity: 1;
        transform: translateX(0);
    }
}


/* =====================================================
   NAVIGATION
===================================================== */

.navbar nav {

    display: flex;

    align-items: center;

    gap: 8px;
}


.navbar nav > a {

    text-decoration: none;

    color: #dcdcdc;

    background: #181818;

    border: 1px solid #292929;

    padding: 8px 13px;

    border-radius: 8px;

    font-size: 12px;

    font-weight: 600;

    transition: all 0.3s ease;

    white-space: nowrap;

    position: relative;

    overflow: hidden;
}


/* Shining effect */

.navbar nav > a::before {

    content: "";

    position: absolute;

    top: 0;
    left: -100%;

    width: 100%;
    height: 100%;

    background: linear-gradient(
        90deg,
        transparent,
        rgba(255,255,255,0.12),
        transparent
    );

    transition: 0.5s;
}


.navbar nav > a:hover::before {

    left: 100%;
}


.navbar nav > a:hover {

    color: white;

    background: #ff6422;

    border-color: #ff6422;

    transform: translateY(-3px);

    box-shadow:
        0 8px 20px rgba(255,100,34,0.35);
}


/* =====================================================
   PROFILE
===================================================== */

.profile-container {

    position: relative;

    margin-left: 5px;
}


.profile-button {

    width: 40px;
    height: 40px;

    padding: 0;

    border-radius: 50%;

    border: 2px solid #303030;

    background: #171717;

    overflow: hidden;

    cursor: pointer;

    transition: all 0.3s ease;
}


.profile-button:hover {

    border-color: #ff6422;

    transform: scale(1.08) rotate(3deg);

    box-shadow:
        0 0 20px rgba(255,100,34,0.45);
}


.profile-image {

    width: 100%;
    height: 100%;

    object-fit: cover;

    display: block;
}


/* =====================================================
   PROFILE POPUP
===================================================== */

.profile-box {

    position: absolute;

    top: 52px;

    right: 0;

    width: 280px;

    padding: 18px;

    display: none;

    background:
        linear-gradient(
            145deg,
            #1c1c1c,
            #0d0d0d
        );

    border: 1px solid #303030;

    border-radius: 16px;

    box-shadow:
        0 25px 60px rgba(0,0,0,0.8);

    z-index: 9999;
}


.profile-box.show {

    display: block;

    animation: profilePopup 0.3s cubic-bezier(.2,.8,.2,1);
}


@keyframes profilePopup {

    from {

        opacity: 0;

        transform:
            translateY(-15px)
            scale(0.92);
    }

    to {

        opacity: 1;

        transform:
            translateY(0)
            scale(1);
    }
}


.profile-header {

    display: flex;

    justify-content: center;

    padding-bottom: 15px;
}


.profile-large-image {

    width: 82px;
    height: 82px;

    border-radius: 50%;

    object-fit: cover;

    border: 3px solid #ff6422;

    box-shadow:
        0 0 20px rgba(255,100,34,0.35);

    animation: profilePulse 2s infinite;
}


@keyframes profilePulse {

    0%,100% {
        box-shadow:
            0 0 15px rgba(255,100,34,0.25);
    }

    50% {
        box-shadow:
            0 0 30px rgba(255,100,34,0.6);
    }
}


.profile-info {

    border-top: 1px solid #292929;

    padding-top: 14px;
}


.profile-info h3 {

    text-align: center;

    color: #ff6422;

    font-size: 19px;

    margin-bottom: 12px;
}


.profile-info p {

    color: #aaa;

    font-size: 13px;

    padding: 8px 2px;

    border-bottom: 1px solid #242424;

    line-height: 1.5;

    word-break: break-word;
}


.profile-info strong {

    color: white;
}


.profile-actions {

    margin-top: 14px;
}


.profile-actions a {

    display: block;

    text-align: center;

    text-decoration: none;

    color: white;

    background: linear-gradient(
        135deg,
        #ff6422,
        #ff4d17
    );

    padding: 9px;

    border-radius: 8px;

    font-size: 13px;

    font-weight: 700;

    transition: all 0.3s ease;
}


.profile-actions a:hover {

    transform: translateY(-3px);

    box-shadow:
        0 8px 20px rgba(255,90,30,0.35);
}


/* =====================================================
   PAGE HEADER
===================================================== */

.page-header {

    width: 92%;

    max-width: 1050px;

    margin: auto;

    padding: 35px 0 25px;

    text-align: center;

    animation: headerAppear 0.8s ease;
}


@keyframes headerAppear {

    from {

        opacity: 0;

        transform: translateY(25px);
    }

    to {

        opacity: 1;

        transform: translateY(0);
    }
}


.back-btn {

    display: inline-flex;

    align-items: center;

    gap: 6px;

    text-decoration: none;

    color: #cccccc;

    background: #171717;

    border: 1px solid #2c2c2c;

    padding: 8px 14px;

    border-radius: 8px;

    font-size: 12px;

    font-weight: 600;

    margin-bottom: 18px;

    transition: all 0.3s ease;
}


.back-btn:hover {

    color: white;

    border-color: #ff6422;

    background: #1e1e1e;

    transform: translateX(-5px);

    box-shadow:
        0 5px 15px rgba(255,100,34,0.2);
}


.page-header h1 {

    font-size: 34px;

    font-weight: 900;

    letter-spacing: -0.8px;

    margin-bottom: 7px;
}


.page-header h1 span {

    color: #ff6422;

    text-shadow:
        0 0 15px rgba(255,100,34,0.35);

    animation: orangeGlow 2s ease-in-out infinite alternate;
}


@keyframes orangeGlow {

    from {
        text-shadow:
            0 0 8px rgba(255,100,34,0.25);
    }

    to {
        text-shadow:
            0 0 25px rgba(255,100,34,0.7);
    }
}


.page-header p {

    color: #777;

    font-size: 13px;
}


.header-line {

    width: 50px;

    height: 3px;

    margin: 14px auto 0;

    border-radius: 20px;

    background:
        linear-gradient(
            90deg,
            #ff8a00,
            #ff4d00
        );

    box-shadow:
        0 0 15px rgba(255,100,34,0.5);

    animation: linePulse 2s ease-in-out infinite;
}


@keyframes linePulse {

    0%,100% {
        width: 45px;
    }

    50% {
        width: 80px;
    }
}


/* =====================================================
   MENU SECTION
===================================================== */

.menu-section {

    width: 92%;

    max-width: 1050px;

    margin: 0 auto 55px;
}


.menu-container {

    display: grid;

    grid-template-columns:
        repeat(3, minmax(0, 1fr));

    gap: 20px;
}


/* =====================================================
   MENU CARD
===================================================== */

.menu-card {

    position: relative;

    overflow: hidden;

    background:
        linear-gradient(
            145deg,
            #191919,
            #101010
        );

    border: 1px solid #292929;

    border-radius: 15px;

    opacity: 0;

    transform: translateY(50px) scale(0.96);

    animation:
        cardAppear 0.7s
        cubic-bezier(.2,.8,.2,1)
        forwards;

    transition:
        transform 0.35s ease,
        border-color 0.35s ease,
        box-shadow 0.35s ease;
}


/* Card animation */

@keyframes cardAppear {

    from {

        opacity: 0;

        transform:
            translateY(50px)
            scale(0.96);
    }

    to {

        opacity: 1;

        transform:
            translateY(0)
            scale(1);
    }
}


/* Delays */

.menu-card:nth-child(1) {
    animation-delay: 0.05s;
}

.menu-card:nth-child(2) {
    animation-delay: 0.12s;
}

.menu-card:nth-child(3) {
    animation-delay: 0.19s;
}

.menu-card:nth-child(4) {
    animation-delay: 0.26s;
}

.menu-card:nth-child(5) {
    animation-delay: 0.33s;
}

.menu-card:nth-child(6) {
    animation-delay: 0.40s;
}

.menu-card:nth-child(7) {
    animation-delay: 0.47s;
}

.menu-card:nth-child(8) {
    animation-delay: 0.54s;
}

.menu-card:nth-child(9) {
    animation-delay: 0.61s;
}


/* =====================================================
   CARD HOVER
===================================================== */

.menu-card:hover {

    transform:
        translateY(-9px)
        scale(1.015);

    border-color: #ff6422;

    box-shadow:
        0 12px 35px rgba(0,0,0,0.65),
        0 0 25px rgba(255,100,34,0.20);
}


/* =====================================================
   CARD SHINE
===================================================== */

.menu-card::before {

    content: "";

    position: absolute;

    top: 0;

    left: -120%;

    width: 70%;

    height: 100%;

    background:
        linear-gradient(
            90deg,
            transparent,
            rgba(255,255,255,0.06),
            transparent
        );

    transform: skewX(-20deg);

    transition: 0.8s;

    pointer-events: none;

    z-index: 5;
}


.menu-card:hover::before {

    left: 140%;
}


/* =====================================================
   IMAGE
===================================================== */

.image-wrapper {

    position: relative;

    width: 100%;

    height: 175px;

    overflow: hidden;
}


.menu-card-image {

    width: 100%;

    height: 100%;

    object-fit: cover;

    display: block;

    transition:
        transform 0.7s cubic-bezier(.2,.8,.2,1),
        filter 0.5s ease;
}


.menu-card:hover .menu-card-image {

    transform: scale(1.12);

    filter:
        brightness(1.08)
        saturate(1.12);
}


/* =====================================================
   IMAGE OVERLAY
===================================================== */

.image-wrapper::after {

    content: "";

    position: absolute;

    left: 0;
    right: 0;
    bottom: 0;

    height: 60%;

    background:
        linear-gradient(
            transparent,
            rgba(0,0,0,0.75)
        );

    pointer-events: none;
}


/* =====================================================
   RATING
===================================================== */

.rating-badge {

    position: absolute;

    top: 12px;

    right: 12px;

    z-index: 2;

    display: flex;

    align-items: center;

    gap: 4px;

    padding: 6px 9px;

    border-radius: 8px;

    color: #ffd45c;

    background: rgba(10,10,10,0.82);

    border: 1px solid rgba(255,255,255,0.12);

    backdrop-filter: blur(6px);

    font-size: 11px;

    font-weight: 700;

    transition: all 0.3s ease;
}


.menu-card:hover .rating-badge {

    transform:
        scale(1.08)
        rotate(2deg);

    background: rgba(255,100,34,0.18);

    border-color: rgba(255,100,34,0.4);

    box-shadow:
        0 0 15px rgba(255,100,34,0.25);
}


/* =====================================================
   MENU INFO
===================================================== */

.menu-card-info {

    padding: 16px;
}


.menu-card-info h2 {

    color: #ffffff;

    font-size: 17px;

    font-weight: 700;

    margin-bottom: 7px;

    white-space: nowrap;

    overflow: hidden;

    text-overflow: ellipsis;

    transition: color 0.3s ease;
}


.menu-card:hover .menu-card-info h2 {

    color: #ff6422;
}


.menu-description {

    color: #858585;

    font-size: 12px;

    line-height: 1.5;

    min-height: 36px;

    margin-bottom: 14px;

    display: -webkit-box;

    -webkit-line-clamp: 2;

    -webkit-box-orient: vertical;

    overflow: hidden;
}


/* =====================================================
   BOTTOM ROW
===================================================== */

.bottom-row {

    display: flex;

    align-items: center;

    justify-content: space-between;

    gap: 10px;
}


.menu-price {

    color: white;

    font-size: 18px;

    font-weight: 800;

    transition: all 0.3s ease;
}


.menu-card:hover .menu-price {

    color: #ff6422;

    transform: scale(1.04);
}


/* =====================================================
   ADD BUTTON
===================================================== */

.add-form {

    margin: 0;
}


.add-btn {

    border: none;

    outline: none;

    cursor: pointer;

    color: white;

    background:
        linear-gradient(
            135deg,
            #ff6422,
            #ff4d17
        );

    padding: 9px 15px;

    border-radius: 8px;

    font-size: 11px;

    font-weight: 700;

    transition: all 0.3s ease;

    box-shadow:
        0 4px 12px rgba(255,90,30,0.18);

    position: relative;

    overflow: hidden;
}


/* Button shine */

.add-btn::before {

    content: "";

    position: absolute;

    top: 0;

    left: -100%;

    width: 100%;

    height: 100%;

    background:
        linear-gradient(
            90deg,
            transparent,
            rgba(255,255,255,0.3),
            transparent
        );

    transition: 0.5s;
}


.add-btn:hover::before {

    left: 100%;
}


.add-btn:hover {

    transform:
        translateY(-3px)
        scale(1.04);

    box-shadow:
        0 8px 22px rgba(255,90,30,0.40);
}


.add-btn:active {

    transform: scale(0.94);
}


/* =====================================================
   NO MENU
===================================================== */

.no-menu {

    grid-column: 1 / -1;

    text-align: center;

    padding: 65px 20px;

    background: #151515;

    border: 1px solid #292929;

    border-radius: 15px;

    animation: cardAppear 0.7s ease;
}


.no-menu .icon {

    font-size: 45px;

    margin-bottom: 12px;

    animation:
        floatingFood 2s ease-in-out infinite;
}


@keyframes floatingFood {

    0%,100% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-8px);
    }
}


.no-menu h2 {

    font-size: 20px;

    margin-bottom: 7px;
}


.no-menu p {

    color: #777;

    font-size: 13px;
}


/* =====================================================
   FOOTER
===================================================== */

footer {

    border-top: 1px solid #242424;

    background: #101010;

    text-align: center;

    padding: 20px;

    color: #666;

    font-size: 12px;
}


footer span {

    color: #ff6422;

    animation:
        heartBeat 1.4s infinite;
}


@keyframes heartBeat {

    0%,100% {
        transform: scale(1);
    }

    50% {
        transform: scale(1.3);
    }
}


/* =====================================================
   TABLET
===================================================== */

@media (max-width: 900px) {

    .navbar {

        padding: 0 20px;
    }

    .navbar nav {

        gap: 6px;
    }

    .navbar nav > a {

        padding: 7px 9px;

        font-size: 10px;
    }

    .menu-container {

        grid-template-columns:
            repeat(2, minmax(0, 1fr));

        gap: 18px;
    }
}


/* =====================================================
   MOBILE
===================================================== */

@media (max-width: 600px) {

    .navbar {

        height: auto;

        padding: 12px 14px;

        flex-direction: column;

        gap: 12px;
    }

    .logo {

        font-size: 22px;
    }

    .navbar nav {

        flex-wrap: wrap;

        justify-content: center;
    }

    .navbar nav > a {

        font-size: 9px;

        padding: 6px 8px;
    }

    .profile-container {

        margin-left: 0;
    }

    .profile-button {

        width: 38px;

        height: 38px;
    }

    .profile-box {

        right: -55px;

        width: 275px;
    }

    .page-header {

        width: 94%;

        padding-top: 25px;
    }

    .page-header h1 {

        font-size: 27px;
    }

    .menu-section {

        width: 94%;
    }

    .menu-container {

        grid-template-columns: 1fr;

        gap: 18px;
    }

    .image-wrapper {

        height: 205px;
    }

    .menu-card-info {

        padding: 16px;
    }
}


/* =====================================================
   REDUCED MOTION
===================================================== */

@media (prefers-reduced-motion: reduce) {

    *,
    *::before,
    *::after {

        animation-duration: 0.01ms !important;

        animation-iteration-count: 1 !important;

        transition-duration: 0.01ms !important;
    }
}

</style>

</head>

<body>

<%

// Get logged-in user

User loggedInUser =
    (User) session.getAttribute("user");


%>

<!-- =====================================================
     NAVBAR
===================================================== -->

<header class="navbar">

<!-- LOGO -->

<div class="logo">

    Food<span>Ninja</span>

</div>


<!-- NAVIGATION -->

<nav>

    <a href="<%= request.getContextPath() %>/restaurant">
        Restaurants
    </a>

    <a href="<%= request.getContextPath() %>/home.jsp">
        Home
    </a>

    <a href="<%= request.getContextPath() %>/cart.jsp">
        🛒 Cart
    </a>


    <% if (loggedInUser == null) { %>

        <a href="<%= request.getContextPath() %>/login.jsp">
            Login
        </a>

    <% } %>


    <!-- PROFILE -->

    <div class="profile-container">

        <button
            type="button"
            class="profile-button"
            onclick="toggleProfile()">

            <img
                src="<%= request.getContextPath() %>/images/profile.png"
                alt="Profile"
                class="profile-image">

        </button>


        <!-- PROFILE POPUP -->

        <div
            class="profile-box"
            id="profileBox">


            <% if (loggedInUser != null) { %>


                <div class="profile-header">

                    <img
                        src="<%= request.getContextPath() %>/images/profile.png"
                        alt="Profile"
                        class="profile-large-image">

                </div>


                <div class="profile-info">

                    <h3>
                        My Profile
                    </h3>

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

                </div>


                <div class="profile-actions">

                    <a
                        href="<%= request.getContextPath() %>/logout">

                        Logout

                    </a>

                </div>


            <% } else { %>


                <div class="profile-header">

                    <img
                        src="<%= request.getContextPath() %>/images/profile.png"
                        alt="Profile"
                        class="profile-large-image">

                </div>


                <div class="profile-info">

                    <h3>
                        My Profile
                    </h3>

                    <p style="text-align:center;">

                        Please login to view your profile.

                    </p>

                </div>


                <div class="profile-actions">

                    <a
                        href="<%= request.getContextPath() %>/login.jsp">

                        Login

                    </a>

                </div>


            <% } %>


        </div>

    </div>

</nav>


</header>

<!-- =====================================================
     PAGE HEADER
===================================================== -->

<section class="page-header">


<a
    href="<%= request.getContextPath() %>/restaurant"
    class="back-btn">

    ← Back to Restaurants

</a>


<h1>

    Explore Our <span>Menu</span>

</h1>


<p>

    Delicious food made for every craving

</p>


<div class="header-line"></div>


</section>

<!-- =====================================================
     MENU SECTION
===================================================== -->

<section class="menu-section">

<div class="menu-container">


<%

List<Menu> allMenus =
    (List<Menu>) request.getAttribute("allMenus");


if (allMenus != null && !allMenus.isEmpty()) {


    for (Menu menu : allMenus) {


        String imageName =
            menu.getImageUrl();


        if (imageName == null ||
            imageName.trim().isEmpty()) {

            imageName = "biryani.jpg";

        }
%>

    <!-- MENU CARD -->

    <div class="menu-card">


        <!-- IMAGE -->

        <div class="image-wrapper">


            <img
                class="menu-card-image"

                src="<%= request.getContextPath() %>/images/<%= imageName %>"

                alt="<%= menu.getItemName() %>"

                onerror="this.onerror=null; this.src='<%= request.getContextPath() %>/images/biryani.jpg';">


            <!-- RATING -->

            <div class="rating-badge">

                ★ <%= menu.getRating() %>

            </div>


        </div>


        <!-- INFORMATION -->

        <div class="menu-card-info">


            <h2>

                <%= menu.getItemName() %>

            </h2>


            <p class="menu-description">

                <%= menu.getDescription() %>

            </p>


            <!-- PRICE + ADD -->

            <div class="bottom-row">


                <span class="menu-price">

                    ₹<%= menu.getPrice() %>

                </span>


                <form
                    class="add-form"

                    action="<%= request.getContextPath() %>/cartServlet"

                    method="post">


                    <input
                        type="hidden"
                        name="menuID"
                        value="<%= menu.getMenuId() %>">


                    <input
                        type="hidden"
                        name="restaurantID"
                        value="<%= menu.getRestaurantId() %>">


                    <input
                        type="hidden"
                        name="qty"
                        value="1">


                    <input
                        type="hidden"
                        name="action"
                        value="add">


                    <input
                        type="submit"
                        value="＋ Add"
                        class="add-btn">

                </form>

            </div>

        </div>

    </div>


<%


    }

} else {

%>
  <!-- NO MENU -->

    <div class="no-menu">

        <div class="icon">

            🍽️

        </div>

        <h2>

            No Menu Items Available

        </h2>

        <p>

            Please check back later for delicious food.

        </p>

    </div>


<%

}

%>

</div>


</section>

<!-- =====================================================
     FOOTER
===================================================== -->

<footer>

© 2026 FoodNinja.

Made with <span>♥</span> for food lovers.


</footer>

<!-- =====================================================
     PROFILE JAVASCRIPT
===================================================== -->

<script>

function toggleProfile() {

    const profileBox =
        document.getElementById("profileBox");

    profileBox.classList.toggle("show");
}


document.addEventListener("click", function(event) {

    const profileContainer =
        document.querySelector(".profile-container");

    const profileBox =
        document.getElementById("profileBox");


    if (
        profileContainer &&
        !profileContainer.contains(event.target)
    ) {

        profileBox.classList.remove("show");

    }

});

</script>

</body>

</html>
