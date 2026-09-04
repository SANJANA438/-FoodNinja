<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User" %>

<%
    User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>FoodNinja | My Profile</title>


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

            overflow-x: hidden;

            background:

                radial-gradient(
                    circle at 5% 5%,
                    rgba(255, 140, 0, 0.20),
                    transparent 25%
                ),

                radial-gradient(
                    circle at 95% 10%,
                    rgba(255, 94, 0, 0.16),
                    transparent 28%
                ),

                radial-gradient(
                    circle at 10% 95%,
                    rgba(255, 140, 0, 0.10),
                    transparent 25%
                ),

                #070707;
        }


        /* =====================================================
           BACKGROUND GLOW CIRCLES
        ===================================================== */

        body::before {

            content: "";

            position: fixed;

            width: 300px;
            height: 300px;

            top: 180px;
            left: -150px;

            border-radius: 50%;

            background: rgba(255, 100, 0, 0.08);

            filter: blur(80px);

            pointer-events: none;
        }


        body::after {

            content: "";

            position: fixed;

            width: 350px;
            height: 350px;

            bottom: -180px;
            right: -150px;

            border-radius: 50%;

            background: rgba(255, 140, 0, 0.08);

            filter: blur(90px);

            pointer-events: none;
        }


        /* =====================================================
           HEADER
        ===================================================== */

        header {

            height: 76px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 70px;

            position: sticky;

            top: 0;

            z-index: 1000;

            background:
                rgba(10, 10, 10, 0.88);

            backdrop-filter: blur(18px);

            -webkit-backdrop-filter: blur(18px);

            border-bottom:
                1px solid rgba(255, 140, 0, 0.18);

            box-shadow:
                0 8px 30px rgba(0, 0, 0, 0.45);
        }


        /* =====================================================
           LOGO
        ===================================================== */

        .logo {

            font-size: 30px;

            font-weight: 900;

            letter-spacing: -1.5px;

            color: white;

            cursor: pointer;

            transition: 0.3s;
        }


        .logo span {

            color: #ff8c00;

            text-shadow:
                0 0 12px rgba(255, 140, 0, 0.65),
                0 0 25px rgba(255, 100, 0, 0.25);
        }


        .logo:hover {

            transform: scale(1.03);
        }


        /* =====================================================
           NAVIGATION
        ===================================================== */

        nav {

            display: flex;

            align-items: center;

            gap: 8px;
        }


        nav a {

            display: flex;

            align-items: center;

            gap: 7px;

            color: #bdbdbd;

            text-decoration: none;

            padding: 10px 15px;

            border-radius: 12px;

            font-size: 14px;

            font-weight: 600;

            transition: all 0.3s ease;

            border: 1px solid transparent;
        }


        nav a:hover {

            color: white;

            background:
                rgba(255, 140, 0, 0.12);

            border-color:
                rgba(255, 140, 0, 0.25);

            box-shadow:
                0 0 18px rgba(255, 140, 0, 0.12);

            transform: translateY(-2px);
        }


        /* =====================================================
           PROFILE WRAPPER
        ===================================================== */

        .profile-wrapper {

            width: 100%;

            max-width: 720px;

            margin: 55px auto 80px;

            padding: 0 20px;

            position: relative;

            z-index: 2;
        }


        /* =====================================================
           PROFILE CARD
        ===================================================== */

        .profile-card {

            position: relative;

            overflow: hidden;

            padding: 45px;

            background:

                linear-gradient(
                    145deg,
                    rgba(31, 31, 31, 0.96),
                    rgba(12, 12, 12, 0.98)
                );

            border:
                1px solid rgba(255, 255, 255, 0.08);

            border-radius: 28px;

            box-shadow:

                0 30px 80px
                rgba(0, 0, 0, 0.75),

                inset 0 1px 0
                rgba(255, 255, 255, 0.04);

            transition:
                transform 0.4s ease,
                border-color 0.4s ease,
                box-shadow 0.4s ease;
        }


        .profile-card:hover {

            transform: translateY(-6px);

            border-color:
                rgba(255, 140, 0, 0.45);

            box-shadow:

                0 0 25px
                rgba(255, 140, 0, 0.13),

                0 35px 90px
                rgba(0, 0, 0, 0.85);
        }


        /* =====================================================
           TOP ORANGE LINE
        ===================================================== */

        .profile-card::before {

            content: "";

            position: absolute;

            top: 0;
            left: 0;

            width: 100%;

            height: 4px;

            background:

                linear-gradient(
                    90deg,
                    #ffb000,
                    #ff8c00,
                    #ff5e00,
                    #ff8c00,
                    #ffb000
                );

            background-size: 300% 100%;

            animation:
                orangeFlow 5s linear infinite;

            box-shadow:
                0 0 20px rgba(255, 120, 0, 0.7);
        }


        @keyframes orangeFlow {

            0% {
                background-position: 0% 50%;
            }

            50% {
                background-position: 100% 50%;
            }

            100% {
                background-position: 0% 50%;
            }
        }


        /* =====================================================
           DECORATIVE CIRCLE
        ===================================================== */

        .profile-card::after {

            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            right: -100px;
            top: -100px;

            border-radius: 50%;

            border:
                1px solid rgba(255, 140, 0, 0.16);

            box-shadow:
                0 0 40px rgba(255, 140, 0, 0.05);

            pointer-events: none;
        }


        /* =====================================================
           PROFILE HEADER
        ===================================================== */

        .profile-header {

            text-align: center;

            margin-bottom: 35px;

            position: relative;

            z-index: 2;
        }


        /* =====================================================
           AVATAR
        ===================================================== */

        .avatar-wrapper {

            width: 125px;

            height: 125px;

            margin: 0 auto 20px;

            padding: 5px;

            border-radius: 50%;

            background:

                linear-gradient(
                    135deg,
                    #ffb000,
                    #ff8c00,
                    #ff5e00
                );

            box-shadow:

                0 0 0 1px
                rgba(255, 140, 0, 0.4),

                0 0 30px
                rgba(255, 100, 0, 0.30),

                0 0 60px
                rgba(255, 100, 0, 0.12);

            animation:
                avatarPulse 3s ease-in-out infinite;
        }


        @keyframes avatarPulse {

            0%,
            100% {

                box-shadow:

                    0 0 0 1px
                    rgba(255, 140, 0, 0.35),

                    0 0 25px
                    rgba(255, 100, 0, 0.25);
            }

            50% {

                box-shadow:

                    0 0 0 3px
                    rgba(255, 140, 0, 0.55),

                    0 0 45px
                    rgba(255, 100, 0, 0.38);
            }
        }


        .avatar {

            width: 100%;

            height: 100%;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 50%;

            background:

                linear-gradient(
                    145deg,
                    #242424,
                    #111111
                );

            border:
                3px solid #171717;

            font-size: 48px;
        }


        /* =====================================================
           USER NAME / TITLE
        ===================================================== */

        h1 {

            font-size: 30px;

            font-weight: 800;

            margin-bottom: 8px;

            letter-spacing: -0.5px;
        }


        h1 span {

            color: #ff8c00;

            text-shadow:
                0 0 15px rgba(255, 140, 0, 0.35);
        }


        .subtitle {

            color: #777;

            font-size: 13px;

            margin-bottom: 14px;
        }


        /* =====================================================
           ONLINE BADGE
        ===================================================== */

        .profile-badge {

            display: inline-flex;

            align-items: center;

            gap: 7px;

            padding: 7px 13px;

            border-radius: 20px;

            background:
                rgba(255, 140, 0, 0.08);

            border:
                1px solid rgba(255, 140, 0, 0.22);

            color: #ff9d00;

            font-size: 12px;

            font-weight: 700;
        }


        .status-dot {

            width: 7px;

            height: 7px;

            border-radius: 50%;

            background: #ff8c00;

            box-shadow:
                0 0 8px rgba(255, 140, 0, 0.8);

            animation:
                statusBlink 1.8s infinite;
        }


        @keyframes statusBlink {

            0%,
            100% {
                opacity: 1;
            }

            50% {
                opacity: 0.35;
            }
        }


        /* =====================================================
           PROFILE SECTION
        ===================================================== */

        .profile-section {

            padding: 8px 20px;

            background:
                rgba(255, 255, 255, 0.018);

            border:
                1px solid rgba(255, 255, 255, 0.07);

            border-radius: 17px;

            box-shadow:
                inset 0 1px 0
                rgba(255, 255, 255, 0.025);
        }


        /* =====================================================
           FIELD
        ===================================================== */

        .field {

            display: flex;

            align-items: center;

            gap: 20px;

            padding: 16px 3px;

            border-bottom:
                1px solid rgba(255, 255, 255, 0.07);

            transition: all 0.3s ease;
        }


        .field:last-child {

            border-bottom: none;
        }


        .field:hover {

            padding-left: 8px;
            padding-right: 8px;
        }


        /* =====================================================
           FIELD ICON
        ===================================================== */

        .field-icon {

            width: 40px;

            height: 40px;

            min-width: 40px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 11px;

            background:
                rgba(255, 140, 0, 0.08);

            border:
                1px solid rgba(255, 140, 0, 0.14);

            font-size: 18px;

            transition: 0.3s;
        }


        .field:hover .field-icon {

            background:
                rgba(255, 140, 0, 0.16);

            border-color:
                rgba(255, 140, 0, 0.35);

            transform: scale(1.05);
        }


        /* =====================================================
           FIELD CONTENT
        ===================================================== */

        .field-content {

            flex: 1;

            min-width: 0;
        }


        .field-content label {

            display: block;

            color: #686868;

            font-size: 11px;

            text-transform: uppercase;

            letter-spacing: 1px;

            font-weight: 700;

            margin-bottom: 5px;
        }


        .value {

            color: #eeeeee;

            font-size: 14px;

            font-weight: 600;

            word-break: break-word;

            line-height: 1.5;
        }


        .field:hover .value {

            color: white;
        }


        /* =====================================================
           ROLE BADGE
        ===================================================== */

        .role-value {

            display: inline-flex;

            align-items: center;

            padding: 5px 11px;

            border-radius: 8px;

            color: #ff9d00;

            background:
                rgba(255, 140, 0, 0.09);

            border:
                1px solid rgba(255, 140, 0, 0.20);

            font-size: 12px;

            font-weight: 700;
        }


        /* =====================================================
           BACK BUTTON
        ===================================================== */

        .back-btn {

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 10px;

            margin-top: 28px;

            padding: 15px;

            background:

                linear-gradient(
                    135deg,
                    #ffb000,
                    #ff8c00,
                    #ff5e00
                );

            color: white;

            text-decoration: none;

            border-radius: 13px;

            font-size: 15px;

            font-weight: 800;

            box-shadow:
                0 10px 25px
                rgba(255, 100, 0, 0.20);

            transition: all 0.3s ease;

            position: relative;

            overflow: hidden;
        }


        .back-btn::before {

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
                    rgba(255,255,255,0.22),
                    transparent
                );

            transition: 0.6s;
        }


        .back-btn:hover::before {

            left: 100%;
        }


        .back-btn:hover {

            transform: translateY(-3px);

            box-shadow:

                0 0 20px
                rgba(255, 140, 0, 0.45),

                0 14px 30px
                rgba(255, 100, 0, 0.25);
        }


        /* =====================================================
           FOOTER
        ===================================================== */

        .footer {

            text-align: center;

            margin-top: 25px;

            color: #454545;

            font-size: 11px;
        }


        .footer span {

            color: #ff8c00;

            font-weight: 700;
        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 700px) {

            header {

                height: auto;

                padding: 18px 20px;

                flex-direction: column;

                gap: 15px;
            }


            .logo {

                font-size: 26px;
            }


            nav {

                width: 100%;

                justify-content: center;

                flex-wrap: wrap;
            }


            nav a {

                padding: 8px 11px;

                font-size: 12px;
            }


            .profile-wrapper {

                margin-top: 30px;
            }


            .profile-card {

                padding: 32px 20px;

                border-radius: 22px;
            }


            .avatar-wrapper {

                width: 105px;

                height: 105px;
            }


            h1 {

                font-size: 26px;
            }


            .field {

                align-items: flex-start;
            }


            .field-content {

                min-width: 0;
            }
        }


        @media (max-width: 480px) {

            .profile-card {

                padding: 28px 15px;
            }


            .profile-section {

                padding: 5px 14px;
            }


            .field {

                gap: 12px;

                padding: 14px 0;
            }


            .field-icon {

                width: 36px;

                height: 36px;

                min-width: 36px;

                font-size: 16px;
            }


            .value {

                font-size: 13px;
            }


            .profile-badge {

                font-size: 11px;
            }
        }

    </style>

