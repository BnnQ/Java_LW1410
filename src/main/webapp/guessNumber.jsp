<%--@elvariable id="currentNumber" type="int"--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Guess the number</title>
    <%@include file="imports.jsp"%>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
            margin: 0;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        button {
            padding: 20px;
            font-size: 20px;
            margin: 10px;
            width: 45%;
        }
        form {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
<a class="link-secondary" href="index.jsp">Back to home</a>
<div class="container">
    <div class="buttons">
        <div class="w-100">
        <form method="post" action="guess">
            <input type="hidden" name="action" value="LESS"/>
            <input type="hidden" name="currentNumber" value="${currentNumber}"/>
            <button type="submit" id="less" class="btn btn-danger">Less than</button>
        </form>
        </div>
        <div class="w-100">
        <form method="post" action="guess">
            <input type="hidden" name="action" value="MORE"/>
            <input type="hidden" name="currentNumber" value="${currentNumber}"/>
            <button type="submit" id="more" class="btn btn-success">More than</button>
        </form>
        </div>
    </div>
    <h1 id="number">${not empty currentNumber ? currentNumber : 50}</h1>
    <div class="w-100">
    <form method="post" action="guess">
        <input type="hidden" name="action" value="EQUALS"/>
        <input type="hidden" name="currentNumber" value="${currentNumber}"/>
        <button type="submit" id="equals" class="btn btn-secondary">It's my number!</button>
    </form>
    </div>
</div>

<%--@elvariable id="result" type="int"--%>
<c:if test="${not empty result}">
    <div class="toast" data-bs-autohide="false">
    <div class="toast-header">
        <strong class="me-auto">Game</strong>
        <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
    </div>
    <div class="toast-body">
        Computer guessed the number! ${result}
    </div>
    </div>
</c:if>

<script type="text/javascript">
    $(document).ready(function () {
        $('.toast').toast('show');
    });
</script>
</body>
</html>