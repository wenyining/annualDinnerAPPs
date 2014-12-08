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
            <a href="home" data-icon="back" class="back ui-btn-left">Back</a>
            <h1>爱拼才会赢</h1>
        </div>

        <div data-role="content" data-theme="b">
            <h3>${user}, 一起来疯狂拼音吧！！！</h3>
            <p>规则如下：</p>

            <ol data-role="listview" >
                <li>3人 vs 3人</li>
                <li>用声母组词(5个活动声母和1个固定声母)</li>
                <li>限时3分钟</li>
                <li>参与均有奖</li>
            </ol>
        </div>
        <ul data-role="listview" data-theme="b">
            <li><a href="bet">参加</a></li>
        </ul>
    </body>
</html>
