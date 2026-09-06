
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.OrderTable" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>FoodNinja - My Orders</title>


    <style>

        /* =====================================================
           RESET
        ===================================================== */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        /* =====================================================
           BODY
        ===================================================== */

        body {
            font-family: "Segoe UI", Arial, sans-serif;

            min-height: 100vh;

            color: #ffffff;

            background:
                radial-gradient(
                    circle at 10% 0%,
                    rgba(255, 100, 34, 0.12),
                    transparent 28%
                ),
                radial-gradient(
                    circle at 90% 100%,
                    rgba(255, 100, 34, 0.08),
                    transparent 30%
                ),
                #080808;
        }


        /* =====================================================
           NAVBAR
        ===================================================== */

        .navbar {
            height: 68px;

            width: 100%;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 5%;

            background: rgba(15, 15, 15, 0.96);

            border-bottom: 1px solid #292929;

            position: sticky;

            top: 0;

            z-index: 1000;

            backdrop-filter: blur(10px);
        }


        /* =====================================================
           LOGO
        ===================================================== */

        .logo {
            font-size: 23px;

            font-weight: 800;

            letter-spacing: -0.5px;

            white-space: nowrap;
        }

        .logo span {
            color: #ff6422;
        }


        /* =====================================================
           NAVIGATION
        ===================================================== */

        .nav-links {
            display: flex;

            align-items: center;

            gap: 8px;
        }

        .nav-links a {
            text-decoration: none;

            color: #eeeeee;

            background: #181818;

            border: 1px solid #2c2c2c;

            padding: 8px 13px;

            border-radius: 8px;

            font-size: 12px;

            font-weight: 600;

            transition: all 0.3s ease;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: #ffffff;

            background:
                linear-gradient(
                    135deg,
                    #ff6422,
                    #ff7b17
                );

            border-color: #ff6422;

            transform: translateY(-2px);

            box-shadow:
                0 6px 18px rgba(255, 100, 34, 0.25);
        }


        /* =====================================================
           PAGE HEADER
        ===================================================== */

        .page-header {
            width: 90%;

            max-width: 1100px;

            margin: 38px auto 25px;

            display: flex;

            justify-content: space-between;

            align-items: center;
        }


        .page-heading h1 {
            font-size: 32px;

            font-weight: 800;

            margin-bottom: 5px;
        }


        .page-heading h1 span {
            color: #ff6422;
        }


        .page-heading p {
            color: #777777;

            font-size: 13px;
        }


        /* =====================================================
           BACK HOME BUTTON
        ===================================================== */

        .back-btn {
            text-decoration: none;

            color: #ffffff;

            background: #181818;

            border: 1px solid #333333;

            padding: 10px 17px;

            border-radius: 9px;

            font-size: 12px;

            font-weight: 600;

            transition: all 0.3s ease;
        }


        .back-btn:hover {
            background: #ff6422;

            border-color: #ff6422;

            transform: translateY(-2px);

            box-shadow:
                0 7px 20px rgba(255, 100, 34, 0.25);
        }


        /* =====================================================
           MAIN CONTAINER
        ===================================================== */

        .container {
            width: 90%;

            max-width: 1100px;

            margin: 0 auto 70px;
        }


        /* =====================================================
           ORDER SUMMARY
        ===================================================== */

        .summary-bar {
            display: flex;

            align-items: center;

            justify-content: space-between;

            background:
                linear-gradient(
                    145deg,
                    #171717,
                    #101010
                );

            border: 1px solid #292929;

            border-radius: 14px;

            padding: 17px 20px;

            margin-bottom: 20px;
        }


        .summary-left {
            display: flex;

            align-items: center;

            gap: 12px;
        }


        .summary-icon {
            width: 40px;

            height: 40px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 10px;

            background: rgba(255, 100, 34, 0.10);

            border: 1px solid rgba(255, 100, 34, 0.20);

            font-size: 18px;
        }


        .summary-title {
            font-size: 13px;

            color: #999999;
        }


        .summary-count {
            color: #ffffff;

            font-size: 18px;

            font-weight: 800;
        }


        /* =====================================================
           ORDER CARD
        ===================================================== */

        .order-card {
            position: relative;

            background:
                linear-gradient(
                    145deg,
                    #181818,
                    #101010
                );

            border: 1px solid #2a2a2a;

            border-radius: 16px;

            margin-bottom: 18px;

            overflow: hidden;

            transition: all 0.3s ease;
        }


        .order-card:hover {
            transform: translateY(-4px);

            border-color: rgba(255, 100, 34, 0.55);

            box-shadow:
                0 15px 35px rgba(0, 0, 0, 0.50),
                0 0 18px rgba(255, 100, 34, 0.10);
        }


        /* =====================================================
           ORANGE TOP LINE
        ===================================================== */

        .order-card::before {
            content: "";

            position: absolute;

            left: 0;

            top: 0;

            width: 100%;

            height: 3px;

            background:
                linear-gradient(
                    90deg,
                    #ff6422,
                    #ff7b17
                );
        }


        /* =====================================================
           ORDER TOP
        ===================================================== */

        .order-top {
            padding: 20px 22px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            border-bottom: 1px solid #272727;
        }


        .order-number {
            display: flex;

            align-items: center;

            gap: 12px;
        }


        .food-icon {
            width: 43px;

            height: 43px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 11px;

            background:
                rgba(255, 100, 34, 0.10);

            border: 1px solid
                rgba(255, 100, 34, 0.20);

            font-size: 20px;
        }


        .order-number h3 {
            font-size: 17px;

            margin-bottom: 3px;
        }


        .order-number p {
            color: #777777;

            font-size: 11px;
        }


        /* =====================================================
           STATUS
        ===================================================== */

        .status {
            display: inline-flex;

            align-items: center;

            gap: 6px;

            padding: 7px 12px;

            border-radius: 20px;

            color: #4ade80;

            background:
                rgba(74, 222, 128, 0.08);

            border:
                1px solid rgba(74, 222, 128, 0.20);

            font-size: 11px;

            font-weight: 700;

            text-transform: capitalize;
        }


        .status::before {
            content: "";

            width: 6px;

            height: 6px;

            border-radius: 50%;

            background: #4ade80;

            box-shadow:
                0 0 8px rgba(74, 222, 128, 0.70);
        }


        /* =====================================================
           ORDER DETAILS
        ===================================================== */

        .order-details {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            padding: 20px 22px;

            gap: 15px;
        }


        .detail-box {
            background: #141414;

            border: 1px solid #242424;

            border-radius: 10px;

            padding: 13px 14px;

            transition: all 0.25s ease;
        }


        .detail-box:hover {
            border-color: #383838;

            background: #181818;
        }


        .detail-label {
            display: block;

            color: #666666;

            font-size: 10px;

            text-transform: uppercase;

            letter-spacing: 0.6px;

            margin-bottom: 6px;
        }


        .detail-value {
            color: #eeeeee;

            font-size: 13px;

            font-weight: 600;

            word-break: break-word;
        }


        /* =====================================================
           TOTAL AMOUNT
        ===================================================== */

        .detail-box.total {
            border-color:
                rgba(255, 100, 34, 0.20);

            background:
                rgba(255, 100, 34, 0.05);
        }


        .detail-box.total .detail-value {
            color: #ff7b17;

            font-size: 17px;

            font-weight: 800;
        }


        /* =====================================================
           ORDER FOOTER
        ===================================================== */

        .order-footer {
            padding: 14px 22px;

            border-top: 1px solid #252525;

            display: flex;

            justify-content: space-between;

            align-items: center;

            color: #666666;

            font-size: 11px;
        }


        .order-footer span {
            color: #999999;
        }


        /* =====================================================
           EMPTY ORDERS
        ===================================================== */

        .no-orders {
            padding: 70px 25px;

            text-align: center;

            background:
                linear-gradient(
                    145deg,
                    #181818,
                    #101010
                );

            border: 1px solid #292929;

            border-radius: 18px;

            box-shadow:
                0 15px 35px rgba(0, 0, 0, 0.40);
        }


        .empty-icon {
            width: 75px;

            height: 75px;

            margin: 0 auto 20px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 50%;

            background:
                rgba(255, 100, 34, 0.08);

            border: 1px solid
                rgba(255, 100, 34, 0.18);

            font-size: 35px;
        }


        .no-orders h2 {
            font-size: 23px;

            margin-bottom: 8px;
        }


        .no-orders p {
            color: #777777;

            font-size: 13px;

            max-width: 420px;

            margin: 0 auto 25px;
        }


        .start-btn {
            display: inline-block;

            text-decoration: none;

            color: #ffffff;

            background:
                linear-gradient(
                    135deg,
                    #ff6422,
                    #ff7b17
                );

            padding: 11px 22px;

            border-radius: 9px;

            font-size: 12px;

            font-weight: 700;

            transition: all 0.3s ease;

            box-shadow:
                0 7px 18px rgba(255, 100, 34, 0.20);
        }


        .start-btn:hover {
            transform: translateY(-3px);

            box-shadow:
                0 10px 25px
                rgba(255, 100, 34, 0.35);
        }


        /* =====================================================
           FOOTER
        ===================================================== */

        .footer {
            text-align: center;

            margin-top: 35px;

            color: #444444;

            font-size: 11px;
        }


        .footer span {
            color: #ff6422;
        }


        /* =====================================================
           TABLET
        ===================================================== */

        @media (max-width: 850px) {

            .navbar {
                padding: 0 25px;
            }


            .nav-links a {
                font-size: 10px;

                padding: 7px 9px;
            }


            .page-header {
                width: 92%;
            }


            .container {
                width: 92%;
            }


            .order-details {
                grid-template-columns:
                    repeat(2, 1fr);
            }
        }


        /* =====================================================
           MOBILE
        ===================================================== */

        @media (max-width: 600px) {

            .navbar {
                height: auto;

                padding: 14px;

                flex-direction: column;

                gap: 12px;
            }


            .logo {
                font-size: 22px;
            }


            .nav-links {
                flex-wrap: wrap;

                justify-content: center;

                width: 100%;
            }


            .nav-links a {
                font-size: 9px;

                padding: 6px 8px;
            }


            .page-header {
                width: 94%;

                margin-top: 28px;

                flex-direction: column;

                align-items: flex-start;

                gap: 15px;
            }


            .page-heading h1 {
                font-size: 27px;
            }


            .back-btn {
                width: 100%;

                text-align: center;
            }


            .container {
                width: 94%;
            }


            .summary-bar {
                padding: 14px;
            }


            .order-top {
                padding: 17px;

                align-items: flex-start;

                gap: 12px;
            }


            .order-number h3 {
                font-size: 15px;
            }


            .status {
                font-size: 10px;

                padding: 6px 9px;
            }


            .order-details {
                grid-template-columns: 1fr;

                padding: 16px;
            }


            .order-footer {
                padding: 12px 16px;

                flex-direction: column;

                align-items: flex-start;

                gap: 5px;
            }


            .no-orders {
                padding: 55px 18px;
            }
        }


        /* =====================================================
           SMALL MOBILE
        ===================================================== */

        @media (max-width: 380px) {

            .page-heading h1 {
                font-size: 24px;
            }


            .order-top {
                flex-direction: column;
            }


            .status {
                align-self: flex-start;
            }
        }

    </style>

