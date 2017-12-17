<%-- 
    Document   : edit.jsp
    Date       : 24SEP16
    Author     : David Kolesar
--%>
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <title>Edit DVD</title>
        
    
        
    </head>

    <body>

        <div class="container">

            <jsp:include page="navbar.jsp" />

            <h2>Edit DVD</h2>

            <div class="row">

                <div class="col-sm-6">

                    <sf:form action="${pageContext.request.contextPath}/DVD/edit" commandName="dvd" method="POST">

                        <input type="hidden" name="dvdId" value="${dvd.dvdId}" />

                        <table class="table">

                            <tr>
                                <td>Title</td>
                                <td><sf:input type="text" path="title" value="${dvd.title}" /> <br /> <sf:errors class="errorMessage" path="title" /></td>
                            </tr>

                            <tr>
                                <td>Release Date</td>
                                <td><sf:input type="date" path="releaseDate" /> <br /> <sf:errors path="releaseDate" /></td>
                            </tr>

                            <tr>
                                <td>MPAA Rating</td>
                                <td>
                                    <sf:select path="mpaaRating">
                                        <option value="">-No Rating-</option>
                                        <option ${dvd.mpaaRating=="G" ? "selected" : ""} value="G">G</option>
                                        <option ${dvd.mpaaRating=="PG" ? "selected" : ""} value="PG">PG</option>
                                        <option ${dvd.mpaaRating=="PG-13" ? "selected" : ""} value="PG-13">PG-13</option>
                                        <option ${dvd.mpaaRating=="R" ? "selected" : ""} value="R">R</option>
                                    </sf:select>
                                    <br /> <sf:errors path="mpaaRating" />
                                </td>
                            </tr>

                            <tr>
                                <td>Director</td>
                                <td><sf:input type="text" path="director" value="${dvd.director}" /> <br /> <sf:errors path="director" /></td>
                            </tr>

                            <tr>
                                <td>Studio</td>
                                <td><sf:input type="text" path="studio" value="${dvd.studio}" /> <br /> <sf:errors path="studio" /></td>
                            </tr>

                            <tr>
                                <td>Your Rating</td>
                                <td>
                                    <sf:select path="userRating">

                                        <c:forEach var="i" begin="1" end="10">
                                            <option ${dvd.userRating==i ? "selected" : ""} value="${i}">${i}</option>
                                        </c:forEach>

                                    </sf:select>
                                    <br /> <sf:errors path="userRating" />
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><input type="submit" value="Edit Information" /></td>
                            </tr>

                        </table>

                    </sf:form>

                </div>

                <div class="col-sm-6">

                    <table class="table">
                        <thead>
                        <th>Your Notes</th>
                        </thead>

                        <c:forEach items="${dvd.userNotes}" var="note" varStatus="i">
                            <tr>
                                <td>${note.noteText}</td>
                                <td><a href="${pageContext.request.contextPath}/Note/edit/${note.noteId}" >Edit</a></td>
                                <td><a href="${pageContext.request.contextPath}/Note/delete/${note.noteId}" >Delete</a></td>
                            </tr>
                        </c:forEach>

                        <tr>
                            <td><a href="${pageContext.request.contextPath}/Note/add/${dvd.dvdId}" >Add New Note</a></td>
                        </tr>

                    </table>

                </div>

            </div>



        </div>

    </body>

</html>
