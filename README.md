# Sistema de Base de Datos para Gestión de Proveedores (Hotel)

## Descripción
Este proyecto consiste en el **diseño e implementación de una base de datos relacional en MySQL** orientada a la gestión del módulo de **compras a proveedores** dentro de un hotel.

Incluye la estructura completa del sistema, junto con **lógica de negocio** implementada directamente en la base de datos mediante **procedimientos almacenados**, **triggers**, **vistas** y **consultas**.

> Este proyecto está enfocado en la **capa de datos** (no incluye frontend ni API).

---

## Objetivos
- Modelar correctamente un sistema real de compras.
- Garantizar integridad de datos mediante claves y restricciones.
- Automatizar procesos con lógica en base de datos.
- Optimizar consultas frecuentes mediante vistas.

---

## Estructura del Proyecto
```text
HotelDB/
│
├── Hotel.sql              # Script principal (estructura + datos)
├── Consultas.sql          # Consultas SQL relevantes
├── Vistas.sql             # Definición de vistas
├── Procedimientos.sql     # Stored Procedures
├── Triggers.sql           # Triggers
└── DiagramaER.mwb         # Modelo entidad-relación (MySQL Workbench)
```

---

## Modelo de Datos
El sistema incluye entidades clave como:
- Depósitos
- Productos
- Proveedores
- Cotizaciones
- Órdenes de compra
- Detalles de órdenes

Relaciones diseñadas para representar un flujo real de compras:

**Proveedor → Cotización → Orden de Compra → Detalle → Depósito**

---

## Funcionalidades Implementadas

### Procedimientos almacenados
- Gestión de órdenes de compra.
- Inserción controlada de datos.
- Automatización de procesos repetitivos.

### Triggers
- Validaciones automáticas.
- Control de integridad.
- Acciones ante inserciones/modificaciones.

### Vistas
- Simplificación de consultas complejas.
- Reportes listos para consumo.

### Consultas
- Ejemplos de uso del sistema.
- Reportes útiles para análisis.

---

## Cómo usar

1. Abrir **MySQL Workbench** (o cualquier cliente MySQL).
2. Ejecutar el script principal:
   ```sql
   SOURCE Hotel.sql;
   ```
3. Luego ejecutar opcionalmente:
   ```sql
   SOURCE Vistas.sql;
   SOURCE Procedimientos.sql;
   SOURCE Triggers.sql;
   SOURCE Consultas.sql;
   ```

---

## Tecnologías
- MySQL 8.x
- MySQL Workbench

---

## Nota
Este proyecto fue desarrollado con fines educativos, simulando un entorno real de gestión hotelera.