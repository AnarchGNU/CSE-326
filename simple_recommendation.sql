/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : movie_recommend

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-27 23:34:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `simple_recommendation`
-- ----------------------------
DROP TABLE IF EXISTS `simple_recommendation`;
CREATE TABLE `simple_recommendation` (
  `movie_id` int(13) NOT NULL,
  `title` varchar(255) NOT NULL,
  `score` float NOT NULL,
  `avg_rating_imdb` decimal(4,2) NOT NULL,
  `votes_count` int(13) NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of simple_recommendation
-- ----------------------------
INSERT INTO `simple_recommendation` VALUES ('11', 'Star Wars', '7.49522', '8.10', '6778');
INSERT INTO `simple_recommendation` VALUES ('12', 'Finding Nemo', '7.08941', '7.60', '6292');
INSERT INTO `simple_recommendation` VALUES ('13', 'Forrest Gump', '7.65421', '8.20', '8147');
INSERT INTO `simple_recommendation` VALUES ('14', 'American Beauty', '7.01368', '7.90', '3438');
INSERT INTO `simple_recommendation` VALUES ('18', 'The Fifth Element', '6.70249', '7.30', '3962');
INSERT INTO `simple_recommendation` VALUES ('22', 'Pirates of the Caribbean: The Curse of the Black Pearl', '7.06167', '7.50', '7191');
INSERT INTO `simple_recommendation` VALUES ('24', 'Kill Bill: Vol. 1', '7.0751', '7.70', '5091');
INSERT INTO `simple_recommendation` VALUES ('38', 'Eternal Sunshine of the Spotless Mind', '7.0614', '7.90', '3758');
INSERT INTO `simple_recommendation` VALUES ('58', 'Pirates of the Caribbean: Dead Man\'s Chest', '6.60113', '7.00', '5380');
INSERT INTO `simple_recommendation` VALUES ('62', '2001: A Space Odyssey', '6.95251', '7.90', '3075');
INSERT INTO `simple_recommendation` VALUES ('63', 'Twelve Monkeys', '6.56403', '7.40', '2470');
INSERT INTO `simple_recommendation` VALUES ('70', 'Million Dollar Baby', '6.7334', '7.70', '2519');
INSERT INTO `simple_recommendation` VALUES ('73', 'American History X', '7.13699', '8.20', '3120');
INSERT INTO `simple_recommendation` VALUES ('77', 'Memento', '7.24674', '8.10', '4168');
INSERT INTO `simple_recommendation` VALUES ('78', 'Blade Runner', '7.07185', '7.90', '3833');
INSERT INTO `simple_recommendation` VALUES ('85', 'Raiders of the Lost Ark', '6.95875', '7.70', '3949');
INSERT INTO `simple_recommendation` VALUES ('87', 'Indiana Jones and the Temple of Doom', '6.45615', '7.10', '2841');
INSERT INTO `simple_recommendation` VALUES ('89', 'Indiana Jones and the Last Crusade', '6.79934', '7.60', '3221');
INSERT INTO `simple_recommendation` VALUES ('98', 'Gladiator', '7.25702', '7.90', '5566');
INSERT INTO `simple_recommendation` VALUES ('101', 'Leon: The Professional', '7.32948', '8.20', '4293');
INSERT INTO `simple_recommendation` VALUES ('103', 'Taxi Driver', '6.97465', '8.10', '2632');
INSERT INTO `simple_recommendation` VALUES ('105', 'Back to the Future', '7.38246', '8.00', '6239');
INSERT INTO `simple_recommendation` VALUES ('107', 'Snatch', '6.81505', '7.70', '2953');
INSERT INTO `simple_recommendation` VALUES ('111', 'Scarface', '6.99994', '8.00', '3017');
INSERT INTO `simple_recommendation` VALUES ('115', 'The Big Lebowski', '6.88111', '7.80', '3001');
INSERT INTO `simple_recommendation` VALUES ('120', 'The Lord of the Rings: The Fellowship of the Ring', '7.53036', '8.00', '8892');
INSERT INTO `simple_recommendation` VALUES ('121', 'The Lord of the Rings: The Two Towers', '7.47057', '8.00', '7641');
INSERT INTO `simple_recommendation` VALUES ('122', 'The Lord of the Rings: The Return of the King', '7.57934', '8.10', '8226');
INSERT INTO `simple_recommendation` VALUES ('129', 'Spirited Away', '7.34799', '8.30', '3968');
INSERT INTO `simple_recommendation` VALUES ('137', 'Groundhog Day', '6.54342', '7.40', '2358');
INSERT INTO `simple_recommendation` VALUES ('141', 'Donnie Darko', '6.91048', '7.70', '3574');
INSERT INTO `simple_recommendation` VALUES ('155', 'The Dark Knight', '7.89475', '8.30', '12269');
INSERT INTO `simple_recommendation` VALUES ('161', 'Ocean\'s Eleven', '6.62827', '7.20', '3857');
INSERT INTO `simple_recommendation` VALUES ('162', 'Edward Scissorhands', '6.8053', '7.50', '3731');
INSERT INTO `simple_recommendation` VALUES ('165', 'Back to the Future Part II', '6.76322', '7.40', '3926');
INSERT INTO `simple_recommendation` VALUES ('185', 'A Clockwork Orange', '7.07383', '8.00', '3432');
INSERT INTO `simple_recommendation` VALUES ('187', 'Sin City', '6.50072', '7.20', '2755');
INSERT INTO `simple_recommendation` VALUES ('194', 'Amélie', '6.94722', '7.80', '3403');
INSERT INTO `simple_recommendation` VALUES ('196', 'Back to the Future Part III', '6.47324', '7.10', '2978');
INSERT INTO `simple_recommendation` VALUES ('197', 'Braveheart', '6.88647', '7.70', '3404');
INSERT INTO `simple_recommendation` VALUES ('207', 'Dead Poets Society', '7.00951', '8.10', '2786');
INSERT INTO `simple_recommendation` VALUES ('218', 'The Terminator', '6.79131', '7.40', '4208');
INSERT INTO `simple_recommendation` VALUES ('238', 'The Godfather', '7.73321', '8.50', '6024');
INSERT INTO `simple_recommendation` VALUES ('240', 'The Godfather: Part II', '7.25454', '8.30', '3418');
INSERT INTO `simple_recommendation` VALUES ('272', 'Batman Begins', '7.07614', '7.50', '7511');
INSERT INTO `simple_recommendation` VALUES ('274', 'The Silence of the Lambs', '7.29502', '8.10', '4549');
INSERT INTO `simple_recommendation` VALUES ('278', 'The Shawshank Redemption', '7.90297', '8.50', '8358');
INSERT INTO `simple_recommendation` VALUES ('280', 'Terminator 2: Judgment Day', '6.99605', '7.70', '4274');
INSERT INTO `simple_recommendation` VALUES ('285', 'Pirates of the Caribbean: At World\'s End', '6.48911', '6.90', '4627');
INSERT INTO `simple_recommendation` VALUES ('329', 'Jurassic Park', '6.99388', '7.60', '4956');
INSERT INTO `simple_recommendation` VALUES ('348', 'Alien', '7.16156', '7.90', '4564');
INSERT INTO `simple_recommendation` VALUES ('350', 'The Devil Wears Prada', '6.43944', '7.00', '3198');
INSERT INTO `simple_recommendation` VALUES ('393', 'Kill Bill: Vol. 2', '6.97204', '7.70', '4061');
INSERT INTO `simple_recommendation` VALUES ('424', 'Schindler\'s List', '7.41529', '8.30', '4436');
INSERT INTO `simple_recommendation` VALUES ('425', 'Ice Age', '6.57289', '7.10', '3954');
INSERT INTO `simple_recommendation` VALUES ('429', 'The Good, the Bad and the Ugly', '6.91018', '8.10', '2371');
INSERT INTO `simple_recommendation` VALUES ('453', 'A Beautiful Mind', '6.83755', '7.70', '3087');
INSERT INTO `simple_recommendation` VALUES ('489', 'Good Will Hunting', '6.91603', '7.90', '2880');
INSERT INTO `simple_recommendation` VALUES ('497', 'The Green Mile', '7.31207', '8.20', '4166');
INSERT INTO `simple_recommendation` VALUES ('500', 'Reservoir Dogs', '7.19744', '8.10', '3821');
INSERT INTO `simple_recommendation` VALUES ('510', 'One Flew Over the Cuckoo\'s Nest', '7.17047', '8.30', '3001');
INSERT INTO `simple_recommendation` VALUES ('539', 'Psycho', '7.02379', '8.30', '2405');
INSERT INTO `simple_recommendation` VALUES ('550', 'Fight Club', '7.80623', '8.30', '9678');
INSERT INTO `simple_recommendation` VALUES ('557', 'Spider-Man', '6.4597', '6.80', '5398');
INSERT INTO `simple_recommendation` VALUES ('562', 'Die Hard', '6.83605', '7.50', '4005');
INSERT INTO `simple_recommendation` VALUES ('578', 'Jaws', '6.64608', '7.50', '2628');
INSERT INTO `simple_recommendation` VALUES ('585', 'Monsters, Inc.', '7.00692', '7.50', '6150');
INSERT INTO `simple_recommendation` VALUES ('597', 'Titanic', '7.08716', '7.50', '7770');
INSERT INTO `simple_recommendation` VALUES ('600', 'Full Metal Jacket', '6.85735', '7.90', '2595');
INSERT INTO `simple_recommendation` VALUES ('601', 'E.T. the Extra-Terrestrial', '6.6375', '7.30', '3359');
INSERT INTO `simple_recommendation` VALUES ('603', 'The Matrix', '7.45756', '7.90', '9079');
INSERT INTO `simple_recommendation` VALUES ('607', 'Men in Black', '6.48262', '6.90', '4521');
INSERT INTO `simple_recommendation` VALUES ('620', 'Ghostbusters', '6.5043', '7.30', '2431');
INSERT INTO `simple_recommendation` VALUES ('627', 'Trainspotting', '6.83183', '7.80', '2737');
INSERT INTO `simple_recommendation` VALUES ('629', 'The Usual Suspects', '7.1178', '8.10', '3334');
INSERT INTO `simple_recommendation` VALUES ('637', 'Life Is Beautiful', '7.2949', '8.30', '3643');
INSERT INTO `simple_recommendation` VALUES ('640', 'Catch Me If You Can', '6.95486', '7.70', '3917');
INSERT INTO `simple_recommendation` VALUES ('641', 'Requiem for a Dream', '6.84186', '7.90', '2525');
INSERT INTO `simple_recommendation` VALUES ('671', 'Harry Potter and the Philosopher\'s Stone', '7.06153', '7.50', '7188');
INSERT INTO `simple_recommendation` VALUES ('672', 'Harry Potter and the Chamber of Secrets', '6.9226', '7.40', '5966');
INSERT INTO `simple_recommendation` VALUES ('673', 'Harry Potter and the Prisoner of Azkaban', '7.147', '7.70', '6037');
INSERT INTO `simple_recommendation` VALUES ('674', 'Harry Potter and the Goblet of Fire', '6.98259', '7.50', '5758');
INSERT INTO `simple_recommendation` VALUES ('675', 'Harry Potter and the Order of the Phoenix', '6.90226', '7.40', '5633');
INSERT INTO `simple_recommendation` VALUES ('679', 'Aliens', '6.86831', '7.70', '3282');
INSERT INTO `simple_recommendation` VALUES ('680', 'Pulp Fiction', '7.76038', '8.30', '8670');
INSERT INTO `simple_recommendation` VALUES ('694', 'The Shining', '7.2077', '8.10', '3890');
INSERT INTO `simple_recommendation` VALUES ('745', 'The Sixth Sense', '6.85924', '7.70', '3223');
INSERT INTO `simple_recommendation` VALUES ('747', 'Shaun of the Dead', '6.6188', '7.50', '2479');
INSERT INTO `simple_recommendation` VALUES ('752', 'V for Vendetta', '7.0261', '7.70', '4562');
INSERT INTO `simple_recommendation` VALUES ('767', 'Harry Potter and the Half-Blood Prince', '6.88933', '7.40', '5435');
INSERT INTO `simple_recommendation` VALUES ('769', 'GoodFellas', '7.15492', '8.20', '3211');
INSERT INTO `simple_recommendation` VALUES ('807', 'Se7en', '7.43078', '8.10', '5915');
INSERT INTO `simple_recommendation` VALUES ('808', 'Shrek', '6.72323', '7.30', '4183');
INSERT INTO `simple_recommendation` VALUES ('812', 'Aladdin', '6.7149', '7.40', '3495');
INSERT INTO `simple_recommendation` VALUES ('857', 'Saving Private Ryan', '7.22037', '7.90', '5148');
INSERT INTO `simple_recommendation` VALUES ('862', 'Toy Story', '7.10174', '7.70', '5415');
INSERT INTO `simple_recommendation` VALUES ('863', 'Toy Story 2', '6.69779', '7.30', '3914');
INSERT INTO `simple_recommendation` VALUES ('1124', 'The Prestige', '7.22297', '8.00', '4510');
INSERT INTO `simple_recommendation` VALUES ('1271', '300', '6.58535', '7.00', '5092');
INSERT INTO `simple_recommendation` VALUES ('1372', 'Blood Diamond', '6.54077', '7.40', '2344');
INSERT INTO `simple_recommendation` VALUES ('1402', 'The Pursuit of Happyness', '6.75115', '7.70', '2607');
INSERT INTO `simple_recommendation` VALUES ('1417', 'Pan\'s Labyrinth', '6.7844', '7.60', '3122');
INSERT INTO `simple_recommendation` VALUES ('1422', 'The Departed', '7.14943', '7.90', '4455');
INSERT INTO `simple_recommendation` VALUES ('1726', 'Iron Man', '7.05057', '7.40', '8951');
INSERT INTO `simple_recommendation` VALUES ('1891', 'The Empire Strikes Back', '7.51087', '8.20', '5998');
INSERT INTO `simple_recommendation` VALUES ('1892', 'Return of the Jedi', '7.18271', '7.90', '4763');
INSERT INTO `simple_recommendation` VALUES ('1895', 'Star Wars: Episode III - Revenge of the Sith', '6.5932', '7.10', '4200');
INSERT INTO `simple_recommendation` VALUES ('2062', 'Ratatouille', '6.88613', '7.50', '4510');
INSERT INTO `simple_recommendation` VALUES ('2108', 'The Breakfast Club', '6.71052', '7.80', '2189');
INSERT INTO `simple_recommendation` VALUES ('2501', 'The Bourne Identity', '6.66946', '7.30', '3640');
INSERT INTO `simple_recommendation` VALUES ('2502', 'The Bourne Supremacy', '6.51703', '7.20', '2873');
INSERT INTO `simple_recommendation` VALUES ('2503', 'The Bourne Ultimatum', '6.58305', '7.30', '2938');
INSERT INTO `simple_recommendation` VALUES ('4638', 'Hot Fuzz', '6.52295', '7.40', '2252');
INSERT INTO `simple_recommendation` VALUES ('4922', 'The Curious Case of Benjamin Button', '6.64213', '7.30', '3398');
INSERT INTO `simple_recommendation` VALUES ('5915', 'Into the Wild', '6.90493', '7.80', '3139');
INSERT INTO `simple_recommendation` VALUES ('6479', 'I Am Legend', '6.50919', '6.90', '4977');
INSERT INTO `simple_recommendation` VALUES ('6977', 'No Country for Old Men', '6.83689', '7.70', '3083');
INSERT INTO `simple_recommendation` VALUES ('8358', 'Cast Away', '6.75125', '7.50', '3304');
INSERT INTO `simple_recommendation` VALUES ('8587', 'The Lion King', '7.32483', '8.00', '5520');
INSERT INTO `simple_recommendation` VALUES ('8681', 'Taken', '6.6789', '7.20', '4444');
INSERT INTO `simple_recommendation` VALUES ('9806', 'The Incredibles', '6.87942', '7.40', '5290');
INSERT INTO `simple_recommendation` VALUES ('10020', 'Beauty and the Beast', '6.71176', '7.50', '3029');
INSERT INTO `simple_recommendation` VALUES ('10191', 'How to Train Your Dragon', '6.8681', '7.50', '4319');
INSERT INTO `simple_recommendation` VALUES ('10193', 'Toy Story 3', '6.97225', '7.60', '4710');
INSERT INTO `simple_recommendation` VALUES ('10528', 'Sherlock Holmes', '6.626', '7.00', '5883');
INSERT INTO `simple_recommendation` VALUES ('10681', 'WALL·E', '7.24745', '7.80', '6439');
INSERT INTO `simple_recommendation` VALUES ('11036', 'The Notebook', '6.8498', '7.70', '3163');
INSERT INTO `simple_recommendation` VALUES ('11324', 'Shutter Island', '7.25503', '7.80', '6559');
INSERT INTO `simple_recommendation` VALUES ('12405', 'Slumdog Millionaire', '6.7518', '7.60', '2918');
INSERT INTO `simple_recommendation` VALUES ('12444', 'Harry Potter and the Deathly Hallows: Part 1', '6.97931', '7.50', '5708');
INSERT INTO `simple_recommendation` VALUES ('12445', 'Harry Potter and the Deathly Hallows: Part 2', '7.30143', '7.90', '6141');
INSERT INTO `simple_recommendation` VALUES ('13223', 'Gran Torino', '6.91194', '7.80', '3181');
INSERT INTO `simple_recommendation` VALUES ('13475', 'Star Trek', '6.82427', '7.40', '4574');
INSERT INTO `simple_recommendation` VALUES ('14160', 'Up', '7.28389', '7.80', '7048');
INSERT INTO `simple_recommendation` VALUES ('16869', 'Inglourious Basterds', '7.33257', '7.90', '6598');
INSERT INTO `simple_recommendation` VALUES ('17654', 'District 9', '6.64831', '7.30', '3451');
INSERT INTO `simple_recommendation` VALUES ('18785', 'The Hangover', '6.79403', '7.20', '6324');
INSERT INTO `simple_recommendation` VALUES ('19908', 'Zombieland', '6.60849', '7.20', '3655');
INSERT INTO `simple_recommendation` VALUES ('19913', '(500) Days of Summer', '6.53286', '7.20', '2993');
INSERT INTO `simple_recommendation` VALUES ('19995', 'Avatar', '6.95842', '7.20', '12114');
INSERT INTO `simple_recommendation` VALUES ('20352', 'Despicable Me', '6.73145', '7.10', '6595');
INSERT INTO `simple_recommendation` VALUES ('23483', 'Kick-Ass', '6.63319', '7.10', '4747');
INSERT INTO `simple_recommendation` VALUES ('24428', 'The Avengers', '7.12568', '7.40', '12000');
INSERT INTO `simple_recommendation` VALUES ('27205', 'Inception', '7.76663', '8.10', '14075');
INSERT INTO `simple_recommendation` VALUES ('36557', 'Casino Royale', '6.69936', '7.30', '3930');
INSERT INTO `simple_recommendation` VALUES ('37165', 'The Truman Show', '7.10808', '7.80', '4702');
INSERT INTO `simple_recommendation` VALUES ('37724', 'Skyfall', '6.61737', '6.90', '7718');
INSERT INTO `simple_recommendation` VALUES ('37799', 'The Social Network', '6.52999', '7.10', '3492');
INSERT INTO `simple_recommendation` VALUES ('38757', 'Tangled', '6.7056', '7.40', '3419');
INSERT INTO `simple_recommendation` VALUES ('44214', 'Black Swan', '6.75563', '7.30', '4562');
INSERT INTO `simple_recommendation` VALUES ('45269', 'The King\'s Speech', '6.73467', '7.60', '2817');
INSERT INTO `simple_recommendation` VALUES ('45612', 'Source Code', '6.44455', '7.10', '2752');
INSERT INTO `simple_recommendation` VALUES ('49026', 'The Dark Knight Rises', '7.22192', '7.60', '9263');
INSERT INTO `simple_recommendation` VALUES ('49047', 'Gravity', '6.84454', '7.30', '5879');
INSERT INTO `simple_recommendation` VALUES ('49051', 'The Hobbit: An Unexpected Journey', '6.71566', '7.00', '8427');
INSERT INTO `simple_recommendation` VALUES ('49538', 'X-Men: First Class', '6.66489', '7.10', '5252');
INSERT INTO `simple_recommendation` VALUES ('51876', 'Limitless', '6.56716', '7.10', '3888');
INSERT INTO `simple_recommendation` VALUES ('54138', 'Star Trek Into Darkness', '6.81606', '7.40', '4479');
INSERT INTO `simple_recommendation` VALUES ('57158', 'The Hobbit: The Desolation of Smaug', '6.96516', '7.60', '4633');
INSERT INTO `simple_recommendation` VALUES ('58574', 'Sherlock Holmes: A Game of Shadows', '6.50984', '7.00', '3971');
INSERT INTO `simple_recommendation` VALUES ('61791', 'Rise of the Planet of the Apes', '6.54536', '7.00', '4452');
INSERT INTO `simple_recommendation` VALUES ('62211', 'Monsters University', '6.48037', '7.00', '3622');
INSERT INTO `simple_recommendation` VALUES ('64682', 'The Great Gatsby', '6.69491', '7.30', '3885');
INSERT INTO `simple_recommendation` VALUES ('64690', 'Drive', '6.75327', '7.40', '3832');
INSERT INTO `simple_recommendation` VALUES ('65754', 'The Girl with the Dragon Tattoo', '6.45933', '7.20', '2479');
INSERT INTO `simple_recommendation` VALUES ('68718', 'Django Unchained', '7.41824', '7.80', '10297');
INSERT INTO `simple_recommendation` VALUES ('68721', 'Iron Man 3', '6.56828', '6.80', '8951');
INSERT INTO `simple_recommendation` VALUES ('68734', 'Argo', '6.52808', '7.10', '3473');
INSERT INTO `simple_recommendation` VALUES ('70160', 'The Hunger Games', '6.66319', '6.90', '9634');
INSERT INTO `simple_recommendation` VALUES ('75656', 'Now You See Me', '6.83033', '7.30', '5635');
INSERT INTO `simple_recommendation` VALUES ('76203', '12 Years a Slave', '7.06547', '7.90', '3787');
INSERT INTO `simple_recommendation` VALUES ('76338', 'Thor: The Dark World', '6.43439', '6.80', '4873');
INSERT INTO `simple_recommendation` VALUES ('76341', 'Mad Max: Fury Road', '6.98911', '7.30', '9629');
INSERT INTO `simple_recommendation` VALUES ('77338', 'The Intouchables', '7.45752', '8.20', '5410');
INSERT INTO `simple_recommendation` VALUES ('82690', 'Wreck-It Ralph', '6.62698', '7.10', '4656');
INSERT INTO `simple_recommendation` VALUES ('82693', 'Silver Linings Playbook', '6.57047', '7.00', '4840');
INSERT INTO `simple_recommendation` VALUES ('82702', 'How to Train Your Dragon 2', '6.79066', '7.60', '3163');
INSERT INTO `simple_recommendation` VALUES ('84892', 'The Perks of Being a Wallflower', '6.83244', '7.70', '3056');
INSERT INTO `simple_recommendation` VALUES ('87827', 'Life of Pi', '6.77338', '7.20', '5912');
INSERT INTO `simple_recommendation` VALUES ('93456', 'Despicable Me 2', '6.56358', '7.00', '4729');
INSERT INTO `simple_recommendation` VALUES ('96721', 'Rush', '6.68845', '7.70', '2310');
INSERT INTO `simple_recommendation` VALUES ('99861', 'Avengers: Age of Ultron', '6.89608', '7.30', '6908');
INSERT INTO `simple_recommendation` VALUES ('100402', 'Captain America: The Winter Soldier', '7.06339', '7.60', '5881');
INSERT INTO `simple_recommendation` VALUES ('101299', 'The Hunger Games: Catching Fire', '6.95986', '7.40', '6656');
INSERT INTO `simple_recommendation` VALUES ('102651', 'Maleficent', '6.55574', '7.00', '4607');
INSERT INTO `simple_recommendation` VALUES ('102899', 'Ant-Man', '6.63265', '7.00', '6029');
INSERT INTO `simple_recommendation` VALUES ('106646', 'The Wolf of Wall Street', '7.34335', '7.90', '6768');
INSERT INTO `simple_recommendation` VALUES ('109424', 'Captain Phillips', '6.67513', '7.60', '2495');
INSERT INTO `simple_recommendation` VALUES ('109445', 'Frozen', '6.81831', '7.30', '5440');
INSERT INTO `simple_recommendation` VALUES ('114150', 'Pitch Perfect', '6.48288', '7.30', '2310');
INSERT INTO `simple_recommendation` VALUES ('116745', 'The Secret Life of Walter Mitty', '6.441', '7.00', '3213');
INSERT INTO `simple_recommendation` VALUES ('118340', 'Guardians of the Galaxy', '7.49147', '7.90', '10014');
INSERT INTO `simple_recommendation` VALUES ('119450', 'Dawn of the Planet of the Apes', '6.75148', '7.30', '4511');
INSERT INTO `simple_recommendation` VALUES ('120467', 'The Grand Budapest Hotel', '7.23821', '8.00', '4644');
INSERT INTO `simple_recommendation` VALUES ('122917', 'The Hobbit: The Battle of the Five Armies', '6.64224', '7.10', '4884');
INSERT INTO `simple_recommendation` VALUES ('127585', 'X-Men: Days of Future Past', '7.00722', '7.50', '6155');
INSERT INTO `simple_recommendation` VALUES ('137106', 'The Lego Movie', '6.7263', '7.50', '3127');
INSERT INTO `simple_recommendation` VALUES ('137113', 'Edge of Tomorrow', '6.99583', '7.60', '4979');
INSERT INTO `simple_recommendation` VALUES ('138843', 'The Conjuring', '6.67318', '7.40', '3169');
INSERT INTO `simple_recommendation` VALUES ('140607', 'Star Wars: The Force Awakens', '7.09621', '7.50', '7993');
INSERT INTO `simple_recommendation` VALUES ('146233', 'Prisoners', '6.97157', '7.90', '3183');
INSERT INTO `simple_recommendation` VALUES ('150540', 'Inside Out', '7.34141', '7.90', '6737');
INSERT INTO `simple_recommendation` VALUES ('152532', 'Dallas Buyers Club', '6.93377', '7.90', '2973');
INSERT INTO `simple_recommendation` VALUES ('152601', 'Her', '7.12129', '7.90', '4215');
INSERT INTO `simple_recommendation` VALUES ('156022', 'The Equalizer', '6.47554', '7.10', '2997');
INSERT INTO `simple_recommendation` VALUES ('157336', 'Interstellar', '7.69463', '8.10', '11187');
INSERT INTO `simple_recommendation` VALUES ('157350', 'Divergent', '6.49837', '6.90', '4784');
INSERT INTO `simple_recommendation` VALUES ('168259', 'Furious 7', '6.7295', '7.30', '4253');
INSERT INTO `simple_recommendation` VALUES ('177572', 'Big Hero 6', '7.23766', '7.80', '6289');
INSERT INTO `simple_recommendation` VALUES ('177677', 'Mission: Impossible - Rogue Nation', '6.50723', '7.10', '3274');
INSERT INTO `simple_recommendation` VALUES ('187017', '22 Jump Street', '6.45729', '7.00', '3375');
INSERT INTO `simple_recommendation` VALUES ('190859', 'American Sniper', '6.82648', '7.40', '4600');
INSERT INTO `simple_recommendation` VALUES ('194662', 'Birdman', '6.83125', '7.40', '4657');
INSERT INTO `simple_recommendation` VALUES ('198663', 'The Maze Runner', '6.6094', '7.00', '5540');
INSERT INTO `simple_recommendation` VALUES ('205596', 'The Imitation Game', '7.35616', '8.00', '5895');
INSERT INTO `simple_recommendation` VALUES ('207703', 'Kingsman: The Secret Service', '7.07561', '7.60', '6069');
INSERT INTO `simple_recommendation` VALUES ('210577', 'Gone Girl', '7.29282', '7.90', '6023');
INSERT INTO `simple_recommendation` VALUES ('222935', 'The Fault in Our Stars', '6.88493', '7.60', '3868');
INSERT INTO `simple_recommendation` VALUES ('228150', 'Fury', '6.77367', '7.40', '4028');
INSERT INTO `simple_recommendation` VALUES ('242582', 'Nightcrawler', '6.83527', '7.60', '3475');
INSERT INTO `simple_recommendation` VALUES ('244786', 'Whiplash', '7.4072', '8.30', '4376');
INSERT INTO `simple_recommendation` VALUES ('245891', 'John Wick', '6.60731', '7.00', '5499');
INSERT INTO `simple_recommendation` VALUES ('259316', 'Fantastic Beasts and Where to Find Them', '6.75696', '7.20', '5612');
INSERT INTO `simple_recommendation` VALUES ('263115', 'Logan', '7.09049', '7.60', '6310');
INSERT INTO `simple_recommendation` VALUES ('264644', 'Room', '7.0208', '8.10', '2838');
INSERT INTO `simple_recommendation` VALUES ('264660', 'Ex Machina', '6.98579', '7.60', '4862');
INSERT INTO `simple_recommendation` VALUES ('266856', 'The Theory of Everything', '6.94722', '7.80', '3403');
INSERT INTO `simple_recommendation` VALUES ('269149', 'Zootopia', '7.06373', '7.70', '4961');
INSERT INTO `simple_recommendation` VALUES ('271110', 'Captain America: Civil War', '6.76457', '7.10', '7462');
INSERT INTO `simple_recommendation` VALUES ('273248', 'The Hateful Eight', '6.9432', '7.60', '4405');
INSERT INTO `simple_recommendation` VALUES ('273481', 'Sicario', '6.4571', '7.20', '2465');
INSERT INTO `simple_recommendation` VALUES ('277834', 'Moana', '6.65062', '7.30', '3471');
INSERT INTO `simple_recommendation` VALUES ('281957', 'The Revenant', '6.87991', '7.30', '6558');
INSERT INTO `simple_recommendation` VALUES ('283995', 'Guardians of the Galaxy Vol. 2', '6.98545', '7.60', '4858');
INSERT INTO `simple_recommendation` VALUES ('284052', 'Doctor Strange', '6.69877', '7.10', '5880');
INSERT INTO `simple_recommendation` VALUES ('286217', 'The Martian', '7.1504', '7.60', '7442');
INSERT INTO `simple_recommendation` VALUES ('293660', 'Deadpool', '7.11449', '7.40', '11444');
INSERT INTO `simple_recommendation` VALUES ('296096', 'Me Before You', '6.7092', '7.60', '2674');
INSERT INTO `simple_recommendation` VALUES ('296098', 'Bridge of Spies', '6.48301', '7.20', '2633');
INSERT INTO `simple_recommendation` VALUES ('297762', 'Wonder Woman', '6.72089', '7.20', '5025');
INSERT INTO `simple_recommendation` VALUES ('313369', 'La La Land', '7.18084', '7.90', '4745');
INSERT INTO `simple_recommendation` VALUES ('314365', 'Spotlight', '6.83457', '7.80', '2751');
INSERT INTO `simple_recommendation` VALUES ('318846', 'The Big Short', '6.54487', '7.30', '2679');
INSERT INTO `simple_recommendation` VALUES ('321612', 'Beauty and the Beast', '6.46553', '6.80', '5530');
INSERT INTO `simple_recommendation` VALUES ('324786', 'Hacksaw Ridge', '6.93026', '7.80', '3294');
INSERT INTO `simple_recommendation` VALUES ('329865', 'Arrival', '6.76351', '7.20', '5729');
INSERT INTO `simple_recommendation` VALUES ('330459', 'Rogue One: A Star Wars Story', '6.86665', '7.40', '5111');
INSERT INTO `simple_recommendation` VALUES ('374720', 'Dunkirk', '6.66073', '7.50', '2712');
INSERT INTO `simple_recommendation` VALUES ('381288', 'Split', '6.54598', '7.00', '4461');
INSERT INTO `simple_recommendation` VALUES ('419430', 'Get Out', '6.53092', '7.20', '2978');
