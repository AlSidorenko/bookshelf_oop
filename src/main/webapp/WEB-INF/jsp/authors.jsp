<%--
  Created by IntelliJ IDEA.
  User: Александр
  Date: 16.08.2021
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>

<html>
<head>
    <title>Authors</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css"/>
</head>
<body>

<div class="container-fluid col-lg-7 col-lg-offset-5 mt-3 pb-2 text-center ">
    <h2>Authors List</h2>

    <table class="table my-5">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Location</th>
            <th scope="col">Dates</th>
            <th scope="col">Gender</th>
            <th scope="col">Photo</th>
            <th scope="col">Link</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="author" items="${AUTHORS_LIST}">
            <tr>
                <td>${author.idAuthor}</td>
                <td>${author.nameAuthor}</td>
                <td>${author.country}</td>
                <td>${author.datesOfLife}</td>
                <td>${author.gender}</td>
                <td>${author.photoAuthor}</td>
                <td>${author.linkBiography}</td>
                <%-- td>href="${pageContext.request.contextPath}/${author.linkBiography}">Link</ --%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<br/>
<a href="${pageContext.request.contextPath}/bookshelf/main">Main</a>

</body>
</html>
