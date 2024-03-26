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


/*9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)*/

SELECT 








