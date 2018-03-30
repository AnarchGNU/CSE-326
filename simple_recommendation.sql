/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : movie_recommend

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-30 13:59:42
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
  `poster_path` varchar(255) NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of simple_recommendation
-- ----------------------------
INSERT INTO `simple_recommendation` VALUES ('11', 'Star Wars', '7.49522', '8.10', '6778', '/btTdmkgIvOi0FFip1sPuZI2oQG6.jpg');
INSERT INTO `simple_recommendation` VALUES ('12', 'Finding Nemo', '7.08941', '7.60', '6292', '/syPWyeeqzTQIxjIUaIFI7d0TyEY.jpg');
INSERT INTO `simple_recommendation` VALUES ('13', 'Forrest Gump', '7.65421', '8.20', '8147', '/yE5d3BUhE8hCnkMUJOo1QDoOGNz.jpg');
INSERT INTO `simple_recommendation` VALUES ('14', 'American Beauty', '7.01368', '7.90', '3438', '/or1MP8BZIAjqWYxPdPX724ydKar.jpg');
INSERT INTO `simple_recommendation` VALUES ('18', 'The Fifth Element', '6.70249', '7.30', '3962', '/zaFa1NRZEnFgRTv5OVXkNIZO78O.jpg');
INSERT INTO `simple_recommendation` VALUES ('22', 'Pirates of the Caribbean: The Curse of the Black Pearl', '7.06167', '7.50', '7191', '/tkt9xR1kNX5R9rCebASKck44si2.jpg');
INSERT INTO `simple_recommendation` VALUES ('24', 'Kill Bill: Vol. 1', '7.0751', '7.70', '5091', '/97fNAi62HawGjWru7PvVmF7RAbU.jpg');
INSERT INTO `simple_recommendation` VALUES ('38', 'Eternal Sunshine of the Spotless Mind', '7.0614', '7.90', '3758', '/7y3eYvTsGjxPYDtSnumCLIMDkrV.jpg');
INSERT INTO `simple_recommendation` VALUES ('58', 'Pirates of the Caribbean: Dead Man\'s Chest', '6.60113', '7.00', '5380', '/waFr5RVKaQ9dzOt3nQuIVB1FiPu.jpg');
INSERT INTO `simple_recommendation` VALUES ('62', '2001: A Space Odyssey', '6.95251', '7.90', '3075', '/90T7b2LIrL07ndYQBmSm09yqVEH.jpg');
INSERT INTO `simple_recommendation` VALUES ('63', 'Twelve Monkeys', '6.56403', '7.40', '2470', '/6Sj9wDu3YugthXsU0Vry5XFAZGg.jpg');
INSERT INTO `simple_recommendation` VALUES ('70', 'Million Dollar Baby', '6.7334', '7.70', '2519', '/h4VZKi2Jt4VoBYJmtC4c3bO8KqM.jpg');
INSERT INTO `simple_recommendation` VALUES ('73', 'American History X', '7.13699', '8.20', '3120', '/fXepRAYOx1qC3wju7XdDGx60775.jpg');
INSERT INTO `simple_recommendation` VALUES ('77', 'Memento', '7.24674', '8.10', '4168', '/fQMSaP88cf1nz4qwuNEEFtazuDM.jpg');
INSERT INTO `simple_recommendation` VALUES ('78', 'Blade Runner', '7.07185', '7.90', '3833', '/p64TtbZGCElxQHpAMWmDHkWJlH2.jpg');
INSERT INTO `simple_recommendation` VALUES ('85', 'Raiders of the Lost Ark', '6.95875', '7.70', '3949', '/44sKJOGP3fTm4QXBcIuqu0RkdP7.jpg');
INSERT INTO `simple_recommendation` VALUES ('87', 'Indiana Jones and the Temple of Doom', '6.45615', '7.10', '2841', '/f2nTRKk2zGdUTE7tLJ5EGGSuKA6.jpg');
INSERT INTO `simple_recommendation` VALUES ('89', 'Indiana Jones and the Last Crusade', '6.79934', '7.60', '3221', '/4p1N2Qrt8j0H8xMHMHvtRxv9weZ.jpg');
INSERT INTO `simple_recommendation` VALUES ('98', 'Gladiator', '7.25702', '7.90', '5566', '/6WBIzCgmDCYrqh64yDREGeDk9d3.jpg');
INSERT INTO `simple_recommendation` VALUES ('101', 'Leon: The Professional', '7.32948', '8.20', '4293', '/gE8S02QUOhVnAmYu4tcrBlMTujz.jpg');
INSERT INTO `simple_recommendation` VALUES ('103', 'Taxi Driver', '6.97465', '8.10', '2632', '/yxq4pk1xGmro8tQABuQIrWrvdaE.jpg');
INSERT INTO `simple_recommendation` VALUES ('105', 'Back to the Future', '7.38246', '8.00', '6239', '/pTpxQB1N0waaSc3OSn0e9oc8kx9.jpg');
INSERT INTO `simple_recommendation` VALUES ('107', 'Snatch', '6.81505', '7.70', '2953', '/on9JlbGEccLsYkjeEph2Whm1DIp.jpg');
INSERT INTO `simple_recommendation` VALUES ('111', 'Scarface', '6.99994', '8.00', '3017', '/zr2p353wrd6j3wjLgDT4TcaestB.jpg');
INSERT INTO `simple_recommendation` VALUES ('115', 'The Big Lebowski', '6.88111', '7.80', '3001', '/qiE3ovg9TPylHReZjizQ40LsKZV.jpg');
INSERT INTO `simple_recommendation` VALUES ('120', 'The Lord of the Rings: The Fellowship of the Ring', '7.53036', '8.00', '8892', '/bxVxZb5O9OxCO0oRUNdCnpy9NST.jpg');
INSERT INTO `simple_recommendation` VALUES ('121', 'The Lord of the Rings: The Two Towers', '7.47057', '8.00', '7641', '/wf3v0Pn09jnT5HSaYal7Ami3bdA.jpg');
INSERT INTO `simple_recommendation` VALUES ('122', 'The Lord of the Rings: The Return of the King', '7.57934', '8.10', '8226', '/uexxR7Kw1qYbZk0RYaF9Rx5ykbj.jpg');
INSERT INTO `simple_recommendation` VALUES ('129', 'Spirited Away', '7.34799', '8.30', '3968', '/ynXoOxmDHNQ4UAy0oU6avW71HVW.jpg');
INSERT INTO `simple_recommendation` VALUES ('137', 'Groundhog Day', '6.54342', '7.40', '2358', '/vXjVd0Vu0MXRZnga7wEnHIIhO5B.jpg');
INSERT INTO `simple_recommendation` VALUES ('141', 'Donnie Darko', '6.91048', '7.70', '3574', '/nmb4QhCRmdfNP6rgb81yUFgI83l.jpg');
INSERT INTO `simple_recommendation` VALUES ('155', 'The Dark Knight', '7.89475', '8.30', '12269', '/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg');
INSERT INTO `simple_recommendation` VALUES ('161', 'Ocean\'s Eleven', '6.62827', '7.20', '3857', '/o0h76DVXvk5OKjmNez5YY0GODC2.jpg');
INSERT INTO `simple_recommendation` VALUES ('162', 'Edward Scissorhands', '6.8053', '7.50', '3731', '/kgLTB53HinftRRwhft7yrUOclDC.jpg');
INSERT INTO `simple_recommendation` VALUES ('165', 'Back to the Future Part II', '6.76322', '7.40', '3926', '/k5dzvCQkXU2CAhLtlj9BHE7xmyK.jpg');
INSERT INTO `simple_recommendation` VALUES ('185', 'A Clockwork Orange', '7.07383', '8.00', '3432', '/kgAi87gyx6b4oGJYSC36tVkJyJu.jpg');
INSERT INTO `simple_recommendation` VALUES ('187', 'Sin City', '6.50072', '7.20', '2755', '/vKJVGOKPyWqp9d2EX5NH1liqRqR.jpg');
INSERT INTO `simple_recommendation` VALUES ('194', 'Amélie', '6.94722', '7.80', '3403', '/f0uorE7K7ggHfr8r7pUTOHWkOlE.jpg');
INSERT INTO `simple_recommendation` VALUES ('196', 'Back to the Future Part III', '6.47324', '7.10', '2978', '/6DmgPTZYaug7QNDjOhUDWyjOQDl.jpg');
INSERT INTO `simple_recommendation` VALUES ('197', 'Braveheart', '6.88647', '7.70', '3404', '/2qAgGeYdLjelOEqjW9FYvPHpplC.jpg');
INSERT INTO `simple_recommendation` VALUES ('207', 'Dead Poets Society', '7.00951', '8.10', '2786', '/3Ri2GReavqSHqWemlP6HYn8i2P9.jpg');
INSERT INTO `simple_recommendation` VALUES ('218', 'The Terminator', '6.79131', '7.40', '4208', '/q8ffBuxQlYOHrvPniLgCbmKK4Lv.jpg');
INSERT INTO `simple_recommendation` VALUES ('238', 'The Godfather', '7.73321', '8.50', '6024', '/rPdtLWNsZmAtoZl9PK7S2wE3qiS.jpg');
INSERT INTO `simple_recommendation` VALUES ('240', 'The Godfather: Part II', '7.25454', '8.30', '3418', '/bVq65huQ8vHDd1a4Z37QtuyEvpA.jpg');
INSERT INTO `simple_recommendation` VALUES ('272', 'Batman Begins', '7.07614', '7.50', '7511', '/dr6x4GyyegBWtinPBzipY02J2lV.jpg');
INSERT INTO `simple_recommendation` VALUES ('274', 'The Silence of the Lambs', '7.29502', '8.10', '4549', '/qjAyTj2BSth1EQ89vNfo0JYVPFN.jpg');
INSERT INTO `simple_recommendation` VALUES ('278', 'The Shawshank Redemption', '7.90297', '8.50', '8358', '/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg');
INSERT INTO `simple_recommendation` VALUES ('280', 'Terminator 2: Judgment Day', '6.99605', '7.70', '4274', '/2y4dmgWYRMYXdD1UyJVcn2HSd1D.jpg');
INSERT INTO `simple_recommendation` VALUES ('285', 'Pirates of the Caribbean: At World\'s End', '6.48911', '6.90', '4627', '/bXb00CkHqx7TPchTGG131sWV59y.jpg');
INSERT INTO `simple_recommendation` VALUES ('329', 'Jurassic Park', '6.99388', '7.60', '4956', '/c414cDeQ9b6qLPLeKmiJuLDUREJ.jpg');
INSERT INTO `simple_recommendation` VALUES ('348', 'Alien', '7.16156', '7.90', '4564', '/2h00HrZs89SL3tXB4nbkiM7BKHs.jpg');
INSERT INTO `simple_recommendation` VALUES ('350', 'The Devil Wears Prada', '6.43944', '7.00', '3198', '/8unCRm0LeiO0fM6skWAZy3ZfXR1.jpg');
INSERT INTO `simple_recommendation` VALUES ('393', 'Kill Bill: Vol. 2', '6.97204', '7.70', '4061', '/au9lFA5a2ZnBKCzPbZQf00r7J64.jpg');
INSERT INTO `simple_recommendation` VALUES ('424', 'Schindler\'s List', '7.41529', '8.30', '4436', '/yPisjyLweCl1tbgwgtzBCNCBle.jpg');
INSERT INTO `simple_recommendation` VALUES ('425', 'Ice Age', '6.57289', '7.10', '3954', '/zpaQwR0YViPd83bx1e559QyZ35i.jpg');
INSERT INTO `simple_recommendation` VALUES ('429', 'The Good, the Bad and the Ugly', '6.91018', '8.10', '2371', '/wfPHdfofBD5PN96dV96a51B3Ja2.jpg');
INSERT INTO `simple_recommendation` VALUES ('453', 'A Beautiful Mind', '6.83755', '7.70', '3087', '/4SFqHDZ1NvWdysucWbgnYlobdxC.jpg');
INSERT INTO `simple_recommendation` VALUES ('489', 'Good Will Hunting', '6.91603', '7.90', '2880', '/jq8LjngZ7XZEQge5JFTdOGMrHyZ.jpg');
INSERT INTO `simple_recommendation` VALUES ('497', 'The Green Mile', '7.31207', '8.20', '4166', '/3yJUlOtVa09CYJocwBU8eAryja0.jpg');
INSERT INTO `simple_recommendation` VALUES ('500', 'Reservoir Dogs', '7.19744', '8.10', '3821', '/tB2ITHg556e7aTV6cqQqVAXkdxN.jpg');
INSERT INTO `simple_recommendation` VALUES ('510', 'One Flew Over the Cuckoo\'s Nest', '7.17047', '8.30', '3001', '/2Sns5oMb356JNdBHgBETjIpRYy9.jpg');
INSERT INTO `simple_recommendation` VALUES ('539', 'Psycho', '7.02379', '8.30', '2405', '/81d8oyEFgj7FlxJqSDXWr8JH8kV.jpg');
INSERT INTO `simple_recommendation` VALUES ('550', 'Fight Club', '7.80623', '8.30', '9678', '/adw6Lq9FiC9zjYEpOqfq03ituwp.jpg');
INSERT INTO `simple_recommendation` VALUES ('557', 'Spider-Man', '6.4597', '6.80', '5398', '/rZd0y1X1Gw4t5B3f01Qzj8DYY66.jpg');
INSERT INTO `simple_recommendation` VALUES ('562', 'Die Hard', '6.83605', '7.50', '4005', '/r7CDkRjZIAP79skLaTTvRk8eUp3.jpg');
INSERT INTO `simple_recommendation` VALUES ('578', 'Jaws', '6.64608', '7.50', '2628', '/l1yltvzILaZcx2jYvc5sEMkM7Eh.jpg');
INSERT INTO `simple_recommendation` VALUES ('585', 'Monsters, Inc.', '7.00692', '7.50', '6150', '/93Y9BGx8blzmZOPSoivkFfaifqU.jpg');
INSERT INTO `simple_recommendation` VALUES ('597', 'Titanic', '7.08716', '7.50', '7770', '/kHXEpyfl6zqn8a6YuozZUujufXf.jpg');
INSERT INTO `simple_recommendation` VALUES ('600', 'Full Metal Jacket', '6.85735', '7.90', '2595', '/zoiGcNlYBR0r2fO2uP44XQF6S1W.jpg');
INSERT INTO `simple_recommendation` VALUES ('601', 'E.T. the Extra-Terrestrial', '6.6375', '7.30', '3359', '/8htLKK03TJjKZOXJgihZCu8v0P.jpg');
INSERT INTO `simple_recommendation` VALUES ('603', 'The Matrix', '7.45756', '7.90', '9079', '/hEpWvX6Bp79eLxY1kX5ZZJcme5U.jpg');
INSERT INTO `simple_recommendation` VALUES ('607', 'Men in Black', '6.48262', '6.90', '4521', '/f24UVKq3UiQWLqGWdqjwkzgB8j8.jpg');
INSERT INTO `simple_recommendation` VALUES ('620', 'Ghostbusters', '6.5043', '7.30', '2431', '/3FS3oBdorgczgfCkFi2u8ZTFfpS.jpg');
INSERT INTO `simple_recommendation` VALUES ('627', 'Trainspotting', '6.83183', '7.80', '2737', '/p1O3eFsdb0GEIYu87xlwV7P4jM1.jpg');
INSERT INTO `simple_recommendation` VALUES ('629', 'The Usual Suspects', '7.1178', '8.10', '3334', '/jgJoRWltoS17nD5MAQ1yK2Ztefw.jpg');
INSERT INTO `simple_recommendation` VALUES ('637', 'Life Is Beautiful', '7.2949', '8.30', '3643', '/f7DImXDebOs148U4uPjI61iDvaK.jpg');
INSERT INTO `simple_recommendation` VALUES ('640', 'Catch Me If You Can', '6.95486', '7.70', '3917', '/MywWCQGJNUr5kivAQ7eseCG7rm.jpg');
INSERT INTO `simple_recommendation` VALUES ('641', 'Requiem for a Dream', '6.84186', '7.90', '2525', '/muym4jTjdLx7E6as09d1wlC3sOB.jpg');
INSERT INTO `simple_recommendation` VALUES ('671', 'Harry Potter and the Philosopher\'s Stone', '7.06153', '7.50', '7188', '/dCtFvscYcXQKTNvyyaQr2g2UacJ.jpg');
INSERT INTO `simple_recommendation` VALUES ('672', 'Harry Potter and the Chamber of Secrets', '6.9226', '7.40', '5966', '/sdEOH0992YZ0QSxgXNIGLq1ToUi.jpg');
INSERT INTO `simple_recommendation` VALUES ('673', 'Harry Potter and the Prisoner of Azkaban', '7.147', '7.70', '6037', '/jUFjMoLh8T2CWzHUSjKCojI5SHu.jpg');
INSERT INTO `simple_recommendation` VALUES ('674', 'Harry Potter and the Goblet of Fire', '6.98259', '7.50', '5758', '/6sASqcdrEHXxUhA3nFpjrRecPD2.jpg');
INSERT INTO `simple_recommendation` VALUES ('675', 'Harry Potter and the Order of the Phoenix', '6.90226', '7.40', '5633', '/4YnLxYLHhT4UQ8i9jxAXWy46Xuw.jpg');
INSERT INTO `simple_recommendation` VALUES ('679', 'Aliens', '6.86831', '7.70', '3282', '/nORMXEkYEbzkU5WkMWMgRDJwjSZ.jpg');
INSERT INTO `simple_recommendation` VALUES ('680', 'Pulp Fiction', '7.76038', '8.30', '8670', '/dM2w364MScsjFf8pfMbaWUcWrR.jpg');
INSERT INTO `simple_recommendation` VALUES ('694', 'The Shining', '7.2077', '8.10', '3890', '/9fgh3Ns1iRzlQNYuJyK0ARQZU7w.jpg');
INSERT INTO `simple_recommendation` VALUES ('745', 'The Sixth Sense', '6.85924', '7.70', '3223', '/imps263dHNe3SuoaAJORZyNTdDT.jpg');
INSERT INTO `simple_recommendation` VALUES ('747', 'Shaun of the Dead', '6.6188', '7.50', '2479', '/ssY4EvRvufUZooNq1buRUrW7lCX.jpg');
INSERT INTO `simple_recommendation` VALUES ('752', 'V for Vendetta', '7.0261', '7.70', '4562', '/AoGpqw4S4ZGgwhlM3FgzFVwyIGl.jpg');
INSERT INTO `simple_recommendation` VALUES ('767', 'Harry Potter and the Half-Blood Prince', '6.88933', '7.40', '5435', '/bFXys2nhALwDvpkF3dP3Vvdfn8b.jpg');
INSERT INTO `simple_recommendation` VALUES ('769', 'GoodFellas', '7.15492', '8.20', '3211', '/hAPeXBdGDGmXRPj4OZZ0poH65Iu.jpg');
INSERT INTO `simple_recommendation` VALUES ('807', 'Se7en', '7.43078', '8.10', '5915', '/8zw8IL4zEPjkh8Aysdcd0FwGMb0.jpg');
INSERT INTO `simple_recommendation` VALUES ('808', 'Shrek', '6.72323', '7.30', '4183', '/140ewbWv8qHStD3mlBDvvGd0Zvu.jpg');
INSERT INTO `simple_recommendation` VALUES ('812', 'Aladdin', '6.7149', '7.40', '3495', '/7f53XAE4nPiGe9XprpGAeWHuKPw.jpg');
INSERT INTO `simple_recommendation` VALUES ('857', 'Saving Private Ryan', '7.22037', '7.90', '5148', '/miDoEMlYDJhOCvxlzI0wZqBs9Yt.jpg');
INSERT INTO `simple_recommendation` VALUES ('862', 'Toy Story', '7.10174', '7.70', '5415', '/rhIRbceoE9lR4veEXuwCC2wARtG.jpg');
INSERT INTO `simple_recommendation` VALUES ('863', 'Toy Story 2', '6.69779', '7.30', '3914', '/3CmK3XurcLeUyMifCR28ibzupbB.jpg');
INSERT INTO `simple_recommendation` VALUES ('1124', 'The Prestige', '7.22297', '8.00', '4510', '/5MXyQfz8xUP3dIFPTubhTsbFY6N.jpg');
INSERT INTO `simple_recommendation` VALUES ('1271', '300', '6.58535', '7.00', '5092', '/bYR8O1H1ZlME7Dm9ysfTYZnRDpw.jpg');
INSERT INTO `simple_recommendation` VALUES ('1372', 'Blood Diamond', '6.54077', '7.40', '2344', '/wRamTzV6udKaMXrspxqOuo02zk0.jpg');
INSERT INTO `simple_recommendation` VALUES ('1402', 'The Pursuit of Happyness', '6.75115', '7.70', '2607', '/iMNp6gTeDBXbzjKRNYtorxZ76G2.jpg');
INSERT INTO `simple_recommendation` VALUES ('1417', 'Pan\'s Labyrinth', '6.7844', '7.60', '3122', '/t0TDsqbCTgSi0AL7k4baZrOYYhi.jpg');
INSERT INTO `simple_recommendation` VALUES ('1422', 'The Departed', '7.14943', '7.90', '4455', '/tGLO9zw5ZtCeyyEWgbYGgsFxC6i.jpg');
INSERT INTO `simple_recommendation` VALUES ('1726', 'Iron Man', '7.05057', '7.40', '8951', '/848chlIWVT41VtAAgyh9bWymAYb.jpg');
INSERT INTO `simple_recommendation` VALUES ('1891', 'The Empire Strikes Back', '7.51087', '8.20', '5998', '/6u1fYtxG5eqjhtCPDx04pJphQRW.jpg');
INSERT INTO `simple_recommendation` VALUES ('1892', 'Return of the Jedi', '7.18271', '7.90', '4763', '/jx5p0aHlbPXqe3AH9G15NvmWaqQ.jpg');
INSERT INTO `simple_recommendation` VALUES ('1895', 'Star Wars: Episode III - Revenge of the Sith', '6.5932', '7.10', '4200', '/tgr5Pdy7ehZYBqBkN2K7Q02xgOb.jpg');
INSERT INTO `simple_recommendation` VALUES ('2062', 'Ratatouille', '6.88613', '7.50', '4510', '/jEiEU8viSb8CIIHcfprVr2V6XDz.jpg');
INSERT INTO `simple_recommendation` VALUES ('2108', 'The Breakfast Club', '6.71052', '7.80', '2189', '/4ZejrrCpfoypR5lHoT3pq6yVldW.jpg');
INSERT INTO `simple_recommendation` VALUES ('2501', 'The Bourne Identity', '6.66946', '7.30', '3640', '/bXQIL36VQdzJ69lcjQR1WQzJqQR.jpg');
INSERT INTO `simple_recommendation` VALUES ('2502', 'The Bourne Supremacy', '6.51703', '7.20', '2873', '/jXwZgmqOtsqsXuB9oGhocOAegCM.jpg');
INSERT INTO `simple_recommendation` VALUES ('2503', 'The Bourne Ultimatum', '6.58305', '7.30', '2938', '/fHho6JYYY0nRcETWSoeI19iZsNF.jpg');
INSERT INTO `simple_recommendation` VALUES ('4638', 'Hot Fuzz', '6.52295', '7.40', '2252', '/5Jx6s6VXnunh8wCLgR0YgjwSgjh.jpg');
INSERT INTO `simple_recommendation` VALUES ('4922', 'The Curious Case of Benjamin Button', '6.64213', '7.30', '3398', '/4O4INOPtWTfHq3dd5vYTPV0TCwa.jpg');
INSERT INTO `simple_recommendation` VALUES ('5915', 'Into the Wild', '6.90493', '7.80', '3139', '/lHyYgaocXR6KcJLxVmxZDj115hH.jpg');
INSERT INTO `simple_recommendation` VALUES ('6479', 'I Am Legend', '6.50919', '6.90', '4977', '/6OA0I8hhW9zftWoCYxJAzXW9UIN.jpg');
INSERT INTO `simple_recommendation` VALUES ('6977', 'No Country for Old Men', '6.83689', '7.70', '3083', '/6o0UWX2naW7HK45PDNYmoMIk5qs.jpg');
INSERT INTO `simple_recommendation` VALUES ('8358', 'Cast Away', '6.75125', '7.50', '3304', '/w515BrZvczKIxbHurG6HIiYYrba.jpg');
INSERT INTO `simple_recommendation` VALUES ('8587', 'The Lion King', '7.32483', '8.00', '5520', '/bKPtXn9n4M4s8vvZrbw40mYsefB.jpg');
INSERT INTO `simple_recommendation` VALUES ('8681', 'Taken', '6.6789', '7.20', '4444', '/3zlffXmo7QpVBc17QIJWrRfasVr.jpg');
INSERT INTO `simple_recommendation` VALUES ('9806', 'The Incredibles', '6.87942', '7.40', '5290', '/huGDgQRB24IzkJLNqe5zq1pdvEE.jpg');
INSERT INTO `simple_recommendation` VALUES ('10020', 'Beauty and the Beast', '6.71176', '7.50', '3029', '/b9QJr2oblOu1grgOMUZF1xkUJdh.jpg');
INSERT INTO `simple_recommendation` VALUES ('10191', 'How to Train Your Dragon', '6.8681', '7.50', '4319', '/3itnFVfx74ccUayMcywRHR8LLSd.jpg');
INSERT INTO `simple_recommendation` VALUES ('10193', 'Toy Story 3', '6.97225', '7.60', '4710', '/mMltbSxwEdNE4Cv8QYLpzkHWTDo.jpg');
INSERT INTO `simple_recommendation` VALUES ('10528', 'Sherlock Holmes', '6.626', '7.00', '5883', '/22ngurXbLqab7Sko6aTSdwOCe5W.jpg');
INSERT INTO `simple_recommendation` VALUES ('10681', 'WALL·E', '7.24745', '7.80', '6439', '/9cJETuLMc6R0bTWRA5i7ctY9bxk.jpg');
INSERT INTO `simple_recommendation` VALUES ('11036', 'The Notebook', '6.8498', '7.70', '3163', '/gMfstesBXKdsHToAUXVPHujUDfb.jpg');
INSERT INTO `simple_recommendation` VALUES ('11324', 'Shutter Island', '7.25503', '7.80', '6559', '/aZqKsvpJDFy2UzUMsdskNFbfkOd.jpg');
INSERT INTO `simple_recommendation` VALUES ('12405', 'Slumdog Millionaire', '6.7518', '7.60', '2918', '/9zknVczWOLhTKnT9nbX2IOCHtZn.jpg');
INSERT INTO `simple_recommendation` VALUES ('12444', 'Harry Potter and the Deathly Hallows: Part 1', '6.97931', '7.50', '5708', '/maP4MTfPCeVD2FZbKTLUgriOW4R.jpg');
INSERT INTO `simple_recommendation` VALUES ('12445', 'Harry Potter and the Deathly Hallows: Part 2', '7.30143', '7.90', '6141', '/fTplI1NCSuEDP4ITLcTps739fcC.jpg');
INSERT INTO `simple_recommendation` VALUES ('13223', 'Gran Torino', '6.91194', '7.80', '3181', '/yeBc5vpEiqIAZrbVQnl833GlBEi.jpg');
INSERT INTO `simple_recommendation` VALUES ('13475', 'Star Trek', '6.82427', '7.40', '4574', '/6V0CY7pwdDOCDS2XqNWahmIlVYh.jpg');
INSERT INTO `simple_recommendation` VALUES ('14160', 'Up', '7.28389', '7.80', '7048', '/nk11pvocdb5zbFhX5oq5YiLPYMo.jpg');
INSERT INTO `simple_recommendation` VALUES ('16869', 'Inglourious Basterds', '7.33257', '7.90', '6598', '/ai0LXkzVM3hMjDhvFdKMUemoBe.jpg');
INSERT INTO `simple_recommendation` VALUES ('17654', 'District 9', '6.64831', '7.30', '3451', '/axFmCRNQsW6Bto8XuJKo08MPPV5.jpg');
INSERT INTO `simple_recommendation` VALUES ('18785', 'The Hangover', '6.79403', '7.20', '6324', '/uluhlXubGu1VxU63X9VHCLWDAYP.jpg');
INSERT INTO `simple_recommendation` VALUES ('19908', 'Zombieland', '6.60849', '7.20', '3655', '/vUzzDpVrab1BOG3ogxhRGfLN94d.jpg');
INSERT INTO `simple_recommendation` VALUES ('19913', '(500) Days of Summer', '6.53286', '7.20', '2993', '/5SjtNPD1bb182vzQccvEUpXHFjN.jpg');
INSERT INTO `simple_recommendation` VALUES ('19995', 'Avatar', '6.95842', '7.20', '12114', '/kmcqlZGaSh20zpTbuoF0Cdn07dT.jpg');
INSERT INTO `simple_recommendation` VALUES ('20352', 'Despicable Me', '6.73145', '7.10', '6595', '/4zHJhBSY4kNZXfhTlmy2TzXD51M.jpg');
INSERT INTO `simple_recommendation` VALUES ('23483', 'Kick-Ass', '6.63319', '7.10', '4747', '/yZFrniO6qSwjTCosStXweYtczGT.jpg');
INSERT INTO `simple_recommendation` VALUES ('24428', 'The Avengers', '7.12568', '7.40', '12000', '/cezWGskPY5x7GaglTTRN4Fugfb8.jpg');
INSERT INTO `simple_recommendation` VALUES ('27205', 'Inception', '7.76663', '8.10', '14075', '/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg');
INSERT INTO `simple_recommendation` VALUES ('36557', 'Casino Royale', '6.69936', '7.30', '3930', '/zlWBxz2pTA9p45kUTrI8AQiKrHm.jpg');
INSERT INTO `simple_recommendation` VALUES ('37165', 'The Truman Show', '7.10808', '7.80', '4702', '/EelZzudHRvJmjWccWscN1S5vmI.jpg');
INSERT INTO `simple_recommendation` VALUES ('37724', 'Skyfall', '6.61737', '6.90', '7718', '/9qUcmHiPpfTJTacyZyxfGTnSz0V.jpg');
INSERT INTO `simple_recommendation` VALUES ('37799', 'The Social Network', '6.52999', '7.10', '3492', '/ok5Wh8385Kgblq9MSU4VGvazeMH.jpg');
INSERT INTO `simple_recommendation` VALUES ('38757', 'Tangled', '6.7056', '7.40', '3419', '/re6AOJbhBk9FIK3knwU6rYlbPDx.jpg');
INSERT INTO `simple_recommendation` VALUES ('44214', 'Black Swan', '6.75563', '7.30', '4562', '/dQ7uxvsVTspVIsqjfgQj8usJpwX.jpg');
INSERT INTO `simple_recommendation` VALUES ('45269', 'The King\'s Speech', '6.73467', '7.60', '2817', '/nkFTbA1XjKWo9LCTaV1hV2Lsgr1.jpg');
INSERT INTO `simple_recommendation` VALUES ('45612', 'Source Code', '6.44455', '7.10', '2752', '/i7hS3kyv7EeoLhCDz3I7MjJ2iEN.jpg');
INSERT INTO `simple_recommendation` VALUES ('49026', 'The Dark Knight Rises', '7.22192', '7.60', '9263', '/dEYnvnUfXrqvqeRSqvIEtmzhoA8.jpg');
INSERT INTO `simple_recommendation` VALUES ('49047', 'Gravity', '6.84454', '7.30', '5879', '/uPxtxhB2Fy9ihVqtBtNGHmknJqV.jpg');
INSERT INTO `simple_recommendation` VALUES ('49051', 'The Hobbit: An Unexpected Journey', '6.71566', '7.00', '8427', '/ysX7vDmSh5O19vFjAi56WL7l4nk.jpg');
INSERT INTO `simple_recommendation` VALUES ('49538', 'X-Men: First Class', '6.66489', '7.10', '5252', '/7SSm7BfzFoVzmd6fCDccj7qRxc8.jpg');
INSERT INTO `simple_recommendation` VALUES ('51876', 'Limitless', '6.56716', '7.10', '3888', '/bQfOFEeXxi51ijQrbQY9qvMtYhZ.jpg');
INSERT INTO `simple_recommendation` VALUES ('54138', 'Star Trek Into Darkness', '6.81606', '7.40', '4479', '/41mhrXASAW3sdn7LBWF49uCX0xi.jpg');
INSERT INTO `simple_recommendation` VALUES ('57158', 'The Hobbit: The Desolation of Smaug', '6.96516', '7.60', '4633', '/gQCiuxGsfiXH1su6lp9n0nd0UeH.jpg');
INSERT INTO `simple_recommendation` VALUES ('58574', 'Sherlock Holmes: A Game of Shadows', '6.50984', '7.00', '3971', '/7OFqsVuS6DlVM10GUD72vCGpQm9.jpg');
INSERT INTO `simple_recommendation` VALUES ('61791', 'Rise of the Planet of the Apes', '6.54536', '7.00', '4452', '/esqXMJv6PiK7GJVRwd2FA3SZUoW.jpg');
INSERT INTO `simple_recommendation` VALUES ('62211', 'Monsters University', '6.48037', '7.00', '3622', '/a05xQU9huY3P5uurLcGGHmsf2Vh.jpg');
INSERT INTO `simple_recommendation` VALUES ('64682', 'The Great Gatsby', '6.69491', '7.30', '3885', '/oJpOYPpVWyPeunGbbDGH1KFvea0.jpg');
INSERT INTO `simple_recommendation` VALUES ('64690', 'Drive', '6.75327', '7.40', '3832', '/nu7XIa67cXc2t7frXCE5voXUJcN.jpg');
INSERT INTO `simple_recommendation` VALUES ('65754', 'The Girl with the Dragon Tattoo', '6.45933', '7.20', '2479', '/voxRWFTtagLiqnJQs9tWQLB0MN.jpg');
INSERT INTO `simple_recommendation` VALUES ('68718', 'Django Unchained', '7.41824', '7.80', '10297', '/5WJnxuw41sddupf8cwOxYftuvJG.jpg');
INSERT INTO `simple_recommendation` VALUES ('68721', 'Iron Man 3', '6.56828', '6.80', '8951', '/1Ilv6ryHUv6rt9zIsbSEJUmmbEi.jpg');
INSERT INTO `simple_recommendation` VALUES ('68734', 'Argo', '6.52808', '7.10', '3473', '/oai3xLBQHpIh18VJdRCcL7D0Yg0.jpg');
INSERT INTO `simple_recommendation` VALUES ('70160', 'The Hunger Games', '6.66319', '6.90', '9634', '/iLJdwmzrHFjFwI5lvYAT1gcpRuA.jpg');
INSERT INTO `simple_recommendation` VALUES ('75656', 'Now You See Me', '6.83033', '7.30', '5635', '/A06e9YJ5ry3WXEIFIAD1mKBxcuZ.jpg');
INSERT INTO `simple_recommendation` VALUES ('76203', '12 Years a Slave', '7.06547', '7.90', '3787', '/kb3X943WMIJYVg4SOAyK0pmWL5D.jpg');
INSERT INTO `simple_recommendation` VALUES ('76338', 'Thor: The Dark World', '6.43439', '6.80', '4873', '/bnX5PqAdQZRXSw3aX3DutDcdso5.jpg');
INSERT INTO `simple_recommendation` VALUES ('76341', 'Mad Max: Fury Road', '6.98911', '7.30', '9629', '/kqjL17yufvn9OVLyXYpvtyrFfak.jpg');
INSERT INTO `simple_recommendation` VALUES ('77338', 'The Intouchables', '7.45752', '8.20', '5410', '/4mFsNQwbD0F237Tx7gAPotd0nbJ.jpg');
INSERT INTO `simple_recommendation` VALUES ('82690', 'Wreck-It Ralph', '6.62698', '7.10', '4656', '/93FsllrXXWncp7BQYTdOU1XMRXo.jpg');
INSERT INTO `simple_recommendation` VALUES ('82693', 'Silver Linings Playbook', '6.57047', '7.00', '4840', '/ilrZAV2klTB0FLxLb01bOp5pzD9.jpg');
INSERT INTO `simple_recommendation` VALUES ('82702', 'How to Train Your Dragon 2', '6.79066', '7.60', '3163', '/lRjOR4uclMQijUav4OjeZprlehu.jpg');
INSERT INTO `simple_recommendation` VALUES ('84892', 'The Perks of Being a Wallflower', '6.83244', '7.70', '3056', '/cyNQLnHnXZcTUDXVVSEYmquOTOI.jpg');
INSERT INTO `simple_recommendation` VALUES ('87827', 'Life of Pi', '6.77338', '7.20', '5912', '/sLYdcz7easaS7CmJGwQcVVYZqiF.jpg');
INSERT INTO `simple_recommendation` VALUES ('93456', 'Despicable Me 2', '6.56358', '7.00', '4729', '/kQrYyZQHkwkUg2KlUDyvymj9FAp.jpg');
INSERT INTO `simple_recommendation` VALUES ('96721', 'Rush', '6.68845', '7.70', '2310', '/cjEepHZOZAwmK6nAj5jis6HV75E.jpg');
INSERT INTO `simple_recommendation` VALUES ('99861', 'Avengers: Age of Ultron', '6.89608', '7.30', '6908', '/t90Y3G8UGQp0f0DrP60wRu9gfrH.jpg');
INSERT INTO `simple_recommendation` VALUES ('100402', 'Captain America: The Winter Soldier', '7.06339', '7.60', '5881', '/5TQ6YDmymBpnF005OyoB7ohZps9.jpg');
INSERT INTO `simple_recommendation` VALUES ('101299', 'The Hunger Games: Catching Fire', '6.95986', '7.40', '6656', '/Hn0KgefVEp0GkdTexS6gfKTMfi.jpg');
INSERT INTO `simple_recommendation` VALUES ('102651', 'Maleficent', '6.55574', '7.00', '4607', '/4FYu1AAu14tuBU0lns0hbKiHUcH.jpg');
INSERT INTO `simple_recommendation` VALUES ('102899', 'Ant-Man', '6.63265', '7.00', '6029', '/D6e8RJf2qUstnfkTslTXNTUAlT.jpg');
INSERT INTO `simple_recommendation` VALUES ('106646', 'The Wolf of Wall Street', '7.34335', '7.90', '6768', '/vK1o5rZGqxyovfIhZyMELhk03wO.jpg');
INSERT INTO `simple_recommendation` VALUES ('109424', 'Captain Phillips', '6.67513', '7.60', '2495', '/AnMTMPTUzeWNbYxzp29WqYf1br1.jpg');
INSERT INTO `simple_recommendation` VALUES ('109445', 'Frozen', '6.81831', '7.30', '5440', '/jIjdFXKUNtdf1bwqMrhearpyjMj.jpg');
INSERT INTO `simple_recommendation` VALUES ('114150', 'Pitch Perfect', '6.48288', '7.30', '2310', '/cLUMPdwCV0Dxd3P1ZkCXe7bVImI.jpg');
INSERT INTO `simple_recommendation` VALUES ('116745', 'The Secret Life of Walter Mitty', '6.441', '7.00', '3213', '/b0nIj7dr2bcLAn3erYhql7f6aUm.jpg');
INSERT INTO `simple_recommendation` VALUES ('118340', 'Guardians of the Galaxy', '7.49147', '7.90', '10014', '/y31QB9kn3XSudA15tV7UWQ9XLuW.jpg');
INSERT INTO `simple_recommendation` VALUES ('119450', 'Dawn of the Planet of the Apes', '6.75148', '7.30', '4511', '/2EUAUIu5lHFlkj5FRryohlH6CRO.jpg');
INSERT INTO `simple_recommendation` VALUES ('120467', 'The Grand Budapest Hotel', '7.23821', '8.00', '4644', '/nX5XotM9yprCKarRH4fzOq1VM1J.jpg');
INSERT INTO `simple_recommendation` VALUES ('122917', 'The Hobbit: The Battle of the Five Armies', '6.64224', '7.10', '4884', '/9zRzFJuaj0CHIOhAkcCcFTvyu2X.jpg');
INSERT INTO `simple_recommendation` VALUES ('127585', 'X-Men: Days of Future Past', '7.00722', '7.50', '6155', '/giUK8ppRbfistadVzHtpainkhq4.jpg');
INSERT INTO `simple_recommendation` VALUES ('137106', 'The Lego Movie', '6.7263', '7.50', '3127', '/lMHbadNmznKs5vgBAkHxKGHulOa.jpg');
INSERT INTO `simple_recommendation` VALUES ('137113', 'Edge of Tomorrow', '6.99583', '7.60', '4979', '/tpoVEYvm6qcXueZrQYJNRLXL88s.jpg');
INSERT INTO `simple_recommendation` VALUES ('138843', 'The Conjuring', '6.67318', '7.40', '3169', '/xYGkdhOEVoFrLNUotuTXemtQAWd.jpg');
INSERT INTO `simple_recommendation` VALUES ('140607', 'Star Wars: The Force Awakens', '7.09621', '7.50', '7993', '/weUSwMdQIa3NaXVzwUoIIcAi85d.jpg');
INSERT INTO `simple_recommendation` VALUES ('146233', 'Prisoners', '6.97157', '7.90', '3183', '/yAhqW57pwMAsCgmZpM5zSIVQVTh.jpg');
INSERT INTO `simple_recommendation` VALUES ('150540', 'Inside Out', '7.34141', '7.90', '6737', '/aAmfIX3TT40zUHGcCKrlOZRKC7u.jpg');
INSERT INTO `simple_recommendation` VALUES ('152532', 'Dallas Buyers Club', '6.93377', '7.90', '2973', '/nxJFUxDRP9qQCiyD5sH24N5SCSu.jpg');
INSERT INTO `simple_recommendation` VALUES ('152601', 'Her', '7.12129', '7.90', '4215', '/fsoTLnUXEUTNuVCBxAJMY0HPPd.jpg');
INSERT INTO `simple_recommendation` VALUES ('156022', 'The Equalizer', '6.47554', '7.10', '2997', '/2eQfjqlvPAxd9aLDs8DvsKLnfed.jpg');
INSERT INTO `simple_recommendation` VALUES ('157336', 'Interstellar', '7.69463', '8.10', '11187', '/nBNZadXqJSdt05SHLqgT0HuC5Gm.jpg');
INSERT INTO `simple_recommendation` VALUES ('157350', 'Divergent', '6.49837', '6.90', '4784', '/yTtx2ciqk4XdN1oKhMMDy3f5ue3.jpg');
INSERT INTO `simple_recommendation` VALUES ('168259', 'Furious 7', '6.7295', '7.30', '4253', '/dCgm7efXDmiABSdWDHBDBx2jwmn.jpg');
INSERT INTO `simple_recommendation` VALUES ('177572', 'Big Hero 6', '7.23766', '7.80', '6289', '/9gLu47Zw5ertuFTZaxXOvNfy78T.jpg');
INSERT INTO `simple_recommendation` VALUES ('177677', 'Mission: Impossible - Rogue Nation', '6.50723', '7.10', '3274', '/z2sJd1OvAGZLxgjBdSnQoLCfn3M.jpg');
INSERT INTO `simple_recommendation` VALUES ('187017', '22 Jump Street', '6.45729', '7.00', '3375', '/gNlV5FhDZ1PjxSv2aqTPS30GEon.jpg');
INSERT INTO `simple_recommendation` VALUES ('190859', 'American Sniper', '6.82648', '7.40', '4600', '/svPHnYE7N5NAGO49dBmRhq0vDQ3.jpg');
INSERT INTO `simple_recommendation` VALUES ('194662', 'Birdman', '6.83125', '7.40', '4657', '/rSZs93P0LLxqlVEbI001UKoeCQC.jpg');
INSERT INTO `simple_recommendation` VALUES ('198663', 'The Maze Runner', '6.6094', '7.00', '5540', '/coss7RgL0NH6g4fC2s5atvf3dFO.jpg');
INSERT INTO `simple_recommendation` VALUES ('205596', 'The Imitation Game', '7.35616', '8.00', '5895', '/noUp0XOqIcmgefRnRZa1nhtRvWO.jpg');
INSERT INTO `simple_recommendation` VALUES ('207703', 'Kingsman: The Secret Service', '7.07561', '7.60', '6069', '/8x7ej0LnHdKUqilNNJXYOeyB6L9.jpg');
INSERT INTO `simple_recommendation` VALUES ('210577', 'Gone Girl', '7.29282', '7.90', '6023', '/gdiLTof3rbPDAmPaCf4g6op46bj.jpg');
INSERT INTO `simple_recommendation` VALUES ('222935', 'The Fault in Our Stars', '6.88493', '7.60', '3868', '/sc6XLX6J714LDkVV3Ys3clgypQS.jpg');
INSERT INTO `simple_recommendation` VALUES ('228150', 'Fury', '6.77367', '7.40', '4028', '/pfte7wdMobMF4CVHuOxyu6oqeeA.jpg');
INSERT INTO `simple_recommendation` VALUES ('242582', 'Nightcrawler', '6.83527', '7.60', '3475', '/8oPY6ULFOTbAEskySNhgsUIN4fW.jpg');
INSERT INTO `simple_recommendation` VALUES ('244786', 'Whiplash', '7.4072', '8.30', '4376', '/lIv1QinFqz4dlp5U4lQ6HaiskOZ.jpg');
INSERT INTO `simple_recommendation` VALUES ('245891', 'John Wick', '6.60731', '7.00', '5499', '/5vHssUeVe25bMrof1HyaPyWgaP.jpg');
INSERT INTO `simple_recommendation` VALUES ('259316', 'Fantastic Beasts and Where to Find Them', '6.75696', '7.20', '5612', '/gri0DDxsERr6B2sOR1fGLxLpSLx.jpg');
INSERT INTO `simple_recommendation` VALUES ('263115', 'Logan', '7.09049', '7.60', '6310', '/gGBu0hKw9BGddG8RkRAMX7B6NDB.jpg');
INSERT INTO `simple_recommendation` VALUES ('264644', 'Room', '7.0208', '8.10', '2838', '/eqFckcHuFCT1FrzLOAvXBb4jHwq.jpg');
INSERT INTO `simple_recommendation` VALUES ('264660', 'Ex Machina', '6.98579', '7.60', '4862', '/btbRB7BrD887j5NrvjxceRDmaot.jpg');
INSERT INTO `simple_recommendation` VALUES ('266856', 'The Theory of Everything', '6.94722', '7.80', '3403', '/4jspr8hLLuju59bCnMiefzRW4p0.jpg');
INSERT INTO `simple_recommendation` VALUES ('269149', 'Zootopia', '7.06373', '7.70', '4961', '/sM33SANp9z6rXW8Itn7NnG1GOEs.jpg');
INSERT INTO `simple_recommendation` VALUES ('271110', 'Captain America: Civil War', '6.76457', '7.10', '7462', '/kSBXou5Ac7vEqKd97wotJumyJvU.jpg');
INSERT INTO `simple_recommendation` VALUES ('273248', 'The Hateful Eight', '6.9432', '7.60', '4405', '/fqe8JxDNO8B8QfOGTdjh6sPCdSC.jpg');
INSERT INTO `simple_recommendation` VALUES ('273481', 'Sicario', '6.4571', '7.20', '2465', '/p2SdfGmQRaw8xhFbexlHL7srMM8.jpg');
INSERT INTO `simple_recommendation` VALUES ('277834', 'Moana', '6.65062', '7.30', '3471', '/z4x0Bp48ar3Mda8KiPD1vwSY3D8.jpg');
INSERT INTO `simple_recommendation` VALUES ('281957', 'The Revenant', '6.87991', '7.30', '6558', '/oXUWEc5i3wYyFnL1Ycu8ppxxPvs.jpg');
INSERT INTO `simple_recommendation` VALUES ('283995', 'Guardians of the Galaxy Vol. 2', '6.98545', '7.60', '4858', '/y4MBh0EjBlMuOzv9axM4qJlmhzz.jpg');
INSERT INTO `simple_recommendation` VALUES ('284052', 'Doctor Strange', '6.69877', '7.10', '5880', '/4PiiNGXj1KENTmCBHeN6Mskj2Fq.jpg');
INSERT INTO `simple_recommendation` VALUES ('286217', 'The Martian', '7.1504', '7.60', '7442', '/5aGhaIHYuQbqlHWvWYqMCnj40y2.jpg');
INSERT INTO `simple_recommendation` VALUES ('293660', 'Deadpool', '7.11449', '7.40', '11444', '/inVq3FRqcYIRl2la8iZikYYxFNR.jpg');
INSERT INTO `simple_recommendation` VALUES ('296096', 'Me Before You', '6.7092', '7.60', '2674', '/oN5lELHH5Xheiy0YdhnY3JB4hx2.jpg');
INSERT INTO `simple_recommendation` VALUES ('296098', 'Bridge of Spies', '6.48301', '7.20', '2633', '/xPCNA8zJxyyFKTj47QpvkXHukzB.jpg');
INSERT INTO `simple_recommendation` VALUES ('297762', 'Wonder Woman', '6.72089', '7.20', '5025', '/imekS7f1OuHyUP2LAiTEM0zBzUz.jpg');
INSERT INTO `simple_recommendation` VALUES ('313369', 'La La Land', '7.18084', '7.90', '4745', '/ylXCdC106IKiarftHkcacasaAcb.jpg');
INSERT INTO `simple_recommendation` VALUES ('314365', 'Spotlight', '6.83457', '7.80', '2751', '/ngKxbvsn9Si5TYVJfi1EGAGwThU.jpg');
INSERT INTO `simple_recommendation` VALUES ('318846', 'The Big Short', '6.54487', '7.30', '2679', 'No image');
INSERT INTO `simple_recommendation` VALUES ('321612', 'Beauty and the Beast', '6.46553', '6.80', '5530', '/tWqifoYuwLETmmasnGHO7xBjEtt.jpg');
INSERT INTO `simple_recommendation` VALUES ('324786', 'Hacksaw Ridge', '6.93026', '7.80', '3294', '/bndiUFfJxNd2fYx8XO610L9a07m.jpg');
INSERT INTO `simple_recommendation` VALUES ('329865', 'Arrival', '6.76351', '7.20', '5729', '/hLudzvGfpi6JlwUnsNhXwKKg4j.jpg');
INSERT INTO `simple_recommendation` VALUES ('330459', 'Rogue One: A Star Wars Story', '6.86665', '7.40', '5111', '/qjiskwlV1qQzRCjpV0cL9pEMF9a.jpg');
INSERT INTO `simple_recommendation` VALUES ('374720', 'Dunkirk', '6.66073', '7.50', '2712', '/bOXBV303Fgkzn2K4FeKDc0O31q4.jpg');
INSERT INTO `simple_recommendation` VALUES ('381288', 'Split', '6.54598', '7.00', '4461', '/rXMWOZiCt6eMX22jWuTOSdQ98bY.jpg');
INSERT INTO `simple_recommendation` VALUES ('419430', 'Get Out', '6.53092', '7.20', '2978', '/1SwAVYpuLj8KsHxllTF8Dt9dSSX.jpg');
