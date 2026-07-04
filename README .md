# CLI Inventory Management System

A command-line inventory management system built with Python and MySQL, focused on backend logic, relational database design, and query operations.

## Features
- Add, update, view, and delete products
- Record product sales with automatic stock deduction
- Low-stock detection (flags products with stock below 10)
- Best-selling products report (top 3 by quantity sold)
- Input validation (prevents negative price/discount, handles invalid entries)
- Transaction safety with rollback on errors during sales

## Database Schema
The database (`inventory`) is relational, with 6 linked tables:

- **category** — product categories (e.g. Electronics, Clothing, Groceries)
- **brand** — brands linked to a category, with a contract status (`ACTIVE`, `WARNING`, `CANCELLED`)
- **product** — products linked to a brand, with stock, price, and discount
- **sales** — sales records linked to products, tracking quantity sold and discount applied
- **feedback** — customer feedback and ratings (1–5) linked to products
- **performance** — monthly performance metrics per product (total sales, revenue, performance score)

All foreign keys enforce relationships between tables (e.g. a product must belong to a valid brand, a sale must reference a valid product).

## Tech Stack
- Python
- MySQL (via `mysql-connector-python`)

## Setup
1. Install dependencies:
   ```
   pip install mysql-connector-python
   ```
2. Set the following environment variables (or update defaults in `main.py`):
   - `DB_HOST` (default: localhost)
   - `DB_USER` (default: root)
   - `DB_PASSWORD`
   - `DB_NAME` (default: inventory)
3. Create the database using the provided `inventory_database.sql` schema file:
   ```
   mysql -u root -p < inventory_database.sql
   ```
4. Run the app:
   ```
   python main.py
   ```

## What I'd Improve Next
- Move raw SQL queries into a dedicated data-access layer
- Add unit tests for CRUD operations
- Build out CLI features for the `feedback` and `performance` tables (currently only `product` and `sales` are used in the CLI)
- Replace print-based UI with a simple CLI menu library (e.g. `click` or `argparse`)

## Author
Alina Amjad
