<%-- 
    Document   : doquiz
    Created on : Feb 21, 2021, 6:02:38 PM
    Author     : Welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/WEB-INF/css/doquiz.css"%></style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Do Quiz Page</title>
    </head>
    <body style="background-color: #33334d;">
        <div style="height: 17%;width: auto;float: right;margin-right: 3%;">
            <div>
                <h1 class="">Hello,<font color="#00ff00">${sessionScope.NAME}</font></h1>
            </div>
        </div>
        <c:set var="QLIST" value="${sessionScope.QLIST}"/>
        <c:set var="RQLIST" value="${sessionScope.RQLIST}"/>
        <c:set var="MAP" value="${sessionScope.MAP}"/>
        <c:set var="QUIZPOS" value="${sessionScope.QUIZPOS}"/>
        <c:set var="QUIZTIME" value="${sessionScope.QUIZTIME}"/>
        <c:set var="NUMOFQUESTION" value="${sessionScope.NUMOFQUESTION}"/>
        <div class="area">${QUIZTIME}</div>
        <div></div>
        <script>
// Set the date we're counting down to
            var countDownDate = new Date('<c:out value=""/>').getTime();

// Update the count down every 1 second
            var x = setInterval(function () {

                // Get today's date and time
                var now = new Date().getTime();

                // Find the distance between now and the count down date
                var distance = countDownDate - now;

                // Time calculations for days, hours, minutes and seconds
//                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
//                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Output the result in an element with id="demo"
                document.getElementById("demo").innerHTML = minutes + "m " + seconds + "s ";

                // If the count down is over, write some text 
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("demo").innerHTML = "EXPIRED";
                    document.getElementById("Submit").click();
                }
            }, 1000);
        </script>
        <div class="position-absolute top-50 start-0 translate-middle-y" style="background-color: #d1d1e0 ;width: 100%">
            <c:forEach var="list" items="${QLIST}" >
                <div style="font-family: 'Lato', sans-serif; font-size: 20px; font-weight: 300; line-height: 40px; margin: 0 0 58px;">
                    Question: ${QUIZPOS} / ${NUMOFQUESTION}<br/>
                    ${list.questionContent}
                </div>
                <div id="answer">
                    Answer:<br/>
                    <form action="ChangeQuestionInQuiz" style="font-family: 'Lato', sans-serif; font-size: 20px; font-weight: 300; line-height: 40px; margin: 0 0 58px;">
                        <c:forEach var="map" items="${MAP}">
                            <c:if test="${map.key == list.questionID}">
                                <c:forEach var="value" items="${map.value}" varStatus="counter">
                                    <c:forEach var="rqlist" items="${RQLIST}">
                                        <c:if test="${rqlist.questionID == list.questionID}">
                                            <c:if test="${value.answerID != rqlist.choseAnswerID}">
                                                <input type="radio" name="rbtQuestion${QUIZPOS}" value="${value.answerID}" />${counter.count}. ${value.answerContent}<br/>
                                            </c:if>
                                            <c:if test="${value.answerID == rqlist.choseAnswerID}">
                                                <input type="radio" name="rbtQuestion${QUIZPOS}" value="${value.answerID}" checked="true"/>${counter.count}. ${value.answerContent}<br/>            
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        <input type="submit" value="Select"  class="btn btn-dark"/>
                        <input type="hidden" name="txtQuestionPos" value="${QUIZPOS + 1}" />
                        <input type="hidden" name="txtQuestionPosNow" value="${QUIZPOS}" />
                    </form>
                </div>
            </div>
            <form action="SubmitQuiz" class="position-absolute bottom-0 start-50 translate-middle-x">
                <input type="submit" id="Submit" value="Submit"  class="btn btn-light"/>
            </form>
            <form action="ChangeQuestionInQuiz" class="position-absolute bottom-0 end-0">
                <input type="submit" value="Next Question ~~>" class="btn btn-dark"/>
                <input type="hidden" name="txtQuestionPos" value="${QUIZPOS + 1}"  />
            </form>
            <form action="ChangeQuestionInQuiz" class="position-absolute bottom-0 start-0">
                <input type="submit" value="<~~ Previous Question" class="btn btn-dark"/>
                <input type="hidden" name="txtQuestionPos" value="${QUIZPOS - 1}"  />
            </form>
        </c:forEach>
    </body>
</html>
    