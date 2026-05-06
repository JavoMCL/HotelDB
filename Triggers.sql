-- EN DETALLE_TRANSFERENCIA 

DELIMITER $$

CREATE TRIGGER tr_actualizar_stock_transferencia
AFTER INSERT ON detalle_transferencia
FOR EACH ROW
BEGIN
    DECLARE v_origen INT;
    DECLARE v_destino INT;
    DECLARE v_stock_actual INT;

    SELECT 
        t.id_deposito_origen,
        t.id_deposito_destino
    INTO 
        v_origen,
        v_destino
    FROM transferencia t
    WHERE t.id_transferencia = NEW.id_transferencia
    LIMIT 1;

    SELECT cantidad 
    INTO v_stock_actual
    FROM stock 
    WHERE id_producto = NEW.id_producto AND id_deposito = v_origen
    LIMIT 1;

    IF v_stock_actual IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = '❌ No existe stock para el producto en el depósito origen';
    END IF;

    IF v_stock_actual < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = '❌ Stock insuficiente en el depósito origen';
    END IF;

    UPDATE stock 
    SET cantidad = cantidad - NEW.cantidad
    WHERE id_producto = NEW.id_producto AND id_deposito = v_origen;

    INSERT INTO stock (id_producto, id_deposito, cantidad, stock_minimo)
    VALUES (NEW.id_producto, v_destino, NEW.cantidad, 0)
    ON DUPLICATE KEY UPDATE cantidad = cantidad + NEW.cantidad;
END$$

DELIMITER ;

-- EN DETALLE_PEDIDO_COTIZACION (INSERT, UPDATE, DELETE)


DELIMITER $$

CREATE TRIGGER trg_prevent_cotizacion_update
BEFORE UPDATE ON detalle_pedido_cotizacion
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM orden_compra
        WHERE id_pedido = OLD.id_pedido
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede modificar una cotización con orden de compra emitida.';
    END IF;
END$$

CREATE TRIGGER trg_prevent_cotizacion_delete
BEFORE DELETE ON detalle_pedido_cotizacion
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM orden_compra
        WHERE id_pedido = OLD.id_pedido
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar una cotización con orden de compra emitida.';
    END IF;
END$$

CREATE TRIGGER trg_prevent_cotizacion_insert
BEFORE INSERT ON detalle_pedido_cotizacion
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM orden_compra
        WHERE id_pedido = NEW.id_pedido
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede insertar en una cotización con orden de compra emitida.';
    END IF;
END$$

DELIMITER ;

-- EN ORDEN_COMPRA


DELIMITER $$

CREATE TRIGGER trg_cierre_cotizacion
AFTER INSERT ON orden_compra
FOR EACH ROW
BEGIN
    UPDATE pedido_cotizacion
    SET estado = 1
    WHERE id_pedido = NEW.id_pedido;
END$$

DELIMITER ;

-- EN STOCK

DELIMITER $$

CREATE TRIGGER tr_generar_pedido_cotizacion_bajo_stock
AFTER UPDATE ON stock
FOR EACH ROW
BEGIN
    DECLARE v_id_tipo_producto INT;
    DECLARE v_fecha_actual DATE;
    DECLARE v_id_proveedor INT;
    DECLARE v_id_pedido INT;
    DECLARE done INT DEFAULT 0;

    DECLARE cur_proveedores CURSOR FOR 
        SELECT ptp.id_proveedor
        FROM proveedor_tipo_producto ptp
        JOIN producto p ON p.id_tipo_producto = ptp.id_tipo_producto
        WHERE p.id_producto = NEW.id_producto
        LIMIT 3;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    IF NEW.cantidad <= NEW.stock_minimo THEN

        SET v_fecha_actual = CURDATE();

        SELECT id_tipo_producto 
        INTO v_id_tipo_producto
        FROM producto 
        WHERE id_producto = NEW.id_producto;

        OPEN cur_proveedores;

        proveedor_loop: LOOP
            FETCH cur_proveedores INTO v_id_proveedor;
            IF done THEN
                LEAVE proveedor_loop;
            END IF;

            SET v_id_pedido = NULL;

            SELECT id_pedido INTO v_id_pedido
            FROM pedido_cotizacion
            WHERE id_proveedor = v_id_proveedor AND fecha = v_fecha_actual
            LIMIT 1;
         
            IF v_id_pedido IS NULL THEN
                INSERT INTO pedido_cotizacion (fecha, id_proveedor, estado)
                VALUES (v_fecha_actual, v_id_proveedor, 'pendiente');
                SET v_id_pedido = LAST_INSERT_ID();
            END IF;

            IF NOT EXISTS (
                SELECT 1 
                FROM detalle_pedido_cotizacion 
                WHERE id_pedido = v_id_pedido AND id_producto = NEW.id_producto
            ) THEN
                INSERT INTO detalle_pedido_cotizacion (
                    id_pedido, id_producto, cantidad, paga_iva, porcentaje_iva, precio_unitario
                )
                SELECT 
                    v_id_pedido, NEW.id_producto, 1, p.paga_iva, p.porcentaje_iva, p.ultimo_costo_unitario
                FROM producto p
                WHERE p.id_producto = NEW.id_producto;
            END IF;

        END LOOP;

        CLOSE cur_proveedores;

    END IF;

END$$

DELIMITER ;

-- Evitar stock negativo 


DELIMITER $$

CREATE TRIGGER trg_evitar_stock_negativo
BEFORE UPDATE ON stock
FOR EACH ROW
BEGIN
    IF NEW.cantidad < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No se permite stock negativo';
    END IF;
END$$

DELIMITER ;

-- Set saldo default

DELIMITER $$

CREATE TRIGGER trg_set_saldo_default
BEFORE INSERT ON orden_compra
FOR EACH ROW
BEGIN
    IF NEW.saldo IS NULL THEN
        SET NEW.saldo = NEW.total;
    END IF;
END$$

DELIMITER ;