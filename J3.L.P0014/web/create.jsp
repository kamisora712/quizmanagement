<%-- 
    Document   : create
    Created on : Feb 19, 2021, 6:43:28 PM
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
        <title>Create Page</title>
    </head>
    <body style="background-color: #33334d;color: white" >
        <c:set var="SLIST" value="${sessionScope.SLIST}"/>
        <div style="height: auto;width: auto;float: right;margin-right: 3%;">
            <div>
                <h1 class="">Hello,<font color="#00ff00">${sessionScope.NAME}</font></h1>
                <form action="LogOut">
                    <input type="submit" value="Logout" class="btn btn-dark" style="margin-left: auto; margin-right:0;float: right;"/>
                </form>
            </div>
        </div>
        <h1>Input the information for the new Question</h1>
        <form action="CreateQuestion" method="GET">
            <table border="1" class="styled-table" style="background-color: #c2c2d6;color: black">
                <tbody>
                    <tr>
                        <td>
                            <div>
                                Content:<br/>
                                <textarea rows="5" cols="200" name="txtQuestionContent" style="resize: none;"></textarea><br/>
                            </div>
                            Subject: <select name="cboSubject">
                                <option value="">---Choose---</option>
                                <c:forEach var="listsubject" items="${SLIST}">
                                    <option value="${listsubject.subjectID}">${listsubject.subjectID}</option>    
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr class="active-row">
                        <td>
                            <div>
                                Answer 1:<br/>
                                <textarea rows="1" cols="200" name="txtAnswerContent" style="resize: none;"></textarea><br/>
                                Is it true? <input type="radio" name="rbtStatus1" value="true"/>YES
                                <input type="radio" name="rbtStatus1" value="false" checked="true"/>NO
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                Answer 2:<br/>
                                <textarea rows="1" cols="200" name="txtAnswerContent" style="resize: none;"></textarea><br/>
                                Is it true? <input type="radio" name="rbtStatus2" value="true"/>YES
                                <input type="radio" name="rbtStatus2" value="false" checked="true"/>NO
                            </div>
                        </td>
                    </tr>
                    <tr class="active-row">
                        <td>
                            <div>
                                Answer 3:<br/>
                                <textarea rows="1" cols="200" name="txtAnswerContent" style="resize: none;"></textarea><br/>
                                Is it true? <input type="radio" name="rbtStatus3" value="true"/>YES
                                <input type="radio" name="rbtStatus3" value="false" checked="true"/>NO
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                Answer 4 :<br/>
                                <textarea rows="1" cols="200 name="txtAnswerContent" style="resize: none;"></textarea><br/>
                                Is it true? <input type="radio" name="rbtStatus4" value="true"/>YES
                                <input type="radio" name="rbtStatus4" value="false" checked="true"/>NO
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Create" class="btn btn-dark" style="width: 100%"/>
        </form>
        <form action="CancelQuestionAction">
            <input type="submit" value="Cancel" class="btn btn-dark" style="width: 100%"/>
        </form>
    </body>
</html>
