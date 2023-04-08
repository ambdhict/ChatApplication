<?php

    class SendMessage{
        private $message;
        private $userId;
        public $connect;

        public function __construct(){
            require_once('DBConnection.php');

            $db_obj = new DBConnection;

            $this->connect = $db_obj->connection();
        }

        public function setMessage($message){
            $this->message = $message;
        }

        public function setUserId($userId){
            $this->userId = $userId;
        }

        public function saveMessage(){
            $date = date("Y-m-d h:i:s");
            $sql = "INSERT INTO tblmessage (message, userid, datecreated) VALUES (:message, :userid, :date)";
            $stmnt = $this->connect->prepare($sql);
            $stmnt->bindParam(':message', $this->message);
            $stmnt->bindParam(':userid', $this->userId);
            $stmnt->bindParam(':date', $date);
            $stmnt->execute();

            $id = $this->connect->lastInsertId();

            return $id;
        }

        public function getMessage($id){
            $sql = "
                SELECT 
                a.*,
                b.username
                FROM tblmessage a
                    LEFT JOIN tbluser b ON a.userid = b.id 
                WHERE a.id=:id
            ";
            $stmnt = $this->connect->prepare($sql);
            $stmnt->bindParam(':id', $id);
            $stmnt->execute();

            $row = $stmnt->fetch(PDO::FETCH_ASSOC);

            return $row;
        }

        public function getAllMessage(){
            $sql = "
                SELECT 
                a.*,
                b.username
                FROM tblmessage a
                    LEFT JOIN tbluser b ON a.userid = b.id 
            ";
            $stmnt = $this->connect->prepare($sql);
            $stmnt->execute();

            $row = $stmnt->fetchAll();

            return $row;
        }
    }

?>