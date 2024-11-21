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

-- Insert Rubeus Hagrid into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code`)
SELECT id, 
    'Keeper of Keys and Grounds at Hogwarts.',
    'Rubeus Hagrid is a half-giant known for his love of magical creatures. 
     As a teacher of Care of Magical Creatures, Hagrid combines hands-on learning 
     with his deep affection for the beings he teaches about. Though sometimes unorthodox, 
     he is fiercely loyal to his students and friends.',
    60,
    1,
    'Avenida de Santo Domingo de la Calzada, 1',
    'Madrid',
    '28050'
FROM users
WHERE username = 'rubeus.hagrid';

-- Insert Filius Flitwick into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code`)
SELECT id, 
    'Charms professor and Head of Ravenclaw House.',
    'Filius Flitwick is a master of charms and an accomplished duelist. 
     Known for his kind and cheerful demeanor, Flitwick has guided countless students 
     to mastery in spells. His small stature belies his immense magical abilities.',
    85,
    1,
    'Calle Mayor, 5',
    'Alcalá de Henares',
    '28801'
FROM users
WHERE username = 'filius.flitwick';

-- Insert Pomona Sprout into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code`)
SELECT id, 
    'Herbology professor and Head of Hufflepuff House.',
    'Pomona Sprout is an expert in magical plants and a caring educator. 
     She is passionate about teaching students the importance of Herbology 
     in magical practices and is always seen with dirt on her robes from her 
     extensive work in the Hogwarts greenhouses.',
    75,
    1,
    'Avenida de la Constitución, 10',
    'Móstoles',
    '28931'
FROM users
WHERE username = 'pomona.sprout';

-- Insert Remus Lupin into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code`)
SELECT id, 
    'Defence Against the Dark Arts professor and member of the Order of the Phoenix.',
    'Remus Lupin is a skilled wizard with a kind and empathetic nature. 
     Despite his condition as a werewolf, he dedicated his life to teaching and 
     fighting against the forces of darkness. His classes were practical, engaging, 
     and beloved by students.',
    90,
    1,
    'Calle Real, 15',
    'San Lorenzo de El Escorial',
    '28200'
FROM users
WHERE username = 'remus.lupin';

-- Insert Gilderoy Lockhart into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code`)
SELECT id, 
    'Famous author and former Defence Against the Dark Arts professor.',
    'Gilderoy Lockhart is a charming yet self-absorbed wizard known for his 
     books on magical creatures and encounters. Though his competence as a teacher 
     was questionable, his flamboyant personality and charisma made him a memorable figure.',
    100,
    1,
    'Plaza de la Villa, 2',
    'Aranjuez',
    '28300'
FROM users
WHERE username = 'gilderoy.lockhart';

-- Insert Dolores Umbridge into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code`)
SELECT id, 
    'Former Hogwarts High Inquisitor and teacher.',
    'Dolores Umbridge is a controversial figure known for her rigid adherence 
     to Ministry policies. Her tenure at Hogwarts was marked by strict rules 
     and punishments, though her magical competence in Dark Arts is notable. 
     She remains a polarizing character in the wizarding world.',
    70,
    1,
    'Avenida de la Constitución, 10',
    'Móstoles',
    '28931'
FROM users
WHERE username = 'dolores.umbridge';

-- Insert Sybill Trelawney into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code`)
SELECT id, 
    'Divination professor at Hogwarts.',
    'Sybill Trelawney is a seer who teaches Divination at Hogwarts. 
     Often eccentric and dramatic, she is known for her cryptic prophecies. 
     Though not always accurate, she has made a few genuine predictions 
     that were crucial to the wizarding world.',
    65,
    1,
    'Calle Mayor, 14',
    'Hondarribia',
    '20280'
FROM users
WHERE username = 'sybill.trelawney';

-- Insert Horace Slughorn into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code`)
SELECT id, 
    'Potions professor and founder of the Slug Club.',
    'Horace Slughorn is a brilliant potioneer and a master at identifying 
     talent among students. As a former head of Slytherin House, he is known for 
     his charm, networking skills, and his selective Slug Club gatherings.',
    90,
    1,
    'Avenida de Navarra, 3',
    'Zarautz',
    '20800'
FROM users
WHERE username = 'horace.slughorn';

-- Insert Alastor Moody into teachers
INSERT INTO `teachers` (`id`, `about_me`, `resume`, `price_hour`, `validated`, `adress`, `city`, `postal_code`)
SELECT id, 
    'Ex-Auror and Defence Against the Dark Arts professor.',
    'Alastor Moody, nicknamed "Mad-Eye," is a legendary Auror known for 
     his paranoia and battle scars. His expertise in combat and defensive 
     magic made him a formidable teacher and ally in the fight against Voldemort. 
     Despite his gruff demeanor, he has a strong sense of justice.',
    100,
    1,
    'Calle Nagusia, 22',
    'Lezo',
    '20100'
FROM users
WHERE username = 'alastor.moody';
