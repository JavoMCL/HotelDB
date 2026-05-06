
CREATE OR REPLACE VIEW vista_stocks AS
SELECT 
    s.id_producto,
    p.descripcion AS producto,
    d.nombre AS deposito,
    s.cantidad AS stock_actual,
    s.stock_minimo,
    CASE 
        WHEN s.cantidad <= s.stock_minimo THEN 'REPONER'
        WHEN s.cantidad <= s.stock_minimo * 1.5 THEN 'ALERTA'
        ELSE 'OK'
    END AS estado
FROM 
    stock s
JOIN producto p ON s.id_producto = p.id_producto
JOIN deposito d ON s.id_deposito = d.id_deposito;

-- PEDIDOS DE COMPRA


CREATE OR REPLACE VIEW vista_pedidos_pendientes AS
SELECT 
    pc.id_pedido,
    pc.fecha,
    pr.nombre AS proveedor,
    COUNT(dpc.id_producto) AS productos_solicitados
FROM 
    pedido_cotizacion pc
JOIN proveedor pr ON pc.id_proveedor = pr.id_proveedor
LEFT JOIN detalle_pedido_cotizacion dpc ON pc.id_pedido = dpc.id_pedido
LEFT JOIN orden_compra oc ON pc.id_pedido = oc.id_pedido
WHERE 
    oc.id_orden IS NULL
    AND pc.estado IN ('pendiente', 'cotizado')
GROUP BY 
    pc.id_pedido, pc.fecha, pr.nombre;



-- ORDENES DE COMPRA


CREATE OR REPLACE VIEW vista_ordenes_proveedores AS
SELECT 
    oc.id_orden,
    oc.fecha,
    p.nombre AS proveedor,
    oc.total,
    oc.saldo,
    (oc.total - oc.saldo) AS monto_pagado,
    CASE 
        WHEN oc.saldo = 0 THEN 'PAGADA'
        WHEN oc.saldo = oc.total THEN 'PENDIENTE'
        ELSE 'PARCIAL'
    END AS estado_pago
FROM 
    orden_compra oc
JOIN proveedor p ON oc.id_proveedor = p.id_proveedor;