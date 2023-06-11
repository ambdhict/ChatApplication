<?php 
    class DBConnection{

        function connection(){
            // live connection for database
            // $con = new PDO("mysql:host=localhost;dbname=u372934681_dbchatsystem", "u372934681_admin", "Admin123");
            // local connection for database
            $con = new PDO("mysql:host=localhost;dbname=dbchatsystem", "root", "");

            return $con;
        }
    }
?>
