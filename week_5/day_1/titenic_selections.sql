SELECT COUNT(*) FROM titanic;

SELECT SUM(survived) FROM titanic;

SELECT pclass FROM titanic GROUP BY pclass
ORDER BY COUNT(*) DESC LIMIT 1;