<%-- 
    Document   : addNote.jsp
    Date       : 24SEP16
    Author     : David Kolesar

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <title>New Note</title>

    </head>

    <body>

        <div class="container">

      
            <jsp:include page="navbar.jsp" />

            <div class="row">

                <div class="col-sm-4 col-sm-offset-4">
                    <h2>New Note for ${dvd.title}</h2>
                </div>

            </div>

            <div class="row">

                <div class="col-sm-6 col-sm-offset-3">

                    <form action="${pageContext.request.contextPath}/Note/add" method="POST">

                        <input type="hidden" name="dvdId" value="${dvd.dvdId}">

                        <table class="table">

                            <tr>
                                <td>Note</td>
                                <td><textarea rows="2" name="noteText" ></textarea></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><input type="submit" value="Add Note"></td>
                            </tr>

                        </table>

                    </form>

                </div>

            </div>

            <div class="row">
                <div class="col-sm-4 col-sm-offset-5">
                    <a href="${pageContext.request.contextPath}/DVD/edit/${dvd.dvdId}" >Back to Edit ${dvd.title}</a>
                </div>
            </div>

        </div>

    </body>

</html>
