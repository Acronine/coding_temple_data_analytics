CREATE TABLE IF NOT EXISTS titanic(
    index SERIAL PRIMARY KEY,
    survived INTEGER,
    pclass INTEGER,
    name VARCHAR(150),
    sex VARCHAR(15),
    age INTEGER,
    siblings_spouses_aboard INTEGER,
    parents_children_aboard INTEGER,
    fare NUMERIC(4,2)
);