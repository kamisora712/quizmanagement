<%-- 
    Document   : registration
    Created on : Feb 17, 2021, 10:07:50 PM
    Author     : Welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/WEB-INF/css/registration.css"%></style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body style="background-color: #33334d;">
        <div class="col-md-4 col-md-offset-4" id="login">
            <section id="inner-wrapper" class="login">
                <article>
                    <form action="SignUp">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"> </i></span>
                                <input type="text" class="form-control" placeholder="Name" name="txtName"><br/>
                            </div>
                            <c:if test="${not empty NAMEERROR}"><h6><font color="red">${requestScope.NAMEERROR}</font></h6><br/></c:if>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope"> </i></span>
                                    <input type="email" class="form-control" placeholder="Email Address" name="txtEmail"><br/>
                                </div>
                            <c:if test="${not empty EMAILERROR}"><h6><font color="red">${requestScope.EMAILERROR}</font></h6><br/></c:if>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key"> </i></span>
                                    <input type="password" class="form-control" placeholder="Password" name="txtPassword"><br/>
                                </div>
                            <c:if test="${not empty PASSWORDERROR}"><h6><font color="red">${requestScope.PASSWORDERROR}</font></h6><br/></c:if>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key"> </i></span>
                                    <input type="password" class="form-control" placeholder="Confirm Password" name="txtConfirmPassword"><br/>
                                </div>
                            <c:if test="${not empty COMFIRMPASSWORDERROR}"><h6><font color="red">${requestScope.COMFIRMPASSWORDERROR}</font></h6><br/></c:if>
                        </div>
                        <button type="submit" class="btn btn-dark btn-block">Register</button>
                    </form>
                    <form action="CancelSignUp">
                        <button type="submit" class="btn btn-dark btn-block">Cancel</button>
                    </form>
                </article>
            </section>
        </div>
    </body>
</html>
