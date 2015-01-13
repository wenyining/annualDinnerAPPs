<%-- 
    Document   : login
    Created on : 2014-12-8, 10:22:02
    Author     : JAWEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
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
        <div data-role="header"  data-theme="b">
            <h1>Annual Dinner</h1>
        </div>

        <div data-role="content"  data-theme="b">
            <p>���굽��,�������ף����</p>
            <form:form action="login" method="POST">
                <table>
                    <div class="ui-field-contain ui-body ui-br" data-role="fieldcontain">
                        <form:label class="ui-input-text" path="nickname">�ǳ�</form:label>
                        <form:input type="text" path="nickname" id="nickname"></form:input>
                        <form:label class="ui-input-text" path="comments">ף����</form:label>
                        <form:input type="text" path="comments"/>
                    </div>
                    <fieldset class="ui-grid-a">
                        <button type="submit" data-theme="b" id="submitButton" >ȷ��</button>
                    </fieldset>
                </table>
            </form:form>
        </div>
        
        <script>
$(document).ready(function () {
    
    $('#submitButton').click(function () {
        
        jQuery.support.cors = true;
        alert('login click!');
        var formDataObj = {};
        var formJqObj = $('#loginForm');
        (function () {
            formJqObj.find(":input").not("[type='submit']").not("[type='reset']").each(function () {
                var thisInput = $(this);
                formDataObj[thisInput.attr("name")] = thisInput.val();
                if(thisInput.attr("name") === "USER_NAME"){
                    Username = thisInput.val();
                }
                if(thisInput.attr("name") === "GUID"){
                    UserId = thisInput.val();
                }
            });
        })();
        console.log(JSON.stringify(formDataObj));
        $.ajax(
                {
                    type: "post",
                    url: '/comments',
                    data: JSON.stringify(formDataObj),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (data) {
                        //alert('success');
                        $.each(data, function (i, theItem) {
                            //alert('Key: '+ option.text + ' Value:' + option.value);
                            
                        });
                        console.log(JSON.stringify(data));
                        app.navigate("#home", {trigger: true, replace: true});
                    },
                    error: function (msg, url, line) {
                        alert('error trapped in error: function(msg, url, line)');
                        alert('msg = ' + msg + ', url = ' + url + ', line = ' + line);
                        Username = '';
                        UserId   = '';
                    }
                });
    });
});

        </script>
    </body>
</html>
