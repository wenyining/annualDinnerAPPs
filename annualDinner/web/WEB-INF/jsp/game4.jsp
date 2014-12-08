<%-- 
    Document   : game1
    Created on : 2014-12-8, 11:00:40
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
        <script src="js/jquery-1.7.1.min.js"></script>
        <script src="js/jquery.mobile-1.0.1.min.js"></script>
    </head>
    <body>

        <div data-role="header" data-theme="a">
            <a href="#home" data-icon="back" class="back ui-btn-left">Back</a>
            <h1>心有灵犀</h1>
        </div>

        <div data-role="content" data-theme="b">
            <h3>${user},展现你们的默契</h3>
            <p>规则如下：</p>

            <ol data-role="listview" >
                <li>两人一组;一人描述,一人猜词</li>
                <li>90秒内猜对词语最多的一组获胜</li>
                <li>允许随意pass(词语总量:20)</li>
                <li>参与均有奖</li>
            </ol>
        </div>
        <ul data-role="listview" data-theme="b">
            <li><a href="bet">参加</a></li>
        </ul>
    </body>
</html>