</head>


<body>


<!-- =====================================================
     HEADER
===================================================== -->

<header>

    <div class="logo">
        Food<span>Ninja</span>
    </div>


    <nav>

        <a href="<%= request.getContextPath() %>/restaurant">
            🍴 Restaurants
        </a>

        <a href="<%= request.getContextPath() %>/home.jsp">
            🏠 Home
        </a>

        <a href="<%= request.getContextPath() %>/cart.jsp">
            🛒 Cart
        </a>

    </nav>

</header>



<!-- =====================================================
     PROFILE
===================================================== -->

<div class="profile-wrapper">


    <div class="profile-card">


        <!-- =================================================
             PROFILE HEADER
        ================================================== -->

        <div class="profile-header">


            <!-- AVATAR -->

            <div class="avatar-wrapper">

                <div class="avatar">
                    👤
                </div>

            </div>


            <!-- TITLE -->

            <h1>
                My <span>Profile</span>
            </h1>


            <p class="subtitle">
                Manage and view your FoodNinja account information
            </p>


            <div class="profile-badge">

                <span class="status-dot"></span>

                FoodNinja Member

            </div>

        </div>



        <!-- =================================================
             PROFILE DETAILS
        ================================================== -->

        <div class="profile-section">


            <!-- USER ID -->

            <div class="field">

                <div class="field-icon">
                    🆔
                </div>

                <div class="field-content">

                    <label>User ID</label>

                    <div class="value">
                        <%= user.getUserID() %>
                    </div>

                </div>

            </div>



            <!-- NAME -->

            <div class="field">

                <div class="field-icon">
                    👤
                </div>

                <div class="field-content">

                    <label>Full Name</label>

                    <div class="value">
                        <%= user.getUserName() %>
                    </div>

                </div>

            </div>



            <!-- EMAIL -->

            <div class="field">

                <div class="field-icon">
                    ✉️
                </div>

                <div class="field-content">

                    <label>Email Address</label>

                    <div class="value">
                        <%= user.getEmail() %>
                    </div>

                </div>

            </div>



            <!-- ADDRESS -->

            <div class="field">

                <div class="field-icon">
                    📍
                </div>

                <div class="field-content">

                    <label>Delivery Address</label>

                    <div class="value">
                        <%= user.getAddress() %>
                    </div>

                </div>

            </div>



            <!-- ROLE -->

            <div class="field">

                <div class="field-icon">
                    🛡️
                </div>

                <div class="field-content">

                    <label>Account Role</label>

                    <div class="value role-value">
                        <%= user.getRole() %>
                    </div>

                </div>

            </div>



            <!-- CREATED DATE -->

            <div class="field">

                <div class="field-icon">
                    📅
                </div>

                <div class="field-content">

                    <label>Account Created</label>

                    <div class="value">
                        <%= user.getCreatedDate() %>
                    </div>

                </div>

            </div>



            <!-- LAST LOGIN -->

            <div class="field">

                <div class="field-icon">
                    🕐
                </div>

                <div class="field-content">

                    <label>Last Login</label>

                    <div class="value">
                        <%= user.getLastLoginDate() %>
                    </div>

                </div>

            </div>


        </div>



        <!-- =================================================
             BACK BUTTON
        ================================================== -->

        <a
            href="<%= request.getContextPath() %>/restaurant"
            class="back-btn">

            🍔

            <span>
                Back to FoodNinja
            </span>

            →

        </a>



        <!-- =================================================
             FOOTER
        ================================================== -->

        <div class="footer">

            Made with ❤️ by

            <span>
                FoodNinja
            </span>

        </div>


    </div>

</div>


</body>

</html>