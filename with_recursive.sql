WITH RECURSIVE categories_extend(id, title, path)
AS
(
SELECT id, title, CAST(title AS CHAR(145))
FROM categories
WHERE categories_id IS NULL
UNION ALL
SELECT c.id, c.title, CONCAT(ce.path, ".", c.title)
FROM categories_extend ce JOIN categories c ON ce.id = c.categories_id
)
SELECT * FROM categories_extend ORDER BY path;