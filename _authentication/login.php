<?php

    if(isset($_POST['submit'])){
        try {
            require('../_classes/Login.php');

            $login_obj = new Login;

            $login_obj->setUsername($_POST['username']);
            $login_obj->setPassword($_POST['password']);

            $count = $login_obj->checkCredentials();

            if($count > 0){
                $row = $login_obj->getUserData();

                $_SESSION['id'] = $row['id'];
                $_SESSION['name'] = $row['username'];
            } else {
                $error = $count;
                $_SESSION['error'] = $error;
                header("location: ../index.php");
            }

        } catch (\PDOException $e) {
            echo $e->getMessage();
        }
    }

?>