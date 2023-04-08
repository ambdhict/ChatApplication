<?php

    class Login {
        // This is used to initialize parameters
        private $username;
        private $password;
        public $connect;

        public function __construct(){
            require_once('DBConnection.php');

            $db_obj = new DBConnection;

            $this->connect = $db_obj->connection();
        }

        public function setUsername($username){
            $this->username = $username;
        }

        public function setPassword($password){
            $this->password = $password;
        }

        public function checkCredentials(){
            $stmnt = $this->connect->prepare("SELECT * FROM tbluser WHERE username=:code AND (password= :passwd OR password2= :passwd)");
            $stmnt->execute(
                array(
                    ':code' => $this->username,
                    ':passwd' => $this->password
                )
            );

            $row = $stmnt->fetch(PDO::FETCH_ASSOC);
            $count = $stmnt->rowCount();

            return $count;
        }

        public function getUserData(){
            $stmnt = $this->connect->prepare("SELECT * FROM tbluser WHERE username=:code AND (password= :passwd OR password2= :passwd)");
            $stmnt->execute(
                array(
                    ':code' => $this->username,
                    ':passwd' => $this->password
                )
            );

            $row = $stmnt->fetch(PDO::FETCH_ASSOC);

            return $row;
        }
    }

?>