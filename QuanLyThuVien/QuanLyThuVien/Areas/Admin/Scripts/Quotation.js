//Load Data in Table when documents is ready
$(document).ready(function () {
    loadData(1, "");
});

//Load Data
function loadData(id, searchString) {
    $.ajax({
        url: "/Admin/Quotation/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        data: { "page": id, "searchKey": searchString },
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result.data, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.QuotationID + '</td>';
                html += '<td>' + item.NameQuotation + '</td>';
                html += '<td><a class="btn btn-default btn-sm" onclick="return getbyID(' + item.QuotationID + ')"><i class="fa fa-edit"></i> Sửa</a>  <a class="btn btn-danger btn-sm" onclick="Delele(' + item.QuotationID + ')"><i class="fa fa-trash"></i> Xoá</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);

            var paging = '';
            if (result.pageNumber == 1) {
                paging += '<li class="paginate_button previous disabled" ><a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>';
                paging += '<li class="paginate_button active" ><a  href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">1</a></li>';
                paging += '<li class="paginate_button next disabled"><a  href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a></li>';
            }
            else {
                if (id == 1) {
                    paging += '<li class="paginate_button previous disabled"><a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>';
                    paging += '<li class="paginate_button active"><a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">1</a></li>';
                }
                else {
                    paging += '<li class="paginate_button previous btn"><a  onclick="return loadData(' + (id - 1) + ',' + result.keyword + ')" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>';
                    paging += '<li class="paginate_button btn"><a onclick="return loadData(' + (id - 1) + ',' + result.keyword + ')" aria-controls="example1" data-dt-idx="0" tabindex="0">' + (id - 1) + '</a></li>';
                    paging += '<li class="paginate_button active"><a onclick="" aria-controls="example1" data-dt-idx="0" tabindex="0">' + id + '</a></li>';
                }
                if (id + 1 <= result.pageNumber) {
                    paging += '<li class="paginate_button btn"><a  onclick="return loadData(' + (id + 1) + ',' + result.keyword + ')" aria-controls="example1" data-dt-idx="0" tabindex="0">' + (id + 1) + '</a></li>';
                    paging += '<li class="paginate_button next btn" id="example1_next"><a onclick="return loadData(' + (id + 1) + ',' + result.keyword + ')" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a></li>';
                } else {
                    paging += '<li class="paginate_button next disabled" id="example1_next"><a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a></li>';
                }

            }
            $('#phantrang').html(paging);
            $("#searchString").val(result.keyword);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Add Data 
function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var quoObj = {
        QuotationID: $('#QuotationID').val(),
        NameQuotation: $('#NameQuotation').val(),
    };
    $.ajax({
        url: "/Admin/Quotation/Add",
        data: JSON.stringify(quoObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData(1, "");
            $('#myModal').modal('hide');
            $.notify(result.message, {
                globalPosition: "top center",
                className: "success"
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Get By ID
function getbyID(QuoID) {
    $('#QuotationID').css('border-color', 'lightgrey');
    $('#NameQuotation').css('border-color', 'lightgrey');
    $.ajax({
        url: "/Admin/Quotation/GetbyID/" + QuoID,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#QuotationID').val(result.QuotationID);
            $('#NameQuotation').val(result.NameQuotation);
            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

//Update
function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }

    var quoObj = {
        QuotationID: $('#QuotationID').val(),
        NameQuotation: $('#NameQuotation').val(),
    };

    $.ajax({
        url: "/Admin/Quotation/Update",
        data: JSON.stringify(quoObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData(1, "");
            $('#myModal').modal('hide');
            $('#QuotationID').val("");
            $('#NameQuotation').val("");
            $.notify(result.message, {
                globalPosition: "top center",
                className: "success"
            });

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Delete by id
function Delele(ID) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: "/Admin/Quotation/Delete/" + ID,
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData(1, "");
                $.notify(result.message, {
                    globalPosition: "top center",
                    className: "success"
                });
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

//clear textbox
function clearTextBox() {
    $('#QuotationID').val("");
    $('#NameQuotation').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#QuotationID').css('border-color', 'lightgrey');
    $('#NameQuotation').css('border-color', 'lightgrey');
}
//Valdidation using jquery
function validate() {
    var isValid = true;
    if ($('#NameQuotation').val().trim() == "") {
        $('#NameQuotation').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#NameQuotation').css('border-color', 'lightgrey');
    }
    return isValid;
}


function SearchClick() {
    var search_value = document.getElementById('inputKeyword').value;
    loadData(1, search_value);
}


