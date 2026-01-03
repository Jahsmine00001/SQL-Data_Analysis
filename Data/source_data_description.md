# Source Data Description

## Data Source
The dataset used in this project represents structured business data sourced from a relational database.  
It simulates a typical transactional system containing sales, customer, and product information.

The data was used strictly for analytical purposes.

---

## Tables Overview

### 1. Customers Table
**Description:**  
Contains customer-level information used to identify and analyze customer behavior.

**Grain:**  
One row per customer.

**Key Columns:**
- `customer_id` — Unique identifier for each customer (Primary Key)
- `customer_name` — Customer name
- `gender` — Customer gender
- `country` — Customer location
- `created_date` — Date the customer was registered

---

### 2. Products Table
**Description:**  
Stores product attributes used for product-level analysis.

**Grain:**  
One row per product.

**Key Columns:**
- `product_id` — Unique product identifier (Primary Key)
- `product_name` — Product name
- `category` — Product category
- `subcategory` — Product subcategory
- `unit_price` — Product price

---

### 3. Sales / Transactions Table
**Description:**  
Captures individual sales transactions linking customers and products.

**Grain:**  
One row per transaction.

**Key Columns:**
- `transaction_id` — Unique transaction identifier (Primary Key)
- `customer_id` — Customer identifier (Foreign Key)
- `product_id` — Product identifier (Foreign Key)
- `order_date` — Date of transaction
- `quantity` — Units sold
- `sales_amount` — Total sales value

---

## Table Relationships
- `sales.customer_id` → `customers.customer_id`
- `sales.product_id` → `products.product_id`

These relationships enable customer-level and product-level analysis.

---

## Data Assumptions & Limitations
- The dataset represents historical transactional data only.
- No real-time updates were involved.
- Data quality issues (missing values, inconsistent categories) were addressed during analysis.
- Financial values are assumed to be in a single currency.

---

## Intended Use
This dataset was used to:
- Perform exploratory data analysis
- Answer business-focused analytical questions
- Demonstrate SQL querying and analytical skills
