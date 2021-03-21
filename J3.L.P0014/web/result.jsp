<%-- 
    Document   : result
    Created on : Feb 22, 2021, 3:05:27 PM
    Author     : Welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/WEB-INF/css/result.css"%></style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
    </head>
    <body style="background-color: #33334d;">
        <c:set var="MARK" value="${requestScope.MARK}"/>
        <div style="width: auto;float: right;margin-right: 3%;">
            <div>
                <h1 class="">Hello,<font color="#00ff00">${sessionScope.NAME}</font></h1>
                <form action="LogOut">
                    <input type="submit" value="Logout" class="btn btn-dark" style="margin-left: auto; margin-right:0;float: right;"/>
                </form>
                <form action="BackToMain" >
                    <input type="submit" value="Back to Main Menu" class="btn btn-dark"style="margin-left: auto; margin-right:0;float: right;"/>
                </form>
            </div>
        </div>
        <div class="position-absolute top-50 start-0 translate-middle-y" style="color: white">
            <h1>Your mark of this Quiz is :</h1>
        </div>
        <div class="position-absolute top-50 start-50 translate-middle">
            <h2 style="font-size: 2500%;">${MARK}</h2>
        </div>
    </body>
</html>
