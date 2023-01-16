<?php 
$connection = new mysqli("localhost","root","","customerbutik");
$data= mysqli_query($connection, "select * from datacustomer");
$data= mysqli_fetch_all($data, MYSQLI_ASSOC);
echo json_encode($data);
