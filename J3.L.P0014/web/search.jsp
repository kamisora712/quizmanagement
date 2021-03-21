<%-- 
    Document   : display
    Created on : Feb 19, 2021, 2:03:16 PM
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
        <title>Search Page</title>
    </head>
    <body style="background-color: #33334d;color: white" >
        <c:set var="SLIST" value="${sessionScope.SLIST}"/>
        <c:set var="QLIST" value="${sessionScope.QLIST}"/>
        <c:set var="MAP" value="${sessionScope.MAP}"/>
        <c:set var="MAXPAGENO" value="${requestScope.MAXPAGENO}"/>
        <c:set var="LASTRESULT" value="${param.txtQuestionName}"/>
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
            <form action="SearchQuestion">
                <c:if test="${LASTRESULT == null}">
                    Name: <input type="text" name="txtQuestionName" value="" /><br/>
                </c:if>
                <c:if test="${LASTRESULT != null}">
                    Name: <input type="text" name="txtQuestionName" value="${LASTRESULT}" /><br/>
                </c:if>
                Status: <select name="cboStatus">
                    <option value="TRUE">Activated</option>
                    <option value="FALSE">Deactivated</option>
                </select>
                Subject: <select name="cboSubject">
                    <option value="">---Choose---</option>
                    <c:forEach var="listsubject" items="${SLIST}">
                        <option value="${listsubject.subjectID}">${listsubject.subjectID}</option>    
                    </c:forEach>
                </select>
                <input type="submit" value="Search" class="btn btn-dark"/>
            </form>
        </div>
        <form action="CreatePage">
            <input type="submit" value="Add A Question" class="btn btn-dark" />
        </form>
        <table border="1" class="styled-table" style="background-color: #c2c2d6">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Subject ID</th>
                    <th>Question</th>
                    <th>Correct Answer</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="list" items="${QLIST}" varStatus="counter">
                    <tr class="active-row">
                        <td>${counter.count}</td>
                        <td>${list.subjectID}</td>
                        <td>${list.questionContent}</td>
                        <td>
                            <c:forEach var="map" items="${MAP}">
                                <c:if test="${map.key == list.questionID}">
                                    <c:forEach var="value" items="${map.value}">
                                        <c:if test="${value.status == true}">
                                            ${value.answerContent}<br/>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:if test="${list.status == false}">
                                <form action="RevertQuestion">
                                    <input type="submit" value="Revert" class="btn btn-light"/>
                                    <input type="hidden" name="txtQuestionID" value="${list.questionID}" />
                                </form>
                            </c:if>
                            <c:if test="${list.status == true}">
                                <form action="DeleteQuestion">
                                    <input type="submit" value="Delete" class="btn btn-light"/>
                                    <input type="hidden" name="txtQuestionID" value="${list.questionID}" />
                                </form>
                            </c:if>
                        </td>
                        <td>
                            <form action="UpdatePage">
                                <input type="submit" value="Update" class="btn btn-light"/>
                                <input type="hidden" name="txtQuestionID" value="${list.questionID}" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="text-align: center;">
            <c:if test="${LASTRESULT == null}">
                <c:forEach var="maxpageno" begin="1" end="${MAXPAGENO}">
                    <a class="paging" href="DisplayQuestionServlet?pageNo=${maxpageno}">${maxpageno}</a>
                </c:forEach>
            </c:if>
            <c:if test="${LASTRESULT != null || cboStatus != null}">
                <c:forEach var="maxpageno" begin="1" end="${MAXPAGENO}">
                    <a class="paging" href="SearchQuestionServlet?pageNo=${maxpageno}&txtQuestionName=${param.txtQuestionName}&cboStatus=${param.cboStatus}&cboSubject=${param.cboSubject}">${maxpageno}</a>
                </c:forEach>
            </c:if>
        </div>
    </body>
</html>
