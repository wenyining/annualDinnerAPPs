<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Music Center</title>
    </head>
    <body>
        <h2>Employee Information</h2>
    <form:form method="POST" action="employee/addresult">
        <table>
            <tr>
                <td><form:label path="emailAddr">Email Address</form:label></td>
                <td><form:input path="emailAddr" /></td>
            </tr>
            <tr>
                <td><form:label path="employeeID">Employee ID</form:label></td>
                <td><form:input path="employeeID" /></td>
            </tr>
            <tr>
                <td><form:label path="nickname">Nickname</form:label></td>
                <td><form:input path="nickname" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit"/>
                </td>
            </tr>
        </table>  
    </form:form>
</body>
</html>