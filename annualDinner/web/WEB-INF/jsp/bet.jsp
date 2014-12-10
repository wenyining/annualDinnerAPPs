<%-- 
    Document   : game1
    Created on : 2014-12-8, 11:00:40
    Author     : JAWEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
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
        <div data-role="header" data-theme="a">
            <a href="home" data-icon="back" class="back ui-btn-left">Back</a>
            <h1>Choose the game you like</h1>
        </div>

        <div data-role="content" data-theme="b">
            <h3><%= session.getAttribute("login") %>,Welcome to Annual Dinner Game Center</h3>
            <p>请选择您想要参加的游戏和竞标价</p>
            <p>每个人每个游戏只有一次投注机会</p>
            <form:form action="bet" method="POST">
                <div class="ui-field-contain ui-field-contain ui-body ui-br">
                    <form:label for="select-game" path="gameid">选择游戏:</form:label>
                    <form:select name="select-game" id="select-game" data-mini="true" path="gameid">
                        <option value="1">爱拼才会赢</option>
                        <option value="2">气象专家</option>
                        <option value="3">头脑风暴</option>
                        <option value="4">心有灵犀</option>
                    </form:select>
                </div>
                <div class="ui-field-contain ui-body ui-br" data-role="fieldcontain">
                    <form:label class="ui-input-text" path="coins">竞标金币:</form:label>
                    <form:input type="number" path="coins" placeholder="500" min="100" max="5000" step="100" id="coins"/>
                </div>

                <div class="ui-body">
                    <fieldset class="ui-grid-a">
                        <div class="ui-block-a" >
                            <button type="reset" data-theme="d" id="cancelBet">Cancel</button>
                        </div>
                        <div class="ui-block-b">
                            <button type="submit" data-theme="b" id="submitBet" >Submit</button>
                        </div>
                    </fieldset>
                </div>
            </form:form>
        </div>
        <script>
            $(document).ready(function () {
                $('#cancelBet').click(function () {
                    $('#coins').val("");
                });
            });
        </script>
    </body>
</html>
