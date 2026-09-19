# Database — Phase 2

PostgreSQL schema, migrations, and optional development seed data.

## Schema

- `users` — account identity and password hash
- `categories` — per-user income/expense categories
- `transactions` — per-user financial transactions
- `settings` — one settings row per user

### Data integrity

- IDs use PostgreSQL UUIDs generated with `gen_random_uuid()`.
- User-owned records cascade when a user is deleted.
- Transaction categories are constrained to the same user as the transaction at the database level.
- Category deletion sets only `category_id` to NULL on related transactions.
- Amounts use `NUMERIC(19,2)`; currency is stored separately as a 3-letter code.
- Transaction and category types are constrained to `income` or `expense`.
- Email uniqueness is case-insensitive.
- Settings are unique per user.
- All tables have `created_at` and `updated_at`; a trigger updates `updated_at` automatically.

## Migrations

From the `backend` directory:

```bash
npm install
npm run migrate
```

The migration runner records applied filenames in `schema_migrations` and applies pending SQL files in filename order.

## Optional development seed

After migrations:

```bash
npm run db:seed
```

This creates a development-only account:

- Email: `dev@example.local`
- Password: `dev-only-password`

**Never use these credentials in production.**

## Environment

Set `DATABASE_URL` through a local `.env` file or your deployment provider's environment variables. Database passwords and JWT secrets must never be committed to Git.
