CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    text TEXT,
    published_at TIMESTAMP,
    url VARCHAR(255) UNIQUE
);

CREATE TABLE chunks (
    id SERIAL PRIMARY KEY,
    news_id INTEGER REFERENCES news(id),
    chunk_index INTEGER,
    vectorising_text TEXT,
    embedding vector(768)
);
