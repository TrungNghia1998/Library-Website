

function loadTrangTypeEbook() {
    window.location.href = "/Admin/TypeEbook/";
}

//Thêm một ebook
function AddTypeEbook() {
    var res = validateEbook();
    if (res == false) {
        return false;
    }
    var typeEObj = {
        TypeID: $('#TypeID').val(),
        Name: $('#Name').val(),
    };


    $.ajax({
        url: "/Admin/TypeEbook/Add",
        data: JSON.stringify(typeEObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#modalAddOrEditTypeEbook').modal('hide');
            $.notify(result.message, {
                globalPosition: "top center",
                className: "success"
            });

            setTimeout(loadTrangTypeEbook, 1000);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Lấy ebook theo id
function getTypeEbookByID(typeid) {
    //$('#typeEbook').css('border-color', 'lightgrey');
    //$('#linkDownload').css('border-color', 'lightgrey');

    $.ajax({
        url: "/Admin/TypeEbook/GetTypeEbookByID?typeid=" + typeid,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#TypeID').val(result.TypeID);
            $('#Name').val(result.Name);
            $('#modalAddOrEditTypeEbook').modal('show');
            $('#btnUpdateTypeEbook').show();
            $('#btnAddTypeEbook').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

//chỉnh sữa một ebook
function UpdateTypeEbook() {
    var res = validateEbook();
    if (res == false) {
        return false;
    }

    var typeEObj = {
        TypeID: $('#TypeID').val(),
        Name: $('#Name').val(),
    };

    $.ajax({
        url: "/Admin/TypeEbook/Update",
        data: JSON.stringify(typeEObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#modalAddOrEditTypeEbook').modal('hide');
            $('#TypeID').val("");
            $('#Name').val("");
            $('#btnUpdateTypeEbook').hide();
            $('#btnAddTypeEbook').show();
            $.notify(result.message, {
                globalPosition: "top center",
                className: "success"
            });
            setTimeout(loadTrangTypeEbook, 1000);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Xoá một ebook
function DeleteTypeEbook(typeid) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: "/Admin/TypeEbook/Delete?typeid="+ typeid,
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                $.notify(result.message, {
                    globalPosition: "top center",
                    className: "success"
                });
                setTimeout(loadTrangTypeEbook, 1000);
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}



function validateEbook() {
    var isValid = true;
    if ($('#Name').val().trim() == "") {
        $('#Name').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Name').css('border-color', 'lightgrey');
    }
    return isValid;
}


function clearModalTypeEbook() {
    $('#Name').val("");
    $('#btnUpdateTypeEbook').hide();
    $('#btnAddTypeEbook').show();
    $('#Name').css('border-color', 'lightgrey');
}

