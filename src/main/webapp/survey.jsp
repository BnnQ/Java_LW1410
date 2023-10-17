<%@ page import="me.bnnq.lw1410.models.enums.Gender" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    boolean isModelValid = request.getAttribute("fullName") != null && request.getAttribute("phoneNumber") != null && request.getAttribute("email") != null && request.getAttribute("age") != null && request.getAttribute("subscribed") != null && request.getAttribute("gender") != null && request.getAttribute("error") == null;
%>
<html>
<head>
    <title>Survey</title>
    <%@include file="imports.jsp" %>
    <style>
        .input-group {
            display: flex;
            flex-direction: column;
        }

        .form-control {
            width: 100% !important;
        }
    </style>
</head>
<body>
<div class="container">
    <c:if test="<%= isModelValid %>"><%--@elvariable id="gender" type="Gender"--%>
        <%--@elvariable id="subscribed" type="boolean"--%>
        <%--@elvariable id="age" type="int"--%>
        <%--@elvariable id="email" type="String"--%>
        <%--@elvariable id="phoneNumber" type="String"--%>
        <%--@elvariable id="fullName" type="String"--%>
        <dl class="row">
            <dt class="col-sm-2">
                Full name:
            </dt>
            <dd class="col-sm-10">
                    ${fullName}
            </dd>
            <dt class="col-sm-2">
                Phone number:
            </dt>
            <dd class="col-sm-10">
                    ${phoneNumber}
            </dd>
            <dt class="col-sm-2">
                Email:
            </dt>
            <dd class="col-sm-10">
                    ${email}
            </dd>
            <dt class="col-sm-2">
                Age:
            </dt>
            <dd class="col-sm-10">
                    ${age}
            </dd>
            <dt class="col-sm-2">
                Subscribed:
            </dt>
            <dd class="col-sm-10">
                <%
                    var result = (boolean) request.getAttribute("subscribed") ? "Yes" : "No";
                %>
                <%= result %>
            </dd>
            <dt class="col-sm-2">
                Gender:
            </dt>
            <dd class="col-sm-10">
                <%
                    var gender = (Gender) (request.getAttribute("gender"));
                    result = gender == Gender.MALE ? "Male" : gender == Gender.FEMALE ? "Female" : "Other";
                %>
                <%= result %>
            </dd>
        </dl>
    </c:if>
    <c:if test="<%= !isModelValid %>">
        <form class="form" method="post" action="survey">
            <div class="input-group mb-1">
                <label for="fullNameInput">Full name:</label>
                <input type="text" class="form-control" name="fullName" id="fullNameInput" placeholder="Enter your full name" required/>
            </div>
            <div class="input-group mb-1">
                <label for="phoneNumberInput">Phone number:</label>
                <input type="tel" class="form-control" name="phoneNumber" id="phoneNumberInput"
                       placeholder="Enter your phone number" required/>
            </div>
            <div class="input-group mb-1">
                <label for="emailInput">Email:</label>
                <input type="email" class="form-control" name="email" id="emailInput" placeholder="Enter your email" required/>
            </div>
            <div class="input-group mb-1">
                <label for="ageInput">Age:</label>
                <input type="number" class="form-control" name="age" id="ageInput" placeholder="Enter your age" required/>
            </div>
            <div class="input-group mb-1">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="genderRadio1" value="MALE">
                    <label class="form-check-label" for="genderRadio1">
                        Male
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="genderRadio2" value="FEMALE">
                    <label class="form-check-label" for="genderRadio2">
                        Female
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="genderRadio3" value="OTHER">
                    <label class="form-check-label" for="genderRadio3">
                        Other
                    </label>
                </div>
            </div>
            <div class="input-group mb-3">
                <label for="subscribedInput">Subscribe to our news</label>
                <input type="checkbox" class="form-check-input" name="subscribed" id="subscribedInput"/>
            </div>
            <%--@elvariable id="error" type="String"--%>
            <c:if test="${error != null}">
                <div class="alert alert-danger" role="alert">
                    Error: ${error}
                </div>
            </c:if>
            <div class="input-group mb-1">
                <input type="submit" class="btn btn-success w-100" value="Submit"/>
            </div>
        </form>
    </c:if>
    <a class="link-secondary" href="index.jsp">Back to home</a>
</div>
</body>
</html>