</head>


<body>


    <!-- =====================================================
         NAVBAR
    ===================================================== -->

    <div class="navbar">

        <div class="logo">
            Food<span>Ninja</span>
        </div>


        <div class="nav-links">

            <a href="home.jsp">
                Home
            </a>

            <a href="restaurant.jsp">
                Restaurants
            </a>

         <a href="${pageContext.request.contextPath}/order" class="active">
    My Orders
</a>

        </div>

    </div>



    <!-- =====================================================
         PAGE HEADER
    ===================================================== -->

    <div class="page-header">

        <div class="page-heading">

            <h1>
                My <span>Orders</span>
            </h1>

            <p>
                Track your orders and view your order history
            </p>

        </div>


        <a href="home.jsp" class="back-btn">
            ← Back to Home
        </a>

    </div>



    <!-- =====================================================
         MAIN CONTAINER
    ===================================================== -->

    <div class="container">


        <%

            List<OrderTable> orderList =
                (List<OrderTable>)
                request.getAttribute("orderList");

            int orderCount = 0;

            if (orderList != null) {
                orderCount = orderList.size();
            }

        %>



        <!-- =================================================
             ORDER SUMMARY
        ================================================= -->

        <div class="summary-bar">

            <div class="summary-left">

                <div class="summary-icon">
                    📦
                </div>

                <div>

                    <div class="summary-title">
                        Total Orders
                    </div>

                    <div class="summary-count">
                        <%= orderCount %>
                    </div>

                </div>

            </div>

        </div>



        <%

            if (orderList != null && !orderList.isEmpty()) {

                for (OrderTable order : orderList) {

        %>


        <!-- =================================================
             ORDER CARD
        ================================================= -->

        <div class="order-card">


            <!-- ORDER HEADER -->

            <div class="order-top">

                <div class="order-number">

                    <div class="food-icon">
                        🍽️
                    </div>

                    <div>

                        <h3>
                            Order #<%= order.getOrderID() %>
                        </h3>

                        <p>
                            FoodNinja Order
                        </p>

                    </div>

                </div>


                <div class="status">

                    <%= order.getStatus() %>

                </div>

            </div>



            <!-- ORDER DETAILS -->

            <div class="order-details">


                <!-- RESTAURANT -->

                <div class="detail-box">

                    <span class="detail-label">
                        Restaurant
                    </span>

                    <span class="detail-value">

                        #<%= order.getRestaurantID() %>

                    </span>

                </div>



                <!-- DATE -->

                <div class="detail-box">

                    <span class="detail-label">
                        Order Date
                    </span>

                    <span class="detail-value">

                        <%= order.getOrderDate() %>

                    </span>

                </div>



                <!-- PAYMENT -->

                <div class="detail-box">

                    <span class="detail-label">
                        Payment
                    </span>

                    <span class="detail-value">

                        <%= order.getPaymentMethod() %>

                    </span>

                </div>



                <!-- TOTAL -->

                <div class="detail-box total">

                    <span class="detail-label">
                        Total Amount
                    </span>

                    <span class="detail-value">

                        ₹<%= String.format(
                            "%.2f",
                            order.getTotalAmount()
                        ) %>

                    </span>

                </div>


            </div>



            <!-- ORDER FOOTER -->

            <div class="order-footer">

                <span>
                    Order ID:
                    <%= order.getOrderID() %>
                </span>

                <span>
                    Thank you for ordering with
                    <strong>FoodNinja</strong>
                </span>

            </div>


        </div>


        <%

                }

            } else {

        %>


        <!-- =================================================
             NO ORDERS
        ================================================= -->

        <div class="no-orders">

            <div class="empty-icon">
                🍔
            </div>

            <h2>
                No Orders Yet
            </h2>

            <p>
                You haven't placed any orders yet.
                Explore our restaurants and discover
                something delicious!
            </p>

            <a href="restaurant" class="start-btn">
                🍴 Explore Restaurants
            </a>

        </div>


        <%

            }

        %>



        <!-- =================================================
             FOOTER
        ================================================= -->

        <div class="footer">

            Made with ❤️ by
            <span>FoodNinja</span>

        </div>


    </div>


</body>

</html>

