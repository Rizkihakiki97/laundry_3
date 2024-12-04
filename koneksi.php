<?php
$host = "localhost";
$user = "root";
$password = "";
$db = "ujikom2_laundry";

$koneksi = mysqli_connect($host, $user, $password, $db);

if (empty($koneksi)) {
    echo "ERROR BRAY....";
}
