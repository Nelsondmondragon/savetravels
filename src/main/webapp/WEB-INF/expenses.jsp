<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="ISO-8859-1">
                    <link rel="stylesheet" type="text/css" href="/css/style.css">
                    <title>Insert title here</title>

                </head>

                <body>
                    <div class="container-travels">
                        <h1>Save Travels</h1>
                        <table>
                            <thead>
                                <tr>
                                    <th>Expense</th>
                                    <th>Vendor</th>
                                    <th>Amount</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="expense" items="${expenses}">
                                    <tr>
                                        <td>
                                            <a href="/expenses/${expense.getId()}">${expense.getName()}</a>
                                        </td>
                                        <td>
                                            ${expense.getVendor()}
                                        </td>
                                        <td>
                                            ${expense.getAmount()}
                                        </td>
                                        <td>
                                            ${expense.getDescription()}
                                        </td>
                                        <td>
                                            <a href="/expenses/edit/${expense.getId()}">edit</a>
                                        </td>
                                        <td>
                                            <form action="/expenses/${expense.getId()}" method="post">
                                                <input type="hidden" name="_method" value="delete">
                                                <input type="submit" value="Delete">

                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>



                            </tbody>

                        </table>
                    </div>

                    <div class="container-expense">

                        <h1>Add an expense:</h1>
                        <!-- <h6 class="error" for="">${errorName}</h6> -->
                        <form:form class="form" action="/expenses" method="POST" modelAttribute="expense">
                            <!-- <input type="hidden" name="_method" value="put"> -->


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
                                <form:input min="0" path="amount" />
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