<%--@elvariable id="author" type="String"--%>
<%--@elvariable id="quote" type="String"--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Quote</title>
    <%@ include file="imports.jsp"%>
</head>
<body>
<h1>${quote}</h1>
<h2>${author}</h2>
<a class="link-secondary" href="index.jsp">Back to home</a>
</body>
</html>
