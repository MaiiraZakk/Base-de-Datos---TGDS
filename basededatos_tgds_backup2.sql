-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2026 a las 19:42:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basededatos_tgds`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `id_reparacion` int(11) NOT NULL,
  `monto_total` float NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `id_mecanico` int(11) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `salario` float NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `id_taller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mecanico`
--

INSERT INTO `mecanico` (`id_mecanico`, `especialidad`, `email`, `nombre`, `apellido`, `salario`, `fecha_ingreso`, `id_taller`) VALUES
(25, 'Motor', 'pedrito.perez@gmail.com', 'Pedro', 'Perez', 45000, '2022-01-10', 1),
(26, 'Motor', 'aldo.martinez@hotmail.com', 'Aldo', 'Martinez', 45000, '2021-05-16', 1),
(27, 'Electricidad', 'diegofernandez1@gmail.com', 'Diego', 'Fernandez', 47000, '2021-05-15', 1),
(28, 'Frenos', 'martincitosanchez@gmail.com', 'Martín', 'Sanchez', 43000, '2023-02-01', 3),
(29, 'Suspensión', 'jjcorrales@hotmail.com', 'Jorge', 'Corrales', 46000, '2005-03-14', 6),
(30, 'Suspensión', 'franciscopacheco14@gmail.com', 'Francisco', 'Pacheco', 46000, '2024-09-18', 2),
(31, 'Diagnóstico', 'alejandro@duran.com.uy', 'Alejandro', 'Duran', 50000, '2010-07-02', 5),
(32, 'Diagnóstico', 'andres.marquez@hotmail.com', 'Andres', 'Marquez', 50000, '2026-01-10', 4),
(33, 'Automotriz', 'mec.hector.parodi@gmail.com', 'Hector', 'Parodi', 54100, '2019-11-06', 2),
(34, 'Automotriz', 'carloscatoira@hotmail.com', 'Carlos', 'Catoira', 54100, '2020-08-20', 5),
(35, 'Automotriz', 'javibenitez88@gmail.com', 'Javier', 'Benitez', 54100, '2015-01-07', 6),
(36, 'Chapista', 'ramossergio@hotmail.com', 'Sergio', 'Ramos', 58300, '2019-11-07', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `metodo_pago` enum('Efectivo','Debito','Credito','Transferencia') NOT NULL,
  `tarjetas_admitidas` varchar(100) DEFAULT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT current_timestamp(),
  `monto_pagado` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparaciones`
--

