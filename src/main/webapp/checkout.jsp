<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Checkout - FoodNinja</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background:
                radial-gradient(
                    circle at top left,
                    rgba(255, 107, 53, 0.08),
                    transparent 35%
                ),
                radial-gradient(
                    circle at bottom right,
                    rgba(255, 107, 53, 0.06),
                    transparent 35%
                ),
                #0b0d12;

            color: white;
            min-height: 100vh;
        }

        /* =========================
           MAIN CONTAINER
        ========================= */

        .container {
            width: 92%;
            max-width: 1250px;
            margin: 35px auto 60px;
        }

        /* =========================
           HEADER
        ========================= */

        .heading {
            text-align: center;
            margin-bottom: 40px;
        }

        .heading h1 {
            font-size: 42px;
            font-weight: 800;
            color: #ff6b35;
            letter-spacing: 0.5px;

            text-shadow:
                0 0 20px rgba(255, 107, 53, 0.25);
        }

        .heading p {
            color: #8f939e;
            margin-top: 8px;
            font-size: 15px;
        }

        /* =========================
           CHECKOUT LAYOUT
        ========================= */

        .checkout-container {
            display: grid;
            grid-template-columns: 1.45fr 1fr;
            gap: 28px;
            align-items: start;
        }

        /* =========================
           COMMON CARD
        ========================= */

        .customer-section,
        .order-summary {
            background:
                linear-gradient(
                    145deg,
                    rgba(31, 35, 47, 0.96),
                    rgba(20, 23, 31, 0.98)
                );

            border: 1px solid #292d38;
            border-radius: 18px;

            box-shadow:
                0 15px 40px rgba(0, 0, 0, 0.45);

            position: relative;
            overflow: hidden;
        }

        .customer-section {
            padding: 32px;
        }

        .order-summary {
            padding: 28px;
            position: sticky;
            top: 20px;
        }

        /* =========================
           ORANGE TOP LINE
        ========================= */

        .customer-section::before,
        .order-summary::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;

            background:
                linear-gradient(
                    90deg,
                    transparent,
                    #ff6b35,
                    transparent
                );
        }

        /* =========================
           SECTION TITLE
        ========================= */

        .section-title,
        .order-title {
            font-size: 24px;
            font-weight: 700;
            color: white;
            margin-bottom: 27px;
            padding-bottom: 15px;

            border-bottom: 1px solid #30343f;

            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-title::before {
            content: "📍";
            font-size: 21px;
        }

        .order-title::before {
            content: "🛒";
            font-size: 21px;
        }

        .order-title {
            margin-bottom: 18px;
        }

        /* =========================
           FORM
        ========================= */

        .form-group {
            margin-bottom: 21px;
        }

        .form-group label {
            display: block;
            margin-bottom: 9px;
            color: #d8d9de;
            font-size: 14px;
            font-weight: 600;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 14px 16px;

            border: 1px solid #353946;
            border-radius: 10px;

            background: #171a22;
            color: white;

            outline: none;
            font-size: 15px;

            transition: 0.3s;
        }

        .form-group input:hover,
        .form-group textarea:hover {
            border-color: #555a68;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #ff6b35;

            box-shadow:
                0 0 0 3px rgba(255, 107, 53, 0.10);
        }

        .form-group textarea {
            height: 115px;
            resize: vertical;
            min-height: 90px;
            max-height: 180px;
        }

        .form-group input::placeholder,
        .form-group textarea::placeholder {
            color: #686c77;
        }

        /* =========================
           PAYMENT
        ========================= */

        .payment-title {
            font-size: 20px;
            font-weight: 700;

            margin-top: 30px;
            margin-bottom: 16px;

            color: white;

            display: flex;
            align-items: center;
            gap: 8px;
        }

        .payment-title::before {
            content: "💳";
        }

        .payment-options {
            display: grid;
            gap: 13px;
        }

        .payment-option {
            position: relative;
        }

        .payment-option input {
            display: none;
        }

        .payment-option label {
            display: flex;
            align-items: center;
            gap: 15px;

            padding: 16px;

            background:
                linear-gradient(
                    145deg,
                    #20242e,
                    #191c24
                );

            border: 1px solid #353946;
            border-radius: 12px;

            cursor: pointer;
            transition: all 0.3s ease;
        }

        .payment-option label:hover {
            transform: translateY(-2px);

            border-color: #ff6b35;

            box-shadow:
                0 7px 20px rgba(0, 0, 0, 0.25);
        }

        .payment-option input:checked + label {
            border-color: #ff6b35;

            background:
                linear-gradient(
                    145deg,
                    rgba(255, 107, 53, 0.15),
                    rgba(255, 107, 53, 0.04)
                );

            box-shadow:
                0 0 0 1px rgba(255, 107, 53, 0.15),
                0 8px 25px rgba(255, 107, 53, 0.08);
        }

        .payment-icon {
            width: 45px;
            height: 45px;
            min-width: 45px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #303440;
            border-radius: 10px;

            font-size: 21px;

            transition: 0.3s;
        }

        .payment-option input:checked + label .payment-icon {
            background: #ff6b35;
            transform: scale(1.05);
        }

        .payment-details {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .payment-name {
            font-weight: 700;
            color: white;
            font-size: 15px;
        }

        .payment-description {
            font-size: 12px;
            color: #858994;
        }

        /* =========================
           CART ITEM
        ========================= */

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;

            gap: 15px;
            padding: 16px 0;

            border-bottom: 1px solid #2c3039;

            transition: 0.25s;
        }

        .cart-item:hover {
            padding-left: 5px;
            padding-right: 5px;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-info {
            flex: 1;
        }

        .item-name {
            font-size: 16px;
            font-weight: 700;

            color: #f5f5f5;

            margin-bottom: 5px;
        }

        .item-details {
            color: #80848f;
            font-size: 13px;
        }

        .item-price {
            color: #ff6b35;

            font-weight: 700;
            font-size: 16px;

            white-space: nowrap;
        }

        /* =========================
           EMPTY CART
        ========================= */

        .empty-cart {
            text-align: center;
            padding: 30px 10px;

            color: #888;
            font-size: 15px;
        }

        /* =========================
           PRICE DETAILS
        ========================= */

        .price-details {
            margin-top: 18px;
            padding-top: 17px;

            border-top: 1px solid #363a45;
        }

        .price-row {
            display: flex;
            justify-content: space-between;

            padding: 8px 0;

            color: #9b9ea8;
            font-size: 14px;
        }

        .price-row span:last-child {
            color: #d7d8dc;
            font-weight: 500;
        }

        .delivery-free {
            color: #4caf50 !important;
            font-weight: 700 !important;
        }

        /* =========================
           TOTAL
        ========================= */

        .total-row {
            display: flex;
            justify-content: space-between;
            align-items: center;

            border-top: 1px solid #424651;

            margin-top: 12px;
            padding-top: 19px;

            font-size: 22px;
            font-weight: 800;

            color: white;
        }

        .grand-total {
            color: #ff6b35;
            font-size: 25px;

            text-shadow:
                0 0 15px rgba(255, 107, 53, 0.18);
        }

        /* =========================
           BUTTONS
        ========================= */

        .action-buttons {
            display: flex;
            gap: 12px;
            margin-top: 25px;
        }

        .back-btn,
        .place-order-btn {
            text-decoration: none;

            padding: 14px 18px;

            border-radius: 10px;

            font-weight: 700;
            text-align: center;

            cursor: pointer;

            border: none;

            font-size: 14px;

            transition: all 0.3s ease;
        }

        .back-btn {
            flex: 1;

            background: #303440;
            color: white;
        }

        .back-btn:hover {
            background: #3c404c;
            transform: translateY(-2px);
        }

        .place-order-btn {
            flex: 2;

            background:
                linear-gradient(
                    135deg,
                    #ff7b47,
                    #ff5b24
                );

            color: white;

            box-shadow:
                0 8px 20px rgba(255, 107, 53, 0.22);
        }

        .place-order-btn:hover {
            background:
                linear-gradient(
                    135deg,
                    #ff8b5c,
                    #ff6b35
                );

            transform: translateY(-2px);

            box-shadow:
                0 12px 28px rgba(255, 107, 53, 0.32);
        }

        /* =========================
           SECURITY
        ========================= */

        .secure-message {
            text-align: center;

            color: #666a75;

            font-size: 12px;

            margin-top: 17px;
            padding-top: 13px;

            border-top: 1px solid #292d36;
        }

        /* =========================
           BADGE
        ========================= */

        .order-badge {
            display: inline-block;

            background: rgba(76, 175, 80, 0.1);
            color: #4caf50;

            border: 1px solid rgba(76, 175, 80, 0.2);

            padding: 5px 9px;

            border-radius: 20px;

            font-size: 11px;

            margin-bottom: 12px;
        }

        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 900px) {

            .checkout-container {
                grid-template-columns: 1fr;
            }

            .order-summary {
                position: static;
            }
        }

        @media (max-width: 600px) {

            .container {
                width: 94%;
                margin: 25px auto 40px;
            }

            .heading h1 {
                font-size: 32px;
            }

            .customer-section,
            .order-summary {
                padding: 21px;
            }

            .action-buttons {
                flex-direction: column;
            }

            .back-btn,
            .place-order-btn {
                width: 100%;
            }

            .payment-description {
                font-size: 11px;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <!-- =========================
         PAGE HEADING
    ========================= -->

    <div class="heading">

        <h1>Checkout</h1>

        <p>
            Complete your order and enjoy your delicious food 🍽️
        </p>

    </div>

    <!-- =========================
         CHECKOUT FORM
    ========================= -->

    <form
        action="${pageContext.request.contextPath}/checkoutServlet"
        method="post">

        <div class="checkout-container">

            <!-- =========================
                 LEFT SIDE
            ========================= -->

            <div class="customer-section">

                <div class="section-title">
                    Delivery Information
                </div>

                <!-- NAME -->

                <div class="form-group">

                    <label for="name">
                        Full Name
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter your full name"
                        required>

                </div>

                <!-- PHONE -->

                <div class="form-group">

                    <label for="phone">
                        Phone Number
                    </label>

                    <input
                        type="tel"
                        id="phone"
                        name="phone"
                        placeholder="Enter your 10-digit phone number"
                        maxlength="10"
                        pattern="[0-9]{10}"
                        required>

                </div>

                <!-- ADDRESS -->

                <div class="form-group">

                    <label for="address">
                        Delivery Address
                    </label>

                    <textarea
                        id="address"
                        name="address"
                        placeholder="House No, Street, Area, City, State, Pincode"
                        required></textarea>

                </div>

                <!-- =========================
                     PAYMENT
                ========================= -->

                <div class="payment-title">
                    Payment Method
                </div>

                <div class="payment-options">

                    <!-- UPI -->

                    <div class="payment-option">

                        <input
                            type="radio"
                            id="upi"
                            name="paymentMode"
                            value="UPI"
                            required>

                        <label for="upi">

                            <div class="payment-icon">
                                📱
                            </div>

                            <div class="payment-details">

                                <span class="payment-name">
                                    UPI
                                </span>

                                <span class="payment-description">
                                    Google Pay, PhonePe, Paytm and more
                                </span>

                            </div>

                        </label>

                    </div>

                    <!-- CASH -->

                    <div class="payment-option">

                        <input
                            type="radio"
                            id="cash"
                            name="paymentMode"
                            value="Cash">

                        <label for="cash">

                            <div class="payment-icon">
                                💵
                            </div>

                            <div class="payment-details">

                                <span class="payment-name">
                                    Cash on Delivery
                                </span>

                                <span class="payment-description">
                                    Pay when your order arrives
                                </span>

                            </div>

                        </label>

                    </div>

                    <!-- CARD -->

                    <div class="payment-option">

                        <input
                            type="radio"
                            id="card"
                            name="paymentMode"
                            value="Card">

                        <label for="card">

                            <div class="payment-icon">
                                💳
                            </div>

                            <div class="payment-details">

                                <span class="payment-name">
                                    Card Payment
                                </span>

                                <span class="payment-description">
                                    Debit Card or Credit Card
                                </span>

                            </div>

                        </label>

                    </div>

                </div>

            </div>

            <!-- =========================
                 RIGHT SIDE
            ========================= -->

            <div class="order-summary">

                <span class="order-badge">
                    ✓ Order Ready
                </span>

                <div class="order-title">
                    Your Order
                </div>

                <!-- =========================
                     CART CALCULATION
                ========================= -->

                <%

                    Cart cart =
                        (Cart) session.getAttribute("cart");

                    double subTotal = 0.0;
                    double dc = 0.0;
                    double gst = 0.0;
                    double grandTotal = 0.0;

                    boolean hasItems =
                        cart != null
                        && cart.getItem() != null
                        && !cart.getItem().isEmpty();

                    if (hasItems) {

                        for (CartItem item :
                                cart.getItem().values()) {

                            double itemTotal =
                                item.getPrice() * item.getQty();

                            subTotal =
                                subTotal + itemTotal;
                        }

                        // Delivery charge
                        dc = 40.0;

                        // GST 5%
                        gst = subTotal * 0.05;

                        // Grand Total
                        grandTotal =
                            subTotal + dc + gst;

                        // Store grand total in session
                        session.setAttribute(
                            "grandTotal",
                            grandTotal
                        );

                    } else {

                        // Empty cart
                        session.setAttribute(
                            "grandTotal",
                            0.0
                        );
                    }

                %>

                <!-- =========================
                     CART ITEMS
                ========================= -->

                <%

                    if (hasItems) {

                        for (CartItem item :
                                cart.getItem().values()) {

                            double itemTotal =
                                item.getPrice() * item.getQty();

                %>

                <div class="cart-item">

                    <div class="item-info">

                        <div class="item-name">

                            <%= item.getName() %>

                        </div>

                        <div class="item-details">

                            ₹<%= String.format(
                                    "%.2f",
                                    item.getPrice()) %>

                            ×

                            <%= item.getQty() %>

                        </div>

                    </div>

                    <div class="item-price">

                        ₹<%= String.format(
                                "%.2f",
                                itemTotal) %>

                    </div>

                </div>

                <%

                        }

                    } else {

                %>

                <div class="empty-cart">

                    🛒 Your cart is empty.

                </div>

                <%

                    }

                %>

                <!-- =========================
                     PRICE DETAILS
                ========================= -->

                <div class="price-details">

                    <!-- SUBTOTAL -->

                    <div class="price-row">

                        <span>
                            Sub Total
                        </span>

                        <span>

                            ₹<%= String.format(
                                    "%.2f",
                                    subTotal) %>

                        </span>

                    </div>

                    <!-- DELIVERY -->

                    <div class="price-row">

                        <span>
                            Delivery Charges
                        </span>

                        <span class="delivery-free">

                            ₹<%= String.format(
                                    "%.2f",
                                    dc) %>

                        </span>

                    </div>

                    <!-- GST -->

                    <div class="price-row">

                        <span>
                            GST (5%)
                        </span>

                        <span>

                            ₹<%= String.format(
                                    "%.2f",
                                    gst) %>

                        </span>

                    </div>

                    <!-- TOTAL -->

                    <div class="total-row">

                        <span>
                            Total
                        </span>

                        <span class="grand-total">

                            ₹<%= String.format(
                                    "%.2f",
                                    grandTotal) %>

                        </span>

                    </div>

                </div>

                <!-- =========================
                     BUTTONS
                ========================= -->

                <div class="action-buttons">

                    <a
                        href="${pageContext.request.contextPath}/cart.jsp"
                        class="back-btn">

                        ← Back to Cart

                    </a>

                    <!-- CHECKOUT SERVLET -->

                    <button
                        type="submit"
                        class="place-order-btn">

                        Place Order →

                    </button>

                </div>

                <div class="secure-message">

                    🔒 Secure checkout • Your information is protected

                </div>

            </div>

        </div>

    </form>

</div>

</body>

</html>