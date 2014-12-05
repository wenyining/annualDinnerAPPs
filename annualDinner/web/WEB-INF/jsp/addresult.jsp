<%-- 
    Document   : addEmployee
    Created on : 2014-12-2, 19:19:20
    Author     : JAWEN
--%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Music Center</title>
</head>
<body>

<h2>Submitted Employee Information</h2>
   <table>
    <tr>
        <td>Email Address</td>
        <td>${emps.emailAddr}</td>
    </tr>
    <tr>
        <td>Employee ID</td>
        <td>${emps.employeeID}</td>
    </tr>
    <tr>
        <td>Nickname</td>
        <td>${emps.nickname}</td>
    </tr>
</table>  
</body>
</html>
