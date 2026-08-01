# Base-de-Datos---TGDS
Codigo de Base de Datos para MySQL

CREATE DATABASE BaseDeDatos_TGDS;

//CREACION DE TABLAS

CREATE TABLE usuario (
    id_usuario VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    documento VARCHAR(8) NOT NULL UNIQUE, 
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE usuario_cliente (
    id_usuario VARCHAR(4) PRIMARY KEY,
    	FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
);

(// SE ELIMINA EL DATO C.I. YA QUE ES REDUNDANTE, TENEMOS Documento EN LA TABLA USUARIO)

CREATE TABLE usuario_administrador_taller (
    id_usuario VARCHAR(4) PRIMARY KEY,
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
);


-- Tabla reservas
CREATE TABLE reservas (
    codigo_reserva VARCHAR(5) PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado_reserva ENUM('Pendiente', 'Confirmada', 'Cancelada') NOT NULL,
    motivo_cancelacion VARCHAR(255) NULL
);

--Tabla vehiculos
CREATE TABLE vehiculos (
    id_vehiculo VARCHAR(4) PRIMARY KEY,
    marca VARCHAR(30) NOT NULL,
    modelo VARCHAR(30) NOT NULL,
    color VARCHAR(30) NOT NULL,
    kilometraje INT NOT NULL,
    anio INT NOT NULL,
    matricula VARCHAR(8) NOT NULL UNIQUE
);

--Tabla talleres
CREATE TABLE talleres (
    id_taller INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    numero_puerta INT NOT NULL,
    calle VARCHAR(30) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    rut INT(12) NOT NULL UNIQUE,
    horario_atencion VARCHAR(20) NOT NULL  (// Capas conviene separarlo por: hora_apertura TIME, hora_cierre TIME )

--Tabla mecánicos
CREATE TABLE mecanico (
    id_mecanico INT PRIMARY KEY,
    especialidad VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    salario FLOAT NOT NULL,
    fecha_ingreso DATE NOT NULL
);

//RECOMENDACION; sería conveniente relacionar los mecánicos con los talleres donde trabajan mediante una clave foránea (ya que serán varios talleres) así cada mecánico quedará asociado a un taller, permitiendo consultar Que mecánico es del taller. Cantidad de mecánicos por taller. Reservas y reparaciones asignadas a un taller específico.

id_taller INT NOT NULL,
FOREIGN KEY (id_taller) REFERENCES talleres(id_taller)


-- Tabla Servicios
CREATE TABLE servicios (
    id_servicio VARCHAR(10) PRIMARY KEY,
    nombre_servicio VARCHAR(50) NOT NULL,
    descripcion_servicio VARCHAR(255) NOT NULL,
    costo_primario FLOAT NOT NULL
);

-- Sería más útil que la tabla reparaciones represente cada reparación realizada y se relacione con las demás tablas mediante claves foráneas.

CREATE TABLE reparaciones (
    id_reparacion INT PRIMARY KEY,
    id_vehiculo VARCHAR(4) NOT NULL,
    id_mecanico INT NOT NULL,
    id_servicio VARCHAR(10) NOT NULL,
    codigo_reserva VARCHAR(5),
    fecha_inicio DATE,
    fecha_fin DATE,
    demora_estimada VARCHAR(20),
    observaciones VARCHAR(255),

    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
    FOREIGN KEY (id_mecanico) REFERENCES mecanico(id_mecanico),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio),
    FOREIGN KEY (codigo_reserva) REFERENCES reservas(codigo_reserva)
);

(Con esto se puede saber, qué vehículo fue reparado, qué mecánico realizó el trabajo, qué servicio se efectuó, a qué reserva corresponde y cuándo comenzó y terminó la reparación.)

-- Tabla facturas
CREATE TABLE facturas (
    id_factura VARCHAR(6) PRIMARY KEY,
    monto_total FLOAT NOT NULL,
    fecha DATE NOT NULL
);

-- Tabla pagos     //Se agrego la relación entre pagos y facturas mediante una clave foránea. De esta manera queda indicado qué factura corresponde a cada pago.
CREATE TABLE pagos (
    id_pago INT PRIMARY KEY,
    metodo_pago VARCHAR(30) NOT NULL,
    tarjetas_admitidas VARCHAR(30) NULL,
	id_factura VARCHAR(6),
	FOREIGN KEY (id_factura) REFERENCES facturas(id_factura)
);
