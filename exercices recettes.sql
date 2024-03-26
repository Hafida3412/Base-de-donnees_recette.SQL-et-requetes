/*1- Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées 
de façon décroissante sur la durée de réalisation*/

SELECT recipe_name, preparation_time FROM recipe ORDER BY preparation_time DESC

/*2- En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.*/

SELECT * FROM recipe
INNER JOIN recipe_ingredients 
ON recipe.id_recipe = recipe_ingredients.id_recipe

/*3- Afficher les recettes qui nécessitent au moins 30 min de préparation*/

SELECT *
FROM recipe
WHERE preparation_time BETWEEN 0 AND 30

/*4- Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en 
question)*/

SELECT *
FROM ingredient
WHERE ingredient_name LIKE '%salade'

/*5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec 
les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de 
pouvoir lister les détails de cette recettes (ingrédients)*/


/*6- Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre 
convenance)*/

UPDATE recipe
SET recipe_name = ' Salade océane'
WHERE id_recipe = 3


/*7- Supprimer la recette n°2 de la base de données*/

DELETE FROM `recipe`
WHERE `id_recipe` = 2  


/*8- Afficher le prix total de la recette n°5 */

/*********IL FAUT D ABORD AFFICHER TOUS LES ELEMENTS AVEC UN INNER JOIN*/

SELECT * FROM ingredient
INNER JOIN recipe_ingredients
ON ingredient.id_ingredient = recipe_ingredients.id_ingredient
INNER JOIN recipe
ON recipe.id_recipe = recipe_ingredients.id_recipe

/********ENSUITE CALCULER LA PRIX TOTAL DE LA RECETTE*****************/

SELECT recipe_ingredients.id_recipe, SUM(price*quantity)
FROM ingredient
INNER JOIN recipe_ingredients
ON ingredient.id_ingredient = recipe_ingredients.id_ingredient
INNER JOIN recipe
ON recipe.id_recipe = recipe_ingredients.id_recipe
GROUP BY id_recipe


/**************9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)*/

SELECT ingredient_name AS ingredient, recipe_ingredients.quantity, ingredient.prix
FROM recipe_ingredients
JOIN ingredient ON recipe_ingredients.id_ingredient = id_ingredient
WHERE recipe_ingredients.id_recipe = 5

/*10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €*/






/*11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance)*/

UPDATE ingredient SET price = 2
WHERE id_ingredient = 12

/*12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts*/

SELECT category, COUNT(*) AS nombre_recipe
FROM recipe GROUP BY category

/*13- Afficher les recettes qui contiennent l’ingrédient « Poulet »*/

SELECT * FROM recipe WHERE ingredient LIKE '%poulet%'

/*14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes */

UPDATE recipe SET preparation_time = preparation_time - 5


/*15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure*/

SELECT * FROM recipe WHERE NOT EXISTS (SELECT * FROM ingredient WHERE recipe_ingredients_id 
AND ingredient.price_unity > 2)


/*16- Afficher la / les recette(s) les plus rapides à préparer*/

SELECT nom_recipe, preparation_time
FROM recipe
ORDER BY preparation_time


/*17- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau 
chaude qui consiste à verser de l’eau chaude dans une tasse)*/

SELECT * FROM recipe WHERE id NOT IN (SELECT id_recipe FROM ingredient)

/*18- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes*/

SELECT ingredient FROM recipe GROUP BY ingredient HAVING COUNT(*) >= 3

/*19- Ajouter un nouvel ingrédient à une recette spécifique*/

INSERT INTO recipe_ingredients(id_recipe, id_ingredient)
VALUES (id_recipe, id_ingredient)

/*Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est 
donc exclu d’utiliser la clause LIMIT)*/

SELECT * FROM recipe WHERE price = (SELECT MAX(price) FROM recipe)











