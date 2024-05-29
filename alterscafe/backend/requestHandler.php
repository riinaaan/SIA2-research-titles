<?php

ob_start();
if (!isset($_SESSION)) {
    session_start();
}

if (isset($_POST['action'])) {

    $action = $_POST['action'];

    include_once "controllers/CategoryController.php";
    $CATEGORY = new CategoryController();
    include_once "controllers/ItemsController.php";
    $ITEM = new ItemsController();
    include_once "controllers/OrderController.php";
    $ORDER = new OrderController();
    include_once "controllers/UserController.php";
    $USER = new UserController();
    include_once "controllers/InventoryController.php";
    $INVENTORY = new InventoryController();
    include_once "controllers/ReportsController.php";
    $REPORT = new ReportsController();

    // CATEGORY 
    if ($action == 'GET_CATEGORY_LIST') {
        echo json_encode(array("status" => true, "categories" => $CATEGORY->getCategoryList()));
    } else if ($action == 'ADD_NEW_CATEGORY') {
        $categoryName = $_POST['category_name'];
        if (!isset($categoryName) || strlen($categoryName) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide category name."));
        } else {
            echo json_encode(array("status" => $CATEGORY->addNewCategory($categoryName)));
        }
    } else if ($action == "DELETE_CATEGORY") {
        $categoryId = $_POST['category_id'];
        if (!isset($categoryId) || strlen($categoryId) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide category id."));
        } else {
            echo json_encode(array("status" => $CATEGORY->deleteCategory($categoryId)));
        }
    }

    // ITEMS
    else if ($action == "GET_ITEM_LIST") {
        echo json_encode(array("status" => true, "items" => $ITEM->getItemList()));
    } else if ($action == "ADD_NEW_ITEM") {
        $categoryId = $_POST['category'];
        $itemName = $_POST['name'];
        $itemPrice = $_POST['price'];
        if (!isset($categoryId) || strlen($categoryId) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide category."));
        } else if (!isset($itemName) || strlen($itemName) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide item name."));
        } else if (!isset($itemPrice) || strlen($itemPrice) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide item price."));
        } else {
            $itemImage = false;
            $itemImageName = "";
            if (isset($_FILES['item_image'])) {
                $itemImage = $_FILES['item_image'];
                echo json_encode(array("status" => $ITEM->addNewItem($categoryId, $itemName, $itemPrice, $itemImage)));
            } else {
                echo json_encode(array("status" => false, "message" => "Please provide item image."));
            }
        }
    } else if ($action == 'DELETE_ITEM') {
        $itemId = $_POST['item_id'];
        if (!isset($itemId) || strlen($itemId) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide Item Id."));
        } else {
            echo json_encode(array("status" => $ITEM->deleteItem($itemId)));
        }
    }

    // ORDER METHODS
    else if ($action == 'GET_ORDER_LIST') {
        echo json_encode(array("status" => true, "orders" => $ORDER->getAllOrders()));
    } else if ($action == 'GET_ORDER_DETAILS') {
        $orderId = $_POST['orderId'];
        if (!isset($orderId) || strlen($orderId) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide Order Id."));
        } else {
            $orderDetails = $ORDER->getOrderDetails($orderId);
            if ($orderDetails) {
                echo json_encode(array("status" => true, "order" => $ORDER->getOrderDetails($orderId)));
            } else {
                echo json_encode(array("status" => false, "message" => "No Order Found."));
            }
        }
    } else if ($action == 'PLACE_ORDER') {
        $orderList = $_POST['orderlist'];
        $discountPercentage = $_POST['discountPercentage'];
        $discountAmount = $_POST['discountAmount'];
        $salesTaxAmount = $_POST['salesTaxAmount'];

        if ($discountPercentage < 0) {
            echo json_encode(array("status" => false, "message" => "Discount Percentage Cannot be less than Zero."));
        } else {
            if (count($orderList) > 0) {
                $result = $ORDER->placeNewOrder($orderList, $discountPercentage, $discountAmount, $salesTaxAmount);
                if ($result) {
                    echo json_encode(array("status" => true, "order_id" => $result));
                } else {
                    echo json_encode(array("status" => false, "message" => "Order Generation Failed. Please try again."));
                }
            } else {
                echo json_encode(array("status" => false, "message" => "No Order Items Provided."));
            }
        }
    } else if ($action == 'CLEAR_ORDER') {
        $orderId = $_POST['orderid'];
        if (!isset($orderId) || strlen($orderId) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide Order Id."));
        } else {
            echo json_encode(array("status" => $ORDER->clearOrder($orderId)));
        }
    } else if ($action == 'CLEAR_ALL_ORDERS') {
        echo json_encode(array("status" => $ORDER->clearAllOrders()));
    }

    // INVENTORY
    else if ($action == 'GET_INVENTORY_ITEMS') {
        echo json_encode(array("status" => true, "items" => $INVENTORY->getAllInventoryItems()));
    } else if ($action == "ADD_INVENTORY_ITEM") {
        $billNumber = $_POST['bill_number'];
        $itemName = $_POST['item_name'];
        $quantity = $_POST['quantity'];
        $unit = $_POST['unit'];
        $price = $_POST['price'];
        $notes = $_POST['notes'];

        if (!isset($itemName) || strlen($itemName) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide Item Name."));
        } else if (!isset($quantity) || strlen($quantity) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide quantity."));
        } else if (!isset($unit) || strlen($unit) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide unit."));
        } else if (!isset($price) || strlen($price) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide item price."));
        } else {
            echo json_encode(array("status" => $INVENTORY->addNewInventoryItem($billNumber, $itemName, $quantity, $unit, $price, $notes)));
        }
    } else if ($action == "EDIT_INVENTORY_ITEM") {
        $itemId = $_POST['item_id'];
        $billNumber = $_POST['bill_number'];
        $itemName = $_POST['item_name'];
        $quantity = $_POST['quantity'];
        $unit = $_POST['unit'];
        $price = $_POST['price'];
        $notes = $_POST['notes'];

        if (!isset($itemName) || strlen($itemName) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide Item Name."));
        } else if (!isset($quantity) || strlen($quantity) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide quantity."));
        } else if (!isset($unit) || strlen($unit) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide unit."));
        } else if (!isset($price) || strlen($price) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide item price."));
        } else {
            echo json_encode(array("status" => $INVENTORY->editNewInventoryItem($itemId, $billNumber, $itemName, $quantity, $unit, $price, $notes)));
        }
    } else if ($action == 'DELETE_INVENTORY_ITEM') {
        $itemId = $_POST['item_id'];
        if (!isset($itemId) || strlen($itemId) <= 0) {
            echo json_encode(array("status" => false, "message" => "Please provide Item Id."));
        } else {
            echo json_encode(array("status" => $INVENTORY->removeInventoryItems($itemId)));
        }
    }

    // AUTH
    else if ($action == 'login') {
        $username = $_POST['username'];
        $password = $_POST['password'];

        if ((!isset($username) || strlen($username) <= 0) || (!isset($password) || strlen($password) <= 0)) {
            echo json_encode(array("status" => false, "message" => "Invalid Credentials."));
        } else {
            $res = $USER->validateUser($username, $password);

            if ($res == 0) {
                echo json_encode(array("status" => false, "message" => "Password is Invalid."));
            } else if ($res == -1) {
                echo json_encode(array("status" => false, "message" => "User does not exist."));
            } else {
                $_SESSION['logged_in'] = true;
                $_SESSION['username'] = $username;
                echo json_encode(array("status" => true, "message" => "User is logged in successfully.", "username" => $_SESSION['username']));
            }
        }
    } else if ($action == 'logout') {
        $_SESSION['username'] = null;
        session_destroy();
    }

    // REPORT
    else if ($action == 'GET_SALES_REPORT') {
        $startDate = $_POST['startDate'];
        $endDate = $_POST['endDate'];

        if ((!isset($startDate) || strlen($startDate) <= 0) || (!isset($endDate) || strlen($endDate) <= 0)) {
            echo json_encode(array("status" => false, "message" => "Please provide date range."));
        } else {
            echo json_encode(array("status" => true, "report" => $REPORT->getSalesReport($startDate, $endDate)));
        }
    }    
}

?>
