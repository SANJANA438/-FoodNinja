<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Your Cart | FoodNinja</title>

<style>

/* =========================================================
   RESET
========================================================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


/* =========================================================
   BODY
========================================================= */

body {

    font-family: 'Segoe UI', Arial, Helvetica, sans-serif;

    color: #ffffff;

    min-height: 100vh;

    overflow-x: hidden;

    position: relative;

    background:
        radial-gradient(
            circle at 10% 10%,
            rgba(255, 107, 53, 0.18),
            transparent 28%
        ),
        radial-gradient(
            circle at 90% 80%,
            rgba(255, 80, 30, 0.14),
            transparent 30%
        ),
        linear-gradient(
            135deg,
            #050505,
            #0b0d12,
            #070707
        );
}


/* =========================================================
   BACKGROUND ORANGE GLOW
========================================================= */

body::before {

    content: "";

    position: fixed;

    width: 420px;
    height: 420px;

    border-radius: 50%;

    background: rgba(255, 107, 53, 0.08);

    filter: blur(90px);

    top: -160px;
    left: -150px;

    animation:
        backgroundFloat 9s ease-in-out infinite;

    pointer-events: none;

    z-index: -1;
}


body::after {

    content: "";

    position: fixed;

    width: 380px;
    height: 380px;

    border-radius: 50%;

    background: rgba(255, 80, 30, 0.07);

    filter: blur(90px);

    right: -140px;
    bottom: -120px;

    animation:
        backgroundFloat2 11s ease-in-out infinite;

    pointer-events: none;

    z-index: -1;
}


@keyframes backgroundFloat {

    0%,
    100% {
        transform: translate(0, 0) scale(1);
    }

    50% {
        transform: translate(100px, 80px) scale(1.25);
    }
}


@keyframes backgroundFloat2 {

    0%,
    100% {
        transform: translate(0, 0) scale(1);
    }

    50% {
        transform: translate(-90px, -70px) scale(1.2);
    }
}


/* =========================================================
   MAIN CONTAINER
========================================================= */

.container {

    width: 92%;

    max-width: 1150px;

    margin: 55px auto 80px;

    animation: pageEnter 0.8s ease forwards;
}


@keyframes pageEnter {

    from {

        opacity: 0;

        transform:
            translateY(35px)
            scale(0.98);
    }

    to {

        opacity: 1;

        transform:
            translateY(0)
            scale(1);
    }
}


/* =========================================================
   HEADING
========================================================= */

.heading {

    text-align: center;

    margin-bottom: 42px;

    position: relative;
}


.heading h1 {

    font-size: 46px;

    font-weight: 800;

    letter-spacing: 1px;

    color: #ff6b35;

    text-shadow:
        0 0 10px rgba(255, 107, 53, 0.25),
        0 0 25px rgba(255, 107, 53, 0.15);

    animation:
        headingGlow 2.5s ease-in-out infinite alternate;
}


.heading h1::before {

    content: "🛒";

    display: inline-block;

    margin-right: 13px;

    font-size: 38px;

    animation:
        cartBounce 2s ease-in-out infinite;
}


@keyframes headingGlow {

    from {

        text-shadow:
            0 0 8px rgba(255, 107, 53, 0.15);
    }

    to {

        text-shadow:
            0 0 18px rgba(255, 107, 53, 0.5),
            0 0 38px rgba(255, 107, 53, 0.2);
    }
}


@keyframes cartBounce {

    0%,
    100% {
        transform:
            translateY(0)
            rotate(0deg);
    }

    50% {
        transform:
            translateY(-8px)
            rotate(-7deg);
    }
}


.heading p {

    margin-top: 10px;

    color: #999;

    font-size: 15px;

    letter-spacing: 0.3px;
}


/* =========================================================
   CART CONTAINER
========================================================= */

.cart-container {

    position: relative;

    padding: 30px;

    border-radius: 24px;

    background:
        linear-gradient(
            145deg,
            rgba(28, 31, 40, 0.97),
            rgba(12, 14, 19, 0.98)
        );

    border: 1px solid rgba(255, 107, 53, 0.10);

    box-shadow:

        0 30px 70px rgba(0, 0, 0, 0.65),

        0 0 35px rgba(255, 107, 53, 0.05),

        inset 0 1px rgba(255, 255, 255, 0.04);

    backdrop-filter: blur(14px);

    overflow: hidden;
}


