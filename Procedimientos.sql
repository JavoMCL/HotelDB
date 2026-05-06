-- Procedimiento 1

DELIMITER $$

CREATE PROCEDURE sp_gestion_proveedor (
    IN p_accion VARCHAR(20),
    IN p_id INT,
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(150),
    IN p_telefono VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_linea_credito DECIMAL(12,2)
)
BEGIN
    IF p_accion = 'alta' THEN
        INSERT INTO proveedor (nombre, direccion, telefono, email, linea_credito)
        VALUES (p_nombre, p_direccion, p_telefono, p_email, p_linea_credito);

    ELSEIF p_accion = 'baja' THEN
        DELETE FROM proveedor WHERE id_proveedor = p_id;

    ELSEIF p_accion = 'modificacion' THEN
        UPDATE proveedor
        SET nombre = p_nombre,
            direccion = p_direccion,
            telefono = p_telefono,
            email = p_email,
            linea_credito = p_linea_credito
        WHERE id_proveedor = p_id;
    END IF;
END$$

DELIMITER ;

-- Procedimiento 2
DELIMITER $$

CREATE PROCEDURE cargar_cotizacion_real (
    IN p_id_pedido INT,
    IN p_id_producto INT,
    IN p_precio_unitario DECIMAL(10,2)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM detalle_pedido_cotizacion
        WHERE id_pedido = p_id_pedido AND id_producto = p_id_producto
    ) THEN

        UPDATE detalle_pedido_cotizacion
        SET precio_unitario = p_precio_unitario
        WHERE id_pedido = p_id_pedido AND id_producto = p_id_producto;

        IF NOT EXISTS (
            SELECT 1
            FROM detalle_pedido_cotizacion
            WHERE id_pedido = p_id_pedido AND precio_unitario = 0
        ) THEN

            UPDATE pedido_cotizacion
            SET estado = 'cotizado'
            WHERE id_pedido = p_id_pedido;
        END IF;

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '❌ No existe ese producto en el pedido';
    END IF;
END$$

DELIMITER ;