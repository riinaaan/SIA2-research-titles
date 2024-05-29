<?php
require_once "DBController.php";

class CategoryController {

    public function getCategoryList() {
        $db = new DBController();
        $query = "SELECT type_id, type_name FROM types WHERE status = ?";
        try {
            return $db->select($query, array("active"));
        } catch (Exception $e) {
            return -1;
        }
    }

    public function addNewCategory($categoryName) : bool {
        $db = new DBController();
        $query = "INSERT INTO types(type_name, status) VALUES (?, ?)";
        return $db->execute($query, array($categoryName, "active"));
    }

    public function deleteCategory($categoryId) : bool {
        $db = new DBController();
        $query = "UPDATE types SET status = ? WHERE type_id = ?";
        return $db->execute($query, array("del", $categoryId));
    }
}
?>