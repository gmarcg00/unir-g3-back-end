-- Insert relationships into the teachers_has_knowledge_branches table
INSERT INTO `teachers_has_knowledge_branches` (`teachers_id`, `knowledge_branches_id`) VALUES
-- Severus Snape teaches Potions and Defence Against the Dark Arts
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'severus.snape')),
 (SELECT id FROM knowledge_branches WHERE name = 'Potions')),
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'severus.snape')),
 (SELECT id FROM knowledge_branches WHERE name = 'Defence Against the Dark Arts')),

-- Rubeus Hagrid teaches Care of Magical Creatures
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'rubeus.hagrid')),
 (SELECT id FROM knowledge_branches WHERE name = 'Care of Magical Creatures')),

-- Filius Flitwick teaches Charms
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'filius.flitwick')),
 (SELECT id FROM knowledge_branches WHERE name = 'Charms')),

-- Pomona Sprout teaches Herbology
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'pomona.sprout')),
 (SELECT id FROM knowledge_branches WHERE name = 'Herbology')),

-- Remus Lupin teaches Defence Against the Dark Arts
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'remus.lupin')),
 (SELECT id FROM knowledge_branches WHERE name = 'Defence Against the Dark Arts')),

-- Gilderoy Lockhart teaches Defence Against the Dark Arts
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'gilderoy.lockhart')),
 (SELECT id FROM knowledge_branches WHERE name = 'Defence Against the Dark Arts')),

-- Dolores Umbridge teaches Dark Arts Enforcement
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'dolores.umbridge')),
 (SELECT id FROM knowledge_branches WHERE name = 'Dark Arts Enforcement')),

-- Sybill Trelawney teaches Divination
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'sybill.trelawney')),
 (SELECT id FROM knowledge_branches WHERE name = 'Divination')),

-- Horace Slughorn teaches Potions
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'horace.slughorn')),
 (SELECT id FROM knowledge_branches WHERE name = 'Potions')),

-- Alastor Moody teaches Auror Studies
((SELECT id FROM teachers WHERE users_id = (SELECT id FROM users WHERE username = 'alastor.moody')),
 (SELECT id FROM knowledge_branches WHERE name = 'Auror Studies'));
