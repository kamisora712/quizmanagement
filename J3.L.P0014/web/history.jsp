<%-- 
    Document   : history
    Created on : Feb 22, 2021, 5:12:38 PM
    Author     : Welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/WEB-INF/css/table.css"%></style>
<style><%@include file="/WEB-INF/css/paging.css"%></style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
    </head>
    <body style="background-color: #33334d;color: white" >
        <h1>History Page</h1>
        <c:set var="HLIST" value="${sessionScope.HLIST}"/>
        <c:set var="SLIST" value="${sessionScope.SLIST}"/>
        <c:set var="MAXPAGENO" value="${requestScope.MAXPAGENO}"/>
        <div style="height: auto;width: auto;float: right;margin-right: 3%;">
            <div>
                <h1 class="">Hello,<font color="#00ff00">${sessionScope.NAME}</font></h1>
                <form action="LogOut">
                    <input type="submit" value="Logout" class="btn btn-dark" style="margin-left: auto; margin-right:0;float: right;"/>
                </form>
                <form action="BackToMain" >
                    <input type="submit" value="Back to Main Menu" class="btn btn-dark" style="margin-left: auto; margin-right: 0;"/>
                </form>
            </div>
        </div>
        <div>
            <form action="SearchHistory">
                Subject: <select name="cboSubject">
                    <option value="">---Choose---</option>
                    <c:forEach var="listsubject" items="${SLIST}">
                        <option value="${listsubject.subjectID}">${listsubject.subjectID}</option>    
                    </c:forEach>
                </select>
                <input type="submit" value="Search" class="btn btn-dark"/>
            </form>
        </div>
        <table border="1" class="styled-table" style="background-color: #c2c2d6;color: black">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>History ID</th>
                    <th>Email</th>
                    <th>Subject ID</th>
                    <th>Mark</th>
                    <th>Create Date</th>
                    <th>Detail</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="list" items="${HLIST}" varStatus="counter">
                    <tr class="active-row">
                        <td>${counter.count}</td>
                        <td>${list.historyID}</td>
                        <td>${list.email}</td>
                        <td>${list.subjectID}</td>
                        <td>${list.mark}</td>
                        <td>${list.createDate}</td>
                        <td>
                            <form action="DisplayHistoryDetail">
                                <input type="hidden" name="historyID" value="${list.historyID}" />
                                <input type="submit" value="Detail" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="text-align: center;">
            <c:forEach var="maxpageno" begin="1" end="${MAXPAGENO}">
                <a class="paging" href="SearchHistoryServlet?pageNo=${maxpageno}&cboSubject=${param.cboSubject}">${maxpageno}</a>
            </c:forEach>
        </div>
    </body>
</html>