/* =========================================================
   MOVING ORANGE LIGHT
========================================================= */

.cart-container::before {

    content: "";

    position: absolute;

    top: 0;

    left: -40%;

    width: 35%;

    height: 2px;

    background:
        linear-gradient(
            90deg,
            transparent,
            #ff4f1f,
            #ff8a65,
            #ff4f1f,
            transparent
        );

    box-shadow:
        0 0 15px #ff6b35,
        0 0 30px rgba(255, 107, 53, 0.6);

    animation:
        lightScan 4s linear infinite;

    z-index: 2;
}


@keyframes lightScan {

    0% {
        left: -40%;
    }

    100% {
        left: 140%;
    }
}


/* =========================================================
   CART ITEM
========================================================= */

.cart-item {

    position: relative;

    display: grid;

    grid-template-columns:
        2fr 1fr 1fr auto;

    align-items: center;

    gap: 22px;

    padding: 22px;

    margin-bottom: 17px;

    border-radius: 17px;

    background:
        linear-gradient(
            135deg,
            #252933,
            #191c24
        );

    border: 1px solid rgba(255, 255, 255, 0.055);

    box-shadow:
        0 10px 25px rgba(0, 0, 0, 0.25);

    transition:
        transform 0.4s ease,
        box-shadow 0.4s ease,
        border-color 0.4s ease,
        background 0.4s ease;

    animation:
        itemAppear 0.7s ease both;

    overflow: hidden;
}


/* ITEM DELAY */

.cart-item:nth-child(1) {
    animation-delay: 0.1s;
}

.cart-item:nth-child(2) {
    animation-delay: 0.2s;
}

.cart-item:nth-child(3) {
    animation-delay: 0.3s;
}

.cart-item:nth-child(4) {
    animation-delay: 0.4s;
}

.cart-item:nth-child(5) {
    animation-delay: 0.5s;
}


@keyframes itemAppear {

    from {

        opacity: 0;

        transform:
            translateX(-40px)
            scale(0.96);
    }

    to {

        opacity: 1;

        transform:
            translateX(0)
            scale(1);
    }
}


/* =========================================================
   LEFT ORANGE BORDER
========================================================= */

.cart-item::before {

    content: "";

    position: absolute;

    left: 0;

    top: 0;

    width: 4px;

    height: 100%;

    background:
        linear-gradient(
            180deg,
            #ff9a76,
            #ff6b35,
            #ff3d00
        );

    transform:
        scaleY(0);

    transform-origin: bottom;

    transition:
        transform 0.4s ease;

    box-shadow:
        0 0 15px rgba(255, 107, 53, 0.8);
}


.cart-item:hover::before {

    transform: scaleY(1);
}


/* =========================================================
   ITEM HOVER
========================================================= */

.cart-item:hover {

    transform:
        translateY(-7px)
        scale(1.012);

    border-color:
        rgba(255, 107, 53, 0.35);

    background:
        linear-gradient(
            135deg,
            #2b303a,
            #1b1e27
        );

    box-shadow:

        0 18px 40px rgba(0, 0, 0, 0.55),

        0 0 25px rgba(255, 107, 53, 0.10),

        inset 0 0 25px rgba(255, 107, 53, 0.025);
}


/* =========================================================
   FOOD INFO
========================================================= */

.food-info {

    min-width: 0;
}


.item-name {

    font-size: 20px;

    font-weight: 700;

    color: #ffffff;

    margin-bottom: 7px;

    word-break: break-word;

    transition:
        color 0.3s ease,
        transform 0.3s ease;
}


.cart-item:hover .item-name {

    color: #ff8055;

    transform:
        translateX(5px);
}


.item-price {

    color: #999;

    font-size: 14px;

    transition:
        color 0.3s ease;
}


.cart-item:hover .item-price {

    color: #c2c2c2;
}


/* =========================================================
   QUANTITY
========================================================= */

.quantity-box {

    display: flex;

    align-items: center;

    justify-content: center;

    gap: 10px;
}


