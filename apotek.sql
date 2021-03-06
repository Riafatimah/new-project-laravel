-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2022 at 03:03 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` int(11) NOT NULL,
  `kode_Obat` int(11) NOT NULL,
  `Kode_Transaksi` int(11) NOT NULL,
  `Harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_obat`
--

CREATE TABLE `kategori_obat` (
  `kode_Kategori` int(11) NOT NULL,
  `Nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `Kode_Obat` int(11) NOT NULL,
  `Kode_Kategori` int(11) NOT NULL,
  `Kode_Supplier` int(11) NOT NULL,
  `Nama_Barang` varchar(100) NOT NULL,
  `Deskripsi_Singkat` varchar(255) DEFAULT NULL,
  `Tanggal_Expired` date NOT NULL,
  `Harga_Supplier` int(11) NOT NULL,
  `Harga_Grosir` int(11) NOT NULL,
  `Harga_User` int(11) NOT NULL,
  `Stok_Barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `Kode_Pembeli` int(11) NOT NULL,
  `Nama_Pembeli` varchar(35) NOT NULL,
  `Alamat` varchar(100) DEFAULT NULL,
  `No_Telp` varchar(15) DEFAULT NULL,
  `Email` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Kode_Supplier` int(11) NOT NULL,
  `Nama_Supplier` varchar(100) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `No_Telp` varchar(35) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `Kode_Transaksi` int(11) NOT NULL,
  `Kode_Obat` int(11) NOT NULL,
  `Kode_Supplier` int(11) NOT NULL,
  `Kode_Pembeli` int(11) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Jumlah_Pembelian` int(11) NOT NULL,
  `Jumlah_Penjualan` int(11) NOT NULL,
  `Subtotal` int(11) NOT NULL,
  `Tanggal_Transaksi` date NOT NULL,
  `waktu_Transaksi` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Kode_Transaksi` (`Kode_Transaksi`),
  ADD KEY `kode_Obat` (`kode_Obat`);

--
-- Indexes for table `kategori_obat`
--
ALTER TABLE `kategori_obat`
  ADD PRIMARY KEY (`kode_Kategori`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`Kode_Obat`),
  ADD KEY `Kode_Kategori` (`Kode_Kategori`),
  ADD KEY `Kode_Supplier` (`Kode_Supplier`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`Kode_Pembeli`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Kode_Supplier`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`Kode_Transaksi`),
  ADD KEY `Kode_Obat` (`Kode_Obat`),
  ADD KEY `Kode_Supplier` (`Kode_Supplier`),
  ADD KEY `Kode_Pembeli` (`Kode_Pembeli`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`kode_Obat`) REFERENCES `obat` (`Kode_Obat`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`Kode_Transaksi`) REFERENCES `transaksi` (`Kode_Transaksi`);

--
-- Constraints for table `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`Kode_Kategori`) REFERENCES `kategori_obat` (`kode_Kategori`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`Kode_Supplier`) REFERENCES `obat` (`Kode_Supplier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
