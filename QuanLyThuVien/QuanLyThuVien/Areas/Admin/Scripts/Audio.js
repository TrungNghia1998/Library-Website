//Thêm  mới một id
function AddAudio() {
    var nameebookselected = document.getElementById("ddlNameBook");
    var bookid = nameebookselected[nameebookselected.selectedIndex].value;
    var model = new FormData();
    model.append("File", $('#fileupload')[0].files[0]);
    model.append("BookID", bookid);
    model.append("AudioID", $('#AudioID').val());
    model.append("AudioName", $('#AudioName').val());
    model.append("Alias", $('#Alias').val());
    $.ajax({
        url: '/Admin/AudioBook/UploadAudio2',
        type: "POST",
        data: model,
        contentType: false,
        processData: false,
        success: function (result) {
            $('#modalAddOrEditAudioBook').modal('hide');
            loadTrangChu();
        },
        error: function (result) {

        }
    });
}


//Function for clearing the textboxes
function clearTextBoxAddAudioBook() {
    getListEbook();
    $("#ddlNameBook").attr('disabled', false);
    $("#AudioID").attr('disabled', false);
    $('#AudioID').val("");
    $('#AudioName').val("");
    $('#Alias').val("");
    $('#AudioID').css('border-color', 'lightgrey');
    $('#AudioName').css('border-color', 'lightgrey');
    $('#Alias').css('border-color', 'lightgrey');
}
//Valdidation using jquery
function validateAudio() {
    var isValid = true;
    if ($('#AudioID').val().trim() == "") {
        $('#AudioID').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#AudioID').css('border-color', 'lightgrey');
    }

    if ($('#Alias').val().trim() == "") {
        $('#Alias').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Alias').css('border-color', 'lightgrey');
    }

    if ($('#AudioName').val().trim() == "") {
        $('#AudioName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#AudioName').css('border-color', 'lightgrey');
    }
    return isValid;
}


function SearchClick() {
    var search_value = document.getElementById('inputKeyword').value;
    loadData(1, search_value);
}


function getListEbook() {
    var url = "/Admin/AudioBook/GetListNameBook";
    var listtypeebookname = $('#ddlNameBook');
    $.getJSON(url, function (response) {
        listtypeebookname.empty();
        $.each(response, function (index, item) {
            listtypeebookname.append($('<option></option>').text(item.nameBook).val(item.idBook));
        });
    });
}


function UpdateAudio()
{
    var nameebookselected = document.getElementById("ddlNameBook");
    var bookid = nameebookselected[nameebookselected.selectedIndex].value;
    var model = new FormData();
    model.append("File", $('#fileupload')[0].files[0]);
    model.append("BookID", bookid);
    model.append("AudioID", $('#AudioID').val());
    model.append("AudioName", $('#AudioName').val());
    model.append("Alias", $('#Alias').val());
    $.ajax({
        url: '/Admin/AudioBook/UploadAudio1',
        type: "POST",
        data: model,
        contentType: false,
        processData: false,
        success: function (result) {
            $('#modalAddOrEditAudioBook').modal('hide');
        },
        error: function (result) {

        }
    });

}


//Update audio
function getbyID(idbook,idaudio) {
    //$('#AuthorName').css('border-color', 'lightgrey');
    //$('#DescriptionAuthor').css('border-color', 'lightgrey');
    //$('#Alias').css('border-color', 'lightgrey');
    $.ajax({
        url: "/Admin/AudioBook/GetAudiobyID?idBook=" + idbook + "&idAudioBook=" + idaudio,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#ddlNameBook').val(result.BookID);
            $("#ddlNameBook").attr('disabled', true);
            $('#AudioID').val(result.AudioID);
            $("#AudioID").attr('disabled', true);
            $('#AudioName').val(result.AudioName);
            $('#Alias').val(result.Alias);
            //$('#fileupload').val(result.UrlSave);


            $('#modalAddOrEditAudioBook').modal('show');
            $('#btnUpdateAudio').show();
            $('#btnAddAudio').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}


function DeleteAudio(idbook, idaudio) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: "/Admin/AudioBook/DeleteAudio?idBook=" + idbook + "&idAudioBook=" + idaudio,
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadTrangChu();
            },
            error: function (errormessage) {
                loadTrangChu();
            }
        });
    }
}


function loadTrangChu()
{
    window.location.href = "/Admin/AudioBook/";
}