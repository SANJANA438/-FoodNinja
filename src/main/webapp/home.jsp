<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.tap.model.User" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>FoodNinja - Food Delivery</title>


    <style>

        /* =====================================================
           RESET
        ===================================================== */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #080a0f;
            color: #ffffff;
            overflow-x: hidden;
        }

        body::before {
            content: "";
            position: fixed;

            width: 450px;
            height: 450px;

            top: -200px;
            left: -180px;

            background: rgba(255, 82, 0, 0.08);

            filter: blur(120px);
            border-radius: 50%;

            pointer-events: none;
            z-index: -1;

            animation: bodyGlowOne 8s ease-in-out infinite alternate;
        }

        body::after {
            content: "";
            position: fixed;

            width: 450px;
            height: 450px;

            right: -180px;
            bottom: -200px;

            background: rgba(255, 82, 0, 0.07);

            filter: blur(120px);
            border-radius: 50%;

            pointer-events: none;
            z-index: -1;

            animation: bodyGlowTwo 10s ease-in-out infinite alternate;
        }

        @keyframes bodyGlowOne {

            from {
                transform: translate(0, 0) scale(0.9);
                opacity: 0.4;
            }

            to {
                transform: translate(120px, 100px) scale(1.15);
                opacity: 0.8;
            }
        }

        @keyframes bodyGlowTwo {

            from {
                transform: translate(0, 0) scale(0.9);
                opacity: 0.3;
            }

            to {
                transform: translate(-100px, -100px) scale(1.2);
                opacity: 0.7;
            }
        }

        a {
            text-decoration: none;
        }


        /* =====================================================
           NAVBAR
        ===================================================== */

        .navbar {
            width: 100%;
            height: 80px;

            background: rgba(10, 12, 17, 0.96);

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 7%;

            position: sticky;
            top: 0;

            z-index: 1000;

            border-bottom: 1px solid rgba(255, 82, 0, 0.25);

            box-shadow:
                0 5px 25px rgba(0, 0, 0, 0.55),
                0 0 25px rgba(255, 82, 0, 0.05);

            backdrop-filter: blur(12px);

            animation: navbarDown 0.7s ease;
        }

        @keyframes navbarDown {

            from {
                opacity: 0;
                transform: translateY(-20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }


        /* =====================================================
           LOGO
        ===================================================== */

        .logo {
            font-size: 30px;
            font-weight: 800;

            color: #ff5200;

            cursor: pointer;

            transition: 0.3s ease;
        }

        .logo span {
            color: #ffffff;
        }

        .logo:hover {

            transform: scale(1.05);

            text-shadow:
                0 0 15px rgba(255, 82, 0, 0.45),
                0 0 35px rgba(255, 82, 0, 0.15);
        }


        /* =====================================================
           NAVIGATION
        ===================================================== */

        .navbar nav {

            display: flex;
            align-items: center;

            gap: 28px;
        }

        .navbar nav > a {

            color: #d9dce2;

            font-size: 15px;
            font-weight: 600;

            position: relative;

            transition:
                color 0.3s ease,
                transform 0.3s ease;
        }

        .navbar nav > a::after {

            content: "";

            position: absolute;

            left: 0;
            bottom: -8px;

            width: 0;
            height: 2px;

            background: #ff5200;

            box-shadow:
                0 0 8px rgba(255, 82, 0, 0.6);

            transition: width 0.3s ease;
        }

        .navbar nav > a:hover {

            color: #ff6520;

            transform: translateY(-2px);

            text-shadow:
                0 0 10px rgba(255, 82, 0, 0.25);
        }

        .navbar nav > a:hover::after {
            width: 100%;
        }


        /* =====================================================
           PROFILE
        ===================================================== */

        .profile-container {
            position: relative;
        }

        .profile-button {

            width: 43px;
            height: 43px;

            border-radius: 50%;

            border: 2px solid #ff5200;

            background: #15181f;

            cursor: pointer;

            overflow: hidden;

            padding: 0;

            transition:
                transform 0.3s ease,
                box-shadow 0.3s ease;
        }

        .profile-button:hover {

            transform: scale(1.08);

            box-shadow:
                0 0 15px rgba(255, 82, 0, 0.45),
                0 0 30px rgba(255, 82, 0, 0.12);
        }

        .profile-image {

            width: 100%;
            height: 100%;

            object-fit: cover;
        }

        .profile-box {

            position: absolute;

            top: 55px;
            right: 0;

            width: 290px;

            background: #15181f;

            border-radius: 14px;

            box-shadow:
                0 20px 50px rgba(0, 0, 0, 0.65),
                0 0 25px rgba(255, 82, 0, 0.08);

            display: none;

            overflow: hidden;

            z-index: 9999;

            border: 1px solid rgba(255, 82, 0, 0.25);

            animation: profileOpen 0.25s ease;
        }

        .profile-box.show {
            display: block;
        }

        @keyframes profileOpen {

            from {
                opacity: 0;
                transform: translateY(-10px) scale(0.97);
            }

            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .profile-header {

            text-align: center;

            padding: 22px;

            background:
                linear-gradient(
                    135deg,
                    #191d24,
                    #21160f
                );

            border-bottom:
                1px solid rgba(255, 82, 0, 0.15);
        }

        .profile-large-image {

            width: 80px;
            height: 80px;

            border-radius: 50%;

            border: 3px solid #ff5200;

            object-fit: cover;

            box-shadow:
                0 0 18px rgba(255, 82, 0, 0.30),
                0 0 35px rgba(255, 82, 0, 0.10);
        }

        .profile-info {
            padding: 18px;
        }

        .profile-info h3 {

            text-align: center;

            margin-bottom: 15px;

            color: #ffffff;
        }

        .profile-info p {

            font-size: 14px;

            color: #aeb4bf;

            padding: 9px 0;

            border-bottom:
                1px solid #2c3038;
        }

        .profile-actions {
            padding: 15px 18px;
        }

        .profile-actions a {

            display: block;

            text-align: center;

            background:
                linear-gradient(
                    135deg,
                    #ff5200,
                    #df4300
                );

            color: white;

            padding: 11px;

            border-radius: 7px;

            font-weight: 600;

            transition: 0.3s ease;

            box-shadow:
                0 7px 18px rgba(255, 82, 0, 0.18);
        }

        .profile-actions a:hover {

            background: #ff6a25;

            transform: translateY(-2px);

            box-shadow:
                0 8px 25px rgba(255, 82, 0, 0.35),
                0 0 20px rgba(255, 82, 0, 0.12);
        }


        /* =====================================================
           HERO
        ===================================================== */

        .hero {

            min-height: 470px;

            background:

                radial-gradient(
                    circle at 85% 20%,
                    rgba(255, 82, 0, 0.18),
                    transparent 30%
                ),

                linear-gradient(
                    135deg,
                    #171a20,
                    #0b0d12
                );

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 65px 8%;

            color: white;

            position: relative;

            overflow: hidden;

            box-shadow:
                inset 0 -1px 0 rgba(255, 82, 0, 0.12);
        }

        .hero::before {

            content: "";

            position: absolute;

            width: 400px;
            height: 400px;

            background:
                rgba(255, 82, 0, 0.08);

            border-radius: 50%;

            filter: blur(80px);

            top: -200px;
            right: -100px;

            animation:
                heroGlow 7s ease-in-out infinite alternate;
        }

        .hero::after {

            content: "";

            position: absolute;

            width: 250px;
            height: 250px;

            background:
                rgba(255, 82, 0, 0.05);

            border-radius: 50%;

            filter: blur(70px);

            bottom: -150px;
            left: 30%;

            animation:
                heroGlowTwo 8s ease-in-out infinite alternate;
        }

        @keyframes heroGlow {

            from {
                transform: translate(0, 0);
                opacity: 0.4;
            }

            to {
                transform: translate(-100px, 120px);
                opacity: 0.8;
            }
        }

        @keyframes heroGlowTwo {

            from {
                transform: translateX(-50px);
                opacity: 0.25;
            }

            to {
                transform: translateX(100px);
                opacity: 0.65;
            }
        }

        .hero-content {

            width: 52%;

            position: relative;

            z-index: 2;

            animation:
                heroContent 0.9s ease forwards;
        }

        @keyframes heroContent {

            from {
                opacity: 0;
                transform: translateX(-35px);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .hero-small-title {

            font-size: 14px;

            font-weight: bold;

            letter-spacing: 2px;

            margin-bottom: 15px;

            color: #ff7130;

            text-shadow:
                0 0 12px rgba(255, 82, 0, 0.25);
        }

        .hero h1 {

            font-size: 52px;

            line-height: 1.15;

            margin-bottom: 18px;
        }

        .hero h1 span {

            display: block;

            color: #ffffff;
        }

        .hero-description {

            font-size: 17px;

            line-height: 1.7;

            max-width: 570px;

            margin-bottom: 25px;

            color: #b9bec8;
        }


        /* =====================================================
           SEARCH BOX
        ===================================================== */

        .search-box {

            width: 100%;

            max-width: 600px;

            background: #ffffff;

            border-radius: 9px;

            display: flex;

            overflow: hidden;

            box-shadow:
                0 10px 30px rgba(0, 0, 0, 0.5),
                0 0 20px rgba(255, 82, 0, 0.06);

            transition:
                box-shadow 0.3s ease,
                transform 0.3s ease;
        }

        .search-box:focus-within {

            transform: translateY(-3px);

            box-shadow:
                0 15px 35px rgba(0, 0, 0, 0.60),
                0 0 0 2px rgba(255, 82, 0, 0.35),
                0 0 30px rgba(255, 82, 0, 0.12);
        }

        .search-box input {

            flex: 1;

            border: none;

            outline: none;

            padding: 17px;

            font-size: 14px;

            color: #222;
        }

        .search-box button {

            border: none;

            background:
                linear-gradient(
                    135deg,
                    #ff5200,
                    #e34700
                );

            color: white;

            padding: 0 25px;

            cursor: pointer;

            font-weight: bold;

            transition: 0.3s ease;

            box-shadow:
                inset 0 0 15px rgba(255,255,255,0.05);
        }

        .search-box button:hover {

            background: #ff6a25;

            box-shadow:
                0 0 20px rgba(255, 82, 0, 0.30);
        }


        /* =====================================================
           HERO IMAGE
        ===================================================== */

        .hero-image {

            width: 390px;

            height: 300px;

            border-radius: 22px;

            overflow: hidden;

            box-shadow:
                0 20px 45px rgba(0, 0, 0, 0.65),
                0 0 25px rgba(255, 82, 0, 0.10);

            position: relative;

            z-index: 2;

            animation:
                heroImageFloat 5s ease-in-out infinite;
        }

        @keyframes heroImageFloat {

            0% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(-10px);
            }

            100% {
                transform: translateY(0);
            }
        }

        .hero-image img {

            width: 100%;
            height: 100%;

            object-fit: cover;

            transition:
                transform 0.6s ease,
                filter 0.4s ease;
        }

        .hero-image:hover img {

            transform: scale(1.06);

            filter:
                brightness(1.05);
        }

        .hero-image:hover {

            box-shadow:
                0 25px 55px rgba(0, 0, 0, 0.75),
                0 0 35px rgba(255, 82, 0, 0.20);
        }


        /* =====================================================
           FOOD CATEGORY SECTION
        ===================================================== */

        .category-section {

            width: 86%;

            max-width: 1200px;

            margin: 55px auto;

            animation:
                sectionAppear 0.9s ease;
        }

        @keyframes sectionAppear {

            from {
                opacity: 0;
                transform: translateY(25px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .section-title {

            font-size: 25px;

            margin-bottom: 25px;

            color: #ffffff;

            text-shadow:
                0 0 15px rgba(255, 82, 0, 0.10);
        }

        .category-list {

            display: flex;

            gap: 35px;

            overflow-x: auto;

            padding-bottom: 15px;
        }

        .category {

            min-width: 105px;

            text-align: center;

            cursor: pointer;

            transition:
                transform 0.3s ease;
        }

        .category:hover {

            transform:
                translateY(-7px);
        }

        .category-image {

            width: 105px;

            height: 105px;

            border-radius: 50%;

            object-fit: cover;

            margin-bottom: 10px;

            border:
                3px solid #252a32;

            transition:
                transform 0.3s ease,
                border-color 0.3s ease,
                box-shadow 0.3s ease;
        }

        .category:hover .category-image {

            transform: scale(1.08);

            border-color: #ff5200;

            box-shadow:
                0 10px 25px rgba(255, 82, 0, 0.25),
                0 0 20px rgba(255, 82, 0, 0.10);
        }

        .category p {

            font-size: 14px;

            font-weight: 600;

            color: #d8dce3;
        }


        /* =====================================================
           FOOD SAFETY & HYGIENE
        ===================================================== */

        .hygiene-section {

            width: 86%;

            max-width: 1200px;

            margin: 70px auto;

            padding: 60px 45px;

            position: relative;

            overflow: hidden;

            background:

                radial-gradient(
                    circle at 10% 20%,
                    rgba(255, 82, 0, 0.10),
                    transparent 30%
                ),

                radial-gradient(
                    circle at 90% 80%,
                    rgba(255, 82, 0, 0.06),
                    transparent 30%
                ),

                #0d1015;

            border:
                1px solid rgba(255, 82, 0, 0.22);

            border-radius: 24px;

            box-shadow:

                0 20px 50px rgba(0, 0, 0, 0.60),

                0 0 30px rgba(255, 82, 0, 0.07),

                inset 0 1px 0
                rgba(255, 255, 255, 0.03);

            isolation: isolate;
        }


        /* =====================================================
           HYGIENE MOVING ORANGE LIGHT
        ===================================================== */

        .hygiene-section::before {

            content: "";

            position: absolute;

            width: 380px;
            height: 380px;

            top: -180px;
            left: -120px;

            background:
                rgba(255, 82, 0, 0.10);

            border-radius: 50%;

            filter: blur(90px);

            animation:
                hygieneGlowOne 7s ease-in-out infinite alternate;

            pointer-events: none;

            z-index: -1;
        }

        .hygiene-section::after {

            content: "";

            position: absolute;

            width: 350px;
            height: 350px;

            bottom: -180px;
            right: -120px;

            background:
                rgba(255, 82, 0, 0.07);

            border-radius: 50%;

            filter: blur(90px);

            animation:
                hygieneGlowTwo 8s ease-in-out infinite alternate;

            pointer-events: none;

            z-index: -1;
        }

        @keyframes hygieneGlowOne {

            0% {

                transform:
                    translate(0, 0)
                    scale(1);

                opacity: 0.3;
            }

            50% {

                transform:
                    translate(120px, 80px)
                    scale(1.2);

                opacity: 0.75;
            }

            100% {

                transform:
                    translate(220px, 40px)
                    scale(1.05);

                opacity: 0.30;
            }
        }

        @keyframes hygieneGlowTwo {

            0% {

                transform:
                    translate(0, 0)
                    scale(1);

                opacity: 0.25;
            }

            50% {

                transform:
                    translate(-100px, -80px)
                    scale(1.2);

                opacity: 0.65;
            }

            100% {

                transform:
                    translate(-180px, -30px)
                    scale(1);

                opacity: 0.25;
            }
        }


        /* =====================================================
           HYGIENE HEADER
        ===================================================== */

        .hygiene-header {

            position: relative;

            z-index: 2;

            text-align: center;

            margin-bottom: 45px;

            animation:
                hygieneHeaderIn 0.9s ease;
        }

        @keyframes hygieneHeaderIn {

            from {

                opacity: 0;

                transform:
                    translateY(20px);
            }

            to {

                opacity: 1;

                transform:
                    translateY(0);
            }
        }

        .hygiene-header h2 {

            font-size: 32px;

            color: #ffffff;

            margin-bottom: 14px;

            letter-spacing: 0.3px;

            animation:
                hygieneTitleGlow
                3s ease-in-out infinite alternate;
        }

        @keyframes hygieneTitleGlow {

            from {

                text-shadow:
                    0 0 0
                    rgba(255, 82, 0, 0);
            }

            to {

                text-shadow:
                    0 0 18px
                    rgba(255, 82, 0, 0.35);
            }
        }

        .hygiene-header p {

            max-width: 760px;

            margin: auto;

            color: #aeb4bf;

            font-size: 15px;

            line-height: 1.8;
        }


        /* =====================================================
           HYGIENE CARDS GRID
        ===================================================== */

        .hygiene-cards {

            position: relative;

            z-index: 2;

            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 22px;
        }


        /* =====================================================
           HYGIENE CARD
        ===================================================== */

        .hygiene-card {

            position: relative;

            min-height: 275px;

            padding: 32px 22px;

            text-align: center;

            border-radius: 18px;

            border:
                1px solid rgba(255, 255, 255, 0.08);

            overflow: hidden;

            transition:

                transform 0.4s ease,

                box-shadow 0.4s ease,

                border-color 0.4s ease;

            animation:
                hygieneCardFloat
                5s ease-in-out infinite;

            isolation: isolate;
        }


        /* =====================================================
           CARD DIFFERENT DARK SHADES
        ===================================================== */

        .hygiene-card:nth-child(1) {

            background:
                linear-gradient(
                    145deg,
                    #181b20,
                    #252a31
                );

            border-color:
                rgba(255, 82, 0, 0.25);

            animation-delay: 0s;
        }

        .hygiene-card:nth-child(2) {

            background:
                linear-gradient(
                    145deg,
                    #151d19,
                    #233028
                );

            border-color:
                rgba(255, 82, 0, 0.18);

            animation-delay: 0.8s;
        }

        .hygiene-card:nth-child(3) {

            background:
                linear-gradient(
                    145deg,
                    #181a21,
                    #272b36
                );

            border-color:
                rgba(255, 82, 0, 0.18);

            animation-delay: 1.6s;
        }

        .hygiene-card:nth-child(4) {

            background:
                linear-gradient(
                    145deg,
                    #1d1b16,
                    #30291e
                );

            border-color:
                rgba(255, 82, 0, 0.23);

            animation-delay: 2.4s;
        }


        /* =====================================================
           CARD ORANGE GLOW
        ===================================================== */

        .hygiene-card::before {

            content: "";

            position: absolute;

            width: 190px;
            height: 190px;

            border-radius: 50%;

            top: -100px;
            right: -80px;

            background:
                rgba(255, 82, 0, 0.14);

            filter: blur(45px);

            opacity: 0.45;

            transition:
                transform 0.6s ease,
                opacity 0.6s ease;

            animation:
                cardGlow 4s ease-in-out infinite alternate;

            z-index: -1;
        }

        .hygiene-card::after {

            content: "";

            position: absolute;

            width: 150px;
            height: 150px;

            border-radius: 50%;

            bottom: -90px;
            left: -60px;

            background:
                rgba(255, 82, 0, 0.08);

            filter: blur(45px);

            opacity: 0.35;

            transition:
                transform 0.6s ease,
                opacity 0.6s ease;

            z-index: -1;
        }

        @keyframes cardGlow {

            from {

                transform:
                    scale(0.8);

                opacity: 0.25;
            }

            to {

                transform:
                    scale(1.3);

                opacity: 0.65;
            }
        }


        /* =====================================================
           CARD FLOAT
        ===================================================== */

        @keyframes hygieneCardFloat {

            0% {

                transform:
                    translateY(0);
            }

            50% {

                transform:
                    translateY(-5px);
            }

            100% {

                transform:
                    translateY(0);
            }
        }


        /* =====================================================
           CARD HOVER
        ===================================================== */

        .hygiene-card:hover {

            transform:
                translateY(-12px)
                scale(1.025);

            border-color:
                rgba(255, 82, 0, 0.65);

            box-shadow:

                0 20px 45px
                rgba(0, 0, 0, 0.70),

                0 0 25px
                rgba(255, 82, 0, 0.22),

                0 0 60px
                rgba(255, 82, 0, 0.08);
        }

        .hygiene-card:hover::before {

            transform:
                translate(-35px, 35px)
                scale(1.5);

            opacity: 0.8;
        }

        .hygiene-card:hover::after {

            transform:
                translate(35px, -30px)
                scale(1.4);

            opacity: 0.55;
        }


        /* =====================================================
           HYGIENE ICON
        ===================================================== */

        .hygiene-icon {

            width: 72px;

            height: 72px;

            margin:
                0 auto 20px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 50%;

            font-size: 32px;

            background:
                rgba(255, 82, 0, 0.08);

            border:
                1px solid
                rgba(255, 82, 0, 0.22);

            box-shadow:

                0 8px 20px
                rgba(0, 0, 0, 0.35),

                0 0 15px
                rgba(255, 82, 0, 0.08);

            transition:

                transform 0.4s ease,

                box-shadow 0.4s ease,

                background 0.4s ease;

            animation:
                iconFloat 3s ease-in-out infinite;
        }

        @keyframes iconFloat {

            0% {

                transform:
                    translateY(0);
            }

            50% {

                transform:
                    translateY(-6px)
                    rotate(2deg);
            }

            100% {

                transform:
                    translateY(0);
            }
        }

        .hygiene-card:hover .hygiene-icon {

            transform:
                translateY(-5px)
                rotate(5deg)
                scale(1.08);

            background:
                rgba(255, 82, 0, 0.13);

            box-shadow:

                0 8px 25px
                rgba(0, 0, 0, 0.45),

                0 0 25px
                rgba(255, 82, 0, 0.20);
        }


        /* =====================================================
           HYGIENE TITLE
        ===================================================== */

        .hygiene-card h3 {

            position: relative;

            font-size: 18px;

            color: #ffffff;

            margin-bottom: 12px;

            font-weight: 700;
        }

        .hygiene-card h3::after {

            content: "";

            display: block;

            width: 35px;

            height: 2px;

            margin:
                10px auto 0;

            border-radius: 10px;

            background:
                rgba(255, 82, 0, 0.45);

            transition:

                width 0.4s ease,

                opacity 0.4s ease,

                box-shadow 0.4s ease;
        }

        .hygiene-card:hover h3::after {

            width: 65px;

            opacity: 1;

            box-shadow:
                0 0 8px
                rgba(255, 82, 0, 0.45);
        }


        /* =====================================================
           DESCRIPTION
        ===================================================== */

        .hygiene-card p {

            position: relative;

            color: #aeb4bf;

            font-size: 13px;

            line-height: 1.7;

            margin: 0;
        }


        /* =====================================================
           SAFETY PROMISE
        ===================================================== */

        .safety-promise {

            width: 86%;

            max-width: 1200px;

            margin: 60px auto;

            display: flex;

            align-items: center;

            justify-content: space-between;

            gap: 40px;

            padding: 45px;

            background:

                radial-gradient(
                    circle at 90% 50%,
                    rgba(255, 82, 0, 0.10),
                    transparent 30%
                ),

                linear-gradient(
                    135deg,
                    #171a20,
                    #252a32
                );

            color: white;

            border-radius: 18px;

            border:
                1px solid
                rgba(255, 82, 0, 0.20);

            box-shadow:

                0 15px 40px
                rgba(0, 0, 0, 0.55),

                0 0 25px
                rgba(255, 82, 0, 0.06);

            position: relative;

            overflow: hidden;
        }

        .safety-promise::before {

            content: "";

            position: absolute;

            width: 300px;
            height: 300px;

            right: -100px;
            top: -120px;

            background:
                rgba(255, 82, 0, 0.10);

            border-radius: 50%;

            filter: blur(70px);

            animation:
                safetyGlow 6s ease-in-out infinite alternate;
        }

        @keyframes safetyGlow {

            from {

                transform:
                    translate(0, 0);

                opacity: 0.3;
            }

            to {

                transform:
                    translate(-100px, 100px);

                opacity: 0.7;
            }
        }

        .safety-promise-content {

            flex: 1;

            position: relative;

            z-index: 2;
        }

        .safety-promise-content h2 {

            font-size: 28px;

            margin-bottom: 15px;

            text-shadow:
                0 0 15px
                rgba(255, 82, 0, 0.18);
        }

        .safety-promise-content p {

            color: #b9bec8;

            line-height: 1.7;

            font-size: 14px;
        }

        .safety-badge {

            min-width: 150px;

            text-align: center;

            position: relative;

            z-index: 2;
        }

        .safety-badge-icon {

            font-size: 55px;

            margin-bottom: 8px;

            animation:
                badgeFloat
                3s ease-in-out infinite;

            filter:
                drop-shadow(
                    0 0 12px
                    rgba(255, 82, 0, 0.25)
                );
        }

        @keyframes badgeFloat {

            0% {

                transform:
                    translateY(0);
            }

            50% {

                transform:
                    translateY(-8px);
            }

            100% {

                transform:
                    translateY(0);
            }
        }

        .safety-badge strong {

            display: block;

            font-size: 16px;

            color: #ffffff;

            text-shadow:
                0 0 12px
                rgba(255, 82, 0, 0.25);
        }


        /* =====================================================
           FOOTER
        ===================================================== */

        footer {

            background: #05070b;

            color: white;

            padding: 45px 8%;

            text-align: center;

            border-top:
                1px solid
                rgba(255, 82, 0, 0.20);

            box-shadow:
                0 -10px 40px
                rgba(255, 82, 0, 0.05);
        }

        footer h2 {

            color: #ff5200;

            margin-bottom: 10px;

            text-shadow:
                0 0 15px
                rgba(255, 82, 0, 0.20);
        }

        footer p {

            color: #8f96a2;

            font-size: 13px;

            line-height: 1.7;
        }


        /* =====================================================
           TABLET
        ===================================================== */

        @media (max-width: 1000px) {

            .navbar {
                padding: 0 4%;
            }

            .navbar nav {
                gap: 15px;
            }

            .hero {
                padding: 45px 5%;
            }

            .hero h1 {
                font-size: 42px;
            }

            .hero-image {
                width: 330px;
                height: 260px;
            }

            .hygiene-cards {

                grid-template-columns:
                    repeat(2, 1fr);
            }
        }


        /* =====================================================
           MOBILE
        ===================================================== */

        @media (max-width: 700px) {

            .navbar {

                height: auto;

                padding: 15px;

                flex-direction: column;

                gap: 15px;
            }

            .navbar nav {

                width: 100%;

                justify-content: center;

                flex-wrap: wrap;

                gap: 12px;
            }

            .hero {

                flex-direction: column;

                text-align: center;

                padding: 45px 20px;

                gap: 30px;
            }

            .hero-content {
                width: 100%;
            }

            .hero h1 {
                font-size: 35px;
            }

            .hero-description {
                font-size: 14px;
            }

            .search-box {
                margin: auto;
            }

            .hero-image {

                width: 100%;

                max-width: 400px;

                height: 240px;
            }

            .category-section {
                width: 92%;
            }

            .hygiene-section {

                width: 92%;

                padding: 40px 20px;
            }

            .hygiene-header h2 {
                font-size: 25px;
            }

            .hygiene-header p {
                font-size: 14px;
            }

            .hygiene-cards {
                grid-template-columns: 1fr;
            }

            .safety-promise {

                width: 92%;

                flex-direction: column;

                text-align: center;

                padding: 35px 25px;
            }

            .profile-box {
                right: -50px;
            }
        }


        /* =====================================================
           REDUCE MOTION
        ===================================================== */

        @media (prefers-reduced-motion: reduce) {

            html {
                scroll-behavior: auto;
            }

            *,
            *::before,
            *::after {

                animation: none !important;

                transition: none !important;
            }
        }

    </style>

</head>


<body>

<%

    User loggedInUser =
        (User) session.getAttribute("user");

%>


<!-- =====================================================
     NAVBAR
===================================================== -->

<header class="navbar">

    <div class="logo">

        Food<span>Ninja</span>

    </div>


    <nav>

        <a href="${pageContext.request.contextPath}/restaurant.jsp">
            Restaurants
        </a>

        <a href="${pageContext.request.contextPath}/cart.jsp">
            🛒 Cart
        </a>

        <a href="${pageContext.request.contextPath}/order.jsp">
            Orders
        </a>


        <% if (loggedInUser == null) { %>

            <a href="${pageContext.request.contextPath}/login.html">
                Sign In
            </a>

        <% } %>


        <!-- PROFILE -->

        <div class="profile-container">

            <button
                type="button"
                class="profile-button"
                onclick="toggleProfile()">

                <img
                    src="${pageContext.request.contextPath}/images/profile.png"
                    class="profile-image"
                    alt="Profile">

            </button>


            <div
                class="profile-box"
                id="profileBox">


                <div class="profile-header">

                    <img
                        src="${pageContext.request.contextPath}/images/profile.png"
                        class="profile-large-image"
                        alt="Profile">

                </div>


                <div class="profile-info">

                    <h3>
                        My Profile
                    </h3>


                    <% if (loggedInUser != null) { %>

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


                    <% } else { %>

                        <p>
                            Please login to view your profile.
                        </p>

                    <% } %>

                </div>


                <div class="profile-actions">

                    <% if (loggedInUser != null) { %>

                        <a href="${pageContext.request.contextPath}/logout">
                            Logout
                        </a>

                    <% } else { %>

                        <a href="${pageContext.request.contextPath}/login.html">
                            Sign In
                        </a>

                    <% } %>

                </div>

            </div>

        </div>

    </nav>

</header>



<!-- =====================================================
     HERO
===================================================== -->

<section class="hero">

    <div class="hero-content">

        <p class="hero-small-title">
            FOODNINJA FOOD DELIVERY
        </p>


        <h1>

            Order food

            <span>
                you love 🍽️
            </span>

        </h1>


        <p class="hero-description">

            Discover delicious meals from trusted restaurants.
            Enjoy fresh, hygienic and carefully prepared food
            delivered straight to your doorstep.

        </p>


        <!-- SEARCH -->

        <div class="search-box">

            <input
                type="text"
                placeholder="Search for restaurant or food">

            <button>
                Search
            </button>

        </div>

    </div>


    <div class="hero-image">

        <img
            src="${pageContext.request.contextPath}/images/biriyani.jpg"
            alt="Delicious Food">

    </div>

</section>



<!-- =====================================================
     FOOD CATEGORIES
===================================================== -->

<section class="category-section">

    <h2 class="section-title">
        What's on your mind?
    </h2>


    <div class="category-list">


        <div class="category">

            <img
                src="${pageContext.request.contextPath}/images/biriyani.jpg"
                class="category-image"
                alt="Biryani">

            <p>
                Biryani
            </p>

        </div>


        <div class="category">

            <img
                src="${pageContext.request.contextPath}/images/pizzahut.jpg"
                class="category-image"
                alt="Pizza">

            <p>
                Pizza
            </p>

        </div>


        <div class="category">

            <img
                src="${pageContext.request.contextPath}/images/udupi.jpg"
                class="category-image"
                alt="South Indian">

            <p>
                South Indian
            </p>

        </div>


        <div class="category">

            <img
                src="${pageContext.request.contextPath}/images/meghana.jpg"
                class="category-image"
                alt="Indian Food">

            <p>
                Indian
            </p>

        </div>


        <div class="category">

            <img
                src="${pageContext.request.contextPath}/images/empire.jpg"
                class="category-image"
                alt="North Indian">

            <p>
                North Indian
            </p>

        </div>


        <div class="category">

            <img
                src="${pageContext.request.contextPath}/images/mtr.jpg"
                class="category-image"
                alt="Meals">

            <p>
                Meals
            </p>

        </div>


    </div>

</section>



<!-- =====================================================
     FOOD SAFETY & HYGIENE
===================================================== -->

<section class="hygiene-section">


    <div class="hygiene-header">

        <h2>
            🛡️ Food Safety & Hygiene
        </h2>


        <p>

            At FoodNinja, your safety comes first.
            We believe that great food should not only taste good,
            but should also be prepared, packed and delivered
            with proper hygiene and care.

        </p>

    </div>



    <div class="hygiene-cards">


        <!-- CARD 1 -->

        <div class="hygiene-card">

            <div class="hygiene-icon">
                🧼
            </div>

            <h3>
                Clean Food Preparation
            </h3>

            <p>

                Food should be prepared in clean and hygienic
                surroundings with proper handling practices.

            </p>

        </div>



        <!-- CARD 2 -->

        <div class="hygiene-card">

            <div class="hygiene-icon">
                🥗
            </div>

            <h3>
                Fresh Ingredients
            </h3>

            <p>

                Fresh and quality ingredients help ensure
                delicious meals and a better food experience.

            </p>

        </div>



        <!-- CARD 3 -->

        <div class="hygiene-card">

            <div class="hygiene-icon">
                📦
            </div>

            <h3>
                Hygienic Packaging
            </h3>

            <p>

                Orders should be packed securely and hygienically
                to help protect food during delivery.

            </p>

        </div>



        <!-- CARD 4 -->

        <div class="hygiene-card">

            <div class="hygiene-icon">
                🚴
            </div>

            <h3>
                Safe Delivery
            </h3>

            <p>

                Careful handling during delivery helps maintain
                food quality from the kitchen to your doorstep.

            </p>

        </div>


    </div>

</section>



<!-- =====================================================
     SAFETY PROMISE
===================================================== -->

<section class="safety-promise">


    <div class="safety-promise-content">

        <h2>
            Your Safety Matters to Us ❤️
        </h2>


        <p>

            FoodNinja is committed to creating a reliable food
            delivery experience where hygiene, cleanliness and
            food safety are given importance at every stage.
            From food preparation to packaging and delivery,
            we encourage responsible food handling practices.

        </p>

    </div>


    <div class="safety-badge">

        <div class="safety-badge-icon">
            🛡️
        </div>

        <strong>
            Food Safety First
        </strong>

    </div>


</section>



<!-- =====================================================
     FOOTER
===================================================== -->

<footer>

    <h2>
        FoodNinja
    </h2>


    <p>
        Delicious food delivered to your doorstep.
    </p>


    <p style="margin-top: 10px;">

        © 2026 FoodNinja. All rights reserved.

    </p>

</footer>



<!-- =====================================================
     JAVASCRIPT
===================================================== -->

<script>

    function toggleProfile() {

        const profileBox =
            document.getElementById("profileBox");

        profileBox.classList.toggle("show");
    }


    document.addEventListener(
        "click",
        function(event) {

            const profileContainer =
                document.querySelector(".profile-container");

            const profileBox =
                document.getElementById("profileBox");


            if (
                !profileContainer.contains(event.target)
            ) {

                profileBox.classList.remove("show");

            }

        }
    );

</script>


</body>

</html>