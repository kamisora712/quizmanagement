<%-- 
    Document   : main
    Created on : Feb 17, 2021, 10:31:57 PM
    Author     : Welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    <body style="background-color: #33334d;color: white" >
        <div style="height: 17%;width: 20%;float: right;margin-right: 3%;">
            <div>
                <h1 class="">Hello,<font color="#00ff00">${sessionScope.NAME}</font></h1>
                <form action="LogOut">
                    <input type="submit" value="Logout" style="margin-left: auto; margin-right:0;float: right;" class="btn btn-dark btn-lg"/>
                </form>
            </div>
        </div>
        <div class="position-absolute top-50 start-50 translate-middle">
            <c:if test="${sessionScope.ROLE.equals('Admin')}">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <form action="DisplayQuestion">
                        <input type="submit" value="Click to Display Question" class="btn btn-dark btn-lg"/>
                    </form>
                    <form action="DisplayHistory">
                        <input type="submit" value="Click to View History" class="btn btn-dark btn-lg"/>
                    </form>
                </div>
            </c:if>
        </div>
        <div class="position-absolute top-50 start-50 translate-middle">
            <c:if test="${sessionScope.ROLE.equals('Student')}">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <form action="DisplayQuizList">
                        <input type="submit" value="Display Quiz List" class="btn btn-dark btn-lg"/>
                    </form>
                    <form action="DisplayHistory">
                        <input type="submit" value="View History" class="btn btn-dark btn-lg"/>
                    </form>
                </div>
            </c:if>
        </div>
        <div class="position-absolute top-50 start-50 translate-middle">
            <c:if test="${empty sessionScope.ROLE}">
                <div class="alert alert-warning" role="alert">
                    <h1>~~~~!ERROR!~~~~</h1>    
                </div>
            </c:if>     
        </div>
    </body>
</html>
