-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2021 at 06:03 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventori`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_barang_no` () RETURNS VARCHAR(6) CHARSET utf8 BEGIN
	DECLARE generate Varchar(6);
	Select LPAD(count(1)+1, 6,'0') into generate from tbl_barang WHERE `pk_barang_id`!='0000000';
RETURN (generate);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `keluar`
-- (See below for the actual view)
--
CREATE TABLE `keluar` (
`id_barang` int(11)
,`stok` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stok`
-- (See below for the actual view)
--
CREATE TABLE `stok` (
`id_barang` int(11)
,`stok` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `pk_barang_id` int(11) NOT NULL,
  `id_barang` varchar(20) DEFAULT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `fk_jenisbarang_id` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `fk_satuan_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`pk_barang_id`, `id_barang`, `nama_barang`, `fk_jenisbarang_id`, `stok`, `fk_satuan_id`, `created_by`, `created_date`) VALUES
(6, 'B000001', 'Jagung', 6, NULL, 7, NULL, NULL),
(7, 'B000002', 'Kandang', 6, NULL, 7, NULL, NULL),
(8, 'B000003', 'Kain Banner', 5, NULL, 6, NULL, NULL),
(11, 'B000004', 'Tes', 6, NULL, 7, NULL, NULL),
(12, 'B000005', 'Tes2', 6, NULL, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenisbarang`
--

CREATE TABLE `tbl_jenisbarang` (
  `pk_jenisbarang_id` int(11) NOT NULL,
  `jenis_barang` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jenisbarang`
--

INSERT INTO `tbl_jenisbarang` (`pk_jenisbarang_id`, `jenis_barang`, `created_by`, `created_date`) VALUES
(1, 'C', NULL, NULL),
(4, 'Umbi', NULL, NULL),
(5, 'Stater pack Banner', NULL, NULL),
(6, 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_satuan`
--

CREATE TABLE `tbl_satuan` (
  `pk_satuan_id` int(11) NOT NULL,
  `satuan_barang` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_satuan`
--

INSERT INTO `tbl_satuan` (`pk_satuan_id`, `satuan_barang`, `created_by`, `created_date`) VALUES
(2, 'Botol', NULL, NULL),
(5, 'Kilogram', NULL, NULL),
(6, 'Meter', NULL, NULL),
(7, 'Kodi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi_keluar`
--

CREATE TABLE `tbl_transaksi_keluar` (
  `pk_transaksi_keluar_id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_keluar` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_transaksi_keluar`
--

INSERT INTO `tbl_transaksi_keluar` (`pk_transaksi_keluar_id`, `tanggal`, `id_barang`, `jumlah_keluar`, `status`) VALUES
(1, '2021-01-07', 7, 10, 1),
(2, '2021-01-07', 7, 2, 2),
(3, '2021-01-07', 7, 2, 2),
(4, '2021-01-07', 6, 8, 1),
(5, '2021-03-11', 7, 5, 1),
(6, '2021-03-11', 7, 1, 1),
(7, '2021-03-11', 8, 1, 1),
(8, '0000-00-00', 6, 2, 1),
(9, '2021-01-16', 6, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi_masuk`
--

CREATE TABLE `tbl_transaksi_masuk` (
  `pk_transaksi_masuk_id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_masuk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` enum('admin','user') NOT NULL,
  `blokir` enum('N','Y') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `level`, `blokir`) VALUES
(10, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'admin', 'N'),
(26, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@gmail.com', 'user', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vbarang`
-- (See below for the actual view)
--
CREATE TABLE `vbarang` (
`pk_barang_id` int(11)
,`id_barang` varchar(20)
,`nama_barang` varchar(20)
,`fk_jenisbarang_id` int(11)
,`stok` int(11)
,`fk_satuan_id` int(11)
,`created_by` int(11)
,`created_date` datetime
,`jenis_barang` varchar(50)
,`satuan_barang` varchar(50)
,`kocak` varchar(73)
,`stokbarang` decimal(32,0)
,`keluar` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Structure for view `keluar`
--
DROP TABLE IF EXISTS `keluar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `keluar`  AS SELECT `kl`.`id_barang` AS `id_barang`, sum(`kl`.`jumlah_keluar`) AS `stok` FROM `tbl_transaksi_keluar` AS `kl` WHERE `kl`.`status` = 1 GROUP BY `kl`.`id_barang` ;

-- --------------------------------------------------------

--
-- Structure for view `stok`
--
DROP TABLE IF EXISTS `stok`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stok`  AS SELECT `tm`.`id_barang` AS `id_barang`, sum(`tm`.`jumlah_masuk`) AS `stok` FROM `tbl_transaksi_masuk` AS `tm` GROUP BY `tm`.`id_barang` ;

-- --------------------------------------------------------

--
-- Structure for view `vbarang`
--
DROP TABLE IF EXISTS `vbarang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vbarang`  AS SELECT `tb`.`pk_barang_id` AS `pk_barang_id`, `tb`.`id_barang` AS `id_barang`, `tb`.`nama_barang` AS `nama_barang`, `tb`.`fk_jenisbarang_id` AS `fk_jenisbarang_id`, `tb`.`stok` AS `stok`, `tb`.`fk_satuan_id` AS `fk_satuan_id`, `tb`.`created_by` AS `created_by`, `tb`.`created_date` AS `created_date`, `tj`.`jenis_barang` AS `jenis_barang`, `ts`.`satuan_barang` AS `satuan_barang`, concat(`tb`.`nama_barang`,' (',`ts`.`satuan_barang`,')') AS `kocak`, `st`.`stok` AS `stokbarang`, `kl`.`stok` AS `keluar` FROM ((((`tbl_barang` `tb` left join `tbl_jenisbarang` `tj` on(`tb`.`fk_jenisbarang_id` = `tj`.`pk_jenisbarang_id`)) left join `tbl_satuan` `ts` on(`tb`.`fk_satuan_id` = `ts`.`pk_satuan_id`)) left join `stok` `st` on(`tb`.`pk_barang_id` = `st`.`id_barang`)) left join `keluar` `kl` on(`kl`.`id_barang` = `tb`.`pk_barang_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`pk_barang_id`),
  ADD KEY `FK_tbl_barang_tbl_jenisbarang` (`fk_jenisbarang_id`),
  ADD KEY `FK_tbl_barang_tbl_satuan` (`fk_satuan_id`);

--
-- Indexes for table `tbl_jenisbarang`
--
ALTER TABLE `tbl_jenisbarang`
  ADD PRIMARY KEY (`pk_jenisbarang_id`);

--
-- Indexes for table `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  ADD PRIMARY KEY (`pk_satuan_id`) USING BTREE;

--
-- Indexes for table `tbl_transaksi_keluar`
--
ALTER TABLE `tbl_transaksi_keluar`
  ADD PRIMARY KEY (`pk_transaksi_keluar_id`) USING BTREE,
  ADD KEY `FK_tbl_transaksi_masuk_tbl_barang` (`id_barang`) USING BTREE;

--
-- Indexes for table `tbl_transaksi_masuk`
--
ALTER TABLE `tbl_transaksi_masuk`
  ADD PRIMARY KEY (`pk_transaksi_masuk_id`),
  ADD KEY `FK_tbl_transaksi_masuk_tbl_barang` (`id_barang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `pk_barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_jenisbarang`
--
ALTER TABLE `tbl_jenisbarang`
  MODIFY `pk_jenisbarang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  MODIFY `pk_satuan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_transaksi_keluar`
--
ALTER TABLE `tbl_transaksi_keluar`
  MODIFY `pk_transaksi_keluar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_transaksi_masuk`
--
ALTER TABLE `tbl_transaksi_masuk`
  MODIFY `pk_transaksi_masuk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD CONSTRAINT `FK_tbl_barang_tbl_jenisbarang` FOREIGN KEY (`fk_jenisbarang_id`) REFERENCES `tbl_jenisbarang` (`pk_jenisbarang_id`),
  ADD CONSTRAINT `FK_tbl_barang_tbl_satuan` FOREIGN KEY (`fk_satuan_id`) REFERENCES `tbl_satuan` (`pk_satuan_id`);

--
-- Constraints for table `tbl_transaksi_keluar`
--
ALTER TABLE `tbl_transaksi_keluar`
  ADD CONSTRAINT `tbl_transaksi_keluar_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`pk_barang_id`);

--
-- Constraints for table `tbl_transaksi_masuk`
--
ALTER TABLE `tbl_transaksi_masuk`
  ADD CONSTRAINT `FK_tbl_transaksi_masuk_tbl_barang` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`pk_barang_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
