-- Development-only seed. Never use this password in production.
-- Creates one local test user plus sample categories/settings.
CREATE EXTENSION IF NOT EXISTS pgcrypto;

DO $$
DECLARE
  dev_user_id UUID;
BEGIN
  SELECT id INTO dev_user_id
  FROM users
  WHERE LOWER(email) = 'dev@example.local'
  LIMIT 1;

  IF dev_user_id IS NULL THEN
    INSERT INTO users (name, email, password_hash)
    VALUES ('Development User', 'dev@example.local', crypt('dev-only-password', gen_salt('bf')))
    RETURNING id INTO dev_user_id;
  END IF;

  INSERT INTO categories (user_id, name, type)
  VALUES
    (dev_user_id, 'Salary', 'income'),
    (dev_user_id, 'Sales', 'income'),
    (dev_user_id, 'Food', 'expense'),
    (dev_user_id, 'Transport', 'expense')
  ON CONFLICT (user_id, name, type) DO NOTHING;

  INSERT INTO settings (user_id, default_currency, business_mode)
  VALUES (dev_user_id, 'MMK', FALSE)
  ON CONFLICT (user_id) DO NOTHING;
END $$;
