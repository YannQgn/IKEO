CREATE TABLE `clients` (
  `id` int NOT NULL,
  `type_client` varchar(50) DEFAULT NULL,
  `raison_sociale` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `clients` (`id`, `type_client`, `raison_sociale`, `adresse`, `ville`, `pays`) VALUES
(1, 'Magasin', 'Bo Meuble', 'Place Vendôme', 'Paris', 'France'),
(2, 'Magasin', 'Mobel', 'Porte de Brandebourg', 'Berlin', 'Allemagne'),
(3, 'Magasin', 'Bo Meuble', 'Rue Jean Jaurès', 'Brest', 'France'),
(4, 'Magasin', 'Tout A La Maison', 'Rue de la Bastille', 'Paris', 'France'),
(5, 'Magasin', 'Bo Meuble', 'Avenue des Trois Dragons', 'Barcelone', 'Espagne'),
(6, 'Central dachat', 'The World Compagny', 'Oxford street', 'Londres', 'Angleterre'),
(7, 'Magasin', 'The Best Greatest Beautifulest Furniture', 'Coven Garden', 'Londres', 'Angleterre');

CREATE TABLE `factures` (
  `id` int NOT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `date_facture` date DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `produit_id` int DEFAULT NULL,
  `quantite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `factures` (`id`, `numero`, `date_facture`, `client_id`, `produit_id`, `quantite`) VALUES
(1, 'MSQ291', '2018-06-15', 1, 1, 20),
(2, 'MSQ291', '2018-06-15', 1, 2, 30),
(3, 'MSQ291', '2018-06-15', 1, 3, 10),
(4, 'MSQ292', '2018-06-23', 5, 8, 25),
(5, 'MSQ292', '2018-06-23', 4, 4, 32),
(6, 'MSQ293', '2018-06-23', 6, 3, 80),
(7, 'MSQ293', '2018-06-23', 6, 5, 70),
(8, 'MSQ293', '2018-06-23', 6, 6, 60),
(9, 'MSQ293', '2018-06-23', 6, 8, 60),
(10, 'MSQ293', '2018-06-23', 6, 9, 120),
(11, 'MSQ293', '2018-06-23', 7, 7, 90),
(12, 'MSQ294', '2018-06-28', 1, 1, 10),
(13, 'MSQ294', '2018-06-28', 1, 2, 10),
(14, 'MSQ294', '2018-06-28', 1, 6, 30),
(15, 'MSQ295', '2018-07-01', 4, 1, 25),
(16, 'MSQ295', '2018-07-01', 4, 7, 34),
(17, 'MSQ296', '2018-07-04', 7, 2, 40),
(18, 'MSQ296', '2018-07-04', 7, 5, 38),
(19, 'MSQ296', '2018-07-04', 7, 6, 54),
(20, 'MSQ297', '2018-07-12', 2, 4, 20),
(21, 'MSQ297', '2018-07-12', 2, 5, 34),
(22, 'MSQ297', '2018-07-12', 2, 6, 45);

CREATE TABLE `produits` (
  `id` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `abandonne` tinyint(1) DEFAULT NULL,
  `usine` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE `sites_de_production` (
  `id` int NOT NULL,
  `usine` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sites_de_production` (`id`, `usine`, `adresse`, `ville`) VALUES
(1, 'Harald', 'Quai Pipervika', 'Oslo'),
(2, 'Sverre', 'Rue Strangehagen', 'Bergen'),
(3, 'Olaf', 'Place Nidaros', 'Trondheim');

CREATE TABLE `sites_produits` (
  `produit_id` int DEFAULT NULL,
  `site_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sites_produits` (`produit_id`, `site_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 3),
(7, 2),
(7, 3),
(8, 3),
(9, 3);

ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `factures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `produit_id` (`produit_id`);

ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sites_de_production`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sites_produits`
  ADD KEY `site_id` (`site_id`),
  ADD KEY `produit_id` (`produit_id`);

ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `factures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

ALTER TABLE `produits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `sites_de_production`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `factures_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

ALTER TABLE `sites_produits`
  ADD CONSTRAINT `sites_produits_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `sites_de_production` (`id`),
  ADD CONSTRAINT `sites_produits_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);
