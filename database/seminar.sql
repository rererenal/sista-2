-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2021 at 08:22 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seminar`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `jenjang`
--

CREATE TABLE `jenjang` (
  `id_jenjang` tinyint(2) NOT NULL,
  `kode_jenjang` varchar(3) NOT NULL,
  `nama_jenjang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenjang`
--

INSERT INTO `jenjang` (`id_jenjang`, `kode_jenjang`, `nama_jenjang`) VALUES
(1, 'D3', 'Diploma-3'),
(2, 'S1', 'Strata-1');

-- --------------------------------------------------------

--
-- Table structure for table `konsentrasi`
--

CREATE TABLE `konsentrasi` (
  `id_konsentrasi` tinyint(2) NOT NULL,
  `kode_konsentrasi` varchar(3) NOT NULL,
  `nama_konsentrasi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konsentrasi`
--

INSERT INTO `konsentrasi` (`id_konsentrasi`, `kode_konsentrasi`, `nama_konsentrasi`) VALUES
(1, 'SI', 'Sistem Informasi'),
(2, 'RPL', 'Rekayasa Perangkat Lunak'),
(3, 'TK', 'Teknik Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nim` int(8) NOT NULL,
  `nama_mhs` varchar(50) NOT NULL,
  `id_prodi` tinyint(2) NOT NULL,
  `id_konsentrasi` tinyint(2) NOT NULL,
  `id_jenjang` tinyint(2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nim`, `nama_mhs`, `id_prodi`, `id_konsentrasi`, `id_jenjang`, `email`, `no_telp`) VALUES
(1, 12345678, 'Mahasiswa', 1, 3, 1, 'mahasiswa1@gmail.com', '0812345678'),
(170, 11928318, 'satria wahyu ismail', 1, 2, 1, 'satriawahyuismail@sttterpadunf.ac.id', '085214371522'),
(172, 7533211, 'Rama Subakti', 1, 1, 2, 'ramasubakti01@gmail.com', '085273617636');

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayaran`
--

CREATE TABLE `metode_pembayaran` (
  `id_metode` tinyint(2) NOT NULL,
  `nama_metode` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `metode_pembayaran`
--

INSERT INTO `metode_pembayaran` (`id_metode`, `nama_metode`) VALUES
(1, 'Cash'),
(2, 'Transfer'),
(3, 'Belum Bayar');

-- --------------------------------------------------------

--
-- Table structure for table `pembicara`
--

CREATE TABLE `pembicara` (
  `id_pembicara` tinyint(3) NOT NULL,
  `nama_pembicara` varchar(150) NOT NULL,
  `latar_belakang` varchar(100) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembicara`
--

INSERT INTO `pembicara` (`id_pembicara`, `nama_pembicara`, `latar_belakang`, `id_seminar`, `foto`) VALUES
(18, 'Dewi Sriwijayanti', 'Moderator', 9, '4308ef381637a155b69540b2e9383d8e.jpg'),
(19, 'Dr. Suprayanto', 'Pemateri', 9, '33dc275329eef08723ab80f71890e3ad.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran_seminar`
--

CREATE TABLE `pendaftaran_seminar` (
  `id_pendaftaran` int(10) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `jam_daftar` time NOT NULL,
  `id_stsbyr` tinyint(2) NOT NULL,
  `id_metode` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pendaftaran_seminar`
--

INSERT INTO `pendaftaran_seminar` (`id_pendaftaran`, `id_seminar`, `id_mahasiswa`, `tgl_daftar`, `jam_daftar`, `id_stsbyr`, `id_metode`) VALUES
(163, 2, 164, '2021-07-15', '06:47:02', 1, 1),
(164, 2, 162, '2021-07-15', '06:47:27', 2, 3),
(166, 9, 1, '2021-07-15', '07:42:05', 2, 3),
(168, 9, 170, '2021-07-15', '09:12:49', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `presensi_seminar`
--

CREATE TABLE `presensi_seminar` (
  `id_presensi` int(11) NOT NULL,
  `id_mahasiswa` tinyint(3) NOT NULL,
  `nomor_induk` int(15) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL,
  `tgl_khd` date NOT NULL,
  `jam_khd` time NOT NULL,
  `id_stskhd` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` tinyint(2) NOT NULL,
  `kode_prodi` varchar(2) NOT NULL,
  `nama_prodi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `kode_prodi`, `nama_prodi`) VALUES
(1, 'IF', 'Teknik Informatika'),
(2, 'MI', 'Manajemen Informatika'),
(3, 'KA', 'Komputer Akuntansi');

-- --------------------------------------------------------

--
-- Table structure for table `seminar`
--

CREATE TABLE `seminar` (
  `id_seminar` int(3) NOT NULL,
  `nama_seminar` varchar(128) NOT NULL,
  `tgl_pelaksana` date NOT NULL,
  `lampiran` varchar(64) NOT NULL,
  `pmb` varchar(128) NOT NULL,
  `pgj1` varchar(128) NOT NULL,
  `pgj2` varchar(128) NOT NULL,
  `rg` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seminar`
--

INSERT INTO `seminar` (`id_seminar`, `nama_seminar`, `tgl_pelaksana`, `lampiran`, `pmb`, `pgj1`, `pgj2`, `rg`) VALUES
(9, 'Menganalisa Bakteri Staphylococcus', '2021-07-02', '2b542de0bb58146380315ab5cde60b04.jpg', 'Dr. Sidomunjul, E.N.K', 'Dr. Sayur Kol, E.N.K', 'Dr.Kulon', 'online');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `id_sponsor` tinyint(3) NOT NULL,
  `nama_sponsor` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`id_sponsor`, `nama_sponsor`, `gambar`, `id_seminar`) VALUES
(12, 'STT Terpadu Nurul Fikri', '6529f7f0292b673a447ad10a74d0cb73.png', 9);

-- --------------------------------------------------------

--
-- Table structure for table `status_kehadiran`
--

CREATE TABLE `status_kehadiran` (
  `id_stskhd` tinyint(1) NOT NULL,
  `nama_stskhd` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_kehadiran`
--

INSERT INTO `status_kehadiran` (`id_stskhd`, `nama_stskhd`) VALUES
(1, 'Tidak Hadir'),
(2, 'Hadir');

-- --------------------------------------------------------

--
-- Table structure for table `status_pembayaran`
--

CREATE TABLE `status_pembayaran` (
  `id_stsbyr` tinyint(2) NOT NULL,
  `nama_stsbyr` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_pembayaran`
--

INSERT INTO `status_pembayaran` (`id_stsbyr`, `nama_stsbyr`) VALUES
(2, 'Belum Lunas'),
(1, 'Sudah Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` tinyint(3) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL,
  `harga_tiket` bigint(15) NOT NULL,
  `slot_tiket` int(5) NOT NULL,
  `lampiran_tiket` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `id_seminar`, `harga_tiket`, `slot_tiket`, `lampiran_tiket`) VALUES
(14, 9, 50000, 76, 'fac1ceb477d0b6931982827c8da99b19.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$ml83HGMMj9/8lQ9yTVmhrO/jIQiGPEwvn0cIXYRP2W3fIaUHeo7G.', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1626357229, 1, 'Admin', 'istrator', 'ADMIN', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenjang`
--
ALTER TABLE `jenjang`
  ADD PRIMARY KEY (`id_jenjang`);

--
-- Indexes for table `konsentrasi`
--
ALTER TABLE `konsentrasi`
  ADD PRIMARY KEY (`id_konsentrasi`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD KEY `id_prodi` (`id_prodi`,`id_konsentrasi`,`id_jenjang`);

--
-- Indexes for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD PRIMARY KEY (`id_metode`);

--
-- Indexes for table `pembicara`
--
ALTER TABLE `pembicara`
  ADD PRIMARY KEY (`id_pembicara`),
  ADD KEY `id_seminar` (`id_seminar`);

--
-- Indexes for table `pendaftaran_seminar`
--
ALTER TABLE `pendaftaran_seminar`
  ADD PRIMARY KEY (`id_pendaftaran`),
  ADD KEY `id_seminar` (`id_seminar`,`id_mahasiswa`,`id_stsbyr`,`id_metode`);

--
-- Indexes for table `presensi_seminar`
--
ALTER TABLE `presensi_seminar`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`,`id_stskhd`),
  ADD KEY `id_seminar` (`id_seminar`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `seminar`
--
ALTER TABLE `seminar`
  ADD PRIMARY KEY (`id_seminar`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`id_sponsor`),
  ADD KEY `id_seminar` (`id_seminar`);

--
-- Indexes for table `status_kehadiran`
--
ALTER TABLE `status_kehadiran`
  ADD PRIMARY KEY (`id_stskhd`);

--
-- Indexes for table `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  ADD PRIMARY KEY (`id_stsbyr`),
  ADD KEY `nama_stsbyr` (`nama_stsbyr`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `id_seminar` (`id_seminar`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenjang`
--
ALTER TABLE `jenjang`
  MODIFY `id_jenjang` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `konsentrasi`
--
ALTER TABLE `konsentrasi`
  MODIFY `id_konsentrasi` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  MODIFY `id_metode` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembicara`
--
ALTER TABLE `pembicara`
  MODIFY `id_pembicara` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pendaftaran_seminar`
--
ALTER TABLE `pendaftaran_seminar`
  MODIFY `id_pendaftaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `presensi_seminar`
--
ALTER TABLE `presensi_seminar`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seminar`
--
ALTER TABLE `seminar`
  MODIFY `id_seminar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `id_sponsor` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `status_kehadiran`
--
ALTER TABLE `status_kehadiran`
  MODIFY `id_stskhd` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  MODIFY `id_stsbyr` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
