<?php 
    $connection = new mysqli("localhost","root","","customerbutik");
    $data       = mysqli_query($connection, "select * from datacustomer where id=".$_GET['id']);
    $data       = mysqli_fetch_array($data, MYSQLI_ASSOC);

    echo json_encode($data);
