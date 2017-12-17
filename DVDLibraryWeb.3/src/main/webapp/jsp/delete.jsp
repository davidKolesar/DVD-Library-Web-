<%-- 
    Document   : delete.jsp
    Date       : 24SEP16
    Author     : David Kolesar
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <title>Delete DVD</title>

    </head>

    <body>

        <div class="container">

            <jsp:include page="navbar.jsp"/>

            <h2>Delete DVD</h2>

            <div class="row">

                <div class ="col-sm-6">

                    <form action="${pageContext.request.contextPath}/DVD/delete" method="POST">

                        <input type="hidden" name="dvdId" value="${dvd.dvdId}">

                        <table class="table table-bordered">

                            <tr>
                                <td>Title</td>
                                <td>${dvd.title}</td>
                            </tr>

                            <tr>
                                <td>Release Date</td>
                                <td>${dvd.releaseDate.month + 1}/${dvd.releaseDate.date}/${dvd.releaseDate.year + 1900}</td>
                            </tr>

                            <tr>
                                <td>MPAA Rating</td>
                                <td>${dvd.mpaaRating}</td>
                            </tr>

                            <tr>
                                <td>Director</td>
                                <td>${dvd.director}</td>
                            </tr>

                            <tr>
                                <td>Studio</td>
                                <td>${dvd.studio}</td>
                            </tr>

                            <tr>
                                <td>Your Rating</td>
                                <td>${dvd.userRating}</td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><input type="submit" value="Delete DVD"></td>
                            </tr>

                        </table>

                    </form>

                </div>
                            
                            <div class="col-sm-3 col-sm-offset-1">
                                
                                <table class="table table-bordered">
                                    
                                    <thead>
                                        <th>Your Notes</th>
                                    </thead>
                                    
                                    <c:forEach items="${dvd.userNotes}" var="i">
                                        <tr>
                                            <td>${i.noteText}</td>
                                        </tr>
                                    </c:forEach>
                                    
                                </table>
                                
                            </div>

            </div>

        </div>

    </body>

</html>
