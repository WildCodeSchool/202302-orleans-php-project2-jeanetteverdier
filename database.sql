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

/********** TABLE SECTOR **********/

CREATE TABLE
    `sector` (
        `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(255) NOT NULL
    );

INSERT INTO `sector` (name)
VALUES (
        'Métiers de la Gestion Administrative du Transport et de la Logistique'
    ), (
        'Métiers de la Relation Client'
    ), ('Métiers de la Mode');

/********** TABLE DEGREE **********/

CREATE TABLE
    `degree` (
        `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(255) NOT NULL,
        `duration` INT NOT NULL
    );

INSERT INTO
    degree (name, duration)
VALUES ('CAP', 2), ('BAC PRO', 3);

/********** TABLE TRAINING **********/

SELECT * FROM sector;

CREATE TABLE
    `training` (
        `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(255) NOT NULL,
        `image` VARCHAR(255),
        `description` TEXT,
        `program` TEXT,
        `nb_students` INT NOT NULL,
        `success_rate` INT NOT NULL,
        `stage_duration` INT NOT NULL,
        `sector_id` INT NOT NULL,
        `degree_id` INT NOT NULL,
        FOREIGN KEY (sector_id) REFERENCES sector(`id`),
        FOREIGN KEY (degree_id) REFERENCES degree(`id`)
    );

INSERT INTO
    `training` (
        name,
        nb_students,
        success_rate,
        stage_duration,
        sector_id,
        degree_id
    )
VALUES (
        "Opérateur logistique",
        24,
        84,
        4,
        1,
        1
    ), (
        "Equipier polyvalent du commerce",
        15,
        86,
        4,
        2,
        1
    ), (
        "Mode option vêtement flou",
        15,
        89,
        4,
        3,
        1
    ), (
        "Assistance à la gestion des organisations et de leurs activités",
        32,
        87,
        6,
        1,
        2
    ), ("Logistique", 30, 85, 6, 1, 2), (
        "Organisation de transport de marchandises",
        15,
        88,
        6,
        1,
        2
    ), (
        "Commerce et de la Vente option A : animation et gestion de l'espace commercial",
        48,
        89,
        6,
        2,
        2
    ), (
        "Commerce et de la Vente option B : prospection clientèle et valorisation de l'offre commerciale",
        16,
        82,
        6,
        2,
        2
    ), ("Accueil", 16, 83, 6, 2, 2);

UPDATE `training`
SET
    description = "Le CAP Opérateur Logistique est une formation professionnelle de niveau V, qui permet d'acquérir les compétences nécessaires pour travailler dans le secteur de la logistique. Cette formation est accessible aux élèves ayant validé un niveau 3ème (ou équivalent) et se déroule sur deux ans.
L'obtention du CAP Opérateur Logistique permet aux diplômés de travailler dans des entreprises de différents secteurs d'activités, en tant qu'opérateurs logistiques ou assistants logistiques.",
    program = "La formation CAP Opérateur Logistique comporte des modules, qui couvrent l'ensemble des compétences nécessaires pour travailler dans le domaine de la logistique. Les modules portent sur l'approvisionnement et la gestion des stocks, la préparation de commandes et l'expédition, la manutention des charges, la conduite d'engins, la communication et l'informatique, ainsi que l'organisation et la réglementation des transports.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 1;

UPDATE `training`
SET
    description = "Le CAP Equipier Polyvalent du Commerce est une formation professionnelle de niveau V, qui vise à former des professionnels du commerce et de la vente. Elle est accessible aux personnes âgées de 16 ans minimum et se déroulesur deux ans.
L'obtention du CAP Equipier Polyvalent du Commerce offre de nombreuses opportunités professionnelles dans le domaine de la vente et du commerce, notamment en tant qu'équipier polyvalent en grande surface, en magasin de proximité ou en commerce spécialisé.",
    program = "La formation CAP Equipier Polyvalent du Commerce comporte des modules, qui prépare les élèves aux métiers du commerce et de la vente. La formation aborde les compétences telles que l'accueil et le conseil des clients, la réception et le stockage des produits, la mise en rayon et le merchandising, l'encaissement et la gestion des transactions, la communication et le travail en équipe.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 2;

UPDATE `training`
SET
    description = "Le CAP Mode option Vêtement Flou est une formation professionnelle de niveau V, qui permet aux apprenants d'acquérir les compétences nécessaires pour travailler dans le domaine de la couture et de la confection de vêtements flous. Cette formation est accessible aux élèves ayant validé un niveau 3ème (ou équivalent) et se déroule sur deux ans.
L’obtention du CAP Mode option Vêtement Flou offre de nombreuses opportunités professionnelles dans le domaine de la couture et de la confection, notamment en tant qu'ouvrier en confection textile, retoucheur, opérateur de production ou encore couturier indépendant.",
    program = "Le CAP Mode option Vêtement Flou permet aux apprenants d'acquérir les compétences pour travailler dans le domaine de la mode, en particulier dans la réalisation de vêtements amples et fluides. Le programme de la formation comprend des modules tels que l'analyse de la demande et la préparation de la production, la réalisation des opérations préparatoires, le montage et l'assemblage des pièces et les finitions et le contrôle qualité.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 3;

UPDATE `training`
SET
    description = "Le BAC PRO Assistance à la gestion des organisations et de leurs activités est une formation professionnel de niveau IV, qui prépare les étudiants à travailler en entreprise dans les domaines de l'administration, de la gestion et du management. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les diplômés peuvent travailler en tant qu'assistant de direction, assistant commercial, assistant de gestion, assistant RH, ou encore gestionnaire de stock et logistique.",
    program = "Le BAC PRO Assistance à la Gestion des Organisations et de leurs Activités comprend différents modules tels que la gestion administrative, la gestion comptable, la gestion commerciale, la gestion des ressources humaines, la communication professionnelle et l'informatique et les outils de gestion. Ces modules permettent aux élèves d'acquérir les compétences nécessaires pour effectuer des tâches administratives et comptables telles que la gestion du courrier, la tenue des livres de comptes, la gestion des stocks, la gestion des contrats de travail, la communication avec les clients et les fournisseurs et l'utilisation d'outils de gestion tels que les logiciels de bureautique.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 4;

UPDATE `training`
SET
    description = "Le BAC PRO Logistique est une formation professionnel de niveau IV, qui permet aux élèves de maîtriser les techniques et les processus de la chaîne logistique. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants peuvent exercer des métiers tels que responsable logistique, gestionnaire de stocks, technicien logistique, responsable d'entrepôt, coordinateur de transport, etc.",
    program = "Le BAC PRO Logistique permet comprend différents modules tels que la gestion de la chaîne logistique, la gestion des stocks, la gestion des opérations de transport, la gestion de la qualité et l'informatique et les outils de gestion. Les étudiants apprennent à planifier, organiser, superviser et gérer les différentes activités logistiques, à évaluer les besoins de stocks, à planifier et à organiser les opérations de transport, à suivre les normes et les certifications de qualité et à utiliser les logiciels de gestion de stocks et les systèmes d'information de la chaîne logistique.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 5;

UPDATE `training`
SET
    description = "Le BAC PRO Organisation de transport de marchandises est une formation professionnel de niveau IV, qui permet aux élèves de maîtriser les compétences nécessaires pour travailler dans le secteur du transport de marchandises. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants sont capables de coordonner et d'optimiser les activités de transport et de logistique pour garantir l'efficacité et la qualité des prestations de service.",
    program = "La formation BAC PRO Organisation de transport de marchandises comporte plusieurs modules tels que, la gestion de la chaîne logistique, la gestion des opérations de transport, l'organisation et la planification du transport, l'économie et la gestion de l'entreprise, la communication professionnelle et l'apprentissage d'une langue étrangère.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 6;

UPDATE `training`
SET
    description = "Le BAC PRO Commerce et de la Vente, option A : Animation et gestion de l'espace commercial est une formation de niveau IV qui s'adresse aux étudiants qui souhaitent se former dans le domaine du commerce et de la vente. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants acquièrent des compétences professionnelles dans le domaine de la vente et de la gestion commerciale, leur permettant ainsi d'exercer des métiers tels que chef de rayon, vendeur conseil, animateur de vente, ou encore responsable de boutique.",
    program = "La formation BAC PRO Commerce et de la Vente, option A : Animation et gestion de l'espace commercial, comporte plusieurs modules enseignés tels que les techniques de vente et de négociation commerciale, le marketing et le merchandising, la gestion de l'espace commercial, la gestion de l'équipe commerciale, la communication professionnelle et les outils bureautiques, ainsi que la langue vivante étrangère.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 7;

UPDATE `training`
SET
    description = "La formation BAC PRO Commerce et de la Vente option B : prospection clientèle et valorisation de l'offre commerciale vise à former les étudiants aux différentes techniques de prospection de la clientèle et de valorisation de l'offre commerciale. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants peuvent accéder à différents métiers tels que commercial sédentaire, commercial itinérant, télévendeur, conseiller commercial , ou encore responsable commercial.",
    program = "La formation BAC PRO Commerce et de la Vente option B : prospection clientèle et valorisation de l'offre commerciale comporte des modules qui incluent les techniques de prospection commerciale, de vente et de négociation commerciale, le marketing de la vente au détail, la gestion de l'offre commerciale, la gestion de la relation client, la communication professionnelle et les outils bureautiques, ainsi que la langue étrangère des affaires.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = "8";

UPDATE `training`
SET
    description = "Le BAC PRO Accueil est une formation professionnalisante qui vise à former des professionnels capables d'accueillir, d'orienter et de renseigner les clients ou les visiteurs, dans différents types d'établissements tels que les hôtels, les musées, les centres culturels, les entreprises, les administrations, etc. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants  peuvent travailler dans différents secteurs tels que l'hôtellerie, la restauration, le tourisme, la culture, les entreprises, les administrations, etc. Ils peuvent occuper des postes tels que réceptionniste, chargé d'accueil, hôte d'accueil, conseiller clientèle, etc.",
    program = "La formation BAC PRO Accueil comporte des modules qui incluent les techniques d'accueil et de communication, la gestion de la qualité de service, la gestion administrative, la connaissance des produits et services, la vente et le conseil, l'informatique et les outils bureautiques ainsi que la langue moderne (anglais).
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 9;