.quantity-box form {

    margin: 0;
}


.quantity-box button {

    width: 40px;

    height: 40px;

    border: none;

    border-radius: 11px;

    background:
        linear-gradient(
            135deg,
            #ff6b35,
            #ff4f1f
        );

    color: #ffffff;

    font-size: 22px;

    font-weight: bold;

    cursor: pointer;

    box-shadow:
        0 5px 14px rgba(255, 107, 53, 0.20);

    transition:
        transform 0.25s ease,
        box-shadow 0.25s ease,
        filter 0.25s ease;
}


.quantity-box button:hover {

    transform:
        translateY(-4px)
        scale(1.1)
        rotate(3deg);

    filter: brightness(1.15);

    box-shadow:

        0 9px 22px rgba(255, 107, 53, 0.4),

        0 0 15px rgba(255, 107, 53, 0.2);
}


.quantity-box button:active {

    transform:
        scale(0.88);
}


.quantity-box span {

    min-width: 40px;

    text-align: center;

    font-size: 18px;

    font-weight: 800;

    color: #ffffff;

    padding: 9px 5px;

    border-radius: 9px;

    background:
        rgba(255, 255, 255, 0.045);

    border:
        1px solid rgba(255, 255, 255, 0.05);

    transition:
        transform 0.3s ease,
        background 0.3s ease,
        color 0.3s ease;
}


.cart-item:hover .quantity-box span {

    background:
        rgba(255, 107, 53, 0.10);

    color: #ff8b66;

    transform:
        scale(1.08);
}


/* =========================================================
   ITEM TOTAL
========================================================= */

.item-total {

    font-size: 19px;

    font-weight: 800;

    color: #ff6b35;

    white-space: nowrap;

    transition:
        transform 0.3s ease,
        text-shadow 0.3s ease;
}


.cart-item:hover .item-total {

    transform:
        scale(1.10);

    text-shadow:
        0 0 12px rgba(255, 107, 53, 0.5),
        0 0 25px rgba(255, 107, 53, 0.2);
}


/* =========================================================
   REMOVE BUTTON
========================================================= */

.remove-section {

    text-align: right;
}


.remove-btn {

    border:
        1px solid rgba(255, 80, 95, 0.25);

    background:
        rgba(220, 53, 69, 0.10);

    color: #ff6878;

    padding:
        10px 16px;

    border-radius: 9px;

    cursor: pointer;

    font-weight: 600;

    transition:
        transform 0.25s ease,
        background 0.25s ease,
        color 0.25s ease,
        box-shadow 0.25s ease;
}


.remove-btn:hover {

    background:
        linear-gradient(
            135deg,
            #ff4757,
            #dc3545
        );

    color: #ffffff;

    transform:
        translateY(-3px)
        scale(1.05);

    box-shadow:
        0 9px 22px rgba(220, 53, 69, 0.35);
}


.remove-btn:active {

    transform:
        scale(0.92);
}


/* =========================================================
   SUMMARY
========================================================= */

.summary {

    position: relative;

    margin-top: 30px;

    padding: 27px;

    border-radius: 18px;

    background:
        linear-gradient(
            135deg,
            #272b35,
            #181b22
        );

    border:
        1px solid rgba(255, 107, 53, 0.08);

    box-shadow:
        0 18px 40px rgba(0, 0, 0, 0.4);

    animation:
        summaryAppear 0.8s ease;

    overflow: hidden;
}


.summary::before {

    content: "";

    position: absolute;

    width: 180px;

    height: 180px;

    border-radius: 50%;

    background:
        rgba(255, 107, 53, 0.05);

    filter: blur(50px);

    right: -80px;

    top: -80px;

    animation:
        summaryGlow 5s ease-in-out infinite;
}


@keyframes summaryGlow {

    0%,
    100% {
        transform: scale(1);
    }

    50% {
        transform: scale(1.4);
    }
}


@keyframes summaryAppear {

    from {

        opacity: 0;

        transform:
            translateY(25px);
    }

    to {

        opacity: 1;

        transform:
            translateY(0);
    }
}


.summary-row {

    position: relative;

    z-index: 1;

    display: flex;

    justify-content: space-between;

    align-items: center;

    padding: 10px 0;

    color: #cccccc;

    font-size: 16px;
}