CREATE TABLE `reparaciones` (
  `id_reparacion` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_mecanico` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `demora_estimada` varchar(20) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `codigo_reserva` varchar(10) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado_reserva` enum('Pendiente','Confirmada','Cancelada','Finalizada') NOT NULL DEFAULT 'Pendiente',
  `motivo_cancelacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `codigo_reserva`, `id_usuario`, `id_vehiculo`, `id_taller`, `fecha`, `hora`, `estado_reserva`, `motivo_cancelacion`) VALUES
(27, 'RES003', 1, 1, 1, '2026-06-01', '09:00:00', 'Confirmada', NULL),
(28, 'RES005', 4, 2, 1, '2026-03-15', '08:00:00', 'Cancelada', 'Cliente no asistió'),
(29, 'RES002', 5, 3, 2, '2026-02-07', '18:00:00', 'Confirmada', NULL),
(30, 'RES001', 7, 1, 2, '2026-05-21', '14:00:00', 'Pendiente', NULL),
(31, 'RES004', 9, 2, 1, '2026-07-02', '17:00:00', 'Confirmada', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(50) NOT NULL,
  `descripcion_servicio` varchar(255) NOT NULL,
  `costo_primario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talleres`
--

CREATE TABLE `talleres` (
  `id_taller` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero_puerta` int(11) NOT NULL,
  `calle` varchar(30) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `hora_apertura` time NOT NULL,
  `hora_cierre` time NOT NULL,
  `id_administrador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talleres`
--

INSERT INTO `talleres` (`id_taller`, `nombre`, `numero_puerta`, `calle`, `ciudad`, `email`, `rut`, `hora_apertura`, `hora_cierre`, `id_administrador`) VALUES
(1, 'AutoCentro Pando', 941, 'Guillermo Marconi', 'Pando', 'autocentropando@gmail.com', '214567890012', '08:00:00', '18:00:00', NULL),
(2, 'Taller Mecánico Parodi', 819, 'Dr. Luis A. de Herrera', 'Pando', 'tallerparodi@hotmail.com', '214567890013', '08:00:00', '17:00:00', NULL),
(3, 'Mecanica Automotriz MSANCHEZ', 1021, 'Washington Furriol', 'Pando', 'matiassanchez962@gmail.com', '214567890014', '09:00:00', '18:00:00', NULL),
(4, 'VHA MECANICA', 827, 'Jose Pedro Varela', 'Pando', 'vhmecanica2017@gmail.com', '214567890015', '08:00:00', '18:00:00', NULL),
(5, 'Mecanica Duran & Duran', 1323, 'Ituzaingó', 'Pando', 'duranyduran@gmail.com', '214567890016', '08:00:00', '18:00:00', NULL),
(6, 'Mecanica Corrales', 3150, 'Franklin D. Roosevelt', 'Pando', 'corralesautomoviles@gmail.com', '214567890017', '08:00:00', '16:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `documento` varchar(8) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tipo_usuario` enum('Cliente','Administrador_Taller','Administrador_Sistema') NOT NULL DEFAULT 'Cliente',
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `documento`, `email`, `tipo_usuario`, `password`) VALUES
(1, 'Juan', 'Perez', '45678901', 'juan.perez@email.com', 'Cliente', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(2, 'Ana', 'Gomez', '51234567', 'ana.gomez@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(3, 'Matias', 'Sanchez', '47890123', 'matias.sanchez@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(4, 'María', 'Silva', '52345678', 'maria.silva@email.com', 'Cliente', ''),
(5, 'Carlos', 'Diaz', '48901234', 'carlos.diaz@email.com', 'Cliente', ''),
(6, 'Julio', 'Uriarte', '12554779', 'julio.uriarte@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(7, 'Martina', 'Lopez', '46471590', 'martina.lopez@email.com', 'Cliente', ''),
(8, 'Alberto', 'Gandini', '32545437', 'alberto.gandini@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(9, 'Pablo', 'Russo', '26617873', 'pablo.russo@email.com', 'Cliente', ''),
(10, 'Lucia', 'Parodi', '58205156', 'lucia.parodi@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(11, 'Mayra', 'Zakoch', '45104243', 'mayra.zakoch@gmail.com', 'Cliente', '$2y$10$64iEmVvDJ8Mv7Sj7ZMJq9ey3gUuryEVDPJtaep7QgoUpGFIAj6Hau');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_administrador_sistema`
--

CREATE TABLE `usuario_administrador_sistema` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_administrador_taller`
--

CREATE TABLE `usuario_administrador_taller` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_administrador_taller`
--

INSERT INTO `usuario_administrador_taller` (`id_usuario`) VALUES
(2),
(3),
(6),
(8),
(10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_cliente`
--

CREATE TABLE `usuario_cliente` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_cliente`
--

INSERT INTO `usuario_cliente` (`id_usuario`) VALUES
(1),
(4),
(5),
(7),
(9),
(11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id_vehiculo` int(11) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `kilometraje` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `matricula` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `marca`, `modelo`, `color`, `kilometraje`, `anio`, `matricula`) VALUES
(1, 'Toyota', 'Corolla', 'Blanco', 45000, 2020, 'ABE 1401'),
(2, 'Chevrolet', 'Onix', 'Negro', 32000, 2021, 'BGA 1325'),
(3, 'Hyundai', 'HB20', 'Rojo', 51000, 2019, 'AAY 4774'),
(4, 'Volkswagen', 'Gol', 'Azul', 28000, 2022, 'ABL 2893'),
(5, 'Nissan', 'Versa', 'Gris', 39000, 2020, 'SDK 1389');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_reparacion` (`id_reparacion`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`id_mecanico`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_taller` (`id_taller`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  ADD PRIMARY KEY (`id_reparacion`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_mecanico` (`id_mecanico`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD UNIQUE KEY `codigo_reserva` (`codigo_reserva`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_taller` (`id_taller`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`id_taller`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD UNIQUE KEY `id_administrador` (`id_administrador`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `usuario_administrador_sistema`
--
ALTER TABLE `usuario_administrador_sistema`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuario_administrador_taller`
--
ALTER TABLE `usuario_administrador_taller`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  MODIFY `id_mecanico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  MODIFY `id_reparacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `talleres`
--
ALTER TABLE `talleres`
  MODIFY `id_taller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_reparacion`) REFERENCES `reparaciones` (`id_reparacion`);

--
-- Filtros para la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD CONSTRAINT `mecanico_ibfk_1` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`);

--
-- Filtros para la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  ADD CONSTRAINT `reparaciones_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `reparaciones_ibfk_2` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`),
  ADD CONSTRAINT `reparaciones_ibfk_3` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `reparaciones_ibfk_4` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_cliente` (`id_usuario`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`);

--
-- Filtros para la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD CONSTRAINT `fk_taller_administrador` FOREIGN KEY (`id_administrador`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario_administrador_sistema`
--
ALTER TABLE `usuario_administrador_sistema`
  ADD CONSTRAINT `usuario_administrador_sistema_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario_administrador_taller`
--
ALTER TABLE `usuario_administrador_taller`
  ADD CONSTRAINT `usuario_administrador_taller_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD CONSTRAINT `usuario_cliente_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
