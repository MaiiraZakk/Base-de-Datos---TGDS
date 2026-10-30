-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2026 a las 14:23:49
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
  `monto_total` decimal(12,2) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `id_reparacion`, `monto_total`, `fecha`) VALUES
(1, 1, 5500.00, '2026-10-12'),
(2, 2, 2500.00, '2026-10-07'),
(3, 3, 500.00, '2026-10-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_presupuesto`
--

CREATE TABLE `factura_presupuesto` (
  `id_factura` int(11) NOT NULL,
  `id_presupuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_taller`
--

CREATE TABLE `horarios_taller` (
  `id_taller` int(11) NOT NULL,
  `dia_semana` tinyint(3) UNSIGNED NOT NULL COMMENT '1=Lunes, 7=Domingo',
  `abierto` tinyint(1) NOT NULL DEFAULT 0,
  `hora_apertura` time DEFAULT NULL,
  `hora_cierre` time DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `horarios_taller`
--

INSERT INTO `horarios_taller` (`id_taller`, `dia_semana`, `abierto`, `hora_apertura`, `hora_cierre`) VALUES
(1, 1, 1, '08:00:00', '18:00:00'),
(1, 2, 1, '08:00:00', '18:00:00'),
(1, 3, 1, '08:00:00', '18:00:00'),
(1, 4, 1, '08:00:00', '18:00:00'),
(1, 5, 1, '08:00:00', '18:00:00'),
(1, 6, 1, '09:00:00', '14:00:00'),
(1, 7, 0, NULL, NULL),
(2, 1, 1, '08:00:00', '17:30:00'),
(2, 2, 1, '08:00:00', '17:30:00'),
(2, 3, 1, '08:00:00', '17:30:00'),
(2, 4, 1, '08:00:00', '17:30:00'),
(2, 5, 1, '08:00:00', '17:30:00'),
(2, 6, 1, '08:00:00', '17:30:00'),
(2, 7, 0, NULL, NULL),
(3, 1, 1, '09:00:00', '18:00:00'),
(3, 2, 1, '09:00:00', '18:00:00'),
(3, 3, 1, '09:00:00', '18:00:00'),
(3, 4, 1, '09:00:00', '18:00:00'),
(3, 5, 1, '09:00:00', '18:00:00'),
(3, 6, 0, NULL, NULL),
(3, 7, 0, NULL, NULL),
(4, 1, 1, '08:00:00', '18:00:00'),
(4, 2, 1, '08:00:00', '18:00:00'),
(4, 3, 1, '08:00:00', '18:00:00'),
(4, 4, 1, '08:00:00', '18:00:00'),
(4, 5, 1, '08:00:00', '18:00:00'),
(4, 6, 0, NULL, NULL),
(4, 7, 0, NULL, NULL),
(5, 1, 1, '08:00:00', '18:00:00'),
(5, 2, 1, '08:00:00', '18:00:00'),
(5, 3, 1, '08:00:00', '18:00:00'),
(5, 4, 1, '08:00:00', '18:00:00'),
(5, 5, 1, '08:00:00', '18:00:00'),
(5, 6, 1, '08:00:00', '18:00:00'),
(5, 7, 0, NULL, NULL),
(6, 1, 1, '08:00:00', '16:00:00'),
(6, 2, 1, '08:00:00', '16:00:00'),
(6, 3, 1, '08:00:00', '16:00:00'),
(6, 4, 1, '08:00:00', '16:00:00'),
(6, 5, 1, '08:00:00', '16:00:00'),
(6, 6, 1, '08:00:00', '13:00:00'),
(6, 7, 0, NULL, NULL),
(7, 1, 1, '09:00:00', '18:00:00'),
(7, 2, 1, '09:00:00', '18:00:00'),
(7, 3, 1, '09:00:00', '18:00:00'),
(7, 4, 1, '09:00:00', '18:00:00'),
(7, 5, 1, '09:00:00', '18:00:00'),
(7, 6, 0, NULL, NULL),
(7, 7, 0, NULL, NULL),
(9, 1, 1, '08:00:00', '18:00:00'),
(9, 2, 1, '08:00:00', '18:00:00'),
(9, 3, 1, '08:00:00', '18:00:00'),
(9, 4, 1, '08:00:00', '18:00:00'),
(9, 5, 1, '08:00:00', '18:00:00'),
(9, 6, 1, '08:00:00', '12:00:00'),
(9, 7, 0, NULL, NULL);

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
(1, 'Motor', 'pedrito.perez@gmail.com', 'Pedro', 'Perez', 45000, '2022-01-10', 1),
(2, 'Motor', 'aldo.martinez@hotmail.com', 'Aldo', 'Martinez', 45000, '2021-05-16', 1),
(3, 'Electricidad', 'diegofernandez1@gmail.com', 'Diego', 'Fernandez', 47000, '2021-05-15', 1),
(4, 'Frenos', 'martincitosanchez@gmail.com', 'Martín', 'Sanchez', 43000, '2023-02-01', 3),
(5, 'Suspensión', 'jjcorrales@hotmail.com', 'Jorge', 'Corrales', 46000, '2005-03-14', 6),
(6, 'Suspensión', 'franciscopacheco14@gmail.com', 'Francisco', 'Pacheco', 46000, '2024-09-18', 2),
(7, 'Diagnóstico', 'alejandro@duran.com.uy', 'Alejandro', 'Duran', 50000, '2010-07-02', 5),
(8, 'Diagnóstico', 'andres.marquez@hotmail.com', 'Andres', 'Marquez', 50000, '2026-01-10', 4),
(9, 'Automotriz', 'mec.hector.parodi@gmail.com', 'Hector', 'Parodi', 54100, '2019-11-06', 2),
(10, 'Automotriz', 'carloscatoira@hotmail.com', 'Carlos', 'Catoira', 54100, '2020-08-20', 5),
(11, 'Automotriz', 'javibenitez88@gmail.com', 'Javier', 'Benitez', 54100, '2015-01-07', 6),
(12, 'Chapista', 'ramossergio@hotmail.com', 'Sergio', 'Ramos', 58300, '2019-11-07', 4);

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
  `monto_pagado` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_factura`, `metodo_pago`, `tarjetas_admitidas`, `fecha_pago`, `monto_pagado`) VALUES
(1, 1, 'Transferencia', NULL, '2026-10-12 14:38:00', 5500.00),
(2, 2, 'Efectivo', NULL, '2026-10-12 15:28:00', 500.00),
(3, 2, 'Debito', 'Visa', '2026-10-26 12:34:00', 2000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_confirmaciones`
--

CREATE TABLE `pagos_confirmaciones` (
  `clave` char(64) NOT NULL,
  `id_pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos_confirmaciones`
--

INSERT INTO `pagos_confirmaciones` (`clave`, `id_pago`) VALUES
('e9dbd0474fecd154bc126b3247356e2bf5a70d993ba8996c627acf59aa9c5729', 1),
('d3502235e1594a74c753eba7e2156ebbf29f61868b08a049b1339180a19ebaee', 2),
('d3a326943b23be3daea794365b08c189b074012ebc0919887a24289e0a2faf14', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos_taller`
--

CREATE TABLE `presupuestos_taller` (
  `id_presupuesto` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `detalle` text NOT NULL,
  `mano_obra` decimal(12,2) NOT NULL DEFAULT 0.00,
  `repuestos` decimal(12,2) NOT NULL DEFAULT 0.00,
  `estado` enum('Borrador','Pendiente','Aceptado','Rechazado','Cancelado') NOT NULL DEFAULT 'Borrador',
  `respuesta_fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presupuestos_taller`
--

INSERT INTO `presupuestos_taller` (`id_presupuesto`, `id_reserva`, `id_taller`, `fecha`, `detalle`, `mano_obra`, `repuestos`, `estado`, `respuesta_fecha`) VALUES
(1, 10, 2, '2026-10-12', 'Cambio de Cubiertas (x4) y Rulemanes\r\nAlineación y Balanceo', 1500.00, 13200.00, 'Pendiente', NULL),
(2, 9, 2, '2026-10-26', 'ajustes', 1990.00, 12000.00, 'Aceptado', '2026-10-26 12:23:13'),
(3, 20, 7, '2026-10-26', 'aceite motul', 1000.00, 0.00, 'Cancelado', '2026-10-26 22:20:11');

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

--
-- Volcado de datos para la tabla `reparaciones`
--

INSERT INTO `reparaciones` (`id_reparacion`, `id_vehiculo`, `id_mecanico`, `id_servicio`, `id_reserva`, `fecha_inicio`, `fecha_fin`, `demora_estimada`, `observaciones`) VALUES
(1, 2, 1, 3, 5, '2026-10-06', '2026-10-09', '3 días', ''),
(2, 3, 9, 5, 3, '2026-10-06', '2026-10-07', '1 día', ''),
(3, 9, 4, 8, 11, '2026-10-21', '2026-10-21', '1 día', 'Revisión general en el día para un primer Diagnostico.'),
(4, 7, 6, 11, 9, '2026-10-26', NULL, '1 día', '');

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
  `id_servicio` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado_reserva` enum('Pendiente','Confirmada','Cancelada','Finalizada') NOT NULL DEFAULT 'Pendiente',
  `motivo_cancelacion` varchar(255) DEFAULT NULL,
  `ocupa_horario` tinyint(4) GENERATED ALWAYS AS (case when `estado_reserva` = 'Cancelada' then NULL else 1 end) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `codigo_reserva`, `id_usuario`, `id_vehiculo`, `id_taller`, `id_servicio`, `fecha`, `hora`, `estado_reserva`, `motivo_cancelacion`) VALUES
(1, 'RES003', 1, 1, 1, 1, '2026-06-01', '09:00:00', 'Confirmada', NULL),
(2, 'RES005', 4, 2, 1, 4, '2026-03-15', '08:00:00', 'Cancelada', 'Cliente no asistió'),
(3, 'RES002', 5, 3, 2, 5, '2026-02-07', '18:00:00', 'Finalizada', NULL),
(4, 'RES001', 7, 1, 2, 2, '2026-05-21', '14:00:00', 'Pendiente', NULL),
(5, 'RES004', 9, 2, 1, 3, '2026-07-02', '17:00:00', 'Finalizada', NULL),
(6, 'R0B4CE46CF', 11, 3, 2, NULL, '2026-09-15', '16:57:00', 'Pendiente', NULL),
(7, 'R0018EFFB4', 12, 3, 5, NULL, '2026-09-28', '17:40:00', 'Pendiente', NULL),
(8, 'R363B6DDC5', 11, 6, 2, NULL, '2026-10-29', '14:35:00', 'Confirmada', NULL),
(9, 'R2E3549C72', 12, 7, 2, 11, '2026-10-22', '13:50:00', 'Confirmada', NULL),
(10, 'R5CE227E06', 14, 8, 2, NULL, '2026-10-14', '08:01:00', 'Pendiente', NULL),
(11, 'RCDD318045', 15, 9, 3, 8, '2027-01-01', '17:30:00', 'Finalizada', NULL),
(12, 'RE8BEC8254', 15, 9, 3, NULL, '2026-10-18', '18:00:00', 'Pendiente', NULL),
(13, 'RCD2BA262F', 16, 11, 2, NULL, '2026-10-28', '17:00:00', 'Confirmada', NULL),
(14, 'R7A891C20B', 12, 7, 5, NULL, '2026-10-18', '17:30:00', 'Pendiente', NULL),
(15, 'R339CD6E9E', 12, 7, 5, NULL, '2026-10-18', '17:30:00', 'Cancelada', 'Cambio de fecha'),
(16, 'R2B2FC63F7', 12, 7, 5, NULL, '2026-10-29', '17:00:00', 'Pendiente', NULL),
(19, 'RAB4A5742A', 12, 12, 3, NULL, '2026-10-30', '16:30:00', 'Pendiente', NULL),
(20, 'R3F9B54407', 19, 13, 7, 12, '2027-11-11', '17:30:00', 'Cancelada', 'cliente no vino');

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

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre_servicio`, `descripcion_servicio`, `costo_primario`) VALUES
(1, 'Cambio aceite', 'Lubricación completa', 2500),
(2, 'Alineación', 'Ajuste de dirección', 1800),
(3, 'Balanceo', 'Balance de ruedas', 1200),
(4, 'Frenos', 'Revisión y cambio', 4500),
(5, 'Diagnóstico', 'Escaneo electrónico', 1500),
(6, 'Cambio de Aceite', 'Cambio de Aceite, Motul\r\ncon Cambio de Filtros incluido.', 3750),
(7, 'Cambio de Aceite', 'Aceite ANCAP, MOTUL, Castrol\r\nSemisintético o Sintético', 2500),
(8, 'Diagnóstico', 'Revisión General y Chequeo por computadora.', 500),
(9, 'Diagnóstico', 'Diagnostico General', 800),
(10, 'Tren Delantero', 'Cambio de Piezas - Costo solo de Mano de Obra', 1500),
(11, 'Alineación y Balanceo', 'Costo por las 4 Ruedas', 1990),
(12, 'Cambio de aceite', 'Cambio de aceite', 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_propietarios`
--

CREATE TABLE `servicios_propietarios` (
  `id_servicio` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios_propietarios`
--

INSERT INTO `servicios_propietarios` (`id_servicio`, `id_taller`) VALUES
(6, 1),
(9, 2),
(10, 2),
(11, 2),
(7, 3),
(8, 3),
(12, 7);

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
  `id_administrador` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talleres`
--

INSERT INTO `talleres` (`id_taller`, `nombre`, `numero_puerta`, `calle`, `ciudad`, `email`, `rut`, `hora_apertura`, `hora_cierre`, `id_administrador`, `imagen`) VALUES
(1, 'AutoCentro Pando', 941, 'Guillermo Marconi', 'Pando', 'autocentropando@gmail.com', '214567890012', '08:00:00', '18:00:00', 2, 'assets/img/TALLERES/dbb7d3c1cf5b3bf1d70581550bb0c953.png'),
(2, 'Taller Mecánico Parodi', 819, 'Dr. Luis A. de Herrera', 'Pando', 'tallerparodi@hotmail.com', '214567890013', '08:00:00', '17:30:00', 10, 'assets/img/TALLERES/2858fa29c716c59f9e125894d207a522.png'),
(3, 'Mecanica Automotriz MSANCHEZ', 1021, 'Washington Furriol', 'Pando', 'matiassanchez962@gmail.com', '214567890014', '09:00:00', '18:00:00', 3, 'assets/img/TALLERES/f2a52402f793bb951ebb9ac2d3962e09.png'),
(4, 'VHA MECANICA', 827, 'Jose Pedro Varela', 'Pando', 'vhmecanica2017@gmail.com', '214567890015', '08:00:00', '18:00:00', 7, 'assets/img/TALLERES/a10d8a984bd36b8c9d3d0fe1eef92e57.png'),
(5, 'Mecanica Duran & Duran', 1323, 'Ituzaingó', 'Pando', 'duranyduran@gmail.com', '214567890016', '08:00:00', '18:00:00', 6, 'assets/img/TALLERES/9a54f7297cd66d52b1f3f659011a25b4.png'),
(6, 'Mecanica Corrales', 3150, 'Franklin D. Roosevelt', 'Pando', 'corralesautomoviles@gmail.com', '214567890017', '08:00:00', '16:00:00', 15, 'assets/img/TALLERES/fa4dc54a8c1dbc193fff3babfab73775.png'),
(7, 'Mecánica Marquez', 214, 'Peluffo', 'Pando', 'mecanica.marquez@gmail.com', '211998860010', '09:00:00', '18:00:00', 1, 'assets/img/TALLERES/2ce70288eb470f68addbf34928c32899.png'),
(9, 'BRANAU', 123, '26 De Mayo, 15600 Em', 'Villa olmos', 'tallerbranau@gmail.com', '214567899912', '08:00:00', '18:00:00', 20, 'assets/img/TALLERES/b3fbe6d17369760ead2f0560a8c48532.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_mecanicos`
--

CREATE TABLE `telefonos_mecanicos` (
  `id_telefonos` int(11) NOT NULL,
  `id_mecanico` int(11) NOT NULL,
  `numero_telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos_mecanicos`
--

INSERT INTO `telefonos_mecanicos` (`id_telefonos`, `id_mecanico`, `numero_telefono`) VALUES
(1, 1, '099222333'),
(2, 1, '095741852'),
(3, 1, '091258963'),
(4, 2, '095890316'),
(5, 3, '099555741'),
(6, 4, '098665544'),
(7, 5, '096369874'),
(8, 6, '091214213'),
(9, 6, '098141414'),
(10, 7, '096321456'),
(11, 8, '099784346'),
(12, 8, '097784346'),
(13, 9, '097550230'),
(14, 10, '094100110'),
(15, 11, '091094836'),
(16, 11, '099321654'),
(17, 12, '092456789'),
(18, 12, '097120360');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_taller`
--

CREATE TABLE `telefonos_taller` (
  `id_telefonos` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL,
  `numero_telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos_taller`
--

INSERT INTO `telefonos_taller` (`id_telefonos`, `id_taller`, `numero_telefono`) VALUES
(45, 1, '099190059'),
(46, 2, '099803996'),
(47, 2, '091478434'),
(48, 2, '22925554'),
(49, 3, '093750244'),
(50, 4, '099393553'),
(51, 4, '22927368'),
(52, 5, '099663858'),
(53, 5, '22927896'),
(54, 6, '22924117'),
(55, 6, '098314233'),
(63, 7, '094273445'),
(64, 7, '091059875'),
(66, 9, '095833511');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_usuario`
--

CREATE TABLE `telefonos_usuario` (
  `id_telefonos` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos_usuario`
--

INSERT INTO `telefonos_usuario` (`id_telefonos`, `id_usuario`, `telefono`) VALUES
(2, 2, '098234567'),
(3, 3, '093750244'),
(4, 4, '096456789'),
(5, 5, '095567890'),
(6, 6, '091095834'),
(8, 8, '095567893'),
(10, 10, '095567895'),
(11, 11, '096406846'),
(12, 12, '094137301'),
(13, 13, '094474966'),
(14, 14, '099999999'),
(15, 7, '095567892'),
(17, 16, '568123489'),
(19, 15, '098432927'),
(21, 17, '096340944'),
(22, 9, '095567894'),
(24, 18, '095833511'),
(25, 1, '099123456'),
(27, 19, '123498765'),
(29, 20, '3748327658');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_talleres`
--

CREATE TABLE `ubicacion_talleres` (
  `id_ubicacion` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL,
  `numero_puerta` int(11) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicacion_talleres`
--

INSERT INTO `ubicacion_talleres` (`id_ubicacion`, `id_taller`, `numero_puerta`, `calle`, `ciudad`) VALUES
(1, 1, 941, 'Guillermo Marconi', 'Pando'),
(2, 2, 819, 'Dr. Luis A. de Herrera', 'Pando'),
(3, 3, 1021, 'Washington Furriol', 'Pando'),
(4, 4, 827, 'Jose Pedro Varela', 'Pando'),
(5, 5, 1323, 'Ituzaingó', 'Pando'),
(6, 6, 3150, 'Franklin D. Roosevelt', 'Pando'),
(7, 7, 214, 'Peluffo', 'Pando'),
(8, 9, 123, '26 De Mayo, 15600 Em', 'Villa olmos');

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
(1, 'Juan', 'Perez', '45678901', 'juan.perez@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(2, 'Ana', 'Gomez', '51234567', 'ana.gomez@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(3, 'Matias', 'Sanchez', '47890123', 'matias.sanchez@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(4, 'María', 'Silva', '52345678', 'maria.silva@email.com', 'Cliente', ''),
(5, 'Carlos', 'Diaz', '48901234', 'carlos.diaz@email.com', 'Cliente', ''),
(6, 'Julio', 'Uriarte', '12554779', 'julio.uriarte@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(7, 'Martina', 'Lopez', '46471590', 'martina.lopez@email.com', 'Administrador_Taller', ''),
(8, 'Alberto', 'Gandini', '32545437', 'alberto.gandini@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(9, 'Pablo', 'Russo', '26617873', 'pablo.russo@email.com', 'Cliente', '$2y$10$wk.3mAZsAomUaY5p2lNlL.v.Umf9wXPjsSNpTiJB0FryRdn2BbPXi'),
(10, 'Lucia', 'Parodi', '58205156', 'lucia.parodi@email.com', 'Administrador_Taller', '$2y$10$tXpNrqn3.I2POa3LV6TtEuSZJmZwoZUhnz28lVtk4CxDsJBynGwHe'),
(11, 'Mayra', 'Zakoch', '45104243', 'mayra.zakoch@gmail.com', 'Administrador_Sistema', '$2y$10$64iEmVvDJ8Mv7Sj7ZMJq9ey3gUuryEVDPJtaep7QgoUpGFIAj6Hau'),
(12, 'Julio', 'Torres', '25551975', 'jatorres13@gmail.com', 'Cliente', '$2y$10$nDoF/XfUpTQ5cLiylPjUd.IC7Vr2E.bgv8dTGuM3T86GHwgjnh6yK'),
(13, 'Yuliana', 'Zunino', '48250178', 'yulianazunino13@gmail.com', 'Administrador_Sistema', '$2y$10$IPOhm8ekQwAA2VwIvnoLXOKLvWDWdvAyj.yZTJEra10uQs2SliFSG'),
(14, 'Oscar', 'Papini', '55555555', 'oscar.informatica.utu@gmail.com', 'Cliente', '$2y$10$bjZEVKy9HfwVj5J2.DSZgeQRzvJlyUJkFMoJylXu5qfOOF/yGmWCa'),
(15, 'Agustin', 'Borba', '57123712', 'agustin04032008@gmail.com', 'Administrador_Taller', '$2y$10$Z04RQV2iSD0KfmOyU6uAVeMeVfCfwEVH4Q2NHhGOmNEe/UXZkeCWm'),
(16, '\' OR \'1\'=\'1\' --', '\' OR \'1\'=\'1\' --', '57857877', 'agustinborbaduarte@gmail.com', 'Cliente', '$2y$10$khUtxt.Fub99NAn7mS0ii.NVING9o9zyoWEO0NinYGZhwf2MSm6Da'),
(17, 'Pilar', 'Petiz', '58628440', 'pilarpetiz.zakoch@gmail.com', 'Cliente', '$2y$10$HC8O7VwLkOYUqYm0bKwPPednfdn10SBxQSnhRMhl1qYD0dtQhPmRq'),
(18, 'Nahuel', 'Ramos', '55356157', 'N4gUY118@gmail.com', 'Administrador_Sistema', '$2y$10$Fkgvkkme3e6mgHWicxBfROl.EQhILTgu5esmHCHD6nq5J9kzos14W'),
(19, 'prueba', 'pruebaa', '12348765', 'prueba@gmail.com', 'Cliente', '$2y$10$zDquLy/WzSIQiUs8Yd1NF.peC32Ge6/vsyl5HS6wgutZQagXoQ6T2'),
(20, 'nautaller', 'prueba', '55354323', 'nautaller@gmail.com', 'Administrador_Taller', '$2y$10$o7pD9bi9qpJdbmkPIs7OpOGVnZV9B.gTdP7c/ddFgZ5rBde6LoSfO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_administrador_sistema`
--

CREATE TABLE `usuario_administrador_sistema` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_administrador_sistema`
--

INSERT INTO `usuario_administrador_sistema` (`id_usuario`) VALUES
(11),
(13),
(18);

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
(1),
(2),
(3),
(6),
(7),
(8),
(10),
(15),
(20);

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
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19);

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
  `matricula` varchar(8) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `marca`, `modelo`, `color`, `kilometraje`, `anio`, `matricula`, `id_usuario`, `activo`) VALUES
(1, 'Toyota', 'Corolla', 'Blanco', 45000, 2020, 'ABE 1401', NULL, 1),
(2, 'Chevrolet', 'Onix', 'Negro', 32000, 2021, 'BGA 1325', NULL, 1),
(3, 'Hyundai', 'HB20', 'Rojo', 51000, 2019, 'AAY 4774', NULL, 1),
(4, 'Volkswagen', 'Gol', 'Azul', 28000, 2022, 'ABL 2893', NULL, 1),
(5, 'Nissan', 'Versa', 'Gris', 39000, 2020, 'SDK 1389', NULL, 1),
(6, 'Chevrolet', 'SPARK LS', 'GRIS PLATA', 188000, 2015, 'AAV7777', 11, 1),
(7, 'BYD', 'Yuan Pro', 'Negro', 87000, 2026, 'ABE2199', 12, 1),
(8, 'Renault', 'Duster', 'Whitekasdh', 80000, 2021, 'ABE111', 14, 1),
(9, 'Lamborghini', 'Veneno', 'Gris', 15, 2020, 'ATX5698', 15, 1),
(10, '\' OR \'1\'=\'1\' --', '\' OR \'1\'=\'1\' --', '\' OR \'1\'=\'1\' --', 1, 2008, 'ABE2198', 15, 1),
(11, 'Pagani', 'Utopia', 'Negro', 70, 2020, 'AWS1233', 16, 1),
(12, 'Suzuki', 'Celerio 1.0', 'Blanco', 148360, 2013, 'AAJ1515', 12, 1),
(13, 'VW', 'UP!', 'Gris', 105000, 2018, 'AVP1122', 19, 1);

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
-- Indices de la tabla `factura_presupuesto`
--
ALTER TABLE `factura_presupuesto`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `id_presupuesto` (`id_presupuesto`);

--
-- Indices de la tabla `horarios_taller`
--
ALTER TABLE `horarios_taller`
  ADD PRIMARY KEY (`id_taller`,`dia_semana`);

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
-- Indices de la tabla `pagos_confirmaciones`
--
ALTER TABLE `pagos_confirmaciones`
  ADD PRIMARY KEY (`clave`),
  ADD UNIQUE KEY `id_pago` (`id_pago`);

--
-- Indices de la tabla `presupuestos_taller`
--
ALTER TABLE `presupuestos_taller`
  ADD PRIMARY KEY (`id_presupuesto`),
  ADD KEY `fk_pt_reserva` (`id_reserva`),
  ADD KEY `idx_pt_estado` (`id_taller`,`estado`);

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
  ADD UNIQUE KEY `uq_reserva_taller_fecha_hora` (`id_taller`,`fecha`,`hora`,`ocupa_horario`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `servicios_propietarios`
--
ALTER TABLE `servicios_propietarios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `fk_sp_taller` (`id_taller`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`id_taller`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD UNIQUE KEY `id_administrador` (`id_administrador`);

--
-- Indices de la tabla `telefonos_mecanicos`
--
ALTER TABLE `telefonos_mecanicos`
  ADD PRIMARY KEY (`id_telefonos`),
  ADD KEY `fk_telefonos_mecanico` (`id_mecanico`);

--
-- Indices de la tabla `telefonos_taller`
--
ALTER TABLE `telefonos_taller`
  ADD PRIMARY KEY (`id_telefonos`),
  ADD KEY `fk_telefonos_taller` (`id_taller`);

--
-- Indices de la tabla `telefonos_usuario`
--
ALTER TABLE `telefonos_usuario`
  ADD PRIMARY KEY (`id_telefonos`),
  ADD KEY `fk_telefonos_usuario` (`id_usuario`);

--
-- Indices de la tabla `ubicacion_talleres`
--
ALTER TABLE `ubicacion_talleres`
  ADD PRIMARY KEY (`id_ubicacion`),
  ADD KEY `fk_ubicacion_taller` (`id_taller`);

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
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `fk_vehiculos_cliente` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  MODIFY `id_mecanico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `presupuestos_taller`
--
ALTER TABLE `presupuestos_taller`
  MODIFY `id_presupuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  MODIFY `id_reparacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `talleres`
--
ALTER TABLE `talleres`
  MODIFY `id_taller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `telefonos_mecanicos`
--
ALTER TABLE `telefonos_mecanicos`
  MODIFY `id_telefonos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT de la tabla `telefonos_taller`
--
ALTER TABLE `telefonos_taller`
  MODIFY `id_telefonos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `telefonos_usuario`
--
ALTER TABLE `telefonos_usuario`
  MODIFY `id_telefonos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `ubicacion_talleres`
--
ALTER TABLE `ubicacion_talleres`
  MODIFY `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_reparacion`) REFERENCES `reparaciones` (`id_reparacion`);

--
-- Filtros para la tabla `factura_presupuesto`
--
ALTER TABLE `factura_presupuesto`
  ADD CONSTRAINT `fk_fp_factura` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`),
  ADD CONSTRAINT `fk_fp_presupuesto` FOREIGN KEY (`id_presupuesto`) REFERENCES `presupuestos_taller` (`id_presupuesto`);

--
-- Filtros para la tabla `horarios_taller`
--
ALTER TABLE `horarios_taller`
  ADD CONSTRAINT `fk_horarios_taller` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`) ON DELETE CASCADE;

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
-- Filtros para la tabla `pagos_confirmaciones`
--
ALTER TABLE `pagos_confirmaciones`
  ADD CONSTRAINT `fk_pc_pago` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`);

--
-- Filtros para la tabla `presupuestos_taller`
--
ALTER TABLE `presupuestos_taller`
  ADD CONSTRAINT `fk_pt_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  ADD CONSTRAINT `fk_pt_taller` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`);

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
-- Filtros para la tabla `servicios_propietarios`
--
ALTER TABLE `servicios_propietarios`
  ADD CONSTRAINT `fk_sp_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sp_taller` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`);

--
-- Filtros para la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD CONSTRAINT `fk_taller_administrador` FOREIGN KEY (`id_administrador`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `telefonos_mecanicos`
--
ALTER TABLE `telefonos_mecanicos`
  ADD CONSTRAINT `fk_telefonos_mecanico` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefonos_taller`
--
ALTER TABLE `telefonos_taller`
  ADD CONSTRAINT `fk_telefonos_taller` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefonos_usuario`
--
ALTER TABLE `telefonos_usuario`
  ADD CONSTRAINT `fk_telefonos_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ubicacion_talleres`
--
ALTER TABLE `ubicacion_talleres`
  ADD CONSTRAINT `fk_ubicacion_taller` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `fk_vehiculos_cliente` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_cliente` (`id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
