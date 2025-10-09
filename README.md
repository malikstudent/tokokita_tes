# 🏪 Tokokita — Containerized E-Commerce API

Tokokita is a simple e-commerce backend built with Flask, PostgreSQL, and Nginx — fully Dockerized with CI/CD integration via GitHub Actions.

## 🔧 Features
- Modular Docker setup (web, db, nginx)
- CI/CD auto deploy (staging + production)
- PostgreSQL persistence with volume
- Environment-based configuration

## 🧠 Branch Strategy
- `feature/*` → development
- `staging` → testing environment
- `main` → production-ready

## 🧰 Commands
```bash
docker compose up -d --build
docker compose logs -f
