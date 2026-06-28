import { Pool } from "pg"

// В проде (Neon/Vercel Postgres) подключение задаётся строкой DATABASE_URL с SSL,
// локально — отдельными переменными DB_*.
export const db = process.env.DATABASE_URL
  ? new Pool({
      connectionString: process.env.DATABASE_URL,
      ssl: { rejectUnauthorized: false },
    })
  : new Pool({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      port: process.env.DB_PORT ? Number(process.env.DB_PORT) : 5432,
    })
