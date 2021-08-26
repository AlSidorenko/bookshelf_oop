<%--
  Created by IntelliJ IDEA.
  User: Александр
  Date: 26.08.2021
  Time: 13:26
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

    <title>Add Author OOP</title>

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
    <h2>Add New Author</h2>
</div>

<div class="container">
    <div class="row ">
        <div class="col-md-12 mb-2 mt-4">
            <form action="${pageContext.request.contextPath}/bookshelf/add_authors" method="GET" class="form-sigin">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name_author">Name</label>
                        <input type="text" class="form-control" name="name_author" id="name_author" placeholder="" value="" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="country">Location</label>
                        <input type="text" class="form-control" name="country" id="country" placeholder="" value="" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="dates_life">Dates</label>
                    <input type="text" class="form-control" name="dates_life" id="dates_life" placeholder="" required>
                </div>

                <div class="mb-3">
                    <label for="gender">Gender</label>
                    <input type="text" class="form-control" name="gender" id="gender" placeholder="" required>
                </div>

                <div class="mb-3">
                    <label for="photo_author">Photo</label>
                    <input type="text" class="form-control" name="photo_author" id="photo_author" placeholder="" required>
                </div>

                <div class="mb-3">
                    <label for="link_biography">Link</label>
                    <input type="text" class="form-control" name="link_biography" id="link_biography" placeholder="" required>
                </div>

                <br/>
                <hr class="mb-4">
                <button class="btn btn-lg btn-primary btn-block" type="submit" value="Enter" class="submit">Add Author</button>
            </form>
        </div>
    </div>
</div> <!-- /container -->

</body>
</html>
