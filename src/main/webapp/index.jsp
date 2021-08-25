<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored = "false"%>
<%@ page session = "true"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.87.0">

    <title>Bookshelf OOP</title>
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
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
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

<main class="container">
    <div class="bg-light p-5 rounded">
        <h1>Navbar example</h1>
        <p class="lead">This example is a quick exercise to illustrate how the top-aligned navbar works. As you scroll, this navbar remains in its original position and moves with the rest of the page.</p>
        <a class="btn btn-lg btn-primary" href="https://getbootstrap.com/docs/5.1/components/navbar/" role="button">View navbar docs &raquo;</a>
    </div>
</main>


<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>

</body>
</html>
