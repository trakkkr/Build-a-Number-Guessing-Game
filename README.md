# Build-a-Number-Guessing-Game

```
-- CREATE DATABASE number_guess;

CREATE TABLE gamedata (
  gamedata_id SERIAL PRIMARY KEY,
  username VARCHAR(22) NOT NULL UNIQUE,
  games_played INT DEFAULT 0,
  best_game INT
);
```
