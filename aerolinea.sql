-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2021 at 06:13 PM
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
-- Database: `aerolinea`
--

-- --------------------------------------------------------

--
-- Table structure for table `ciudad`
--

CREATE TABLE `ciudad` (
  `idCiudad` int(10) NOT NULL COMMENT 'Primary key',
  `ciNombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `ciPais` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `ciAeropuerto` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itinerario`
--

CREATE TABLE `itinerario` (
  `idItinerario` int(10) NOT NULL COMMENT 'Primary key',
  `itiOrigen` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `itiDestino` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `idCiudad` int(10) NOT NULL COMMENT 'Foreign key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pasajero`
--

CREATE TABLE `pasajero` (
  `idPasajero` int(10) NOT NULL COMMENT 'Primary key',
  `pasDocumento` enum('Cédula de ciudadanía','Cédula de extranjería','Tarjeta de identidad','Registro civil','Pasaporte') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `pasIdentificacion` int(20) NOT NULL,
  `pasApellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `pasNombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `pasTelefono` int(20) NOT NULL,
  `pasNacimiento` date NOT NULL,
  `pasFamiliar` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pasCelfam` int(20) DEFAULT NULL,
  `pasEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(10) NOT NULL COMMENT 'Primary key',
  `resCodigo` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `resIda` enum('Solo ida','Ida y vuelta') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `resDirecto` enum('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `resEscala` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `resFecha` datetime NOT NULL DEFAULT current_timestamp(),
  `idVuelo` int(10) NOT NULL COMMENT 'Foreign key',
  `idPasajero` int(10) NOT NULL COMMENT 'Foreign key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(10) NOT NULL COMMENT 'Primary key',
  `usLogin` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usePassword` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `useRol` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vuelo`
--

CREATE TABLE `vuelo` (
  `idVuelo` int(10) NOT NULL COMMENT 'Primary key',
  `vueCodigo` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `vueAeronave` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `vueTipoAvion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `vueCupo` int(10) NOT NULL,
  `vueSalida` datetime NOT NULL,
  `vueLLegada` datetime NOT NULL,
  `idItinerario` int(10) NOT NULL COMMENT 'Foreign key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indexes for table `itinerario`
--
ALTER TABLE `itinerario`
  ADD PRIMARY KEY (`idItinerario`),
  ADD KEY `fk_idCiudad` (`idCiudad`);

--
-- Indexes for table `pasajero`
--
ALTER TABLE `pasajero`
  ADD PRIMARY KEY (`idPasajero`);

--
-- Indexes for table `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `fk_idPasajero` (`idPasajero`),
  ADD KEY `fk_idVuelo` (`idVuelo`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- Indexes for table `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`idVuelo`),
  ADD KEY `fk_idItinerario` (`idItinerario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idCiudad` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary key';

--
-- AUTO_INCREMENT for table `itinerario`
--
ALTER TABLE `itinerario`
  MODIFY `idItinerario` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary key';

--
-- AUTO_INCREMENT for table `pasajero`
--
ALTER TABLE `pasajero`
  MODIFY `idPasajero` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary key';

--
-- AUTO_INCREMENT for table `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary key';

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary key';

--
-- AUTO_INCREMENT for table `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `idVuelo` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary key';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `itinerario`
--
ALTER TABLE `itinerario`
  ADD CONSTRAINT `fk_idCiudad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`);

--
-- Constraints for table `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_idPasajero` FOREIGN KEY (`idPasajero`) REFERENCES `pasajero` (`idPasajero`),
  ADD CONSTRAINT `fk_idVuelo` FOREIGN KEY (`idVuelo`) REFERENCES `vuelo` (`idVuelo`);

--
-- Constraints for table `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `fk_idItinerario` FOREIGN KEY (`idItinerario`) REFERENCES `itinerario` (`idItinerario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
