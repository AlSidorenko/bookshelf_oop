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

<html lang="en">
<head>
    <meta charset="utf-8">

    <!-- Header Page -->
    <jsp:include page="${pageContext.request.contextPath}/jsp/views/header.jsp"/>
    <title>Authors OOP</title>
</head>
<body>

<br/>
<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2 text-center">
    <h2>List Authors</h2>
</div>

<!-- put new button: Add Author -->
<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2">
    <input type="button" value="Add Author"
           onclick="window.location.href='${pageContext.request.contextPath}/jsp/author/add_author.jsp';
                   return false;"
           class="btn btn-primary"/>
</div> <!--/ put new button: Add Author -->

<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2 text-center ">
    <table class="table my-5">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Country</th>
            <th scope="col">Dates Life</th>
            <th scope="col">Gender</th>
            <th scope="col">Photo</th>
            <th scope="col">Link Biography</th>
        </tr>
        </thead>

        <tbody>
        <jsp:useBean id="AUTHORS_LIST" scope="request" type="java.util.List"/>
        <c:forEach var="author" items="${AUTHORS_LIST}">

            <!-- set up a link for each Author -->
            <c:url var="tempLink" value="/bookshelf/authors">
                <c:param name="command" value="LOAD_AUTHOR"/>
                <c:param name="id_author" value="${author.idAuthor}"/>
            </c:url>

            <!-- set up a link to delete a Author -->
            <c:url var="deleteLink" value="/bookshelf/authors">
                <c:param name="command" value="DELETE_AUTHOR"/>
                <c:param name="id_author" value="${author.idAuthor}"/>
            </c:url>

            <tr>
                <td>${author.idAuthor}</td>
                <td>${author.nameAuthor}</td>
                <td>${author.country}</td>
                <td>${author.datesOfLife}</td>
                <td>${author.gender}</td>
                <td><img src="${author.photoAuthor}" width="120" height="150" alt="${author.photoAuthor}"/></td>
                <td><a href="${author.linkBiography}">Link</a></td>
                <td>
                    <%-- <a href="${tempLink}">Update</a> --%>
                    |
                    <a href="${deleteLink}"
                       onclick="if (!(confirm('Are you sure you want to delete this author?'))) return false">
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
