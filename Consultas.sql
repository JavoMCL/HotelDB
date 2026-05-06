-- Monto del importe total de pedidos de cotización en un rango de fechas (entre dos fechas), desplegar los atributos: fecha, código y nombre del proveedor, importe total de pedidos para esa fecha. (2).

SELECT 
    pc.fecha,
    pr.id_proveedor AS codigo_proveedor,
    pr.nombre AS nombre_proveedor,
    ROUND(SUM(dpc.precio_unitario * dpc.cantidad), 2) AS importe_total
FROM 
    pedido_cotizacion pc
JOIN 
    proveedor pr ON pc.id_proveedor = pr.id_proveedor
JOIN 
    detalle_pedido_cotizacion dpc ON pc.id_pedido = dpc.id_pedido
WHERE 
    pc.fecha BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY 
    pc.fecha, pr.id_proveedor, pr.nombre
ORDER BY 
    pc.fecha, pr.nombre;

-- Productos que cotizan proveedores, el criterio de recuperación es por rango de proveedores y rango de fechas, desplegar los siguientes atributos: Código y nombre del Proveedor, código y descripción del producto, ultimo precio cotizado. (1)

SELECT 
    p.id_proveedor AS codigo_proveedor,
    p.nombre AS nombre_proveedor,
    pr.id_producto AS codigo_producto,
    pr.descripcion AS descripcion_producto,
    dpc.precio_unitario AS ultimo_precio_cotizado
FROM 
    proveedor p
JOIN pedido_cotizacion pc ON pc.id_proveedor = p.id_proveedor
JOIN detalle_pedido_cotizacion dpc ON pc.id_pedido = dpc.id_pedido
JOIN producto pr ON pr.id_producto = dpc.id_producto
WHERE 
    p.id_proveedor BETWEEN 1 AND 3
    AND pc.fecha BETWEEN '2025-01-01' AND '2025-12-31'
    AND pc.fecha = (
        SELECT MAX(pc2.fecha)
        FROM pedido_cotizacion pc2
        JOIN detalle_pedido_cotizacion dpc2 ON pc2.id_pedido = dpc2.id_pedido
        WHERE pc2.id_proveedor = p.id_proveedor AND dpc2.id_producto = pr.id_producto
    )
ORDER BY 
    p.id_proveedor, pr.id_producto;


-- Ordenes de compra por rango de proveedores y fecha: Numero de orden de compra, fecha, código y nombre del proveedor, total de la orden de compra. (1)

SELECT 
    oc.id_orden AS numero_orden,
    oc.fecha,
    p.id_proveedor AS codigo_proveedor,
    p.nombre AS nombre_proveedor,
    oc.total
FROM 
    orden_compra oc
JOIN proveedor p ON oc.id_proveedor = p.id_proveedor
WHERE 
    p.id_proveedor BETWEEN 1 AND 3
    AND oc.fecha BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY 
    oc.fecha;

-- Productos que pueden solicitarse cotización a más de un proveedor por rango de proveedores, desplegar los atributos: Código y descripción del Producto, código y nombre del proveedor. (2)

SELECT 
    pr.id_producto,
    pr.descripcion,
    pv.id_proveedor,
    p.nombre AS nombre_proveedor
FROM 
    proveedor_tipo_producto pv
JOIN proveedor p ON pv.id_proveedor = p.id_proveedor
JOIN tipo_producto tp ON pv.id_tipo_producto = tp.id_tipo_producto
JOIN producto pr ON pr.id_tipo_producto = tp.id_tipo_producto
WHERE 
    pv.id_proveedor BETWEEN 1 AND 3
ORDER BY 
    pr.id_producto, pv.id_proveedor;

-- Informe de productos con stock igual o menor al minimo, desplegar los atributos: Codigo de producto, descripción del producto, cantidad del stock, cantidad del stock minimo. (2)

SELECT 
    pr.id_producto,
    pr.descripcion,
    s.cantidad AS stock_actual,
    s.stock_minimo
FROM 
    stock s
JOIN producto pr ON s.id_producto = pr.id_producto
WHERE 
    s.cantidad <= s.stock_minimo;

-- Ranking de productos (Productos con mayor cantidad de ordenes de compra). (2)

SELECT 
    p.id_producto,
    p.descripcion,
    COUNT(doc.id_producto) AS cantidad_ordenes
FROM 
    detalle_orden_compra doc
JOIN producto p ON doc.id_producto = p.id_producto
GROUP BY 
    p.id_producto, p.descripcion
ORDER BY 
    cantidad_ordenes DESC
LIMIT 10;

-- Ranking de proveedores (Proveedores a los que más se les ha realizado una orden de compra, por monto de la orden de compra). (2)

SELECT 
    p.id_proveedor,
    p.nombre,
    SUM(oc.total) AS total_ordenado
FROM 
    orden_compra oc
JOIN proveedor p ON oc.id_proveedor = p.id_proveedor
GROUP BY 
    p.id_proveedor, p.nombre
ORDER BY 
    total_ordenado DESC
LIMIT 10;

-- Productos que no tienen ordenes de compra por rango de fecha, desplegar los atributos: código y descripción del producto, ultima fecha de última orden de compra. 

SELECT 
    p.id_producto,
    p.descripcion,
    (
        SELECT MAX(oc.fecha)
        FROM detalle_orden_compra doc
        JOIN orden_compra oc ON doc.id_orden = oc.id_orden
        WHERE doc.id_producto = p.id_producto
    ) AS ultima_fecha_orden
FROM 
    producto p
WHERE 
    p.id_producto NOT IN (
        SELECT DISTINCT doc.id_producto
        FROM detalle_orden_compra doc
        JOIN orden_compra oc ON doc.id_orden = oc.id_orden
        WHERE oc.fecha BETWEEN '2025-01-01' AND '2025-12-31'
    );