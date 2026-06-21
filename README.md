# IMDb Data Analytics with SQL

This is my SQL project designed to analyze movies from the IMDb dataset. It demonstrates foundational and intermediate SQL concepts.

## Key Features & SQL Techniques Used
- **Window Functions:** Employed `ROW_NUMBER() OVER(PARTITION BY...)` to rank and extract the top-rated movie for each year.
- **Common Table Expressions (CTEs):** Used `WITH` clauses to organize complex queries and make the code modular.
- **Conditional Logic:** Applied `CASE WHEN` statements to segment movies into rating categories (`Efsanevi`, `Cox yaxsi`, etc.).
- **Subqueries & Aggregations:** Used subqueries to dynamically filter movies with above-average ratings.

## Project Structure
- `IMDB_ANALYTICS.sql`: The main script containing the analysis queries.

## Next Steps & Future Enhancements
- [ ] Connect Spotify dataset to analyze correlations between movie popularity and soundtrack streams.
- [ ] Implement advanced `JOIN` operations across multiple tables.
- [ ] Optimize queries by shifting filters into the CTE definitions.
