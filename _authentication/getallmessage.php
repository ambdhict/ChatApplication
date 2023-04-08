<?php

    require('../_classes/SendMessage.php');

    $send_obj = new SendMessage;

    $data = $send_obj->getAllMessage();

    echo json_encode($data);

?>