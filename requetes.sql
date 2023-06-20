-- Voici les requêtes à tester sur la base :

-- Afficher les noms et descriptions de tous les produits✅
SELECT nom,descript FROM `produits`;

-- Afficher tous les meubles qui sont abandonnés✅
SELECT * FROM `produits` WHERE abandonne = TRUE;

-- Effacer le Bo Meuble de Brest✅
DELETE FROM clients
WHERE raison_sociale= 'Bo Meuble'
AND ville = 'Brest'

-- Il y a une erreur sur le nom du meuble Apfelgluk, il faut le réécrire Apfelgluck✅
UPDATE produits
SET nom = 'Apfelgluck'
WHERE nom = 'Apfelgluk'

-- Ajouter un nouveau client : Tout à la maison, Place Terreaux, Lyon✅
INSERT INTO clients (type, raison_sociale, adresse, ville, pays)
VALUES ('Magasin', 'Tout à la maison', 'Place Terreaux', 'Lyon', 'France')

-- Ajouter une nouvelle facture pour le tout à la maison de Lyon , enregistré le 28/08/2018, à 18h. La commande est composé de 18 Naess✅
INSERT INTO facture (numero, date, client, produit, quantite)
VALUES (MSQ298, '2018-07-23 18:00:00', 'Tout à la maison, Place Terreaux, Lyon', 'Naess', 18)

-- Retrouvez tous les meubles achetés par le Bo Meuble de Paris✅
SELECT p.nom
FROM produits p
JOIN factures f ON f.produit LIKE '%' || p.nom || '%'
JOIN clients c ON f.client LIKE '%' || c.raison_sociale || '%'
WHERE c.raison_sociale = 'Bo Meuble' AND c.ville = 'Paris'

-- Retrouvez toutes les factures enregistrées depuis le 1er juillet 2018✅
SELECT * FROM factures WHERE date_facture >= '2018-07-01'

-- Afficher le nombre de commandes par meubles✅
SELECT p.nom, COUNT(f.numero) AS nombre_commandes
FROM produits p 
LEFT JOIN factures f ON f.produit LIKE '%' || p.nom || '%'
GROUP BY p.nom;

-- Afficher le nombre de commandes par clients✅
SELECT c.raison_sociale, COUNT(f.numero) AS nombre_commandes
FROM clients c 
LEFT JOIN factures f ON f.client LIKE '%' || c.raison_sociale || '%'
GROUP BY c.raison_sociale