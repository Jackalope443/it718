-- 1. Create the Master Tables
CREATE TABLE races (id INT PRIMARY KEY, name VARCHAR(50));
CREATE TABLE classes (id INT PRIMARY KEY, name VARCHAR(50));
CREATE TABLE subclasses (id INT PRIMARY KEY, class_id INT, name VARCHAR(50));

-- 2. Create the Submission Table
CREATE TABLE character_submissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    race_id INT,
    class_id INT,
    subclass_id INT,
    FOREIGN KEY (race_id) REFERENCES races(id),
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (subclass_id) REFERENCES subclasses(id)
);

-- 3. Populate Races (Core PHB)
INSERT INTO races (id, name) VALUES 
(1, 'Dragonborn'), 
(2, 'Dwarf'), 
(3, 'Elf'), 
(4, 'Gnome'), 
(5, 'Half-Elf'), 
(6, 'Half-Orc'), 
(7, 'Halfling'), 
(8, 'Human'), 
(9, 'Tiefling'),
(10, 'Aarakocra'),
(11, 'Aasimar'),
(12, 'Changeling'),
(13, 'Deep Gnome'),
(14, 'Duergar'),
(15, 'Eladrin'),
(16, 'Fairy'),
(17, 'Firbolg'),
(18, 'Genasi (Air)'),
(19, 'Genasi (Earth)'),
(20, 'Genasi (Fire)'),
(21, 'Genasi (Water)'),
(22, 'Githyanki'),
(23, 'Githzerai'),
(24, 'Goliath'),
(25, 'Harengon'),
(26, 'Kenku'),
(27, 'Locathah'),
(28, 'Owlin'),
(29, 'Satyr'),
(30, 'Sea Elf'),
(31, 'Shadar-Kai'),
(32, 'Tabaxi'),
(33, 'Tortle'),
(34, 'Triton'),
(35, 'Verdan'),
(36, 'Bugbear'),
(37, 'Centaur'),
(38, 'Goblin'),
(39, 'Grung'),
(40, 'Hobgoblin'),
(41, 'Kobold'),
(42, 'Lizardfolk'),
(43, 'Minotaur'),
(44, 'Orc'),
(45, 'Shifter'),
(46, 'Yuan-Ti');


-- 4. Populate Classes
INSERT INTO classes (id, name) VALUES 
(1, 'Barbarian'), (2, 'Bard'), (3, 'Cleric'), (4, 'Druid'), 
(5, 'Fighter'), (6, 'Monk'), (7, 'Paladin'), (8, 'Ranger'), 
(9, 'Rogue'), (10, 'Sorcerer'), (11, 'Warlock'), (12, 'Wizard'),
(13, 'Artificer');

-- 5. Populate Subclasses
-- Barbarian (ID 1)
INSERT INTO subclasses (id, class_id, name) VALUES 
(1, 1, 'Path of the Ancestral Guardian'), (2, 1, 'Path of the Battlerager'), (3, 1, 'Path of the Beast'), 
(4, 1, 'Path of the Berserker'), (5, 1, 'Path of the Giant'), (6, 1, 'Path of the Storm Herald'), 
(7, 1, 'Path of the Totem Warrior'), (8, 1, 'Path of Wild Magic'), (9, 1, 'Path of the Zealot');

-- Bard (ID 2)
INSERT INTO subclasses (id, class_id, name) VALUES 
(10, 2, 'College of Creation'), (11, 2, 'College of Eloquence'), (12, 2, 'College of Glamour'), 
(13, 2, 'College of Lore'), (14, 2, 'College of Spirits'), (15, 2, 'College of Swords'), 
(16, 2, 'College of Valor'), (17, 2, 'College of Whispers');

-- Cleric (ID 3)
INSERT INTO subclasses (id, class_id, name) VALUES 
(18, 3, 'Arcana Domain'), (19, 3, 'Death Domain'), (20, 3, 'Forge Domain'), (21, 3, 'Grave Domain'), 
(22, 3, 'Knowledge Domain'), (23, 3, 'Life Domain'), (24, 3, 'Light Domain'), (25, 3, 'Nature Domain'), 
(26, 3, 'Order Domain'), (27, 3, 'Peace Domain'), (28, 3, 'Tempest Domain'), (29, 3, 'Trickery Domain'), 
(30, 3, 'Twilight Domain'), (31, 3, 'War Domain');

-- Druid (ID 4)
INSERT INTO subclasses (id, class_id, name) VALUES 
(32, 4, 'Circle of Dreams'), (33, 4, 'Circle of the Land'), (34, 4, 'Circle of the Moon'), 
(35, 4, 'Circle of the Shepherd'), (36, 4, 'Circle of Spores'), (37, 4, 'Circle of Stars'), 
(38, 4, 'Circle of Wildfire');

-- Fighter (ID 5)
INSERT INTO subclasses (id, class_id, name) VALUES 
(39, 5, 'Arcane Archer'), (40, 5, 'Battle Master'), (41, 5, 'Cavalier'), (42, 5, 'Champion'), 
(43, 5, 'Echo Knight'), (44, 5, 'Eldritch Knight'), (45, 5, 'Psi Warrior'), (46, 5, 'Rune Knight'), 
(47, 5, 'Samurai');

