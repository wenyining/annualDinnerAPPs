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
            <h1>气象专家</h1>
        </div>

        <div data-role="content" data-theme="b">
            <h3>${user},动起来吧！！！</h3>
            <p>规则如下：</p>
            <p>秦岭淮河线划分两区域(南方/北方)</p>
            <p>主持人播报不同地理位置的天气预报,该位置所在区域(南/北)的玩家对此做出相应的反应</p>

            <ol data-role="listview" >
                <li>小雨拍肩</li>
                <li>中雨拍手</li>
                <li>大雨拍腿</li>
            </ol>
            <p>参与均有奖</p>
        </div>
        <ul data-role="listview" data-theme="b">
            <li><a href="bet">参加</a></li>
        </ul>
    </body>
</html>
