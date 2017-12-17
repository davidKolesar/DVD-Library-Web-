<%-- 
    Document   : create.jsp
    Date       : 24SEP16
    Author     : David Kolesar
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <title>New DVD</title>
        
 

    </head>

    <body>

        <div class="container">

            <jsp:include page="header.jsp" />
            <jsp:include page="navbar.jsp" />

            <br />

            <h2>New DVD</h2>

            <sf:form action="${pageContext.request.contextPath}/DVD/create" commandName="addDVDCommand" method="POST">

                <div class="row">

                    <div class="col-sm-6">

                        <table class="table">

                            <tr>
                                <td>Title</td>
                                <td><sf:input type="text" path="title" /> <br /> <sf:errors class="errorMessage" path="title" /> </td> 
                            </tr>

                            <tr>
                                <td>Release Date</td>
                                <td><sf:input type="date" placeholder="MM/DD/YYYY" path="releaseDate" /> <br /> <sf:errors class="errorMessage" path="releaseDate" /></td>
                            </tr>

                            <tr>
                                <td>MPAA Rating</td>
                                <td>
                                    <sf:select path="mpaaRating">
                                        <option value="">-MPAA Rating-</option>
                                        <option value="G">G</option>
                                        <option value="PG">PG</option>
                                        <option value="PG-13">PG-13</option>
                                        <option value="R">R</option>
                                    </sf:select>
                                    <br /> <sf:errors class="errorMessage" path="mpaaRating" />
                                </td>
                            </tr>

                            <tr>
                                <td>Director</td>
                                <td><sf:input type="text" path="director" /> <br /> <sf:errors class="errorMessage" path="director" /></td>
                            </tr>

                            <tr>
                                <td>Studio</td>
                                <td><sf:input type="text" path="studio" /> <br /> <sf:errors class="errorMessage" path="studio" /></td>
                            </tr>

                            <tr>
                                <td>Your Rating</td>
                                <td>
                                    <sf:select path="userRating">
                                        <option value="">-Your Rating-</option>

                                        <c:forEach var="i" begin="1" end="10">
                                            <option value="${i}">${i}</option>
                                        </c:forEach>

                                    </sf:select>
                                    <br /> <sf:errors class="errorMessage" path="userRating" />
                                </td>
                            </tr>

                            <tr>
                                <td>Note</td>
                                <td><input type="text" name="noteText"</td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><input type="submit" value="Add DVD"></td>
                            </tr>

                        </table>

                    </div>

                </div>

            </sf:form>

        </div>

    </body>

</html>
