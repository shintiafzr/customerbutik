<?php
    $connection = new mysqli("localhost", "root", "", "customerbutik");
    $nama      = $_POST['nama']; 
    $alamat    = $_POST['alamat'];
    $email     = $_POST['email'];
    $notelp    = $_POST['notelp'];
    $id         = $_POST['id'];
    $result = mysqli_query($connection, "update datacustomer set nama='$nama', alamat='$alamat', email='$email', 
    notelp='$notelp', where id='$id'");
        
    if($result){
        echo json_encode([
            'message' => 'Data edit successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to update'
        ]);
    }
