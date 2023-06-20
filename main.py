import mysql.connector
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="example",
    database="ikeo"
)
cursor = db.cursor()

 #Afficher les noms et descriptions de tous les produits:
cursor.execute("SELECT nom, descript FROM produits;")
print("exo1:description des produit")
print(cursor.fetchall())

#Aficher tous les meubles qui sont abandonnés:
print("exo2:meuble abandonnés")
cursor.execute("SELECT id,nom FROM produits WHERE abandonne = True;")
print(cursor.fetchall())

#Effacer le Bo Meuble de Brest:
#cursor.execute("DELETE FROM clients WHERE raison_sociale = 'Bo Meuble' AND ville = 'Brest';")
#print(cursor.fetchall())

#Il y a une erreur sur le nom du meuble Apfelgluk, il faut le réécrire Apfelgluck:
#cursor.execute("UPDATE produits SET nom = 'Apfelgluck' WHERE nom = 'Apfelgluk';")
#print(cursor.fetchall())

#Ajouter un nouveau client: Tout à la maison, Place Terreaux, Lyon:
#cursor.execute("INSERT INTO clients (type_client, raison_sociale, adresse, ville, pays) VALUES ('Magasin', 'Tout à la maison', 'Place Terreaux', 'Lyon', 'France');")
#print(cursor.fetchall())

#Ajouter une nouvelle facture pour le Tout à la maison de Lyon, enregistrée le 28/08/2018, à 18h. La commande est composée de 18 Naess:
#cursor.execute("SELECT nom, descript FROM produits;")
#produit = cursor.fetchall()

# Récupère l'ID du client Tout à la maison de Lyon
#print("exoi3:id de maison de lyon")
#cursor.execute("SET @client_id = (SELECT id FROM clients WHERE raison_sociale = 'Tout à la maison' AND ville = 'Lyon');")
#print(cursor.fetchall())


# Récupère l'ID du produit Naess
#print("exo4:id de Naess")
#cursor.execute("SET @produit_id = (SELECT id FROM produits WHERE nom = 'Naess');")
#print(cursor.fetchall())

#-- Insère la nouvelle facture
#cursor.execute("INSERT INTO factures (numero, date_facture, client, produit, quantite) VALUES ('MSQ298', '2018-08-28 18:00:00', @client_id, @produit_id, 18);")
#print(cursor.fetchall())

#Retrouver tous les meubles achetés par le Bo Meuble de Paris:
print("exo5:meuble achetés par bo meuble Paris")
cursor.execute("SELECT p.nom FROM produits p JOIN factures f ON p.id = f.produit JOIN clients c ON f.client = c.id WHERE c.raison_sociale = 'Bo Meuble' AND c.ville = 'Paris';")
print(cursor.fetchall())

#Retrouver toutes les factures enregistrées depuis le 1er juillet 2018:
print("exo6:facture depuit juillet 2018")
cursor.execute("SELECT f.numero, f.date_facture, c.raison_sociale AS client, p.nom AS produit, f.quantite FROM factures f JOIN clients c ON f.client = c.id JOIN produits p ON f.produit = p.id WHERE f.date_facture >= '2018-07-01';")
print(cursor.fetchall())

