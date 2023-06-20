import mysql.connector

# Configuration connexion à la bdd
def create_connection():
    config = {
    "host":"localhost",
    "port":"3307",
    "user":"admin_ikeo",
    "password":"YfvS674t9F7Hvm",
    "database":"ikeo"
    }

    connection = mysql.connector.connect(**config)

    return connection