.summary-row.total {

    border-top:
        1px solid #3d414a;

    margin-top: 12px;

    padding-top: 20px;

    font-size: 24px;

    font-weight: 800;

    color: #ffffff;
}


.total-price {

    color: #ff6b35;

    font-size: 28px;

    text-shadow:
        0 0 12px rgba(255, 107, 53, 0.25);

    animation:
        pricePulse 2s ease-in-out infinite;
}


@keyframes pricePulse {

    0%,
    100% {

        text-shadow:
            0 0 8px rgba(255, 107, 53, 0.15);

        transform: scale(1);
    }

    50% {

        text-shadow:
            0 0 20px rgba(255, 107, 53, 0.5),
            0 0 35px rgba(255, 107, 53, 0.2);

        transform: scale(1.04);
    }
}


/* =========================================================
   BUTTON AREA
========================================================= */

.buttons {

    display: flex;

    justify-content: flex-end;

    gap: 15px;

    margin-top: 28px;

    position: relative;

    z-index: 2;
}


.add-more-btn,
.checkout-btn {

    position: relative;

    display: inline-block;

    text-decoration: none;

    padding:
        14px 25px;

    border-radius: 11px;

    font-weight: 700;

    overflow: hidden;

    transition:
        transform 0.3s ease,
        box-shadow 0.3s ease;
}


/* =========================================================
   BUTTON LIGHT SWEEP
========================================================= */

.add-more-btn::before,
.checkout-btn::before {

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
            rgba(255, 255, 255, 0.20),
            transparent
        );

    transform:
        skewX(-20deg);

    transition:
        left 0.6s ease;
}


.add-more-btn:hover::before,
.checkout-btn:hover::before {

    left: 140%;
}


/* =========================================================
   ADD MORE
========================================================= */

.add-more-btn {

    background:
        linear-gradient(
            135deg,
            #30343f,
            #242832
        );

    color: #ffffff;

    border:
        1px solid #414653;

    box-shadow:
        0 7px 18px rgba(0, 0, 0, 0.25);
}


.add-more-btn:hover {

    background:
        linear-gradient(
            135deg,
            #3b404c,
            #292e38
        );

    transform:
        translateY(-5px)
        scale(1.02);

    box-shadow:
        0 12px 28px rgba(0, 0, 0, 0.4),
        0 0 15px rgba(255, 107, 53, 0.05);
}


/* =========================================================
   CHECKOUT
========================================================= */

.checkout-btn {

    background:
        linear-gradient(
            135deg,
            #ff733d,
            #ff4f1f,
            #ff3d00
        );

    color: #ffffff;

    border:
        1px solid rgba(255, 170, 130, 0.25);

    box-shadow:
        0 8px 22px rgba(255, 107, 53, 0.25);
}


.checkout-btn:hover {

    transform:
        translateY(-5px)
        scale(1.035);

    box-shadow:

        0 14px 32px rgba(255, 107, 53, 0.4),

        0 0 25px rgba(255, 107, 53, 0.18);
}


.checkout-btn:active,
.add-more-btn:active {

    transform:
        scale(0.95);
}


/* =========================================================
   EMPTY CART
========================================================= */

.empty-cart {

    position: relative;

    text-align: center;

    padding:
        95px 25px;

    background:
        linear-gradient(
            135deg,
            #1c2029,
            #111319
        );

    border-radius: 23px;

    border:
        1px solid rgba(255, 107, 53, 0.08);

    box-shadow:
        0 25px 60px rgba(0, 0, 0, 0.55),
        0 0 25px rgba(255, 107, 53, 0.04);

    overflow: hidden;

    animation:
        emptyAppear 0.8s ease;
}


.empty-cart::after {

    content: "";

    position: absolute;

    width: 250px;

    height: 250px;

    border-radius: 50%;

    background:
        rgba(255, 107, 53, 0.05);

    filter: blur(60px);

    left: 50%;

    top: 20%;

    transform: translateX(-50%);

    animation:
        emptyGlow 4s ease-in-out infinite;
}


