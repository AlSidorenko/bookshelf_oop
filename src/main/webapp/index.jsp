<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>

<html lang="en">

<head>
    <!-- Header Page -->
    <jsp:include page="${pageContext.request.contextPath}/jsp/views/header.jsp"/>
    <title>Bookshelf OOP</title>
</head>

<body>
<main class="container">
    <div class="bg-light p-5 rounded">
        <h1>Книжкова полиця</h1>
        <p class="lead">Основні класи: </p>

        <p> книжка (назва, автор, жанр, посилання на електронній файл,
            посилання на файл з зображенням, особистий рейтинг книги),
            список книг; </p>

        <p>автор (ПІБ, країна, дати життя, стать, фото, посилання на файл з біографією),
            список авторів. </p>

        <p>Основні функції:
            ведення списку книг, визначення улюблених книг,
            пошук книги за різними ознаками, ведення довідника жанрів;
            ведення списку авторів, визначення улюбленого автора,
            пошук авторів за різними ознаками, ведення довідника країн.</p>

    </div>
</main>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<!-- Footer Page -->
<jsp:include page="${pageContext.request.contextPath}/jsp/views/footer.jsp"/>

</body>
</html>
