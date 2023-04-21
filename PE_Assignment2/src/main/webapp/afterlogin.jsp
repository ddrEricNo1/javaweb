<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Academic Admin</title>
    <link href="resources/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/main.css" rel="stylesheet">
</head>
<body>
<%@page import="com.dr.service.impl.StudentServiceImpl"%>
<%@page import="com.dr.entity.Student"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
List<Student>result=StudentServiceImpl.displayAll();
request.setAttribute("result", result);
%>
    <div class="container-fluid pageheader">
        <div class="content">
            <h1 class="title text-center">Home - Student Registration System</h1>
        </div>
    </div>

    <div class="container-fluid sections-wrapper">
        <div class="section">
            <div class="section-inner">
                <div class="content">
                    <div class="item">
                        <h3 class="title text-justify text-decoration-underline">New Registration</h3>
                            <form action="student?method=search" method="post">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label class="form-label fs-4 fw-bold">Search by IC:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" type="text" name="Passport" placeholder="Student IC">
                                    </div>
                                    <div class="col-md-1">
                                        <input class="btn btn-primary fw-bold" type="submit" value="Search">
                                    </div>
                                </div>
                            </form>
                        <div class="row">
                            <div class="col-md-2">
                                <a href="addData.jsp" class="btn btn-dark fw-bold" role="button">ADD DATA</a>
                            </div>
                        </div>
                        <br>
                        <div class="list">
                            <table class="table">
                                <thead>
                                    <tr class="table-dark" style="font-size: 20px;">
                                        <th scope="col">IC No.</th>
                                        <th scope="col">Student ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Nationality</th>
                                        <th scope="col">Reg. Date</th>
                                        <th scope="col">Programme</th>
                                        <th scope="col">Questionnaire</th>
                                        <th scope="col" colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody class="table-group-divider">
                                    <c:forEach items="${result}" var="s">
                                        <tr>
                                            <td>${s.getPassport()}</td>
                                            <td>${s.getSID()}</td>
                                            <td>${s.getSName() }</td>
                                            <td>${s.getGender() }</td>
                                            <td>${s.getNationality() }</td>
                                            <td>${s.getRegtime()}</td>
                                            <td>${s.getProgramme()}</td>
                                            <td>
                                                <a href="addform.jsp?SID=${s.getSID()}" class="btn btn-outline-warning btn-sm" role="button">
                                                    Click Here</a>
                                            </td>
                                            <td>
                                                <a href="form?method=update" class="btn btn-outline-success btn-sm" role="button">
                                                    Edit</a>
                                            </td>
                                            <td><a href="student?method=delete&SID=${s.getSID()}" class="btn btn-outline-danger btn-sm" role="button">
                                                Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="container-fluid">
                <small class="copyright">Copyright @ SWE306 A2 GROUP 5. All Rights Reserved | SWE2009499 SWE2009495</small>
        </div><!--container-->
    </footer><!--footer-->
</body>
</html>