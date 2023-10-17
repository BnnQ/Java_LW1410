<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <%@include file="imports.jsp"%>
</head>
<body>
<%--@elvariable id="number" type="int"--%>
<form method="post" action="multiplication">
    <label for="numberInput">Number:</label>
    <input type="number" name="number" id="numberInput" class="form-control mt-3" min="1" required/>

    <input type="submit" class="btn btn-secondary mt-3" value="Get multiplication table"/>
</form>
<%--@elvariable id="tableResults" type="String[]"--%>
<c:if test="${tableResults != null}">
    <c:forEach var="el" items="${tableResults}">
        <p class="fs-3">${el}</p>
    </c:forEach>
</c:if>
<a class="link-secondary" href="index.jsp">Back to home</a>
</body>
</html>
