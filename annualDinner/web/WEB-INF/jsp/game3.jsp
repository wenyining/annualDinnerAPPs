<%-- 
    Document   : game1
    Created on : 2014-12-8, 11:00:40
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
        <script src="js/jquery-1.7.1.min.js"></script>
        <script src="js/jquery.mobile-1.0.1.min.js"></script>
    </head>
    <body>
        <div data-role="header" data-theme="b">
            <a href="game" data-icon="back" class="back ui-btn-left" id="back">Back</a>
            <h1>头脑风暴</h1>
        </div>

        <div data-role="content" data-theme="b">
            <h3><%= session.getAttribute("login") %>,开动你的大脑</h3>
            <p>规则如下：</p>

            <ol data-role="listview" >
                <li>4人一组,共同答题</li>
                <li>听题目,尽快回答问题(时限:20秒/题)</li>
                <li>答对题目最多的一组获胜</li>
                <li>参与均有奖</li>
            </ol>
        </div>
        <ul data-role="listview" data-theme="b">
            <li><a href="bet">参加</a></li>
        </ul>
            
        <script>
            $(document).ready(function () {
                $('#back').click(function () {
                    response.sendRedirect("game");
                });
                $('#logout').click(function () {
                    response.sendRedirect("logout");
                });
            });            
        </script>
    </body>
</html>
