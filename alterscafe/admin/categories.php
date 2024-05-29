<?php include "__header__.php"; ?>

<div class="p-3 mb-5 sticky-top text-white bg-dark">
    <h3>Category Manager</h3>
</div>
<div class="">
    <div class="row">
        <div class="col-lg-4">
            <div class="card">
                <div class="card-header">
                    <h6>Add New Category</h6>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="">Enter Name</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>
                </div>
                <div class="card-footer">
                    <center>
                        <button class="btn btn-primary btn-block w-25" type="btn" id='saveCategoryBtn'>Save</button>
                    </center>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h6>Category List</h6>
                </div>
                <div class="card-body">
                    <div class="category-list">
                        <p>Nothing to Show</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<?php include "__footer__.php"; ?>


<script>
$(document).ready(function() {
    getCategoryList();
    getItemList();
});

function getCategoryList() {
    $.ajax({
        type: 'POST',
        url: AJAX_URL,
        data: {
            'action': 'GET_CATEGORY_LIST',
        },
        success: function(response) {
            response = $.parseJSON(response);
            html = "";
            $.each(response['categories'], function(key, value) {
                html += '<div class="border p-3 my-2">';
                html += '    <div class="clearfix">';
                html += '        <div class="float-left">';
                html += '            <b>' + value['type_name'] + '</b>';
                html += '        </div>';
                html += '        <div class="float-right">';
                html += '            <button class="btn btn-danger" onclick="deleteCategory(' + value['type_id'] + ')"><i class="fa fa-times"></i></button>';
                html += '        </div>';
                html += '    </div>';
                html += '</div>';
            });

            $('.category-list').html(html);
        }
    });
}

$('#saveCategoryBtn').click(function() {
    var categoryName = $('#name').val();

    if (!categoryName || categoryName.length <= 0) {
        toastr.error("Please Enter Category Name");
        return false;
    } else {
        $.ajax({
            type: 'POST',
            url: AJAX_URL,
            data: {
                'action': 'ADD_NEW_CATEGORY',
                'category_name': categoryName,
            },
            success: function(response) {
                response = $.parseJSON(response);
                if (response['status']) {
                    $('#name').val("");
                    toastr.success("Category Successfully Added");
                    getCategoryList();
                } else {
                    if (response['message']) {
                        toastr.error(response['message']);
                    } else {
                        toastr.error("Action Failed");
                    }
                }
            }
        });
    }
});

function deleteCategory(categoryId) {
    if (!categoryId || categoryId.length <= 0) {
        toastr.error("Category Not Found");
        return false;
    } else {
        $.ajax({
            type: 'POST',
            url: AJAX_URL,
            data: {
                'action': 'DELETE_CATEGORY',
                'category_id': categoryId,
            },
            success: function(response) {
                response = $.parseJSON(response);
                if (response['status']) {
                    toastr.success("Category Successfully Deleted");
                    getCategoryList();
                } else {
                    if (response['message']) {
                        toastr.error(response['message']);
                    } else {
                        toastr.error("Action Failed");
                    }
                }
            }
        });
    }
}
</script>