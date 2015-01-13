<%-- 
    Document   : addEmployee
    Created on : 2014-12-2, 19:19:20
    Author     : JAWEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
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
            <h1>投票成功！</h1>
        </div>

        <div data-role="content" data-theme="b">
            <h3><%= session.getAttribute("login") %>, 您现在排在第${rank} 位。</h3>
            <p>具体信息如下：</p>

            <ol data-role="listview" >
                <li>金币： ${coins}</li>
                <li>时间： ${date}</li>
            </ol>
        </div>
            
        <script>
            $(document).ready(function () {
                $('#back').click(function () {
                    response.sendRedirect("game");
                });
            });            
        </script>
    </body>
</html>
