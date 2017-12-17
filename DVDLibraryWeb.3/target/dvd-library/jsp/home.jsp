<%-- 
    Document   : home.jsp
    Date       : 24SEP16
    Author     : David Kolesar
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
        <title>DVD Library Home</title>
    </head>

    <body>

        <div class="container">

            <jsp:include page="Navbar.jsp"/>

            <br/>

            <div class="row">

                <div class="col-sm-6 ">

                    <h2>DVDs</h2>

                    <table id="DvdTable" class="table">

                        <tr>
                            <th>Title</th>
                            <th>Release Date</th>
                            <th>Content Rating</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>

                        <c:forEach items="${dvdList}" var="dvd">
                            <tr id="dvd-row-${dvd.dvdId}">
                                <td><a data-dvd-id="${dvd.dvdId}" data-toggle="modal" data-target="#showDVDModal">${dvd.title}</a></td>
                                <td>${dvd.releaseDate.year + 1900}</td>
                                <td>${dvd.mpaaRating}</td>
                                <td><a data-dvd-id="${dvd.dvdId}" data-toggle="modal" data-target="#editDVDModal">Edit</a></td>
                                <td><a data-dvd-id="${dvd.dvdId}" data-toggle="modal" data-target="#deleteDVDModal">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>

                    </table>

                </div>

                <div class="col-sm-5 col-sm-offset-1">

                    <h2>Add new DVD</h2>

                    <form action="${pageContext.request.contextPath}/DVD/create" commandName="addDVDCommand" method="POST">

                        <table class="table">

                            <tr>
                                <td>Title</td>
                                <td>
                                    <input id="titleCreate" type="text" path="title"/> <br/>
                                    <div class="errorMessages" id="add-title-validation-error"></div><br/>
                                </td>
                            </tr>

                            <tr>
                                <td>Release Date</td>
                                <td>
                                    <input id="releaseDateCreate" type="date" placeholder="MM/DD/YYYY" path="releaseDate"/> <br/>
                                    <div class="errorMessages" id="add-releaseDate-validation-error"></div>
                                </td>
                            </tr>

                            <tr>
                                <td>MPAA Rating</td>

                                <td>
                                    <select id="mpaaRatingCreate" path="mpaaRating">
                                        <option value="">-MPAA Rating-</option>
                                        <option value="G">G</option>
                                        <option value="PG">PG</option>
                                        <option value="PG-13">PG-13</option>
                                        <option value="R">R</option>
                                    </select>

                                    <br/>

                                    <div class="errorMessages" id="add-mpaaRating-validation-error"></div>
                                </td>
                            </tr>

                            <tr>
                                <td>Director</td>
                                <td>
                                    <input id="directorCreate" type="text" path="director"/> <br/>
                                    <div class="errorMessages" id="add-director-validation-error"></div>
                                </td>
                            </tr>

                            <tr>
                                <td>Studio</td>
                                <td>
                                    <input id="studioCreate" type="text" path="studio"/> <br/>
                                    <div class="errorMessages" id="add-studio-validation-error"></div>
                                </td>
                            </tr>

                            <tr>
                                <td>Your Rating</td>
                                <td>
                                    <select id="userRatingCreate" path="userRating">

                                        <option value="">Input your rating</option>
                                        <option value="This movie was awful">This movie was awful</option>
                                        <option value="This was a bad movie">This was a bad movie</option>
                                        <option value="Meh">Meh</option>
                                        <option value="This was a good movie">This was a good movie</option>
                                        <option value="This was a great movie">This was a great movie</option>
                                        <option value="This was one of my favorite movies">This was one of my favorite movies</option>
                                        <option value="I have not watched this yet">I have not watched this yet</option>

                                    </select>

                                    <br/>


                                    <div class="errorMessages" id="add-userRating-validation-error"></div>
                                </td> 

                                </select>

                            <br/>


                            </td>
                            </tr>

                            <tr>
                                <td>Note</td>
                                <td>
                                    <input id="noteTextCreate" type="text" name="noteText"/>
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td>
                                    <input id="addDVDButton" type="submit" value="Add DVD"/>
                                </td>
                            </tr>

                        </table>

                    </form>

                </div>

            </div>

        </div>


        <div class="modal fade" id="showDVDModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="container">

                            <div class="row">

                                <div class="col-sm-3">

                                    <table class="table">

                                        <tr>
                                            <td>Title:</td>
                                            <td id="showTitle"></td>
                                        </tr>

                                        <tr>
                                            <td>Release Date:</td>
                                            <td id="showReleaseDate"></td>
                                        </tr>

                                        <tr>
                                            <td>MPAA Rating:</td>
                                            <td id="showMpaaRating"></td>
                                        </tr>

                                        <tr>
                                            <td>Director</td>
                                            <td id="showDirector"></td>
                                        </tr>

                                        <tr>
                                            <td>Studio</td>
                                            <td id="showStudio"></td>
                                        </tr>

                                        <tr>
                                            <td>Your Rating:</td>
                                            <td id="showUserRating"></td>
                                        </tr>

                                    </table>

                                </div>

                                <div class="col-sm-3 col-sm-offset-0">

                                    <table id="showNoteTable" class="table">

                                        <tr>
                                            <th id="showNotesTableHeader"></th>
                                        </tr>

                                    </table>

                                </div>

                            </div>

                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal" id="editDVDModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit DVD</h4>
                    </div>
                    <div class="modal-body">

                        <div class="container">

                            <div class="row">

                                <div class="col-sm-3">

                                    <table class="table">

                                        <input type="hidden" id="editId"/>

                                        <tr>
                                            <td>Title</td>
                                            <td>
                                                <input type="text" id="editTitle"/> <br/>
                                                <div class="errorMessages" id="edit-title-validation-error"></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>Release Date</td>
                                            <td>
                                                <input type="date" id="editReleaseDate"/><br/>
                                                <div class="errorMessages" id="edit-releaseDate-validation-error"></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>MPAA Rating</td>
                                            <td>
                                                <select id="editMpaaRating">
                                                    <option value="">-MPAA Rating-</option>

                                                    <option ${dvd.mpaaRating=="G" ? "selected" : ""} value="G">G</option>
                                                    <option ${dvd.mpaaRating=="PG" ? "selected" : ""} value="PG">PG</option>
                                                    <option ${dvd.mpaaRating=="PG-13" ? "selected" : ""} value="PG-13">PG-13
                                                    </option>
                                                    <option ${dvd.mpaaRating=="R" ? "selected" : ""} value="R">R</option>
                                                </select>

                                                <br/>

                                                <div class="errorMessages" id="edit-MpaaRating-validation-error"></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>Director</td>
                                            <td>
                                                <input type="text" id="editDirector"/> <br/>
                                                <div class="errorMessages" id="edit-director-validation-error"></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>Studio</td>
                                            <td>
                                                <input type="text" id="editStudio"/> <br/>
                                                <div class="errorMessages" id="edit-studio-validation-error"></div>
                                            </td>
                                        </tr>

                                        <tr>

                                            <td>Your Rating</td>
                                            <td>
                                                <select id="editUserRating" path="userRating">

                                                    <option value="">-Select Your Rating-</option>
                                                    <option value="This movie was awful">This movie was awful</option>
                                                    <option value="This was a bad movie">This was a bad movie</option>
                                                    <option value="Meh">Meh</option>
                                                    <option value="This was a good movie">This was a good movie</option>
                                                    <option value="This was a great movie">This was a great movie</option>
                                                    <option value="This was one of my favorite movies">This was one of my favorite movies</option>
                                                    <option value="I have not watched this yet">I have not watched this yet</option>

                                                </select>

                                                <br/>
                                                 <div class="errorMessages" id="edit-userRating-validation-error"></div>
                                            </td> 
                                            </select>

                                        <br/>


                                        </td>
                                        </tr>

                                    </table>

                                </div>

                                <div class="col-sm-3 col-sm-offset-0">

                                    <table id="editNoteTable" class="table">

                                        <tr>
                                            <th id="editNotesTableHeader"></th>
                                            <td colspan="2"><a data-toggle="modal" data-target="#createNoteModal"
                                                               data-backdrop="false">Add Note</a>
                                            </td>
                                        </tr>

                                    </table>

                                </div>

                            </div>

                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="editDVDButton">Save changes</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="deleteDVDModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Are you sure you want to permanently delete this movie?</h4>
                    </div>
                    <div class="modal-body">

                        <div class="container">

                            <div class="row">

                                <div class="col-sm-3">

                                    <table class="table">

                                        <input type="hidden" id="deleteId"/>

                                        <tr>
                                            <td>Title:</td>
                                            <td id="deleteTitle"></td>
                                        </tr>

                                        <tr>
                                            <td>Release Date:</td>
                                            <td id="deleteReleaseDate"></td>
                                        </tr>

                                        <tr>
                                            <td>MPAA Rating:</td>
                                            <td id="deleteMpaaRating"></td>
                                        </tr>

                                        <tr>
                                            <td>Director</td>
                                            <td id="deleteDirector"></td>
                                        </tr>

                                        <tr>
                                            <td>Studio</td>
                                            <td id="deleteStudio"></td>
                                        </tr>

                                        <tr>
                                            <td>Your Rating:</td>
                                            <td id="deleteUserRating"></td>
                                        </tr>

                                        <input type="hidden" id="deleteUserNotes"/>

                                    </table>

                                </div>

                                <div class="col-sm-3 col-sm-offset-0">

                                    <table id="deleteNoteTable" class="table">

                                        <tr>
                                            <th id="deleteNotesTableHeader"></th>
                                        </tr>

                                    </table>

                                </div>

                            </div>

                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="deleteDVDButton" data-dismiss="modal">Confirm</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal" id="createNoteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Create New Note</h4>
                    </div>
                    <div class="modal-body">


                        <table>

                            <tr>
                                <td><h4>New Note Text</h4></td>
                            </tr>

                            <tr>
                                <td>
                                    <input type="text" id="createNoteText"/> <br/>
                                    <div class="errorMessages" id="add-noteText-validation-error"></div>
                                </td>
                            </tr>

                        </table>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="createNoteButton">Create Note</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal" id="editNoteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Existing Note</h4>
                    </div>
                    <div class="modal-body">


                        <table>

                            <input type="hidden" id="editNoteId"/>
                            <input type="hidden" id="editNoteDvdId"/>

                            <tr>
                                <td>Note Text</td>
                                <td>
                                    <input type="text" id="editNoteText"/> <br/>
                                    <div class="errorMessages" id="edit-noteText-validation-error"></div>
                                </td>
                            </tr>

                        </table>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="editNoteButton">Submit Changes
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal" id="deleteNoteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Delete Note</h4>
                    </div>
                    <div class="modal-body">

                        <div class="container">

                            <div class="row">

                                <div class="col-sm-2 col-sm-offset-2">

                                    <table class="table">

                                        <input type="hidden" id="deleteNoteId"/>

                                        <tr>
                                            <td>Note Text:</td>
                                            <td id="deleteNoteText"></td>
                                        </tr>

                                    </table>

                                </div>

                            </div>

                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="deleteNoteButton" data-dismiss="modal">Delete Note</button>
                    </div>
                </div>
            </div>
        </div>


        <script>
            var contextRoot = "${pageContext.request.contextPath}";
        </script>

        <script src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/app.js"></script>

    </body>

</html>
