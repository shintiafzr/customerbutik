<?php
    $connection = new mysqli("localhost", "root", "", "customerbutik");
    $nama      = $_POST['nama']; 
    $alamat    = $_POST['alamat'];
    $email     = $_POST['email'];
    $notelp    = $_POST['notelp'];
    $date       = date('Y-m-d');
    $result = mysqli_query($connection, "insert into datacustomer set nama='$nama', alamat='$alamat', email='$email', 
    notelp='$notelp', date='$date'");
    if($result){
        echo json_encode([
            'message' => 'Data input successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to input'
        ]);
    }
