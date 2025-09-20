# ai-ragcrawler-prototype

## Workflows

1. [Single Newspage](./workflows/1-single-newspage/): The workflow only allow to define an URL to a single newspage and process it
2. [Overview Page](./workflows/2-overview-page/): The workflow allow to define an URL to an overview page to extract and process all linked newspages
3. [Search](./workflows/3-search/): The workflow to search for the 3 nearest news via searchText
4. [Chunking](./workflows/4-chunking/): Chunking each news into paragraphs and vectorise them

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
6. Open n8n in your browser via `http://localhost:5678/` and create account
7. Choose a workflow from [workflows](./workflows/) which you want to try out
    1. Execute the SQL from the `database.sql` in adminer
    2. Import the `.json` files into n8n
8. Run it :)

## n8n Learnings

* Save often... If the browser crashes, the changes are gone...
* Loop in loop doesn't work, the n8n way for this is to split the logic into different workflows
