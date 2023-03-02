<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!-- <%@ page isErrorPage="true" %> -->
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="ISO-8859-1">
                <link rel="stylesheet" type="text/css" href="/css/styleview.css">
                <title>Insert title here</title>

            </head>

            <body>

                <div class="container-expense">

                    <div class="title">
                        <h1>Expense Details</h1>
                        <a href="/expenses">Go back</a>
                    </div>
                    <!-- <h6 class="error" for="">${errorName}</h6> -->
                    <form:form class="form" action="" method="get" modelAttribute="expense">
                        <input type="hidden" name="_method" value="get">

                        <div class="form-div">
                            <form:label path="name">Expense name:</form:label>
                            <form:input path="name" disabled="true" />
                        </div>

                        <div class="form-div">
                            <form:label path="vendor">Vender:</form:label>
                            <form:input path="vendor" disabled="true" />
                        </div>

                        <div class="form-div">
                            <form:label path="amount">Amount:</form:label>
                            <form:input path="amount" disabled="true" />
                        </div>

                        <div class="form-div">
                            <form:label path="description">Description</form:label>
                            <form:textarea path="description" id="" cols="30" rows="10" disabled="true"></form:textarea>
                        </div>
                    </form:form>
                </div>



            </body>

            </html>