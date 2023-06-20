import mysql.connector

# Remplacez ces valeurs par les informations de connexion à votre base de données
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="example",
    database="ikeo"
)

cursor = db.cursor()

# Récupère la liste des tables de la base de données
cursor.execute("SHOW TABLES")
tables = cursor.fetchall()

# Parcoure chaque table et affiche sa définition
for (table_name,) in tables:
    cursor.execute(f"SHOW CREATE TABLE {table_name}")
    table_definition = cursor.fetchone()[1]
    print(f"Table {table_name}:\n{table_definition}\n")

