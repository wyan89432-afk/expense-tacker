import 'dotenv/config';
import { readFile } from 'node:fs/promises';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import pg from 'pg';

const { Pool } = pg;
const __dirname = dirname(fileURLToPath(import.meta.url));
const seedFile = resolve(__dirname, '../../database/seed/development.sql');

if (!process.env.DATABASE_URL) {
  throw new Error('DATABASE_URL is required.');
}

const pool = new Pool({ connectionString: process.env.DATABASE_URL });

try {
  const sql = await readFile(seedFile, 'utf8');
  await pool.query(sql);
  console.log('Development seed applied.');
} finally {
  await pool.end();
}