@keyframes emptyGlow {

    0%,
    100% {
        opacity: 0.5;
        transform:
            translateX(-50%)
            scale(1);
    }

    50% {
        opacity: 1;
        transform:
            translateX(-50%)
            scale(1.3);
    }
}


@keyframes emptyAppear {

    from {

        opacity: 0;

        transform:
            scale(0.94);
    }

    to {

        opacity: 1;

        transform:
            scale(1);
    }
}


.empty-cart::before {

    content: "🛒";

    position: relative;

    z-index: 2;

    display: block;

    font-size: 70px;

    margin-bottom: 20px;

    animation:
        emptyCartFloat 2.5s ease-in-out infinite;
}


@keyframes emptyCartFloat {

    0%,
    100% {
        transform:
            translateY(0)
            rotate(0deg);
    }

    50% {
        transform:
            translateY(-14px)
            rotate(-5deg);
    }
}


.empty-cart h2 {

    position: relative;

    z-index: 2;

    font-size: 32px;

    margin-bottom: 12px;

    color: #ffffff;
}


.empty-cart p {

    position: relative;

    z-index: 2;

    color: #999;

    margin-bottom: 30px;

    font-size: 15px;
}


.empty-cart .checkout-btn {

    position: relative;

    z-index: 3;

    display: inline-block;
}


/* =========================================================
   TABLET
========================================================= */

@media (max-width: 850px) {

    .cart-item {

        grid-template-columns:
            1fr 1fr;

        gap: 18px;
    }


    .food-info {

        grid-column:
            1 / -1;
    }


    .quantity-box {

        justify-content:
            flex-start;
    }


    .remove-section {

        text-align:
            right;
    }
}


/* =========================================================
   MOBILE
========================================================= */

@media (max-width: 600px) {

    .container {

        width: 94%;

        margin:
            30px auto 50px;
    }


    .heading {

        margin-bottom:
            30px;
    }


    .heading h1 {

        font-size:
            32px;
    }


    .heading h1::before {

        font-size:
            28px;

        margin-right:
            7px;
    }


    .cart-container {

        padding:
            15px;

        border-radius:
            18px;
    }


    .cart-item {

        grid-template-columns:
            1fr;

        text-align:
            center;

        padding:
            22px 15px;

        gap:
            15px;
    }


    .food-info {

        grid-column:
            auto;
    }


    .quantity-box {

        justify-content:
            center;
    }


    .item-total {

        text-align:
            center;

        font-size:
            21px;
    }


    .remove-section {

        text-align:
            center;
    }


    .summary {

        padding:
            20px;

        border-radius:
            15px;
    }


    .summary-row.total {

        font-size:
            21px;
    }


    .total-price {

        font-size:
            23px;
    }


    .buttons {

        flex-direction:
            column;

        gap:
            12px;
    }


    .add-more-btn,
    .checkout-btn {

        width:
            100%;

        text-align:
            center;
    }
}


/* =========================================================
   SMALL MOBILE
========================================================= */

@media (max-width: 400px) {

    .heading h1 {

        font-size:
            28px;
    }


    .heading h1::before {

        font-size:
            23px;
    }


    .item-name {

        font-size:
            18px;
    }


    .quantity-box button {

        width:
            35px;

        height:
            35px;
    }


    .empty-cart {

        padding:
            70px 15px;
    }


    .empty-cart::before {

        font-size:
            55px;
    }


    .empty-cart h2 {

        font-size:
            25px;
    }
}


/* =========================================================
   REDUCE MOTION FOR ACCESSIBILITY
========================================================= */

@media (prefers-reduced-motion: reduce) {

    *,
    *::before,
    *::after {

        animation-duration:
            0.01ms !important;

        animation-iteration-count:
            1 !important;

        scroll-behavior:
            auto !important;

        transition-duration:
            0.01ms !important;
    }
}

</style>

</head>


<body>

<div class="container">


<!-- =====================================================
     CART HEADING
===================================================== -->

<div class="heading">

    <h1>Your Cart</h1>

    <p>
        Review your selected food items
    </p>

</div>


<%

/* =====================================================
   GET CART FROM SESSION
===================================================== */

Cart cart =
    (Cart) session.getAttribute("cart");


/* =====================================================
   GET RESTAURANT ID
===================================================== */

