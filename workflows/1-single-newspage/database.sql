CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    text TEXT,
    published_at TIMESTAMP,
    url VARCHAR(255) UNIQUE,
    embedding vector(768)
);
