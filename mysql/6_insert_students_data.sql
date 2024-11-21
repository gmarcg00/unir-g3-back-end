-- Insert records into the students table
INSERT INTO `students` (`users_id`, `logical_deletion`) 
SELECT id, 0
FROM `users`
WHERE id IN (
    SELECT id 
    FROM `users`
    WHERE username IN (
        'harry.potter',
        'hermione.granger',
        'ron.weasley',
        'draco.malfoy',
        'luna.lovegood',
        'neville.longbottom',
        'ginny.weasley',
        'cedric.diggory',
        'cho.chang',
        'seamus.finnigan'
    )
);
