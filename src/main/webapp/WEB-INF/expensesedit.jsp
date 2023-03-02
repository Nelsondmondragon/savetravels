<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="ISO-8859-1">
                    <link rel="stylesheet" type="text/css" href="/css/styleedit.css">
                    <title>Insert title here</title>

                </head>

                <body>

                    <div class="container-expense">

                        <div class="title">
                            <h1>Edit expense:</h1>
                            <a href="/expenses">Go back</a>
                        </div>
                        <!-- <h6 class="error" for="">${errorName}</h6> -->
                        <form:form class="form" action="/expenses/${expense.getId()}" method="POST" modelAttribute="expense">

                            <input type="hidden" name="_method" value="put">
                            <form:errors path="name" />
                            <div class="form-div">
                                <form:label path="name">Expense name:</form:label>
                                <form:input path="name" />
                            </div>

                            <form:errors path="vendor" />
                            <div class="form-div">
                                <form:label path="vendor">Vender:</form:label>
                                <form:input path="vendor" />
                            </div>

                            <form:errors path="amount" />
                            <div class="form-div">
                                <form:label path="amount">Amount:</form:label>
                                <form:input path="amount" />
                            </div>

                            <form:errors path="description" />
                            <div class="form-div">
                                <form:label path="description">Description</form:label>
                                <form:textarea path="description" id="" cols="30" rows="10"></form:textarea>
                            </div>
                            <input class="submit" type="submit" value="Submit" />

                        </form:form>
                    </div>



                </body>

                </html>