-- Monk (ID 6)
INSERT INTO subclasses (id, class_id, name) VALUES 
(48, 6, 'Way of the Ascendant Dragon'), (49, 6, 'Way of the Astral Self'), (50, 6, 'Way of the Drunken Master'), 
(51, 6, 'Way of the Four Elements'), (52, 6, 'Way of the Kensei'), (53, 6, 'Way of the Long Death'), 
(54, 6, 'Way of Mercy'), (55, 6, 'Way of the Open Hand'), (56, 6, 'Way of Shadow'), (57, 6, 'Way of the Sun Soul');

-- Paladin (ID 7)
INSERT INTO subclasses (id, class_id, name) VALUES 
(58, 7, 'Oath of the Ancients'), (59, 7, 'Oath of Conquest'), (60, 7, 'Oath of the Crown'), 
(61, 7, 'Oath of Devotion'), (62, 7, 'Oath of Glory'), (63, 7, 'Oath of Redemption'), 
(64, 7, 'Oath of Vengeance'), (65, 7, 'Oath of the Watchers'), (66, 7, 'Oathbreaker');

-- Ranger (ID 8)
INSERT INTO subclasses (id, class_id, name) VALUES 
(67, 8, 'Beast Master Conclave'), (68, 8, 'Drakewarden'), (69, 8, 'Fey Wanderer'), 
(70, 8, 'Gloom Stalker Conclave'), (71, 8, 'Horizon Walker Conclave'), (72, 8, 'Hunter Conclave'), 
(73, 8, 'Monster Slayer Conclave'), (74, 8, 'Swarmkeeper');

-- Rogue (ID 9)
INSERT INTO subclasses (id, class_id, name) VALUES 
(75, 9, 'Arcane Trickster'), (76, 9, 'Assassin'), (77, 9, 'Inquisitive'), (78, 9, 'Mastermind'), 
(79, 9, 'Phantom'), (80, 9, 'Scout'), (81, 9, 'Soulknife'), (82, 9, 'Swashbuckler'), (83, 9, 'Thief');

-- Sorcerer (ID 10)
INSERT INTO subclasses (id, class_id, name) VALUES 
(84, 10, 'Aberrant Mind'), (85, 10, 'Clockwork Soul'), (86, 10, 'Divine Soul'), 
(87, 10, 'Draconic Bloodline'), (88, 10, 'Lunar Sorcery'), (89, 10, 'Shadow Magic'), 
(90, 10, 'Storm Sorcery'), (91, 10, 'Wild Magic');

-- Warlock (ID 11)
INSERT INTO subclasses (id, class_id, name) VALUES 
(92, 11, 'The Archfey'), (93, 11, 'The Celestial'), (94, 11, 'The Fathomless'), 
(95, 11, 'The Fiend'), (96, 11, 'The Genie'), (97, 11, 'The Great Old One'), 
(98, 11, 'The Hexblade'), (99, 11, 'The Undead'), (100, 11, 'The Undying');

-- Wizard (ID 12)
INSERT INTO subclasses (id, class_id, name) VALUES 
(101, 12, 'Abjuration'), (102, 12, 'Bladesinging'), (103, 12, 'Chronurgy'), (104, 12, 'Conjuration'), 
(105, 12, 'Divination'), (106, 12, 'Enchantment'), (107, 12, 'Evocation'), (108, 12, 'Graviturgy'), 
(109, 12, 'Illusion'), (110, 12, 'Necromancy'), (111, 12, 'Order of Scribes'), 
(112, 12, 'Transmutation'), (113, 12, 'War Magic');

-- Artificer (ID 13)
INSERT INTO subclasses (id, class_id, name) VALUES 
(114, 13, 'Alchemist'), (115, 13, 'Armorer'), (116, 13, 'Artillerist'), (117, 13, 'Battle Smith');



INSERT INTO character_submissions (race_id, class_id, subclass_id) VALUES
-- High Density: Human Fighters (Champion)
(8, 5, 10), (8, 5, 10), (8, 5, 10), (8, 5, 11), (8, 5, 10), (8, 5, 40), (8, 5, 10),
-- High Density: Elf Wizards (Evocation)
(3, 12, 107), (3, 12, 107), (3, 12, 107), (3, 12, 105), (3, 12, 107), (3, 12, 102),
-- Medium Density: Tiefling Warlocks (Fiend/Hexblade)
(9, 11, 95), (9, 11, 98), (9, 11, 98), (9, 11, 95), (9, 11, 92),
-- Medium Density: Dwarf Clerics (Life)
(2, 3, 23), (2, 3, 23), (2, 3, 23), (2, 3, 31), (2, 3, 23),
-- Medium Density: Halfling Rogues (Thief/Assassin)
(7, 9, 83), (7, 9, 76), (7, 9, 83), (7, 9, 83), (7, 9, 75),
-- Exotic/Monstrous Variety (The "Wildcards")
(18, 1, 4), (21, 10, 87), (17, 7, 61), (13, 2, 13), (19, 13, 116), (15, 4, 34);

INSERT INTO character_submissions (race_id, class_id, subclass_id) SELECT race_id, class_id, subclass_id FROM character_submissions ORDER BY RAND() LIMIT 150;