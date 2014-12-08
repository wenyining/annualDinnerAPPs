<%-- 
    Document   : home
    Created on : 2014-12-8, 10:56:22
    Author     : JAWEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h3>${emps.emailAddr}, Welcome to Annual Dinner Game Center</h3>
            <p>Please choose the game you want to join and bet</p>
            <ul data-role="listview" >
                <li><a href="game/1">爱拼才会赢</a></li>
                <li><a href="game/2">气象专家</a></li>
                <li><a href="game/3">头脑风暴</a></li>
                <li><a href="game/4">心有灵犀</a></li>
            </ul>
        </div>
    </body>
</html>
