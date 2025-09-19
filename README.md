# ai-ragcrawler-prototype

## Workflows

1. [Single Newspage](./workflows/1-single-newspage/): The workflow only allow to define an URL to a single newspage and process it
2. [Overview Page](./workflows/2-overview-page/): The workflow allow to define an URL to an overview page to extract and process all linked newspages
2. [Search](./workflows/3-search/): The workflow to search for the 3 nearest news via searchText

## Installation

1. Install [Docker Desktop](https://www.docker.com/) and start it
2. Run `docker compose up -d` to pull and start docker containers
3. Run `docker exec -it ollama ollama pull embeddinggemma` to pull embedding model
4. Open adminer in your browser via `http://localhost:8080/`, use these credentials:
    - Datenbank System: PostgreSQL
    - Server: postgres
    - Benutzer: n8n
    - Passwort: n8npassword
    - Datenbank: n8n
5. Enable vector extension via:
```sql
CREATE EXTENSION IF NOT EXISTS vector;
```
6. Create `news` table via:
```sql
CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    text TEXT,
    published_at TIMESTAMP,
    url VARCHAR(255) UNIQUE,
    embedding vector(768)
);
```
7. Open n8n in your browser via `http://localhost:5678/` and create account
8. Import one of the `n8n-workflow.json` from the [workflows](./workflows/)
9. Run it :)
