-- Insertar registros en la tabla teachers
USE `magic_teachers_db` ;

-- Insert Severus Snape into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code` )
SELECT id, 
    'Potions Master and former Head of Slytherin House.',
    'Severus Snape is a highly skilled wizard in Potions and Occlumency. 
     He served as Potions Master at Hogwarts for years and briefly held the 
     position of Defence Against the Dark Arts professor. Despite his stern demeanor, 
     Snape was instrumental in the fight against Voldemort and a deeply complex character.',
    95,
    1,
    'Calle de Serrano, 45',
    'Madrid',
    '28001'
FROM users
WHERE username = 'severus.snape';

-- Insert Minerva McGonagall into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code` )
SELECT id, 
    'Transfiguration professor and Head of Gryffindor House.',
    'Minerva McGonagall is a strict yet fair Transfiguration teacher and Head of Gryffindor House. 
     A highly skilled witch, she is known for her sharp intellect, no-nonsense demeanor, and 
     deep dedication to her students and Hogwarts. McGonagall played a crucial role in the 
     fight against Voldemort, exemplifying courage, wisdom, and leadership.',
    95,
    1,
    'Calle Mayor, 5',
    'Alcala de Henares',
    '28001'
FROM users
WHERE username = 'minerva.mcgonagall';
