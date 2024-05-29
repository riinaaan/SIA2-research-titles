<!-- __header__.php -->
<!DOCTYPE html>
<html>

<head>
    <title>Welcome, Admin!</title>
    <link rel="shortcut icon" href="../static/img/alterscafe_icon.jpg" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="../static/css/loader.css">
    <link rel="stylesheet" href="../static/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

</head>

<body>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">
                <div class="card sticky-top">
                    <div class="card-header">
                        <center>
                            <h4>
                                <a href="../index.html" class="brand">ADMIN</a>
                            </h4>
                        </center>
                    </div>
                    <div class="card-body">
                        <div class="card my-3">
                            <div class="card-header">
                                <h6>MENU</h6>
                            </div>
                            <div class="card-body">
                                <div class="nav-item">
                                    <a class="nav-link text-truncate" href="items.php"><i class="fa fa fa-shopping-basket"></i> <span class="d-none d-sm-inline">Items</span></a>
                                </div>

                                <div class="nav-item">
                                    <a class="nav-link text-truncate" href="categories.php"><i class="fa fa fa-tasks"></i> <span class="d-none d-sm-inline">Categories</span></a>
                                </div>

                                <div class="nav-item">
                                    <a class="nav-link text-truncate" href="orders.php"><i class="fa fa fa-inbox"></i> <span class="d-none d-sm-inline">History</span></a>
                                </div>

                                <div class="nav-item">
                                    <a class="nav-link text-truncate" href="inventory.php"><i class="fa fa-archive"></i> <span class="d-none d-sm-inline">Inventory</span></a>
                                </div>

                                <div class="nav-item">
                                    <a class="nav-link text-truncate" href="sales_report.php"><i class="fa fa-bar-chart"></i> <span class="d-none d-sm-inline">Sales Report</span></a>
                                </div>

                            </div>
                        </div>
                    
                        <div class="nav-item ">
                            <a class="nav-link btn-block btn btn-info text-white" href="../index.html"><span class="fa fa-arrow-left"></span>ADD NEW ORDER</a>
                        </div>
                        <div class="nav-item ">
                            <button class="btn-block btn btn-outline-danger " onclick="logout()">ALTERS CAFE</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9" style="border-left:1px solid lightgrey">
                <!-- Main content area -->
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <script>
    function logout() {
        // Add your logout functionality here
        $.ajax({
            type: 'POST',
            url: '../backend/requestHandler.php',
            data: {
                action: 'logout'
            },
            success: function(result) {
                window.location.href = '../index.php';
            },
            error: function(error) {
                toastr.error("Cannot Logout, Please try again.")
            }
        });
    }
</script>
</body>

</html>