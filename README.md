# Expense Tracker

Production-ready foundation for a personal finance and small-business accounting web application.

## Phase 1

Phase 1 establishes a clean frontend/backend/database architecture without fake business features.

### Stack

- Frontend: React, TypeScript, Vite, Tailwind CSS, React Router
- Backend: Node.js, Express.js, TypeScript, PostgreSQL
- API: REST
- Authentication: JWT foundation
- Deployment target: GitHub Pages (frontend), Railway (backend + PostgreSQL)

## Project structure

```
frontend/
  src/
    components/
    pages/
    layouts/
    hooks/
    services/
    types/
    utils/
backend/
  src/
    controllers/
    routes/
    middleware/
    services/
    models/
    utils/
    config/
database/
.github/workflows/
```

## Install

### Frontend

```bash
cd frontend
npm install
```

### Backend

```bash
cd backend
npm install
```

Copy `.env.example` to `.env` inside `backend/` and configure PostgreSQL/JWT values.

## Run

### Frontend

```bash
cd frontend
npm run dev
```

### Backend

```bash
cd backend
npm run dev
```

The backend exposes a small health endpoint at `/api/health` only to verify the server is running. No fake finance functionality is implemented.

## Production builds

```bash
cd frontend && npm run build
cd backend && npm run build
```

## Phase 2

Phase 2 can add the real data layer and authentication: PostgreSQL migrations/schema, user registration/login, password hashing, JWT sessions, protected API routes, transaction CRUD, validation, and secure error handling.

## Environment

Never commit real secrets. Use `.env` locally and Railway environment variables in production. See `.env.example`.
