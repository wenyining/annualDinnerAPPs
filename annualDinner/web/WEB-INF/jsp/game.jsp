<%-- 
    Document   : home
    Created on : 2014-12-8, 10:56:22
    Author     : JAWEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html class="ui-mobile-rendering">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="css/jquery.mobile-1.0.1.min.css"/>

        <!-- The Scripts -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.mobile-1.0.1.min.js"></script>
    </head>
    <body>
        <div data-role="header" data-theme="b">
            <h1>Welcome to Annual Dinner Game Center</h1>
        </div>

        <div data-role="content" >
            <h3><%= session.getAttribute("login") %>, Welcome to Annual Dinner Game Center</h3>
            <p>Please choose the game you want to join and bet</p>
            <ul data-role="listview">
                <li><a href="game1" id="game1">爱拼才会赢</a></li>
                <li><a href="game2" id="game2">气象专家</a></li>
                <li><a href="game3" id="game3">头脑风暴</a></li>
                <li><a href="game4" id="game4">心有灵犀</a></li>
            </ul>
        </div>
        
        <script>
            $(document).ready(function () {
                $('#game1').click(function () {
                    response.sendRedirect("game1");
                });
                $('#game2').click(function () {
                    response.sendRedirect("game2");
                });
                $('#game3').click(function () {
                    response.sendRedirect("game3");
                });
                $('#game4').click(function () {
                    response.sendRedirect("game4");
                });
                $('#logout').click(function () {
                    response.sendRedirect("logout");
                });
            });
        </script>
    </body>
</html>