Integer restaurantID =
    (Integer) session.getAttribute("restaurantID");


/* =====================================================
   CHECK CART
===================================================== */

if (cart != null
        && cart.getItem() != null
        && !cart.getItem().isEmpty()) {

%>


<!-- =====================================================
     CART CONTAINER
===================================================== -->

<div class="cart-container">

<%

    double grandTotal = 0;


    /* =================================================
       LOOP THROUGH CART ITEMS
    ================================================= */

    for (CartItem item : cart.getItem().values()) {

        double totalPrice =
            item.getPrice() * item.getQty();

        grandTotal =
            grandTotal + totalPrice;

%>


<!-- =================================================
     SINGLE CART ITEM
================================================= -->

<div class="cart-item">


    <!-- FOOD INFORMATION -->

    <div class="food-info">

        <div class="item-name">

            <%= item.getName() %>

        </div>


        <div class="item-price">

            ₹<%= item.getPrice() %> per item

        </div>

    </div>


    <!-- =================================================
         QUANTITY
    ================================================= -->

    <div class="quantity-box">


        <!-- MINUS -->

        <form action="cartServlet"
              method="post">

            <input type="hidden"
                   name="menuID"
                   value="<%= item.getMenuID() %>">


            <input type="hidden"
                   name="restaurantID"
                   value="<%= item.getRestaurantID() %>">


            <input type="hidden"
                   name="action"
                   value="update">


            <input type="hidden"
                   name="qty"
                   value="<%= item.getQty() - 1 %>">


            <button type="submit">

                −

            </button>

        </form>


        <!-- CURRENT QUANTITY -->

        <span>

            <%= item.getQty() %>

        </span>


        <!-- PLUS -->

        <form action="cartServlet"
              method="post">

            <input type="hidden"
                   name="menuID"
                   value="<%= item.getMenuID() %>">


            <input type="hidden"
                   name="restaurantID"
                   value="<%= item.getRestaurantID() %>">


            <input type="hidden"
                   name="action"
                   value="update">


            <input type="hidden"
                   name="qty"
                   value="<%= item.getQty() + 1 %>">


            <button type="submit">

                +

            </button>

        </form>

    </div>


    <!-- =================================================
         ITEM TOTAL
    ================================================= -->

    <div class="item-total">

        ₹<%= totalPrice %>

    </div>


    <!-- =================================================
         REMOVE ITEM
    ================================================= -->

    <div class="remove-section">

        <form action="cartServlet"
              method="post">

            <input type="hidden"
                   name="menuID"
                   value="<%= item.getMenuID() %>">


            <input type="hidden"
                   name="restaurantID"
                   value="<%= item.getRestaurantID() %>">


            <input type="hidden"
                   name="action"
                   value="remove">


            <button type="submit"
                    class="remove-btn">

                Remove

            </button>

        </form>

    </div>


</div>


<%

    }

%>


<!-- =================================================
     ORDER SUMMARY
================================================= -->

<div class="summary">


    <!-- SUB TOTAL -->

    <div class="summary-row">

        <span>
            Sub Total
        </span>

        <span>
            ₹<%= grandTotal %>
        </span>

    </div>


    <!-- TOTAL -->

    <div class="summary-row total">

        <span>
            Total
        </span>

        <span class="total-price">
            ₹<%= grandTotal %>
        </span>

    </div>


    <!-- =================================================
         ACTION BUTTONS
    ================================================= -->

    <div class="buttons">


        <!-- ADD MORE ITEMS -->

        <a class="add-more-btn"
           href="menu?restaurantID=<%= restaurantID %>">

            🍴 Add More Items

        </a>


        <!-- PROCEED TO CHECKOUT -->

        <a class="checkout-btn"
           href="checkout.jsp">

            Proceed to Checkout →

        </a>

    </div>


</div>


</div>


<%

}

else {

%>


<!-- =====================================================
     EMPTY CART
===================================================== -->

<div class="empty-cart">


    <h2>

        Your cart is empty

    </h2>


    <p>

        Please add some delicious food items from the menu.

    </p>


    <a class="checkout-btn"
       href="restaurant.jsp">

        🍴 Browse Restaurants

    </a>


</div>


<%

}

%>


</div>

</body>

</html>