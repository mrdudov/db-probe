CREATE TABLE chess_game 
(
    white_player text,
    black_player text,
    moves text[],
    final_state text[][]
);

INSERT INTO chess_game
VALUES ('Caruana', 'Nakamura', '{"d4", "d5", "c4", "c6"}',
        '{{"Ra8", "Qe8", "x", "x","x","x","x","x"}, 
         {"a7", "x", "x", "x","x","x","x","x"}, 
         {"Kb5", "Bc5", "d5", "x","x","x","x","x"}}');

SELECT * FROM chess_game;

INSERT INTO chess_game
VALUES ('Caruana', 'Nakamura', ARRAY['d4', 'd5', 'c4', 'c6'],
        ARRAY[['Ra8', 'Qe8', 'x', 'x','x','x','x','x'], 
         ['a7', 'x', 'x', 'x','x','x','x','x'], 
         ['Kb5', 'Bc5', 'd5', 'x','x','x','x','x']]);

SELECT moves[2:3]
FROM chess_game;

SELECT moves[:3]
FROM chess_game;

SELECT moves[2:]
FROM chess_game;


SELECT array_dims(moves), array_length(moves, 1)
FROM chess_game;

SELECT array_dims(final_state), array_length(moves, 1)
FROM chess_game;

UPDATE chess_game
SET moves = ARRAY['e4', 'd3', 'd4', 'Kf6'];


UPDATE chess_game
SET moves[4] = 'g6';

SELECT *
FROM chess_game
WHERE 'g6' = ANY(moves);
