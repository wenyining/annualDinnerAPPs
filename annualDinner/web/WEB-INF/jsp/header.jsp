<%-- 
    Document   : header
    Created on : 2014-12-10, 14:47:40
    Author     : JAWEN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sses = request.getSession(false);
if (sses == null
        || sses.getAttribute("connected") == null
        || !((String) sses.getAttribute("connected")).equals("true")) {
    String redirectURL = "login";
    response.sendRedirect(redirectURL);
}
%>
