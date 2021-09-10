<%--
  Created by IntelliJ IDEA.
  User: Александр
  Date: 09.09.2021
  Time: 19:05
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
    <title>Add Book OOP</title>
</head>

<body>
<br/>

<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2 text-center">
    <h2>Add Book</h2>
</div>

<div class="container">
    <div class="row ">
        <div class="col-md-12 mb-2 mt-4">
            <form action="${pageContext.request.contextPath}/bookshelf/books" method="GET" class="form-sigin" enctype="multipart/form-data">
                <input type="hidden" name="command" value="ADD_BOOK" />
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name_book">Book Name</label>
                        <input type="text" class="form-control" name="name_book" id="name_book" placeholder="" value="" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="author_book">Author</label>
                        <input type="text" class="form-control" name="author_book" id="author_book" placeholder="" value="" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="genre_book">Genre</label>
                    <select type="text" class="form-control" name="genre_book" id="genre_book" placeholder="" required>
                        <option value="">Choose genre...</option>
                        <option value="ADVENTURE">Adventure</option>
                        <option value="BIOGRAPHY">Biography</option>
                        <option value="COMEDY">Comedy</option>
                        <option value="CRIME AND MYSTERY">Crime and mystery</option>
                        <option value="FICTION">Fiction</option>
                        <option value="HISTORY">History</option>
                        <option value="POETRY">Poetry</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="link_book">Link</label>
                    <input type="text" class="form-control" name="link_book" id="link_book" placeholder="" required>
                </div>

                <div class="mb-3">
                    <label for="photo_book" class="text-black">Фото<span class="text-danger"> </span></label>
                    <input type="file" class="photo_book"  name="photo_book" id="photo_book"
                           placeholder="Enter Image" value="#" >
                </div>

                <div class="mb-3">
                    <label for="rating_book">Rating</label>
                    <select type="text" class="form-control" name="rating_book" id="rating_book" placeholder="" required>
                        <option value="">Choose level...</option>
                        <option value="HIGH">High</option>
                        <option value="MIDDLE">Middle</option>
                        <option value="LOW">Low</option>
                    </select>
                </div>

                <hr class="mb-4">
                <button class="btn btn-lg btn-primary btn-block" type="submit" value="Enter" class="submit">Submit</button>
            </form>
        </div>
    </div>
</div> <!-- /container -->

<!-- Footer Page -->
<jsp:include page="${pageContext.request.contextPath}/jsp/views/footer.jsp"/>

</body>
</html>
