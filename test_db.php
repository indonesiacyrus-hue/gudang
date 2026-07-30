<?php
$koneksi = mysqli_connect("localhost", "root", "", "banisaleh");

if (!$koneksi) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
echo "Koneksi database berhasil!";
