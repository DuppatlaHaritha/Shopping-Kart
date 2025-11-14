# Spring Boot E-commerce Backend (Pooja Essentials)

This repository contains a minimal, functional Spring Boot backend implementing:
- JWT-based authentication (admin & customers)
- Product, Category, Coupon management (CRUD for admin)
- Order placement and viewing
- Simple coupon application in orders
- Payment & WhatsApp integration stubs (instructions included)
- MySQL database configuration

> You asked to start step-by-step with Spring Boot alone — this archive contains the full backend source.
> After you review this backend, we can proceed to the Flutter UI which will call these APIs.

## Quick setup (Linux / macOS / WSL)
1. Install Java 17 and Maven.
2. Install MySQL and create a database:
   ```sql
   CREATE DATABASE ecommdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
3. Update `src/main/resources/application.properties` with your MySQL credentials and a JWT secret.
4. Build:
   ```bash
   mvn clean package
   ```
5. Run:
   ```bash
   java -jar target/springboot-ecomm-backend-1.0.0.jar
   ```
   The app runs on port 8080 by default.

## Database
Two SQL files are provided to bootstrap schema and sample data:
- `src/main/resources/schema.sql`
- `src/main/resources/data.sql`

When `spring.jpa.hibernate.ddl-auto=none` the schema.sql will **not** auto-run; you can import these manually or set ddl-auto to `create` for development.

## Important endpoints (examples)
- `POST /api/auth/register` - register user (customer)
- `POST /api/auth/login` - get JWT token
- `GET /api/products` - list public products
- `POST /api/admin/products` - create product (ADMIN role)
- `PUT /api/admin/products/{id}` - update product (ADMIN)
- `DELETE /api/admin/products/{id}` - delete product (ADMIN)
- `POST /api/orders` - place order (authenticated)
- `GET /api/admin/orders` - list orders (ADMIN)
- `POST /api/admin/coupons` - create coupon (ADMIN)
- `POST /api/whatsapp/send` - send WhatsApp message (stub; configure provider)

## Security
JWT with username/password and `ROLE_ADMIN` / `ROLE_USER`. Passwords are stored with BCrypt.

## WhatsApp & Payment
Integration code is provided as stubs. The README contains instructions to wire them with:
- Twilio WhatsApp API or WhatsApp Business API for messaging
- Razorpay / your preferred Indian payment gateway for payments

---

If you'd like, next step:
- I'll provide the Flutter frontend project and show how to call these APIs.
- Or I can add Dockerfile / docker-compose for MySQL + app.

