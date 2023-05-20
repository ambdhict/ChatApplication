<?php 
    class DBConnection{

        function connection(){
            $con = new PDO("mysql:host=localhost;dbname=u372934681_dbchatsystem", "u372934681_admin", "Admin123");

            return $con;
        }
    }
?>
