-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03 Nov 2025 pada 18.55
-- Versi Server: 10.1.29-MariaDB
-- PHP Version: 7.2.0

-- Database creation and selection is handled by Docker MYSQL_DATABASE env var

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--  = "NO_AUTO_VALUE_ON_ZERO";
-- SET AUTOCOMMIT = 0;
-- START TRANSACTION;
-- SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banisaleh`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `batal_keluar` (IN `id_barang` INT, IN `jml_keluar` INT)  BEGIN
    UPDATE stok 
    SET 
        stok.jml_keluar = stok.jml_keluar - jml_keluar,
        stok.total_barang = stok.total_barang + jml_keluar
    WHERE stok.id_barang = id_barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `batal_masuk` (IN `id_barang` INT, IN `jml_masuk` INT)  BEGIN
    UPDATE stok 
    SET 
        stok.jml_masuk = stok.jml_masuk - jml_masuk,
        stok.total_barang = stok.total_barang - jml_masuk
    WHERE stok.id_barang = id_barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kembali` (IN `id_barang` INT, IN `jml` INT)  BEGIN
    UPDATE stok 
    SET stok.total_barang = stok.total_barang + jml
    WHERE stok.id_barang = id_barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pinjam` (IN `id_barang` INT, IN `jml` INT)  BEGIN
    UPDATE stok 
    SET stok.total_barang = stok.total_barang - jml
    WHERE stok.id_barang = id_barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_keluar` (IN `id_barang` INT, IN `jml_keluar` INT)  BEGIN
    UPDATE stok 
    SET 
        stok.jml_keluar = stok.jml_keluar + jml_keluar,
        stok.total_barang = stok.total_barang - jml_keluar
    WHERE stok.id_barang = id_barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_masuk` (IN `id_barang` INT, IN `jml_masuk` INT)  BEGIN
    UPDATE stok
    SET 
        stok.jml_masuk = stok.jml_masuk + jml_masuk,
        stok.total_barang = stok.total_barang + jml_masuk
    WHERE stok.id_barang = id_barang;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `spesifikasi` text,
  `lokasi` varchar(100) DEFAULT NULL,
  `kondisi` varchar(50) DEFAULT NULL,
  `jml_barang` int(11) DEFAULT '0',
  `sumber_dana` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `spesifikasi`, `lokasi`, `kondisi`, `jml_barang`, `sumber_dana`) VALUES
(10, 'Cube Gaming', 'RAM 12gb, SSD 32gb', 'Gudang 1', 'Baru', 1000, 'UNIVERSITAS Bani Saleh'),
(12, 'Lenovo Legion', 'Ram 32gb, SSD 2tb', 'Gudang 1', 'Baru', 100, 'Universitas Bani Saleh'),
(20, 'Lenovo Think', 'Ram 32gb, SSD 1tb', 'Gudang 1', 'Baru', 500, 'UNIVERSITAS Bani Saleh'),
(30, 'Asus ROG', 'Ram 32gb, SSD 4tb', 'Gudang 2', 'Baru', 550, 'UNIVERSITAS Bani Saleh'),
(1000, 'Monitor RedMagic', '120Hz', 'Gudang 1', 'Baru', 1000, 'Bansal');

--
-- Trigger `barang`
--
DELIMITER $$
CREATE TRIGGER `ins_stok` AFTER INSERT ON `barang` FOR EACH ROW BEGIN
    INSERT INTO stok (id_barang, nama_barang)
    VALUES (NEW.id_barang, NEW.nama_barang);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `jml_keluar` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `jml_masuk` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjam_barang`
--

CREATE TABLE `pinjam_barang` (
  `id_pinjam` int(11) NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `kondisi` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok`
--

CREATE TABLE `stok` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jml_masuk` int(11) NOT NULL,
  `jml_keluar` int(11) NOT NULL,
  `total_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stok`
--

INSERT INTO `stok` (`id_barang`, `nama_barang`, `jml_masuk`, `jml_keluar`, `total_barang`) VALUES
(10, 'Cube Gaming', 0, 0, -50),
(12, 'Lenovo Legion', 0, 0, -25),
(20, 'Lenovo Think', 0, 0, 0),
(30, 'Asus ROG', 0, 0, -175),
(100, 'Komputer', 0, 0, 0),
(1000, 'Monitor RedMagic', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(100) NOT NULL,
  `telp_supplier` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `telp_supplier`) VALUES
(1, 'UNIVERSITAS Bani Saleh', '', ''),
(2, 'STIKES BANI SALEH', '-', '88345064'),
(3, 'STAI BANI SALEH', '-', '88343360');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `level` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
(1, 'Administrator', 'admin', 'unindra123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `pinjam_barang`
--
ALTER TABLE `pinjam_barang`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
