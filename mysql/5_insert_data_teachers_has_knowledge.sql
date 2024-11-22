USE `magic_teachers_db`;
-- Insert relationships into the teachers_has_knowledge_branches table
INSERT INTO `teachers_has_knowledge_branches` (`teachers_id`, `knowledge_branches_id`) VALUES
-- Severus Snape teaches Defence Against the Dark Arts and Potions ...
 (4,1),
 (4,9),
-- Minerva McGonagall teaches ...
 (5,6),
 (5,7),
 (5,8);