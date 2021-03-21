<%-- 
    Document   : displayquiz
    Created on : Feb 21, 2021, 12:53:15 PM
    Author     : Welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/WEB-INF/css/displayquiz.css"%></style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Page</title>
    </head>
    <body style="background-color: #33334d;">
        <c:set var="SLIST" value="${sessionScope.SLIST}"/>
        <c:set var="ERROR" value="${requestScope.ERROR}"/>
        <div style="height: 17%;width: 20%;float: right;margin-right: 3%;">
            <div>
                <h1 class="">Hello,<font color="#00ff00">${sessionScope.NAME}</font></h1>
                <form action="LogOut">
                    <input type="submit" value="Logout" style="margin-left: auto; margin-right:0;float: right;"/>
                </form>
            </div>
        </div>
        <div class="position-absolute top-50 start-50 translate-middle" style="height: auto;width: auto; color: white">
            <c:if test="${ERROR != null}"><font color="red">${ERROR}</font></c:if>
            <c:forEach var="slist" items="${SLIST}" varStatus="counter">
                <div>
                    <form action="TakeAQuiz" >
                        ${counter.count}.${slist.subjectID}
                        <input type="hidden" name="txtSubjectID" value="${slist.subjectID}" />
                        <select name="cbbTime" class="select-css">
                            <option value="">~~~~~~~CHOOSE ONE~~~~~~~</option>
                            <option value="60:00">60 Minutes - 60 Questions</option>
                            <option value="45:00">45 Minutes - 45 Questions</option>
                            <option value="30:00">30 Minutes - 30 Questions</option>
                            <option value="15:00">15 Minutes - 15 Questions</option>
                            <option value="10:00">10 Minutes - 10 Questions</option>
                            <option value="05:00">5 Minutes - 5 Questions</option>
                        </select>
                        <input type="submit" value="Take a Quiz" class="btn btn-dark"/>
                    </form>
                </div><br/>
            </c:forEach>
        </div>
        <form action="BackToMain" class="position-absolute bottom-0 start-50 translate-middle-x">
            <input type="submit" value="Back to Main Menu" class="btn btn-dark"/>
        </form>
    </body>
</html>
