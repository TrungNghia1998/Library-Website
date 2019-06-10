

function loadTrangEbook() {
    window.location.href = "/Admin/Ebook/";
}

//Thêm một ebook
function AddEbook() {
    var res = validateEbook();
    if (res == false) {
        return false;
    }
    var bookselected = document.getElementById("ddlBookName");
    var typeebookselected = document.getElementById("ddlTypename");

    var ebookObj = {
        BookID: bookselected[bookselected.selectedIndex].value,
        TypeEbookID: typeebookselected[typeebookselected.selectedIndex].value,
        Link: $('#linkDownload').val(),
    };
    $.ajax({
        url: "/Admin/Book/AddEbook",
        data: JSON.stringify(ebookObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#modalAddOrEditEbook').modal('hide');
            $.notify(result.message, {
                globalPosition: "top center",
                className: "success"
            });

            setTimeout(loadTrangEbook, 1000);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Lấy ebook theo id
function getEbookByID(idbook, typeid) {
    //$('#typeEbook').css('border-color', 'lightgrey');
    //$('#linkDownload').css('border-color', 'lightgrey');

    $.ajax({
        url: "/Admin/Book/GetEbookByID?idbook=" + idbook + "&typeid=" + typeid,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#ddlBookName').val(result.BookID);
            $("#ddlBookName").attr('disabled', true);
            $('#ddlTypename').val(result.TypeEbookID);
            $("#ddlTypename").attr('disabled', true);
            $('#linkDownload').val(result.LinkDownload);
            $('#modalAddOrEditEbook').modal('show');
            $('#btnUpdateEbook').show();
            $('#btnAddEbook').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

//chỉnh sữa một ebook
function UpdateEbook() {
    var res = validateEbook();
    if (res == false) {
        return false;
    }
    var bookselected = document.getElementById("ddlBookName");
    var typeebookselected = document.getElementById("ddlTypename");

    var ebookObj = {
        BookID: bookselected[bookselected.selectedIndex].value,
        TypeEbookID: typeebookselected[typeebookselected.selectedIndex].value,
        Link: $('#linkDownload').val(),
    };

    $.ajax({
        url: "/Admin/Book/UpdateEbook",
        data: JSON.stringify(ebookObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#modalAddOrEditEbook').modal('hide');
            $('#bookID').val("");
            $('#typeEbook').val("");
            $('#linkDownload').val("");
            $('#btnUpdateEbook').hide();
            $('#btnAddEbook').show();
            $.notify(result.message, {
                globalPosition: "top center",
                className: "success"
            });
            setTimeout(loadTrangEbook, 1000);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Xoá một ebook
function DeleteEbook(idbook, typeid) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: "/Admin/Book/DeleteEbook?idbook=" + idbook + "&typeid=" + typeid,
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                $.notify(result.message, {
                    globalPosition: "top center",
                    className: "success"
                });
                setTimeout(loadTrangEbook, 1000);
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}



function validateEbook() {
    var isValid = true;
    if ($('#linkDownload').val().trim() == "") {
        $('#linkDownload').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#linkDownload').css('border-color', 'lightgrey');
    }
    return isValid;
}


function clearModalEbook() {
    getListBookName();
    getListTypeEbook();
    $("#ddlBookName").attr('disabled', false);
    $("#ddlTypename").attr('disabled', false);
    $('#linkDownload').val("");
    $('#btnUpdateEbook').hide();
    $('#btnAddEbook').show();
    $('#linkDownload').css('border-color', 'lightgrey');
}


//Load name type ebook lên droplist

function getListTypeEbook() {
    var url = "/Admin/Book/GetAllListTypeEbook";
    var listtypeebookname = $('#ddlTypename');
    $.getJSON(url, function (response) {
        listtypeebookname.empty();
        $.each(response, function (index, item) {
            listtypeebookname.append($('<option></option>').text(item.TypeEbookName).val(item.TypeEbookID));
        });
    });
}



function getListBookName() {
    var url = "/Admin/Ebook/GetAllListBook";
    var listbook = $('#ddlBookName');
    $.getJSON(url, function (response) {
        listbook.empty();
        $.each(response, function (index, item) {
            listbook.append($('<option></option>').text(item.BookName).val(item.BookID));
        });
    });
}

