-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour recettes_hafida
CREATE DATABASE IF NOT EXISTS `recettes_hafida` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recettes_hafida`;

-- Listage de la structure de table recettes_hafida. category
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table recettes_hafida.category : ~3 rows (environ)
INSERT INTO `category` (`id_category`, `category_name`) VALUES
	(1, 'Entree'),
	(2, 'Plat'),
	(3, 'Dessert');

-- Listage de la structure de table recettes_hafida. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(100) NOT NULL DEFAULT '0',
  `unity` varchar(100) NOT NULL DEFAULT '0',
  `price` float NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Listage des données de la table recettes_hafida.ingredient : ~31 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `ingredient_name`, `unity`, `price`) VALUES
	(1, 'salade', '1', 1),
	(2, 'tomates', '1', 0.9),
	(3, 'avocat', '1', 1.5),
	(4, 'oeuf', '1', 0.5),
	(5, 'mozzarella', '1', 1),
	(6, 'boite de thon', '1', 2),
	(7, 'pomme de terre', '1', 0.5),
	(8, 'pate', '100', 0.5),
	(9, 'pomme', '1', 1),
	(10, 'beurre', '100', 0.3),
	(11, 'farine', '100', 0.3),
	(12, 'fromage rape', '100', 0.5),
	(13, 'puree de tomate', '100', 0.5),
	(14, 'oignons', '1', 0.5),
	(15, 'carotte', '1', 0.3),
	(16, 'gousse d\'ail', '1', 1),
	(17, 'branche de céleri', '1', 1),
	(18, 'boeuf hache', '100', 1),
	(19, 'lait', '100', 0.2),
	(20, 'paquet de laqagnes', '1', 3),
	(21, 'sel', '1', 0.1),
	(22, 'poivre', '1', 0.1),
	(23, 'creme liquidde', '100', 0.2),
	(24, 'sucre', '100', 0.5),
	(25, 'pate brisee', '1', 2),
	(26, 'gousse vanille', '1', 1),
	(27, 'maizena', '100', 0.3),
	(28, 'banane', '1', 0.2),
	(29, 'kiwi', '1', 0.5),
	(30, 'orange', '1', 0.2),
	(31, 'clementine', '1', 0.5);

-- Listage de la structure de table recettes_hafida. recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `id_recipe` int NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(200) NOT NULL,
  `preparation_time` int NOT NULL DEFAULT '0',
  `instructions` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_recipe`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `FK_recipe_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Listage des données de la table recettes_hafida.recipe : ~10 rows (environ)
INSERT INTO `recipe` (`id_recipe`, `recipe_name`, `preparation_time`, `instructions`, `id_category`) VALUES
	(1, 'Salade tomate thon oeuf', 20, 'Faites bouillir de l’eau dans une casserole légèrement vinaigrée. Déposez-y délicatement les oeufs et laissez les cuire 8 ou 9 minutes. Refroidissez-les dans de l’eau froide et écalez-les.\r\nPelez les tomates, coupez-les en tranches et mettez-les dans du papier absorbant pour qu’elles contiennent le moins d’eau possible.\r\nRépartissez-les dans une assiette ou un plat.\r\nPréparez la vinaigrette. Mettez-en la moitié sur le thon avec l’échalote émincée et l’autre sur les tomates.\r\nAjoutez dans les assiettes le thon et les oeufs coupés en deux ou en quatre.\r\nSaupoudrez de persil.', 1),
	(2, 'Salade pomme de terre au thon', 35, 'cuire les pommes de terres à l\'eau salée pendant environ 20-25 min.\r\nEcrasez le thon dans le fond d\'un saladier en y incorporant l\'échalote coupée en petits morceaux (le plus fin possible), la ciboulette, le jus de citron et la crème fraîche.\r\nMélangez bien le tout.\r\nCoupez en dés les pommes de terre pelées et mélangez-les à la farce de thon.', 1),
	(3, 'Salade de pâtes au thon', 40, 'ÉTAPE 1\r\nÉplucher le concombre et le couper en petits dés. Le mettre dans un grand saladier. Laver les tomates, les couper en petits dés et les ajouter dans le saladier.\r\nÉTAPE 2\r\nOuvrir le pot de maïs, l’égoutter dans l’évier et le verser également dans le saladier dans la même proportion que le reste (il ne faut pas mettre toute la boîte).\r\nÉTAPE 3\r\nCuire les pâtes dans de l’eau légèrement salée et dans laquelle on aura versé un filet d’huile d’olive. Lorsqu’elles sont cuites, égoutter les pâtes, les laisser un peu refroidir, puis les ajouter au reste de la préparation. Mélanger.\r\nÉTAPE 4\r\nOuvrir la boîte de thon, l’égoutter puis l’émietter dans sa boîte à l’aide d’un petit couteau. L’incorporer au fur et à mesure au reste de la salade.\r\nÉTAPE 5\r\nBien mélanger le tout et y ajouter de la mayonnaise juste avant de servir.\r\n\r\nA\r\nAnia\r\nNote de l\'auteur :\r\n\r\n« Il s’agit d’une salade qui se déguste froide (donc parfaite en été lorsqu’il fait chaud). Cette salade est encore meilleure si elle est préparée la veille. Elle se conserve sans problème un jour ou deux, mais il vaut toujours mieux ne rajouter la mayonnaise qu\'au moment de servir pour éviter qu\'elle ne \'tourne\'. »\r\nLa suite après cette publicité\r\n\r\n', 1),
	(4, 'Salade avocat pomme mozzarella', 15, 'ÉTAPE 1\r\nCouper les tomates, les avocats, la mozzarella et la pomme en cubes.\r\nÉTAPE 2\r\nMélanger le tout sans oublier d\'ajouter le jus des tomates coupées.\r\nÉTAPE 3\r\nAjouter un filet d\'huile d\'olive.', 1),
	(5, 'Lasagnes à la bolognaise', 120, 'ÉTAPE 1\r\nFaire revenir gousses hachées d\'ail et les oignons émincés dans un peu d\'huile d\'olive.\r\nÉTAPE 2\r\nAjouter la carotte et la branche de céleri hachée puis la viande et faire revenir le tout.\r\nÉTAPE 3\r\nAjouter la purée de tomates, l\'eau et les herbes. Saler, poivrer, puis laisser mijoter à feu doux 45 minutes.\r\nÉTAPE 4\r\nPréparer la béchamel : faire fondre 100 g de beurre.\r\nÉTAPE 5\r\nHors du feu, ajouter la farine d\'un coup.\r\nÉTAPE 6\r\nRemettre sur le feu et remuer avec un fouet jusqu\'à l\'obtention d\'un mélange bien lisse.', 2),
	(6, 'Hachis parmentier', 45, 'ÉTAPE 1\r\nHacher l\'oignon et l\'ail. Les faire revenir dans le beurre jusqu\'à ce qu\'ils soient tendres.\r\nÉTAPE 2\r\nAjouter les tomates coupées en dés, la viande hachée, la farine, du sel, du poivre et les herbes de Provence.\r\nÉTAPE 3\r\nQuand tout est cuit, couper le feu et ajouter le jaune d\'oeuf et un peu de parmesan. Bien mélanger.\r\nÉTAPE 4\r\nPréchauffer le four à 200°C (thermostat 6-7). Etaler au fond du plat à gratin. Préparer la purée. L\'étaler au dessus de la viande. Saupoudrer de fromage râpé et faire gratiner.', 2),
	(7, 'Gratin dauphinois', 90, 'ÉTAPE 1\r\nPréchauffer le four à 150°C (thermostat 5).\r\nÉTAPE 2\r\nEplucher et couper les pommes de terres en rondelles. Presser l\'ail.\r\nÉTAPE 3\r\nNapper le fond d\'un plat à gratin de crème.\r\nÉTAPE 4\r\nAlterner une couche de pommes de terres, crème, ail, sel, poivre.\r\nÉTAPE 5\r\njusqu\'à épuisement des ingrédients.\r\nÉTAPE 6\r\nTerminer en nappant de crème, sel, poivre.\r\nÉTAPE 7\r\nMettre au four pendant au moins une heure. Plus la température est basse et le temps de cuisson long, plus les pommes seront fondantes...\r\n', 2),
	(8, 'Gateau au chocolat', 40, 'ÉTAPE 1\r\nPréchauffez votre four à 180°C (thermostat 6). Dans une casserole, faites fondre le chocolat et le beurre coupé en morceaux à feu très doux.\r\nÉTAPE 2\r\nDans un saladier, ajoutez le sucre, les oeufs, la farine. Mélangez.\r\nÉTAPE 3\r\nAjoutez le mélange chocolat/beurre. Mélangez bien.\r\nÉTAPE 4\r\nBeurrez à l\'aide d\'une feuille de papier essuie-tout et farinez votre moule puis y versez la pâte à gâteau.\r\nÉTAPE 5\r\nFaites cuire au four environ 20 minutes.\r\nÉTAPE 6\r\nA la sortie du four le gâteau ne paraît pas assez cuit. C\'est normal, laissez-le refroidir puis démoulez- le.', 3),
	(9, 'Flan patissier', 60, 'ÉTAPE 1\r\nFaire bouillir le lait avec la gousse de vanille fendue (dans le sens de la longueur).\r\nÉTAPE 2\r\nPendant ce temps, mélanger la Maïzena (tamisée, c\'est mieux) avec le sucre.\r\nÉTAPE 3\r\net ajouter les oeufs bien battus.\r\nÉTAPE 4\r\nMélanger le tout (bien homogène)\r\nÉTAPE 5\r\net ajouter le lait bouillant (sans la gousse).\r\nÉTAPE 6\r\nCuire la préparation à feu doux sans cesser de remuer pendant environ 1 à 2 min\r\nÉTAPE 7\r\nPréchauffer le four à 200°C (thermostat 6-7). Foncer un plat rectangulaire ou rond préalablement beurré avec la pâte brisée.\r\nÉTAPE 8\r\nPiquer le fond.\r\nÉTAPE 9\r\nY verser la préparation.\r\nÉTAPE 10\r\nLisser la surface.\r\nÉTAPE 11\r\nCuire pendant environ 30 à 40 min.\r\nÉTAPE 12\r\nLaisser refroidir.', 3),
	(10, 'Salade de fruits', 25, 'ÉTAPE 1\r\nCouper les fruits en fines lamelles ou en petits dés (selon votre choix esthétique !).\r\nÉTAPE 2\r\nAjouter le tout dans un grand saladier.\r\nÉTAPE 3\r\nPresser ensuite les oranges et ajouter le jus dans la salade.\r\nÉTAPE 4\r\nMettre au frais 10 min.', 3);

-- Listage de la structure de table recettes_hafida. recipe_ingredients
CREATE TABLE IF NOT EXISTS `recipe_ingredients` (
  `quantity` float NOT NULL,
  `id_ingredient` int NOT NULL,
  `id_recipe` int NOT NULL,
  KEY `FK_recipe_ingredients_ingredient` (`id_ingredient`),
  KEY `FK_recipe_ingredients_recipe` (`id_recipe`),
  CONSTRAINT `FK_recipe_ingredients_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_recipe_ingredients_recipe` FOREIGN KEY (`id_recipe`) REFERENCES `recipe` (`id_recipe`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table recettes_hafida.recipe_ingredients : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
