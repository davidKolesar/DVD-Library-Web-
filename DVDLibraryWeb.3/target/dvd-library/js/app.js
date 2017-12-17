/* 
 * 
 * Author : David Kolesar
 */

$(document).ready(function () {



    $('#addDVDButton').on('click', function (e) {

        e.preventDefault();

        var addDVDCommand = {
            title: $('#titleCreate').val(),
            releaseDate: $('#releaseDateCreate').val(),
            mpaaRating: $('#mpaaRatingCreate').val(),
            director: $('#directorCreate').val(),
            studio: $('#studioCreate').val(),
            userRating: $('#userRatingCreate').val(),
            noteText: $('#noteTextCreate').val()
        };

        var addDVDCommandData = JSON.stringify(addDVDCommand);

        $.ajax({
            url: contextRoot + "/DVD/",
            type: "POST",
            data: addDVDCommandData,
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (data, status) {

                clearAddDVDErrorMessages();

                var tableRow = buildDVDRow(data);

                $('#DvdTable').append($(tableRow));

                $('#titleCreate').val('');
                $('#releaseDateCreate').val('');
                $('#mpaaRatingCreate').val('');
                $('#directorCreate').val('');
                $('#studioCreate').val('');
                $('#userRatingCreate').val('');
                $('#noteTextCreate').val('');

            },
            error: function (data, status) {

                clearAddDVDErrorMessages();

                var errors = data.responseJSON.errorList;

                $.each(errors, function (index, error) {

                    if (error.fieldName == "title") {
                        $('#add-title-validation-error').append(error.message);
                    }

                    if (error.fieldName == "releaseDate") {
                        $('#add-releaseDate-validation-error').append(error.message);
                    }

                    if (error.fieldName == "mpaaRating") {
                        $('#add-mpaaRating-validation-error').append(error.message);
                    }

                    if (error.fieldName == "director") {
                        $('#add-director-validation-error').append(error.message);
                    }

                    if (error.fieldName == "studio") {
                        $('#add-studio-validation-error').append(error.message);
                    }

                    if (error.fieldName == "userRating") {
                        $('#add-userRating-validation-error').append(error.message);
                    }

                });

            }
        });
    });

    $('#showDVDModal').on('shown.bs.modal', function (e) {

        var link = $(e.relatedTarget);
        var dvdId = link.data('dvd-id');

        $.ajax({
            url: contextRoot + "/DVD/" + dvdId,
            type: "GET",
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (data, status) {

                $('#myModalLabel').text(data.dvd.title);

                $('#showTitle').text(data.dvd.title);
                $('#showReleaseDate').text(data.dvd.releaseDate);
                $('#showMpaaRating').text(data.dvd.mpaaRating);
                $('#showDirector').text(data.dvd.director);
                $('#showStudio').text(data.dvd.studio);
                $('#showUserRating').text(data.dvd.userRating);

                $('#showNotesTableHeader').text(data.dvd.title + " Notes");

                for (var i = 0; i < data.dvdNoteList.length; i++) {

                    var tableRow = buildShowNoteRow(data.dvdNoteList[i].noteText);

                    $('#showNoteTable').append($(tableRow));

                }

            },
            error: function (data, status) {
                console.log("DVD not found");
            }
        });

    });
    $('#editDVDModal').on('shown.bs.modal', function (e) {

        var link = $(e.relatedTarget);
        var dvdId = link.data("dvd-id");

        $.ajax({
            url: contextRoot + "/DVD/" + dvdId,
            type: "GET",
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
            },
            success: function (data, status) {

                $('#editId').val(data.dvd.dvdId);
                $('#editTitle').val(data.dvd.title);
                $('#editReleaseDate').val(data.dvd.releaseDate);
                $('#editMpaaRating').val(data.dvd.mpaaRating);
                $('#editDirector').val(data.dvd.director);
                $('#editStudio').val(data.dvd.studio);
                $('#editUserRating').val(data.dvd.userRating);

                $('#editNotesTableHeader').text(data.dvd.title + " Notes");

                for (var i = 0; i < data.dvdNoteList.length; i++) {

                    var tableRow = buildEditNoteRow(data.dvdNoteList[i].noteText, data.dvdNoteList[i].noteId);

                    $('#editNoteTable').append($(tableRow));

                }

            },
            error: function (data, status) {
                console.log("Error reading DVD");
            }
        });

    });

    $('#editDVDButton').on('click', function (e) {

        e.preventDefault();

        var dvd = {
            dvdId: $('#editId').val(),
            title: $('#editTitle').val(),
            releaseDate: $('#editReleaseDate').val(),
            mpaaRating: $('#editMpaaRating').val(),
            director: $('#editDirector').val(),
            studio: $('#editStudio').val(),
            userRating: $('#editUserRating').val()
        };

        var dvdData = JSON.stringify(dvd);

        $.ajax({
            url: contextRoot + "/DVD/" + dvd.dvdId,
            type: "PUT",
            data: dvdData,
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (data, status) {

                clearEditDVDErrorMessages();

                var tableRow = buildDVDRow(data);

                $('#dvd-row-' + data.dvdId).replaceWith($(tableRow));

                $('#editDVDModal').modal('hide');

            },
            error: function (data, status) {

                clearEditDVDErrorMessages();

                var errors = data.responseJSON.errorList;

                $.each(errors, function (index, error) {

                    if (error.fieldName == "title") {
                        $('#edit-title-validation-error').append(error.message);
                    }

                    if (error.fieldName == "releaseDate") {
                        $('#edit-releaseDate-validation-error').append(error.message);
                    }

                    if (error.fieldName == "mpaaRating") {
                        $('#edit-MpaaRating-validation-error').append(error.message);
                    }

                    if (error.fieldName == "director") {
                        $('#edit-director-validation-error').append(error.message);
                    }

                    if (error.fieldName == "studio") {
                        $('#edit-studio-validation-error').append(error.message);
                    }

                    if (error.fieldName == "userRating") {

                        $('#edit-userRating-validation-error').append(error.message);
                    }

                });

            }
        });

    });

    $('#deleteDVDModal').on('shown.bs.modal', function (e) {

        var link = $(e.relatedTarget);
        var dvdId = link.data("dvd-id");

        $.ajax({
            url: contextRoot + "/DVD/" + dvdId,
            type: "GET",
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
            },
            success: function (data, status) {
                $('#deleteId').val(data.dvd.dvdId);
                $('#deleteTitle').text(data.dvd.title);
                $('#deleteReleaseDate').text(data.dvd.releaseDate);
                $('#deleteMpaaRating').text(data.dvd.mpaaRating);
                $('#deleteDirector').text(data.dvd.director);
                $('#deleteStudio').text(data.dvd.studio);
                $('#deleteUserRating').text(data.dvd.userRating);

                $('#deleteUserNotes').val(data.userNotes);

                $('#deleteNotesTableHeader').text(data.dvd.title + " Notes");

                for (var i = 0; i < data.dvdNoteList.length; i++) {

                    var tableRow = buildShowNoteRow(data.dvdNoteList[i].noteText);

                    $('#deleteNoteTable').append($(tableRow));

                }
            },
            error: function (data, status) {
                console.log("DVD not found");
            }
        });

    });

    $('#deleteDVDButton').on('click', function (e) {

        e.preventDefault();

        var dvd = {
            dvdId: $('#deleteId').val(),
            title: $('#deleteTitle').val(),
            releaseDate: $('#deleteReleaseDate').val(),
            mpaaRating: $('#deleteMpaaRating').val(),
            director: $('#deleteDirector').val(),
            studio: $('#deleteStudio').val(),
            userRating: $('#deleteUserRating').val(),
            userNotes: $('#deleteUserNotes').val()
        };

        var dvdData = JSON.stringify(dvd);

        $.ajax({
            url: contextRoot + "/DVD/" + dvd.dvdId,
            type: "DELETE",
            data: dvdData,
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (data, status) {
                $('#dvd-row-' + data.dvdId).remove();
            },
            error: function (data, status) {
                console.log("DVD not found");
            }
        });

    });

    $('#createNoteButton').on('click', function (e) {

        e.preventDefault();

        var dvd = {
            dvdId: $('#editId').val()
        };

        var note = {
            noteText: $('#createNoteText').val(),
            dvd: dvd
        };

        var noteData = JSON.stringify(note);

        $.ajax({
            url: contextRoot + "/Note/",
            type: "POST",
            data: noteData,
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (data, status) {

                clearAddNoteErrorMessages();

                var tableRow = buildEditNoteRow(data.noteText, data.noteId);

                $('#editNoteTable').append($(tableRow));

                $('#createNoteModal').modal('toggle');

            },
            error: function (data, status) {

                clearAddNoteErrorMessages();

                var errors = data.responseJSON.errorList;

                $.each(errors, function (index, error) {

                    if (error.fieldName == "noteText") {
                        $('#add-noteText-validation-error').append(error.message);
                    }

                });

            }
        });

    });

    $('#editNoteModal').on('shown.bs.modal', function (e) {

        var link = $(e.relatedTarget);
        var noteId = link.data("note-id");

        $.ajax({
            url: contextRoot + "/Note/" + noteId,
            type: "GET",
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
            },
            success: function (data, status) {

                $('#editNoteId').val(data.noteId);
                $('#editNoteText').val(data.noteText);
                $('#editNoteDvdId').val(data.dvd.dvdId);

            },
            error: function (data, status) {
                console.log("Error reading Note");
            }
        });

    });

    $('#editNoteButton').on('click', function (e) {

        e.preventDefault();

        var dvd = {
            dvdId: $('#editNoteDvdId').val()
        };

        var note = {
            noteId: $('#editNoteId').val(),
            noteText: $('#editNoteText').val(),
            dvd: dvd
        };

        var noteData = JSON.stringify(note);

        $.ajax({
            url: contextRoot + "/Note/" + note.noteId,
            type: "PUT",
            data: noteData,
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (data, status) { // A Note object is the response (data)

                clearEditNoteErrorMessages();

                var tableRow = buildEditNoteRow(data.noteText, data.noteId);

                $('#note-row-' + data.noteId).replaceWith($(tableRow));

                $('#editNoteModal').modal('hide');

            },
            error: function (data, status) {

                clearEditNoteErrorMessages();

                var errors = data.responseJSON.errorList;

                $.each(errors, function (index, error) {

                    if (error.fieldName == "noteText") {
                        $('#edit-noteText-validation-error').append(error.message);
                    }

                });

            }
        });

    });

    $('#deleteNoteModal').on('shown.bs.modal', function (e) {

        link = $(e.relatedTarget);
        noteId = link.data("note-id");

        $.ajax({
            url: contextRoot + "/Note/" + noteId,
            type: "GET",
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
            },
            success: function (data, status) {
                $('#deleteNoteId').val(data.noteId);
                $('#deleteNoteText').text(data.noteText);
            },
            error: function (data, status) {
                console.log("Error with something");
            }
        });

    });


    $('#deleteNoteButton').on('click', function (e) {

        var note = {
            noteId: $('#deleteNoteId').val()
        };

        var noteData = JSON.stringify(note);

        $.ajax({
            url: contextRoot + "/Note/" + noteId,
            type: "DELETE",
            data: noteData,
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (data, status) {
                $('#note-row-' + data.noteId).remove();
            },
            error: function (data, status) {
                console.log("Error in the Delete Note Button method");
            }
        });

    });


    $('#showDVDModal').on('hidden.bs.modal', function () {

        $('#showTitle').text('');
        $('#showReleaseDate').text('');
        $('#showMpaaRating').text('');
        $('#showDirector').text('');
        $('#showStudio').text('');

        $('.noteRows').text('');

    });

    $('#editDVDModal').on('hidden.bs.modal', function () {

        $('#editTitle').val('');
        $('#editReleaseDate').val('');
        $('#editDirector').val('');
        $('#editStudio').val('');

        $('.noteRows').text('');

    });

    $('#deleteDVDModal').on('hidden.bs.modal', function () {

        $('#deleteTitle').text('');
        $('#deleteReleaseDate').text('');
        $('#deleteMpaaRating').text('');
        $('#deleteDirector').text('');
        $('#deleteStudio').text('');

        $('.noteRows').text('');

    });

    $('#createNoteModal').on('hidden.bs.modal', function () {

        $('#createNoteText').val('');

    });

    $('#editNoteModal').on('hidden.bs.modal', function () {

        $('#editNoteText').val('');

    });

    function buildDVDRow(data) {

        var date = new Date(data.releaseDate);
        var releaseYear = date.getFullYear();

        var tableRow = '\
                <tr id="dvd-row-' + data.dvdId + '"> \n\
                    <td><a data-dvd-id="' + data.dvdId + '" data-toggle="modal" data-target="#showDVDModal">' + data.title + '</a></td> \n\
                    <td>' + releaseYear + '</td> \n\
                    <td>' + data.mpaaRating + '</td> \n\
                    <td><a data-dvd-id="' + data.dvdId + '" data-toggle="modal" data-target="#editDVDModal" >Edit</a></td> \n\
                    <td><a data-dvd-id="' + data.dvdId + '" data-toggle="modal" data-target="#deleteDVDModal" >Delete</a></td> \n\
                </tr>';

        return tableRow;

    }
    ;

    function buildShowNoteRow(text) {

        var tableRow = '\
                <tr class="noteRows"> \n\
                    <td>' + text + '</td> \n\
                </tr>';

        return tableRow;

    }
    ;

    function buildEditNoteRow(text, noteId) {

        var tableRow = '\
                <tr id="note-row-' + noteId + '" class="noteRows"> \n\
                    <td>' + text + '</td> \n\
                    <td><a data-note-id="' + noteId + '" data-toggle="modal" data-target="#editNoteModal">Edit</a></td>\n\
                    <td><a data-note-id="' + noteId + '" data-toggle="modal" data-target="#deleteNoteModal">Delete</a></td>\n\
                </tr>';

        return tableRow;

    }
    ;

    function clearEditDVDErrorMessages() {

        $('#edit-title-validation-error').text('');
        $('#edit-releaseDate-validation-error').text('');
        $('#edit-MpaaRating-validation-error').text('');
        $('#edit-director-validation-error').text('');
        $('#edit-studio-validation-error').text('');
        $('#edit-userRating-validation-error').text('');

    }
    ;

    function clearAddDVDErrorMessages() {

        $('#add-title-validation-error').text('');
        $('#add-releaseDate-validation-error').text('');
        $('#add-mpaaRating-validation-error').text('');
        $('#add-director-validation-error').text('');
        $('#add-studio-validation-error').text('');
        $('#add-userRating-validation-error').text('');

    }
    ;

    function clearAddNoteErrorMessages() {

        $('#add-noteText-validation-error').text('');


    }

    function clearEditNoteErrorMessages() {
        $('#edit-noteText-validation-error').text('');
    }

});
