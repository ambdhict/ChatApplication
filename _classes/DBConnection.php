<?php 
    class DBConnection{

        function connection(){
            $con = new PDO("mysql:host=localhost;dbname=dbchatsystem", "root", "");

            return $con;
        }
    }
?>