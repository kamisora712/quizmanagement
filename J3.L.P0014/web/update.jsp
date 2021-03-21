<%-- 
    Document   : update
    Created on : Feb 20, 2021, 9:37:57 PM
    Author     : Welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/WEB-INF/css/table.css"%></style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body style="background-color: #33334d;color: white" >
        <c:set var="QLIST" value="${sessionScope.QLIST}"/>
        <c:set var="SLIST" value="${sessionScope.SLIST}"/>
        <c:set var="MAP" value="${sessionScope.MAP}"/>
        <c:set var="updatequestionID" value="${param.txtQuestionID}"/>
        <div style="height: auto;width: auto;float: right;margin-right: 3%;">
            <div>
                <h1 class="">Hello,<font color="#00ff00">${sessionScope.NAME}</font></h1>
                <form action="LogOut">
                    <input type="submit" value="Logout" class="btn btn-dark" style="margin-left: auto; margin-right:0;float: right;"/>
                </form>
            </div>
        </div>
        <h1>Update the information for the Question</h1>
        <form action="UpdateQuestion">
            <input type="hidden" name="txtQuestionID" value="${updatequestionID}" />
            <c:forEach var="list" items="${QLIST}">
                <c:if test="${list.questionID == updatequestionID}">
                    <table border="1" class="styled-table" style="background-color: #c2c2d6;color: black">
                        <tr class="active-row">
                            <td>
                                <textarea rows="5" cols="200" name="txtQuestionContent" style="resize: none;">${list.questionContent}</textarea><br/>
                                Subject At Now : ${list.subjectID}<br/>
                                New Subject: <select name="cboSubject">
                                    <option value="">---Choose---</option>
                                    <c:forEach var="listsubject" items="${SLIST}">
                                        <option value="${listsubject.subjectID}">${listsubject.subjectID}</option>    
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr class="active-row">
                            <td>
                                <c:forEach var="map" items="${MAP}">
                                    <c:if test="${map.key == list.questionID}">
                                        <c:forEach var="value" items="${map.value}" varStatus="counter">
                                            <c:if test="${value.status == true}">
                                                <div>
                                                    Answer ${counter.count}:<br/>
                                                    <input type="hidden" name="txtAnswerID" value="${value.answerID}" />
                                                    <textarea rows="1" cols="200" name="txtAnswerContent" style="resize: none;">${value.answerContent}</textarea><br/>
                                                    Is it true? <input type="radio" name="rbtStatus${counter.count}" value="true" checked="true"/>YES
                                                    <input type="radio" name="rbtStatus${counter.count}" value="false" />NO
                                                </div><br/>
                                            </c:if>
                                            <c:if test="${value.status != true}">
                                                <div>
                                                    Answer ${counter.count}:<br/>
                                                    <input type="hidden" name="txtAnswerID" value="${value.answerID}" />
                                                    <textarea rows="1" cols="200" name="txtAnswerContent" style="resize: none;">${value.answerContent}</textarea><br/>
                                                    Is it true? <input type="radio" name="rbtStatus${counter.count}" value="true"/>YES
                                                    <input type="radio" name="rbtStatus${counter.count}" value="false" checked="true"/>NO
                                                </div><br/>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </td>
                        </tr>
                    </table>
                </c:if>
            </c:forEach>
            <input type="submit" value="Update" class="btn btn-dark" style="width: 100%"/>
        </form>
        <form action="CancelQuestionAction">
            <input type="submit" value="Cancel" class="btn btn-dark" style="width: 100%"/>
        </form>
    </body>
</html>
