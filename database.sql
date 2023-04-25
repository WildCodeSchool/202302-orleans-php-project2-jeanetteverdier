-- phpMyAdmin SQL Dump

-- version 4.5.4.1deb2ubuntu2

-- http://www.phpmyadmin.net

--

-- Client :  localhost

-- Généré le :  Jeu 26 Octobre 2017 à 13:53

-- Version du serveur :  5.7.19-0ubuntu0.16.04.1

-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8mb4 */

;

--

-- Base de données :  `simple-mvc`

--

-- --------------------------------------------------------

--

-- Structure de la table `item`

--

CREATE TABLE
    `item` (
        `id` int(11) UNSIGNED NOT NULL,
        `title` varchar(255) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--

-- Contenu de la table `item`

--

INSERT INTO
    `item` (`id`, `title`)
VALUES (1, 'Stuff'), (2, 'Doodads');

--

-- Index pour les tables exportées

--

--

-- Index pour la table `item`

--

ALTER TABLE `item` ADD PRIMARY KEY (`id`);

--

-- AUTO_INCREMENT pour les tables exportées

--

--

-- AUTO_INCREMENT pour la table `item`

--

ALTER TABLE
    `item` MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;

CREATE TABLE `work_departement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
  );

CREATE TABLE `team` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `post` text NOT NULL,
  `biography` text,
  `picture` varchar(255),
  `work_departement_id` INT NOT NULL,
  CONSTRAINT fk_work_departement      
        FOREIGN KEY (work_departement_id)             
        REFERENCES work_departement(id) 
);

INSERT INTO `work_departement` (`name`) VALUES
('Direction'),
('Vie scolaire'),
('Service medico-social'),
('Agents techniques'),
('Coordinations Dispositifs'),
('Personnels enseignants');

INSERT INTO `team` (`firstname`, `lastname`, `post`, `work_departement_id`) VALUES
('Matthias', 'CYPRIEN', 'PROVISEUR', 1),
('Oliver', 'DREYFUS', 'Proviseur-adjoint', 1),
('Miréla', 'DENYS', 'Adjointe-gestionnaire', 1),
('Chrystèle', 'ADAM', 'D.D.F.P.T.', 1),
('Bochra', 'MOUJIB', 'Assistante de direction', 1),
('Anyssa', 'DJERA', 'Secrétaire de gestion', 1),
('Laurent', 'DENIS', 'CPE', 2),
('Alexandrine', 'BEAUVAIS', 'CPE', 2),
('Maxence', 'BIWER', 'Assistants d éducation', 2),
('Florian', 'CHAUVOT', 'Assistants d éducation', 2),
('Malika', 'MORANDY', 'Assistants d éducation', 2),
('Aline', 'NOREST', 'AESH-ULIS-prof.', 2),
('Sophie', 'NEGRE', 'Infirmière', 3),
('Danièle', 'DARDONVILLE', 'Assistante sociale',  3),
('Kathline', 'PAILLER', 'Psy-EN', 3),
('Corinne', 'BELLANGER', 'Agents techniques', 4),
('Marie-José', 'LIMA', 'Agents techniques', 4),
('Nathalie', 'BERRUET', 'Agents techniques', 4),
('Romain', 'DEMILLY', 'resp.restauration', 4),
('Frédéric', 'THEO', 'resp.maintenance', 4),
('Gaëlle', 'HABIJAN', 'Agents techniques', 4),
('Valérie', 'JULLY', 'Agents techniques', 4),
('Caroline', 'CABON', 'CDI', 5),
('Aurore', 'MADOUX', 'COORDONNATEUR ULIS', 5),
('Dejan', 'PETROVIC', 'COORDONNATEUR ARTP', 5),
('Christine', 'MALINGE', 'interlocutrice', 5),
('Mathilde', 'RICHER', 'veille numérique', 5),
('José', 'HEDDE', 'animation du site Web', 5),
('Jean', 'RINGUET', 'réseau informatique', 5),
('Astrid', 'BERNARD', 'LETTRES HISTOIRE GEOGRAPHIE', 6),
('Héléna', 'JOUJOUX', 'LETTRES HISTOIRE GEOGRAPHIE', 6),
('Céline', 'GERARD', 'LETTRES HISTOIRE GEOGRAPHIE', 6),
('Julie', 'LE CORRE', 'LETTRES HISTOIRE GEOGRAPHIE', 6),
('Sandrine', 'SCHWOEHRER', 'LETTRES HISTOIRE GEOGRAPHIE',6),
('Dilgoudry', 'THIAM', 'LETTRES HISTOIRE GEOGRAPHIE', 6),
('Eric', 'PAZOLA', 'LETTRES HISTOIRE GEOGRAPHIE', 6),
('Priscillia', 'SERRE', 'LETTRES HISTOIRE GEOGRAPHIE', 6),
('Stéphanie', 'ARAUZO', 'MATHS-SCIENCES', 6),
('Mélanie', 'HEDDE', 'MATHS-SCIENCES', 6),
('Julie', 'PUBELLIER', 'MATHS-SCIENCES', 6),
('Joseph', 'MOUKOLO', 'MATHS-SCIENCES', 6),
('Gilles', 'ALIN', 'ANGLAIS', 6),
('Sandrine', 'DIOP', 'ANGLAIS', 6),
('Carine', 'NICOLAS', 'ANGLAIS', 6),
('Romain', 'NELLEE', 'ANGLAIS', 6),
('Emilie', 'GUIRAUDON', 'ESPAGNOL', 6),
('Alexandre', 'BRIMONT', 'ESPAGNOL', 6),
('Mandy', 'MILON', 'ALLEMAND', 6),
('Caroline', 'CABON', 'CDI', 6),
('Florian', 'RINGUET', 'PSE', 6),
('Claire', 'CAVEREAU', 'ARTS APPLIQUES', 6),
('Laura', 'LAVAUD', 'ARTS APPLIQUES', 6),
('Valentin', 'GAUDRY', 'EPS', 6),
('Catherine', 'MARSALIK', 'EPS', 6),
('Kévin', 'OCULI', 'CDI', 6),
('Mélanie', 'ABRAHAM', 'VENTE', 6),
('Laurent', 'ADAMI', 'VENTE', 6),
('Alexandre', 'BOSRAMIER', 'VENTE', 6),
('Bastien', 'DUCREST', 'VENTE', 6),
('Isabelle', 'FABRO', 'VENTE', 6),
('Mylène', 'DECHAMBRE', 'VENTE', 6),
('Magali', 'TOUPIN', 'VENTE', 6),
('Fabrice', 'LAURENT', 'VENTE', 6),
('Gaëlle', 'MALINGE', 'VENTE', 6),
('Valérie', 'NEVE', 'VENTE', 6),
('Marie-Hélène', 'RAUCH', 'VENTE', 6),
('Nadine', 'DAVID', 'VENTE', 6),
('Vanessa', 'TEMPLIER', 'VENTE', 6),
('Magali', 'GAUTHIER', 'LOGISTIQUE - TRANSPORT', 6),
('Aline', 'RAINGEVAL', 'LOGISTIQUE - TRANSPORT', 6),
('Jennifer', 'CUVILLON', 'LOGISTIQUE - TRANSPORT', 6),
('Christian', 'JEPHOS', 'LOGISTIQUE - TRANSPORT', 6),
('Yannick', 'LE GOFF', 'LOGISTIQUE - TRANSPORT', 6),
('Katia', 'GUERIN', 'LOGISTIQUE - TRANSPORT', 6),
('Alexandra', 'MENJIKOFF', 'LOGISTIQUE - TRANSPORT', 6),
('Isabelle', 'MIELZARCK', 'LOGISTIQUE - TRANSPORT', 6),
('Abel', 'FATTAHI', 'LOGISTIQUE - TRANSPORT', 6),
('Alexandre', 'RICHER', 'LOGISTIQUE - TRANSPORT', 6),
('Magali', 'DESLAIS', 'AGORA', 6),
('Kubra', 'DINDAR', 'AGORA', 6),
('Véronique', 'ESPILIT', 'AGORA', 6),
('Béatrice', 'VAPPEREAU', 'AGORA', 6),
('Stéphanie', 'BALUSSAUD', 'GENIE INDUS. TEXTILE ET CUIRS', 6),
('Aurore', 'BRETEAU', 'GENIE INDUS. TEXTILE ET CUIRS', 6),
('Béatrice', 'VAPPEREAU', 'RÉFÈRENTS ÉCOLE - ENTREPRISE', 6),
('Laurent', 'ADAMI', 'RÉFÈRENTS ÉCOLE - ENTREPRISE', 6);