-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mar. 20 juin 2023 à 08:16
-- Version du serveur : 8.0.33
-- Version de PHP : 8.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ikeo`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `type_client` varchar(50) DEFAULT NULL,
  `raison_sociale` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `type_client`, `raison_sociale`, `adresse`, `ville`, `pays`) VALUES
(1, 'Magasin', 'Bo Meuble', 'Place Vendôme', 'Paris', 'France'),
(2, 'Magasin', 'Mobel', 'Porte de Brandebourg', 'Berlin', 'Allemagne'),
(3, 'Magasin', 'Bo Meuble', 'Rue Jean Jaurès', 'Brest', 'France'),
(4, 'Magasin', 'Tout A La Maison', 'Rue de la Bastille', 'Paris', 'France'),
(5, 'Magasin', 'Bo Meuble', 'Avenue des Trois Dragons', 'Barcelone', 'Espagne'),
(6, 'Central d\'achat', 'The World Compagny', 'Oxford street', 'Londres', 'Angleterre'),
(7, 'Magasin', 'The Best Greatest Beautifulest Furniture', 'Coven Garden', 'Londres', 'Angleterre');

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

CREATE TABLE `factures` (
  `id` int NOT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `date_facture` date DEFAULT NULL,
  `client` varchar(100) DEFAULT NULL,
  `produit` varchar(255) DEFAULT NULL,
  `quantite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `factures`
--

INSERT INTO `factures` (`id`, `numero`, `date_facture`, `client`, `produit`, `quantite`) VALUES
(1, 'MSQ291', '2018-06-15', 'Bo Meuble, place Vendôme, Paris', 'Knutsen', 20),
(2, 'MSQ291', '2018-06-15', 'Bo Meuble, place Vendôme, Paris', 'Moen', 30),
(3, 'MSQ291', '2018-06-15', 'Bo Meuble, place Vendôme, Paris', 'Eide', 10),
(4, 'MSQ292', '2018-06-23', 'Bo Meuble, Avenue des Trois Dragons, Barcelonne', 'Ruud', 25),
(5, 'MSQ292', '2018-06-23', 'Bo Meuble, Avenue des Trois Dragons, Barcelonne', 'Gulbrandsen', 32),
(6, 'MSQ293', '2018-06-23', 'The World Compagny, Oxford Street, Londres', 'Eide', 80),
(7, 'MSQ293', '2018-06-23', 'The World Compagny, Oxford Street, Londres', 'Naess', 70),
(8, 'MSQ293', '2018-06-23', 'The World Compagny, Oxford Street, Londres', 'Lund', 60),
(9, 'MSQ293', '2018-06-23', 'The World Compagny, Oxford Street, Londres', 'Gulbrandsen', 60),
(10, 'MSQ293', '2018-06-23', 'The World Compagny, Oxford Street, Londres', 'Apfelgluk', 120),
(11, 'MSQ293', '2018-06-23', 'The World Compagny, Oxford Street, Londres', 'Dahl', 90),
(12, 'MSQ294', '2018-06-28', 'Bo Meuble, place Vendôme, Paris', 'Knutsen', 10),
(13, 'MSQ294', '2018-06-28', 'Bo Meuble, place Vendôme, Paris', 'Moen', 10),
(14, 'MSQ294', '2018-06-28', 'Bo Meuble, place Vendôme, Paris', 'Lund', 30),
(15, 'MSQ295', '2018-07-01', 'Tout A La Maison, rue de la Bastille, Paris', 'Knutsen', 25),
(16, 'MSQ295', '2018-07-01', 'Tout A La Maison, rue de la Bastille, Paris', 'Dahl', 34),
(17, 'MSQ296', '2018-07-04', 'The Best Greatest Beautifulest Furniture, Coven Garden, Londres', 'Moen', 40),
(18, 'MSQ296', '2018-07-04', 'The Best Greatest Beautifulest Furniture, Coven Garden, Londres', 'Naess', 38),
(19, 'MSQ296', '2018-07-04', 'The Best Greatest Beautifulest Furniture, Coven Garden, Londres', 'Lund', 54),
(20, 'MSQ297', '2018-07-12', 'Mobel, Porte de Brandebourg, Berlin', 'Gulbrandsen', 20),
(21, 'MSQ297', '2018-07-12', 'Mobel, Porte de Brandebourg, Berlin', 'Naess', 34),
(22, 'MSQ297', '2018-07-12', 'Mobel, Porte de Brandebourg, Berlin', 'Lund', 45);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `abandonne` tinyint(1) DEFAULT NULL,
  `usine` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `ref`, `descript`, `abandonne`, `usine`) VALUES
(1, 'Knutsen', 'OANT72', 'Table basse pour poser les bières', 0, 'Harald,Sverre'),
(2, 'Moen', 'OANT34', 'Chaise haute de bar', 1, 'Harald,Sverre'),
(3, 'Eide', 'OANT67', 'Porte-serviettes pour 100 serviettes', 0, 'Harald,Olaf'),
(4, 'Gulbrandsen', 'LXAL34', 'Lit nuage en lévitation', 0, 'Olaf'),
(5, 'Naess', 'LXAL56', 'Table 128 convives', 0, 'Haral,Sverre,Olaf'),
(6, 'Lund', 'LXAL78', 'Bureau-cafetière électrique', 0, 'Haral,Olaf'),
(7, 'Dahl', 'LXAL12', 'Tiroir à ronds de serviette', 1, 'Sverre,Olaf'),
(8, 'Ruud', 'OANT90', 'Bureau-lit conbiné', 0, 'Olaf'),
(9, 'Apfelgluk', 'OANT12', 'Panier à chien (ou à chat)', 0, 'Olaf');

-- --------------------------------------------------------

--
-- Structure de la table `sites_de_production`
--

CREATE TABLE `sites_de_production` (
  `id` int NOT NULL,
  `usine` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sites_de_production`
--

INSERT INTO `sites_de_production` (`id`, `usine`, `adresse`, `ville`) VALUES
(1, 'Harald', 'Quai Pipervika', 'Oslo'),
(2, 'Sverre', 'Rue Strangehagen', 'Bergen'),
(3, 'Olaf', 'Place Nidaros', 'Trondheim');

-- --------------------------------------------------------

--
-- Structure de la table `sites_produits`
--

CREATE TABLE `sites_produits` (
  `produit_id` int DEFAULT NULL,
  `site_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sites_de_production`
--
ALTER TABLE `sites_de_production`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sites_produits`
--
ALTER TABLE `sites_produits`
  ADD KEY `site_id` (`site_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `factures`
--
ALTER TABLE `factures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `sites_de_production`
--
ALTER TABLE `sites_de_production`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `sites_produits`
--
ALTER TABLE `sites_produits`
  ADD CONSTRAINT `sites_produits_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `sites_de_production` (`id`),
  ADD CONSTRAINT `sites_produits_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
