<?php
require_once "DBController.php";

class UserController{
    private function checkUserExistence($username)
    {
        $db = new DBController();
        // check if UserExists
        $query = "SELECT COUNT(username) AS COUNT FROM users WHERE username =?";
        $count = $db->select($query, array($username));
        if ($count[0]['count'] != 0) {
            return true;
        } else {
            return false;
        }
    }
    public function validateUser($username, $password){
        $exists = $this->checkUserExistence($username);
        if (!$exists) {
            return -1;
        }
    
        $db = new DBController();
    
        $query = "SELECT username, password, status FROM users WHERE username=?";
    
        $res = $db->select($query, array($username));
    
        if ($password != $res[0]['password']) {
            return 0;
        } else if ($res[0]['status'] != 'active') {
            return 2;
        } else {
            return $res;
        }
    }
}
?>