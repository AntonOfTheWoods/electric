CREATE TABLE IF NOT EXISTS todos (
    id UUID PRIMARY KEY,
    title TEXT NOT NULL,
    generated_bug SMALLINT GENERATED ALWAYS AS (
        CASE
            WHEN title = 'bug' THEN 0
            WHEN title = 'another' THEN 1
            ELSE -1
        END
    ) STORED,
    completed BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL
);