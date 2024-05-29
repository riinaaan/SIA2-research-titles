<?php
require_once "DBController.php";

class ReportsController {
    public function getSalesReport($startDate, $endDate) {
        $db = new DBController();
        $startDate = DateTime::createFromFormat('m/d/Y', $startDate)->format('Y-m-d');
        $endDate = DateTime::createFromFormat('m/d/Y', $endDate)->format('Y-m-d');

        $query = "SELECT i.item_name, ot.unit_price, SUM(ot.quantity) AS quantity, SUM(ot.sub_total) AS sub_total 
                  FROM order_items ot 
                  JOIN items i ON ot.item_id = i.item_id 
                  WHERE DATE(ot.datetime) BETWEEN DATE(?) AND DATE(?) 
                  AND ot.status = ? 
                  GROUP BY i.item_name, ot.unit_price 
                  ORDER BY SUM(ot.sub_total) DESC";

        return $db->select($query, array($startDate, $endDate, 'active'));
    }
}
?>