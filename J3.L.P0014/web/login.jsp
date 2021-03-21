<%-- 
    Document   : login
    Created on : Feb 18, 2021, 3:54:42 PM
    Author     : Welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/WEB-INF/css/login.css"%></style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body style="background-color: #33334d;">
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <div class="fadeIn first"><h1>Login</h1></div>
                <form action="Login" method="POST">
                    Email:<input type="text" name="txtEmail" class="fadeIn second" placeholder="Email"/><br/>
                    <c:if test="${not empty EMAILERROR}"><h4><font color="red">${requestScope.EMAILERROR}</font></h4><br/></c:if>
                        Pass:<input type="password" name="txtPassword" class="fadeIn third"  placeholder="password"/><br/>
                    <c:if test="${not empty PASSWORDERROR}"><h4><font color="red">${requestScope.PASSWORDERROR}</font></h4><br/></c:if>
                    <input type="submit" value="Login" class="fadeIn fourth"/>
                </form>
                <div id="formFooter">
                    <form action="RegistrationPage" class="fadeIn fitht">
                        <p style="text-align: center;">No account?</p>
                        <input type="submit" value="Registrate Here"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
