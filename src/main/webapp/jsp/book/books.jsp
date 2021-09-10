<%--
  Created by IntelliJ IDEA.
  User: Александр
  Date: 16.08.2021
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>

<html lang="en">
<head>
    <meta charset="utf-8">

    <!-- Header Page -->
    <jsp:include page="${pageContext.request.contextPath}/jsp/views/header.jsp"/>
    <title>Books OOP</title>
</head>
<body>

<br/>
<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2 text-center">
    <h2>List Books</h2>
</div>

<!-- put new button: Add Book -->
<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2">
    <input type="button" value="Add Book"
           onclick="window.location.href='${pageContext.request.contextPath}/jsp/book/add_book.jsp';
                   return false;"
           class="btn btn-primary"/>
</div> <!--/ put new button: Add Author -->

<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2 text-center ">
    <table class="table my-5">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Genre</th>
            <th scope="col">Link Book</th>
            <th scope="col">Photo Book</th>
            <th scope="col">Rating</th>
        </tr>
        </thead>

        <tbody>
        <jsp:useBean id="BOOKS_LIST" scope="request" type="java.util.List"/>
        <c:forEach var="book" items="${BOOKS_LIST}">

            <!-- set up a link for each Author -->
            <c:url var="tempLink" value="/bookshelf/books">
                <c:param name="command" value="LOAD_BOOK"/>
                <c:param name="id_book" value="${book.idBook}"/>
            </c:url>

            <!-- set up a link to delete a Author -->
            <c:url var="deleteLinkBook" value="/bookshelf/books">
                <c:param name="command" value="DELETE_BOOK"/>
                <c:param name="id_book" value="${book.idBook}"/>
            </c:url>

            <tr>
                <td>${book.idBook}</td>
                <td>${book.nameBook}</td>
                <td>${book.authorBook}</td>
                <td>${book.genreBook}</td>
                <td><a href="${book.linkBook}">Link</a></td>
                <td><img src="${book.photoBook}" width="120" height="150" alt="${book.photoBook}"/></td>
                <td>${book.ratingBook}</td>
                <td>
                        <%-- <a href="${tempLink}">Update</a> --%>
                    |
                    <a href="${deleteLinkBook}"
                       onclick="if (!(confirm('Are you sure you want to delete this book?'))) return false">
                        Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Footer Page -->
<jsp:include page="${pageContext.request.contextPath}/jsp/views/footer.jsp"/>

</body>
</html>