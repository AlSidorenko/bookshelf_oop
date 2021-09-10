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

<html lang="en">
<head>
    <meta charset="utf-8">

    <!-- Header Page -->
    <jsp:include page="${pageContext.request.contextPath}/jsp/views/header.jsp"/>
    <title>Add Author OOP</title>
</head>

<body>
<br/>

<div class="container-fluid col-lg-10 col-lg-offset-2 mt-3 pb-2 text-center">
    <h2>Add Author</h2>
</div>

<div class="container">
    <div class="row ">
        <div class="col-md-12 mb-2 mt-4">
            <form action="${pageContext.request.contextPath}/bookshelf/authors" method="GET" class="form-sigin" enctype="multipart/form-data">
                <input type="hidden" name="command" value="ADD_AUTHOR" />
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name_author">Name Author</label>
                        <input type="text" class="form-control" name="name_author" id="name_author" placeholder="" value="" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="country">Country</label>
                        <input type="text" class="form-control" name="country" id="country" placeholder="" value="" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="dates_life">Dates Life</label>
                    <input type="text" class="form-control" name="dates_life" id="dates_life" placeholder="" required>
                </div>

                <div class="mb-3">
                    <label for="gender">Gender</label>
                    <select type="text" class="form-control" name="gender" id="gender" placeholder="" required>
                        <option value="">Choose gender...</option>
                        <option value="MALE">Male</option>
                        <option value="FEMALE">Female</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="photo_author" class="text-black">Photo Author<span class="text-danger"> </span></label>
                    <input type="file" class="photo_author"  name="photo_author" id="photo_author"
                           placeholder="Enter Image" value="#" >
                </div>

                <div class="mb-3">
                    <label for="link_biography">Link Biography</label>
                    <input type="text" class="form-control" name="link_biography" id="link_biography" placeholder="" required>
                </div>

                <hr class="mb-4">
                <button class="btn btn-lg btn-primary btn-block" type="submit" value="Enter" class="submit">Submit</button>
            </form>
        </div>
    </div>
</div> <!-- /container -->

<br/><br/><br/>
<!-- Footer Page -->
<jsp:include page="${pageContext.request.contextPath}/jsp/views/footer.jsp"/>

</body>
</html>
