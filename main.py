import streamlit as st
import pandas as pd
from data.db_connection import create_connection
# from assets.css.custom_css import load_css
import seaborn as sns
import matplotlib.pyplot as plt

# load_css()

connection = create_connection()
mycursor = connection.cursor()

st.title("IKEO")

mycursor.execute('''SELECT p.id, p.nom, p.ref, p.descript, p.abandonne, sdp.usine, sdp.adresse, sdp.ville FROM produits p 
JOIN sites_produits sp ON sp.produit_id = p.id
JOIN sites_de_production sdp ON sp.site_id = sdp.id; ''')
result = mycursor.fetchall()
df = pd.DataFrame(result, columns=mycursor.column_names)
selected_line = st.selectbox('Sélectionnez une usine', df['usine'].unique())
filtered_df = df[df['usine'] == selected_line]
st.dataframe(filtered_df)

mycursor.execute('''SELECT produits.nom AS nom_produit, factures.numero, factures.date_facture, clients.raison_sociale, factures.quantite
FROM factures
JOIN produits ON factures.produit_id = produits.id
JOIN clients ON factures.client_id = clients.id
ORDER BY produits.nom; ''')
result = mycursor.fetchall()
df = pd.DataFrame(result, columns=mycursor.column_names)
plt.figure(figsize=(15, 5))
sns.barplot(x='nom_produit', y='quantite', data=df)
plt.xlabel('Nom Produit')
plt.ylabel('Quantité')
plt.title('Graphique des commandes par produits')
st.pyplot()

mycursor.execute('''SELECT c.raison_sociale, f.numero, f.date_facture, p.nom AS nom_produit, f.quantite
FROM factures f
JOIN clients c ON f.client_id = c.id
JOIN produits p ON f.produit_id = p.id
ORDER BY c.raison_sociale; ''')
result = mycursor.fetchall()
df = pd.DataFrame(result, columns=mycursor.column_names)

plt.figure(figsize=(15, 5))
sns.barplot(x='raison_sociale', y='quantite', data=df)
plt.xlabel('Raison sociale')
plt.ylabel('Quantité')
plt.title('Graphique des commandes par clients')
st.pyplot()