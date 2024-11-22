-- Insert records into the students table
INSERT INTO `students` (`id`, `active`) 
SELECT id, 1
FROM `users`
WHERE id IN (
    SELECT id 
    FROM `users`
    WHERE username IN (
        'harry.potter',
        'hermione.granger'
    )
);
