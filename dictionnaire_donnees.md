# Dictionnaire des données

## TABLE Client  :
ID,
Type de client,
Raison sociale,
Adresse,
Ville,
Pays,

## TABLE Facture  :
ID,
Numéro,
Date de facture,
Client,
Produit,
Quantité,

## TABLE Employé  :
ID,
Nom,
Prénom,
Poste,
Département,
Date d'embauche,

## TABLE Produit  :
ID,
Nom du produit,
Description,
Prix unitaire,
Stock disponible,


# Dépendances fonctionnelles

## Table factures :
client_id dépend de id dans la table clients.
produit_id dépend de id dans la table produits.

## Table sites_produits :
produit_id dépend de id dans la table produits.
site_id dépend de id dans la table sites_de_production.
