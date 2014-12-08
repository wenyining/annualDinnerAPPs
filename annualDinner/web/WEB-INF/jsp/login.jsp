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
            <h1>TK's Annual Dinner Games</h1>
        </div>

        <div data-role="content"  data-theme="b">
            <form:form action="login" method="POST">
                <table>
                    <div class="ui-field-contain ui-body ui-br" data-role="fieldcontain">
                        <form:label class="ui-input-text" path="emailAddr">E-mail</form:label>
                        <form:input type="email" path="emailAddr" placeholder="yourname@email.com" id="usermail"></form:input>
                        </div>
                        <div class="ui-field-contain ui-body ui-br" data-role="fieldcontain">
                        <form:label class="ui-input-text" path="employeeID">Employee ID</form:label>
                        <form:input type="password" path="employeeID" placeholder="password" id="gid"></form:input>
                        </div>
                        <fieldset class="ui-grid-a">
                            <div class="ui-block-a" >
                                <button type="reset" data-theme="d" id="cancelButton">Cancel</button>
                            </div>
                            <div class="ui-block-b">
                                <button type="submit" data-theme="b" id="submitButton" >Submit</button>
                            </div>
                        </fieldset>
                    </table>
            </form:form>
        </div>
        <script>
            $(document).ready(function () {
                $('#clearButton').click(function () {
                    alert('clear click!');
                    $('#usermail').val("");
                    $('#gid').val("");
                });
            });
        </script>
    </body>
</html>
