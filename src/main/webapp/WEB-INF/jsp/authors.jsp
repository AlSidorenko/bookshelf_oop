<%--
  Created by IntelliJ IDEA.
  User: Александр
  Date: 16.08.2021
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.87.0">

    <title>Authors OOP</title>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/static/icon/favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/navbar-static/">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/css/navbar-top.css" rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Bookshelf</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"
                       href="${pageContext.request.contextPath}/bookshelf/main">Home</a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"
                       href="${pageContext.request.contextPath}/bookshelf/books">List of Books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"
                       href="${pageContext.request.contextPath}/bookshelf/authors">List of Authors</a>
                </li>
            </ul>

            <form class="d-flex" action="">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<br/>

<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2 text-center">
    <h2>List Of Authors</h2>
</div>

<!-- put new button: Add Author -->
<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2">
    <input type="button" value="Add Author"
           onclick="window.location.href='${pageContext.request.contextPath}/bookshelf/add_authors';
           return false;"
           class="btn btn-primary"/>
</div> <!--/ put new button: Add Author -->

<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2 text-center ">
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
        <jsp:useBean id="AUTHORS_LIST" scope="request" type="java.util.List"/>
        <c:forEach var="author" items="${AUTHORS_LIST}">
            <tr>
                <td>${author.idAuthor}</td>
                <td>${author.nameAuthor}</td>
                <td>${author.country}</td>
                <td>${author.datesOfLife}</td>
                <td>${author.gender}</td>
                <td><img src="${author.photoAuthor}" width="120" height="150" alt="${author.photoAuthor}"/></td>
                <td><a href="${author.linkBiography}">Link Biography</a></td>
                <td>
                    <a href="${tempLink}">Update</a>
                    |
                    <a href="${deleteLink}"
                       onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">
                        Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
