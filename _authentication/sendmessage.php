<?php

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        try {
            require('../_classes/SendMessage.php');

            $send_obj = new SendMessage;

            $send_obj->setMessage($_POST['message']);
            $send_obj->setUserId($_POST['userid']);

            $result = $send_obj->saveMessage();

            $data = $send_obj->getMessage($result);

            if($result != 0 || $result != null){
                echo json_encode($data);
            }
        } catch (\PDOException $e) {
            die($e->getMessage());
        }
    }

?>