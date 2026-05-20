# Supplier Management Database System (Hotel)

> **Note:** This project is entirely in Spanish because it was developed as a university project. Database objects, table names, procedures, triggers, and queries are written in Spanish.

## Description

This project consists of the **design and implementation of a relational database in MySQL** focused on managing the **supplier purchasing module** within a hotel environment.

It includes the complete system structure along with **business logic** implemented directly in the database using **stored procedures**, **triggers**, **views**, and **SQL queries**.

> This project focuses exclusively on the **data layer** (no frontend or API included).

---

## Objectives

- Properly model a real-world purchasing system.
- Ensure data integrity through keys and constraints.
- Automate processes using database-level logic.
- Optimize common queries through views.

---

## Project Structure

```text
HotelDB/
│
├── Hotel.sql              # Main script (schema + sample data)
├── Consultas.sql          # Relevant SQL queries
├── Vistas.sql             # View definitions
├── Procedimientos.sql     # Stored Procedures
├── Triggers.sql           # Database Triggers
└── DiagramaER.mwb         # Entity-Relationship model (MySQL Workbench)
```

---

## Data Model

The system includes key entities such as:

- Warehouses
- Products
- Suppliers
- Quotations
- Purchase Orders
- Order Details

Relationships were designed to represent a real purchasing workflow:

```text
Supplier → Quotation → Purchase Order → Detail → Warehouse
```

---

## Implemented Features

### Stored Procedures

- Purchase order management
- Controlled data insertion
- Repetitive process automation

### Triggers

- Automatic validations
- Integrity control
- Actions on inserts and updates

### Views

- Simplification of complex queries
- Ready-to-use reports

### Queries

- System usage examples
- Useful reports for analysis

---

## How to Use

1. Open **MySQL Workbench** (or any MySQL client).
2. Run the main script:

```sql
SOURCE Hotel.sql;
```

3. Then optionally run:

```sql
SOURCE Vistas.sql;
SOURCE Procedimientos.sql;
SOURCE Triggers.sql;
SOURCE Consultas.sql;
```

---

## Technologies

- MySQL 8.x
- MySQL Workbench

---

## Notes

This project was developed for educational purposes, simulating a real hotel purchasing management environment.
