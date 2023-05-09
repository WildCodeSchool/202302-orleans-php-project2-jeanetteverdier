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

CREATE TABLE `item` (
    `id` int(11) UNSIGNED NOT NULL,
    `title` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--

-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `title`)
VALUES (1, 'Stuff'),
    (2, 'Doodads');
--

-- Index pour les tables exportées
--

--

-- Index pour la table `item`
--

ALTER TABLE `item`
ADD PRIMARY KEY (`id`);
--

-- AUTO_INCREMENT pour les tables exportées
--

--

-- AUTO_INCREMENT pour la table `item`
--

ALTER TABLE `item`
MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
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
CREATE TABLE `employee` (
    `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `firstname` varchar(255) NOT NULL,
    `lastname` varchar(255) NOT NULL,
    `post` text NOT NULL,
    `biography` text,
    `picture` varchar(255),
    `work_departement_id` INT NOT NULL,
    CONSTRAINT fk_work_departement FOREIGN KEY (work_departement_id) REFERENCES work_departement(id)
);
INSERT INTO `work_departement` (`name`)
VALUES ('Direction'),
    ('Vie scolaire'),
    ('Service medico-social'),
    ('Agents techniques'),
    ('Coordinations Dispositifs'),
    ('Personnels enseignants');
INSERT INTO `employee` (
        `firstname`,
        `lastname`,
        `post`,
        `picture`,
        `work_departement_id`
    )
VALUES (
        'Matthias',
        'CYPRIEN',
        'PROVISEUR',
        'direction4.webp',
        1
    ),
    (
        'Oliver',
        'DREYFUS',
        'Proviseur-adjoint',
        'direction3.webp',
        1
    ),
    (
        'Miréla',
        'DENYS',
        'Adjointe-gestionnaire',
        'direction2.webp',
        1
    ),
    (
        'Chrystèle',
        'ADAM',
        'D.D.F.P.T.',
        'direction6.webp',
        1
    ),
    (
        'Bochra',
        'MOUJIB',
        'Assistante de direction',
        'direction5.webp',
        1
    ),
    (
        'Anyssa',
        'DJERA',
        'Secrétaire de gestion',
        'direction1.webp',
        1
    ),
    (
        'Laurent',
        'DENIS',
        'CPE',
        'vs1.jpg',
        2
    ),
    (
        'Alexandrine',
        'BEAUVAIS',
        'CPE',
        'vs3.jpg',
        2
    ),
    (
        'Maxence',
        'BIWER',
        'Assistants d éducation',
        'vs2.jpg',
        2
    ),
    (
        'Florian',
        'CHAUVOT',
        'Assistants d éducation',
        'vs6.jpg',
        2
    ),
    (
        'Malika',
        'MORANDY',
        'Assistants d éducation',
        'vs5.jpg',
        2
    ),
    (
        'Aline',
        'NOREST',
        'AESH-ULIS-prof.',
        'vs4.jpg',
        2
    );

INSERT INTO `employee` (
        `firstname`,
        `lastname`,
        `post`,
        `work_departement_id`
    )
VALUES (
        'Sophie',
        'NEGRE',
        'Infirmière',
        3
    ),
    (
        'Danièle',
        'DARDONVILLE',
        'Assistante sociale',
        3
    ),
    (
        'Kathline',
        'PAILLER',
        'Psy-EN',
        3
    ),
    (
        'Corinne',
        'BELLANGER',
        'Agents techniques',
        4
    ),
    (
        'Marie-José',
        'LIMA',
        'Agents techniques',
        4
    ),
    (
        'Nathalie',
        'BERRUET',
        'Agents techniques',
        4
    ),
    (
        'Romain',
        'DEMILLY',
        'Resp.restauration',
        4
    ),
    (
        'Frédéric',
        'THEO',
        'Resp.maintenance',
        4
    ),
    (
        'Gaëlle',
        'HABIJAN',
        'Agents techniques',
        4
    ),
    (
        'Valérie',
        'JULLY',
        'Agents techniques',
        4
    ),
    ('Caroline', 'CABON', 'CDI', 5),
    (
        'Aurore',
        'MADOUX',
        'Coordonnateur ULIS',
        5
    ),
    (
        'Dejan',
        'PETROVIC',
        'Coordonateur ARTP',
        5
    ),
    (
        'Christine',
        'MALINGE',
        'Interlocutrice',
        5
    ),
    (
        'Mathilde',
        'RICHER',
        'Veille numérique',
        5
    ),
    (
        'José',
        'HEDDE',
        'Animation du site Web',
        5
    ),
    (
        'Jean',
        'RINGUET',
        'Réseau informatique',
        5
    ),
    (
        'Astrid',
        'BERNARD',
        'Lettres histoire géographie',
        6
    ),
    (
        'Héléna',
        'JOUJOUX',
        'Lettres histoire géographie',
        6
    ),
    (
        'Céline',
        'GERARD',
        'Lettres histoire géographie',
        6
    ),
    (
        'Julie',
        'LE CORRE',
        'Lettres histoire géographie',
        6
    ),
    (
        'Sandrine',
        'SCHWOEHRER',
        'Lettres histoire géographie',
        6
    ),
    (
        'Dilgoudry',
        'THIAM',
        'Lettres histoire géographie',
        6
    ),
    (
        'Eric',
        'PAZOLA',
        'Lettres histoire géographie',
        6
    ),
    (
        'Priscillia',
        'SERRE',
        'Lettres histoire géographie',
        6
    ),
    (
        'Stéphanie',
        'ARAUZO',
        'Maths-Sciences',
        6
    ),
    (
        'Mélanie',
        'HEDDE',
        'Maths-Sciences',
        6
    ),
    (
        'Julie',
        'PUBELLIER',
        'Maths-Sciences',
        6
    ),
    (
        'Joseph',
        'MOUKOLO',
        'Maths-Sciences',
        6
    ),
    ('Gilles', 'ALIN', 'Anglais', 6),
    (
        'Sandrine',
        'DIOP',
        'Anglais',
        6
    ),
    (
        'Carine',
        'NICOLAS',
        'Anglais',
        6
    ),
    (
        'Romain',
        'NELLEE',
        'Anglais',
        6
    ),
    (
        'Emilie',
        'GUIRAUDON',
        'Espagnol',
        6
    ),
    (
        'Alexandre',
        'BRIMONT',
        'Espagnol',
        6
    ),
    ('Mandy', 'MILON', 'Allemand', 6),
    ('Caroline', 'CABON', 'CDI', 6),
    ('Florian', 'RINGUET', 'PSE', 6),
    (
        'Claire',
        'CAVEREAU',
        'Arts Appliqués',
        6
    ),
    (
        'Laura',
        'LAVAUD',
        'Arts Appliqués',
        6
    ),
    ('Valentin', 'GAUDRY', 'EPS', 6),
    (
        'Catherine',
        'MARSALIK',
        'EPS',
        6
    ),
    ('Kévin', 'OCULI', 'CDI', 6),
    (
        'Mélanie',
        'ABRAHAM',
        'Vente',
        6
    ),
    ('Laurent', 'ADAMI', 'VENTE', 6),
    (
        'Alexandre',
        'BOSRAMIER',
        'Vente',
        6
    ),
    (
        'Bastien',
        'DUCREST',
        'Vente',
        6
    ),
    ('Isabelle', 'FABRO', 'Vente', 6),
    (
        'Mylène',
        'DECHAMBRE',
        'Vente',
        6
    ),
    ('Magali', 'TOUPIN', 'Vente', 6),
    (
        'Fabrice',
        'LAURENT',
        'Vente',
        6
    ),
    ('Gaëlle', 'MALINGE', 'Vente', 6),
    ('Valérie', 'NEVE', 'Vente', 6),
    (
        'Marie-Hélène',
        'RAUCH',
        'Vente',
        6
    ),
    ('Nadine', 'DAVID', 'Vente', 6),
    (
        'Vanessa',
        'TEMPLIER',
        'Vente',
        6
    ),
    (
        'Magali',
        'GAUTHIER',
        'Logistique - Transport',
        6
    ),
    (
        'Aline',
        'RAINGEVAL',
        'Logistique - Transport',
        6
    ),
    (
        'Jennifer',
        'CUVILLON',
        'Logistique - Transport',
        6
    ),
    (
        'Christian',
        'JEPHOS',
        'Logistique - Transport',
        6
    ),
    (
        'Yannick',
        'LE GOFF',
        'Logistique - Transport',
        6
    ),
    (
        'Katia',
        'GUERIN',
        'Logistique - Transport',
        6
    ),
    (
        'Alexandra',
        'MENJIKOFF',
        'Logistique - Transport',
        6
    ),
    (
        'Isabelle',
        'MIELZARCK',
        'Logistique - Transport',
        6
    ),
    (
        'Abel',
        'FATTAHI',
        'Logistique - Transport',
        6
    ),
    (
        'Alexandre',
        'RICHER',
        'Logistique - Transport',
        6
    ),
    ('Magali', 'DESLAIS', 'AGORA', 6),
    ('Kubra', 'DINDAR', 'AGORA', 6),
    (
        'Véronique',
        'ESPILIT',
        'AGORA',
        6
    ),
    (
        'Béatrice',
        'VAPPEREAU',
        'AGORA',
        6
    ),
    (
        'Stéphanie',
        'BALUSSAUD',
        'Génie indus. textile et cuirs',
        6
    ),
    (
        'Aurore',
        'BRETEAU',
        'Génie indus. textile et cuirs',
        6
    ),
    (
        'Béatrice',
        'VAPPEREAU',
        'Réfèrents école - Entreprise',
        6
    ),
    (
        'Laurent',
        'ADAMI',
        'Réfèrents école - Entreprise',
        6
    );
-- ********** TABLE SECTOR **********
CREATE TABLE `sector` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);
INSERT INTO `sector` (name)
VALUES (
        'Métiers de la Gestion Administrative du Transport et de la Logistique'
    ),
    ('Métiers de la Relation Client'),
    ('Métiers de la Mode');
-- ********** TABLE DEGREE **********
CREATE TABLE `degree` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `duration` INT NOT NULL
);
INSERT INTO degree (name, duration)
VALUES ('CAP', 2),
    ('BAC PRO', 3);
-- ********** TABLE TRAINING **********
CREATE TABLE `training` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255),
    `description` TEXT,
    `program` TEXT,
    `nb_students` INT NOT NULL,
    `success_rate` INT NOT NULL,
    `stage_duration` INT NOT NULL,
    `sector_id` INT,
    `degree_id` INT,
    FOREIGN KEY (sector_id) REFERENCES sector(`id`),
    FOREIGN KEY (degree_id) REFERENCES degree(`id`)
);
INSERT INTO `training` (
        name,
        image,
        nb_students,
        success_rate,
        stage_duration,
        sector_id,
        degree_id
    )
VALUES (
        "Opérateur logistique",
        "operateur-logistique.webp",
        24,
        84,
        4,
        1,
        1
    ),
    (
        "Equipier polyvalent du commerce",
        "commerce.webp",
        15,
        86,
        4,
        2,
        1
    ),
    (
        "Mode option vêtement flou",
        "mode.webp",
        15,
        89,
        4,
        3,
        1
    ),
    (
        "Assistance à la gestion des organisations et de leurs activités",
        "gestion.webp",
        32,
        87,
        6,
        1,
        2
    ),
    (
        "Logistique",
        "logistique.webp",
        30,
        85,
        6,
        1,
        2
    ),
    (
        "Organisation de transport de marchandises",
        "transport.webp",
        15,
        88,
        6,
        1,
        2
    ),
    (
        "Commerce et de la Vente option A : animation et gestion de l'espace commercial",
        "vente-a.webp",
        48,
        89,
        6,
        2,
        2
    ),
    (
        "Commerce et de la Vente option B : prospection clientèle et valorisation de l'offre commerciale",
        "vente-b.webp",
        16,
        82,
        6,
        2,
        2
    ),
    (
        "Accueil",
        "accueil.webp",
        16,
        83,
        6,
        2,
        2
    );
UPDATE `training`
SET description = "Le CAP Opérateur Logistique est une formation professionnelle de niveau V, qui permet d'acquérir les compétences nécessaires pour travailler dans le secteur de la logistique. Cette formation est accessible aux élèves ayant validé un niveau 3ème (ou équivalent) et se déroule sur deux ans.
L'obtention du CAP Opérateur Logistique permet aux diplômés de travailler dans des entreprises de différents secteurs d'activités, en tant qu'opérateurs logistiques ou assistants logistiques.",
    program = "La formation CAP Opérateur Logistique comporte des modules, qui couvrent l'ensemble des compétences nécessaires pour travailler dans le domaine de la logistique. Les modules portent sur l'approvisionnement et la gestion des stocks, la préparation de commandes et l'expédition, la manutention des charges, la conduite d'engins, la communication et l'informatique, ainsi que l'organisation et la réglementation des transports.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 1;
UPDATE `training`
SET description = "Le CAP Equipier Polyvalent du Commerce est une formation professionnelle de niveau V, qui vise à former des professionnels du commerce et de la vente. Elle est accessible aux personnes âgées de 16 ans minimum et se déroulesur deux ans.
L'obtention du CAP Equipier Polyvalent du Commerce offre de nombreuses opportunités professionnelles dans le domaine de la vente et du commerce, notamment en tant qu'équipier polyvalent en grande surface, en magasin de proximité ou en commerce spécialisé.",
    program = "La formation CAP Equipier Polyvalent du Commerce comporte des modules, qui prépare les élèves aux métiers du commerce et de la vente. La formation aborde les compétences telles que l'accueil et le conseil des clients, la réception et le stockage des produits, la mise en rayon et le merchandising, l'encaissement et la gestion des transactions, la communication et le travail en équipe.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 2;
UPDATE `training`
SET description = "Le CAP Mode option Vêtement Flou est une formation professionnelle de niveau V, qui permet aux apprenants d'acquérir les compétences nécessaires pour travailler dans le domaine de la couture et de la confection de vêtements flous. Cette formation est accessible aux élèves ayant validé un niveau 3ème (ou équivalent) et se déroule sur deux ans.
L’obtention du CAP Mode option Vêtement Flou offre de nombreuses opportunités professionnelles dans le domaine de la couture et de la confection, notamment en tant qu'ouvrier en confection textile, retoucheur, opérateur de production ou encore couturier indépendant.",
    program = "Le CAP Mode option Vêtement Flou permet aux apprenants d'acquérir les compétences pour travailler dans le domaine de la mode, en particulier dans la réalisation de vêtements amples et fluides. Le programme de la formation comprend des modules tels que l'analyse de la demande et la préparation de la production, la réalisation des opérations préparatoires, le montage et l'assemblage des pièces et les finitions et le contrôle qualité.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 3;
UPDATE `training`
SET description = "Le BAC PRO Assistance à la gestion des organisations et de leurs activités est une formation professionnel de niveau IV, qui prépare les étudiants à travailler en entreprise dans les domaines de l'administration, de la gestion et du management. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les diplômés peuvent travailler en tant qu'assistant de direction, assistant commercial, assistant de gestion, assistant RH, ou encore gestionnaire de stock et logistique.",
    program = "Le BAC PRO Assistance à la Gestion des Organisations et de leurs Activités comprend différents modules tels que la gestion administrative, la gestion comptable, la gestion commerciale, la gestion des ressources humaines, la communication professionnelle et l'informatique et les outils de gestion. Ces modules permettent aux élèves d'acquérir les compétences nécessaires pour effectuer des tâches administratives et comptables telles que la gestion du courrier, la tenue des livres de comptes, la gestion des stocks, la gestion des contrats de travail, la communication avec les clients et les fournisseurs et l'utilisation d'outils de gestion tels que les logiciels de bureautique.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 4;
UPDATE `training`
SET description = "Le BAC PRO Logistique est une formation professionnel de niveau IV, qui permet aux élèves de maîtriser les techniques et les processus de la chaîne logistique. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants peuvent exercer des métiers tels que responsable logistique, gestionnaire de stocks, technicien logistique, responsable d'entrepôt, coordinateur de transport, etc.",
    program = "Le BAC PRO Logistique permet comprend différents modules tels que la gestion de la chaîne logistique, la gestion des stocks, la gestion des opérations de transport, la gestion de la qualité et l'informatique et les outils de gestion. Les étudiants apprennent à planifier, organiser, superviser et gérer les différentes activités logistiques, à évaluer les besoins de stocks, à planifier et à organiser les opérations de transport, à suivre les normes et les certifications de qualité et à utiliser les logiciels de gestion de stocks et les systèmes d'information de la chaîne logistique.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 5;
UPDATE `training`
SET description = "Le BAC PRO Organisation de transport de marchandises est une formation professionnel de niveau IV, qui permet aux élèves de maîtriser les compétences nécessaires pour travailler dans le secteur du transport de marchandises. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants sont capables de coordonner et d'optimiser les activités de transport et de logistique pour garantir l'efficacité et la qualité des prestations de service.",
    program = "La formation BAC PRO Organisation de transport de marchandises comporte plusieurs modules tels que, la gestion de la chaîne logistique, la gestion des opérations de transport, l'organisation et la planification du transport, l'économie et la gestion de l'entreprise, la communication professionnelle et l'apprentissage d'une langue étrangère.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 6;
UPDATE `training`
SET description = "Le BAC PRO Commerce et de la Vente, option A : Animation et gestion de l'espace commercial est une formation de niveau IV qui s'adresse aux étudiants qui souhaitent se former dans le domaine du commerce et de la vente. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants acquièrent des compétences professionnelles dans le domaine de la vente et de la gestion commerciale, leur permettant ainsi d'exercer des métiers tels que chef de rayon, vendeur conseil, animateur de vente, ou encore responsable de boutique.",
    program = "La formation BAC PRO Commerce et de la Vente, option A : Animation et gestion de l'espace commercial, comporte plusieurs modules enseignés tels que les techniques de vente et de négociation commerciale, le marketing et le merchandising, la gestion de l'espace commercial, la gestion de l'équipe commerciale, la communication professionnelle et les outils bureautiques, ainsi que la langue vivante étrangère.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 7;
UPDATE `training`
SET description = "La formation BAC PRO Commerce et de la Vente option B : prospection clientèle et valorisation de l'offre commerciale vise à former les étudiants aux différentes techniques de prospection de la clientèle et de valorisation de l'offre commerciale. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants peuvent accéder à différents métiers tels que commercial sédentaire, commercial itinérant, télévendeur, conseiller commercial , ou encore responsable commercial.",
    program = "La formation BAC PRO Commerce et de la Vente option B : prospection clientèle et valorisation de l'offre commerciale comporte des modules qui incluent les techniques de prospection commerciale, de vente et de négociation commerciale, le marketing de la vente au détail, la gestion de l'offre commerciale, la gestion de la relation client, la communication professionnelle et les outils bureautiques, ainsi que la langue étrangère des affaires.
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 8;
UPDATE `training`
SET description = "Le BAC PRO Accueil est une formation professionnalisante qui vise à former des professionnels capables d'accueillir, d'orienter et de renseigner les clients ou les visiteurs, dans différents types d'établissements tels que les hôtels, les musées, les centres culturels, les entreprises, les administrations, etc. La formation est accessible aux élèves ayant obtenu un diplôme de niveau 3 (CAP/BEP) ou ayant suivi une classe de seconde générale ou professionnelle.
À l'issue de la formation, les apprenants  peuvent travailler dans différents secteurs tels que l'hôtellerie, la restauration, le tourisme, la culture, les entreprises, les administrations, etc. Ils peuvent occuper des postes tels que réceptionniste, chargé d'accueil, hôte d'accueil, conseiller clientèle, etc.",
    program = "La formation BAC PRO Accueil comporte des modules qui incluent les techniques d'accueil et de communication, la gestion de la qualité de service, la gestion administrative, la connaissance des produits et services, la vente et le conseil, l'informatique et les outils bureautiques ainsi que la langue moderne (Anglais).
Des stages en entreprise sont également prévus pour permettre aux apprenants de mettre en pratique leurs compétences et de se familiariser avec le milieu professionnel."
WHERE id = 9;
-- ********** TABLE SKILL **********
CREATE TABLE `skill` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);
INSERT INTO `skill` (name)
VALUES ("Autonomie"),
    ("Accueil"),
    ("Adaptabilité"),
    ("Disponibilité"),
    ("Rigueur"),
    ("Sens de l'organisation"),
    ("Travail en équipe"),
    ("Sens de l'organisation"),
    ("Relationnel"),
    ("Dynamisme"),
    ("Communication"),
    ("Négociation"),
    ("Ouverture d'esprit"),
    ("Amabilité"),
    ("Organisation"),
    ("Créativité"),
    ("Patience"),
    ("Minutie"),
    ("Précision");
-- ********** TABLE INTER TRAINING_SKILL **********
CREATE TABLE `training_skill` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `training_id` INT NOT NULL,
    `skill_id` INT NOT NULL,
    FOREIGN KEY (training_id) REFERENCES training(`id`) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skill(`id`) ON DELETE CASCADE
);
-- COMPETENCE BAC AGORA
INSERT INTO `training_skill` (skill_id, training_id)
VALUES (1, 4),
    (2, 4),
    (3, 4),
    (4, 4);
-- COMPETENCE BAC LOGISTIQUE
INSERT INTO `training_skill` (skill_id, training_id)
VALUES (1, 5),
    (5, 5),
    (6, 5),
    (7, 5);
-- COMPETENCE BAC OTM
INSERT INTO `training_skill` (skill_id, training_id)
VALUES (1, 6),
    (5, 6),
    (6, 6),
    (7, 6);
-- COMPETENCE BAC COMMERCE OPT A
INSERT INTO `training_skill` (skill_id, training_id)
VALUES (9, 7),
    (10, 7),
    (1, 7),
    (4, 7),
    (3, 7);
-- COMPETENCE BAC COMMERCE OPT B
INSERT INTO `training_skill` (skill_id, training_id)
VALUES (11, 8),
    (9, 8),
    (12, 8),
    (4, 8);
-- COMPETENCE BAC ACCUEIL
INSERT INTO `training_skill` (skill_id, training_id)
VALUES (9, 9),
    (13, 9),
    (14, 9),
    (4, 9),
    (3, 9);
-- COMPETENCE CAP EPC
INSERT INTO `training_skill` (skill_id, training_id)
VALUES (9, 2),
    (10, 2),
    (1, 2),
    (4, 2),
    (3, 2);
-- COMPETENCE CAP OPERATEUR
INSERT INTO `training_skill` (skill_id, training_id)
VALUES (1, 1),
    (5, 1),
    (15, 1),
    (7, 1);
-- COMPETENCE CAP COUTURE
INSERT INTO `training_skill` (skill_id, training_id)
VALUES (16, 3),
    (5, 3),
    (17, 3),
    (18, 3),
    (19, 3);
-- ********** TABLE NEXT_TRAINING **********
CREATE TABLE `next_training` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `degree` VARCHAR(10) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `duration` INT NOT NULL,
    `description` TEXT,
    `link` VARCHAR(255)
);
CREATE TABLE `training_next_training` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `training_id` INT NOT NULL,
    `next_training_id` INT NOT NULL,
    FOREIGN KEY (training_id) REFERENCES training(`id`) ON DELETE CASCADE,
    FOREIGN KEY (next_training_id) REFERENCES next_training(`id`) ON DELETE CASCADE
);
INSERT INTO `next_training` (degree, name, duration, link)
VALUES (
        "BAC PRO",
        "Logistique",
        3,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Lycees/bac-pro-logistique"
    ),
    (
        "BAC PRO",
        "Commerce et de la vente option A : animation et gestion de l'espace commercial",
        3,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Lycees/bac-pro-metiers-du-commerce-et-de-la-vente-option-a-animation-et-gestion-de-l-espace-commercial"
    ),
    (
        "BAC PRO",
        "Métiers de la mode - Vêtement",
        3,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Lycees/bac-pro-metiers-de-la-mode-vetements"
    ),
    (
        "BTS",
        "Gestion de la PME",
        2,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Post-bac/bts-gestion-de-la-pme"
    ),
    (
        "BTS",
        "Support à l'action managériale",
        2,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Post-bac/bts-support-a-l-action-manageriale"
    ),
    (
        "BTS",
        "Comptabilité et gestion",
        2,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Post-bac/bts-comptabilite-et-gestion"
    ),
    (
        "BTS",
        "Gestion des transports et logistique associée (GTLA)",
        2,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Post-bac/bts-gestion-des-transports-et-logistique-associee"
    ),
    (
        "BTS",
        "Management commercial opérationnel",
        2,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Post-bac/bts-management-commercial-operationnel"
    ),
    (
        "BTS",
        "Négociation et digitalisation de la relation client",
        2,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Post-bac/bts-negociation-et-digitalisation-de-la-relation-client"
    ),
    (
        "BTS",
        "Tourisme",
        2,
        "https://www.onisep.fr/ressources/univers-formation/Formations/Post-bac/bts-tourisme"
    );
UPDATE `next_training`
SET description = "Ce bac pro se prépare en 3 ans après la classe de 3e. Les élèves entrent en 2de professionnelle Métiers de la gestion administrative, du transport et de la logistique pour préparer cette spécialité du bac pro.
L'accès est différent pour les élèves en apprentissage qui entrent directement dans cette spécialité de bac pro sans passer par une 2de pro famille de métiers.
Les élèves titulaires de certains CAP du même secteur peuvent également le préparer en 2 ans sous certaines conditions."
WHERE id = 1;
UPDATE `next_training`
SET description = "Ce bac pro se prépare en 3 ans après la classe de 3e. Les élèves entrent en 2de professionnelle métiers de la relation clientpour préparer cette spécialité du bac pro.
L'accès est différent pour les élèves en apprentissage qui entrent directement dans cette spécialité de bac pro sans passer par une 2de pro famille de métiers.
Les élèves titulaires de certains CAP du même secteur peuvent également préparer ce bac pro en 2 ans sous certaines conditions."
WHERE id = 2;
UPDATE `next_training`
SET description = "Ce bac pro se prépare en trois ans après la classe de troisième. Accès possible après un CAP du domaine des matériaux souples."
WHERE id = 3;
UPDATE `next_training`
SET description = "Le BTS gestion de la PME est accessible à tout titulaire d'un baccalauréat : bac pro, bac STMG, bac général. Accès sur dossier, voire tests et/ou entretien."
WHERE id = 4;
UPDATE `next_training`
SET description = "Ce bac pro se prépare en 3 ans après la classe de 3e. Les élèves entrent en 2de professionnelle Métiers de la gestion administrative, du transport et de la logistique pour préparer cette spécialité du bac pro.
L'accès est différent pour les élèves en apprentissage qui entrent directement dans cette spécialité de bac pro sans passer par une 2de pro famille de métiers.
Les élèves titulaires de certains CAP du même secteur peuvent également le préparer en 2 ans sous certaines conditions."
WHERE id = 5;
UPDATE `next_training`
SET description = "Le BTS support à l'action managériale est accessible à tout titulaire d'un baccalauréat : bac STMG, bac pro, bac général. Accès sur dossier, voire tests et/ou entretien."
WHERE id = 6;
UPDATE `next_training`
SET description = "Ce BTS est accessible à tout titulaire d'un baccalauréat : bac pro logistique, bac pro transport, bac STMG. Accès sur dossier, voire tests et/ou entretien."
WHERE id = 7;
UPDATE `next_training`
SET description = "Le BTS management commercial opérationnel est accessible à tout titulaire d'un baccalauréat : bac STMG, bac pro Métiers du commerce et de la vente, bac général. Accès sur dossier, voire tests et/ou entretien."
WHERE id = 8;
UPDATE `next_training`
SET description = "Le BTS négociation et digitalisation de la relation client est accessible à tout titulaire d'un baccalauréat : bac STMG, bac pro Métiers du commerce et de la vente, option A : animation et gestion de l'espace commercial, option B : prospection clientèle et valorisation de l'offre commerciale, bac général. Accès sur dossier, voire tests et/ou entretien."
WHERE id = 9;
UPDATE `next_training`
SET description = "Le BTS Tourisme est accessible à tout titulaire d'un baccalauréat : bac général et technologique, bac pro. Accès sur dossier, voire tests et/ou entretien."
WHERE id = 10;
INSERT INTO `training_next_training` (training_id, next_training_id)
VALUES (1, 1);
INSERT INTO `training_next_training` (training_id, next_training_id)
VALUES (2, 2);
INSERT INTO `training_next_training` (training_id, next_training_id)
VALUES (3, 3);
INSERT INTO `training_next_training` (training_id, next_training_id)
VALUES (4, 4),
    (4, 5),
    (4, 6);
INSERT INTO `training_next_training` (training_id, next_training_id)
VALUES (5, 7);
INSERT INTO `training_next_training` (training_id, next_training_id)
VALUES (6, 7);
INSERT INTO `training_next_training` (training_id, next_training_id)
VALUES (7, 8),
    (7, 9);
INSERT INTO `training_next_training` (training_id, next_training_id)
VALUES (8, 8),
    (8, 9);
INSERT INTO `training_next_training` (training_id, next_training_id)
VALUES (9, 10);
-- ********** TABLE ACTUALITY **********
CREATE TABLE `actuality`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `content` TEXT,
    `image` VARCHAR(255)
);
INSERT INTO `actuality` (title, content)
VALUES (
        "C'est la rentrée !",
        "Retrouvez toutes les informations concernant la rentrée des classes et de l'internat prévue le 3 Septembre 2023"
    ),
    (
        "Journée Porte ouverte",
        "Le samedi 10 mai 2023, le lycée vous ouvre ses portes de 9h à 17h !
Un accueil central, situé à l'entrée de l'établissement, vous permettra de découvrir les formations et services dédiés à la vie étudiante."
    ),
    (
        "Calendrier des sorties scolaires",
        "Retrouvez toutes les informations concernant les sorties scolaires organisées pour chaque chaque classes. "
    ),
    (
        "L'internat",
        "Dans cette rubrique retrouvez toutes les informations concernant l'internat."
    ),
    (
        "Meeting entreprise !",
        "Le  29 mai, de 10h à 11h30, aura lieu dans l'amphithéâtre, une conférence qui portera sur “l'avenir du travail”. Nous auront la chance de recevoir Mr MIZELE Loïc, un jeune entrepreneur Franco-Américain. "
    ),
    (
        "Forum des métiers et de l'orientation !",
        "Le 24 mai, de 10h à 11h30, dans l'amphithéâtre, sera organisé un forum pour en savoir plus et s'informer sur les métiers, les formations et les secteurs d'activité de sa région."
    ),
    (
        "La couture en folie !",
        "Le 26 mai, de 14h à 15h, le Méga concours de couture fait son retour.
Nos élèves de CAP couture auront le plaisir de vous présenter leur créations, à travers un défilé administré par nos jurys Mme BALUSSAUD Stéphanie et Mme BRETEAU Aurore."
    ),
    (
        "Cap à ANVERS !",
        "Le 14 juin, à 9h00, nos élèves de BAC pro Organisation de transport de marchandises font cap sur la Belgique afin de visiter le deuxième plus grand port d'Europe: le port d'Anvers."
    ),
    (
        "Verdier cup !",
        "Dans ce tournoi, prévu du juin au juin, chaque équipe devra s'affronter afin de remporter l'ultime coupe “Verdier”. Les vainqueurs auront le privilège d'aller assister à la finale de la coupe de France."
    ),
    (
        "La charité avant tout !",
        "Chaque 2 ans, c'est de bon coeur que nos élèves du lycée se dévouent afin de réunir un maximum de fournitures scolaires qui seront ensuite distribuer à la WildCodeSchool du Soudan du Sud. "
    );


INSERT INTO 
`actuality` (title, content)
VALUES ("C'est la rentrée !", "Retrouvez toutes les informations concernant la rentrée des classes et de l'internat prévue le 3 Septembre 2023"),
("Journée Porte ouverte", "Le samedi 10 mai 2023, le lycée vous ouvre ses portes de 9h à 17h !
Un accueil central, situé à l'entrée de l'établissement, vous permettra de découvrir les formations et services dédiés à la vie étudiante."), 
("Calendrier des sorties scolaires", "Retrouvez toutes les informations concernant les sorties scolaires organisées pour chaque chaque classes. "),
("L'internat", "Dans cette rubrique retrouvez toutes les informations concernant l'internat."),
("Forum des métiers et de l'orientation !", "Le 24 mai, de 10h à 11h30, dans l'amphithéâtre, sera organisé un forum pour en savoir plus et s'informer sur les métiers, les formations et les secteurs d'activité de sa région."),
("Cap à ANVERS !", "Le 14 juin, à 9h00, nos élèves de BAC pro Organisation de transport de marchandises font cap sur la Belgique afin de visiter le deuxième plus grand port d'Europe: le port d'Anvers."),
("La charité avant tout !", "Chaque 2 ans, c'est de bon coeur que nos élèves du lycée se dévouent afin de réunir un maximum de fournitures scolaires qui seront ensuite distribuer à la WildCodeSchool du Soudan du Sud. "),
("Meeting entreprise !", "Le  29 mai, de 10h à 11h30, aura lieu dans l'amphithéâtre, une conférence qui portera sur “l'avenir du travail”. Nous auront la chance de recevoir Mr MIZELE Loïc, un jeune entrepreneur Franco-Américain. "),
("La couture en folie !", "Le 26 mai, de 14h à 15h, le Méga concours de couture fait son retour.
Nos élèves de CAP couture auront le plaisir de vous présenter leur créations, à travers un défilé administré par nos jurys Mme BALUSSAUD Stéphanie et Mme BRETEAU Aurore."),
("Verdier cup !", "Dans ce tournoi, prévu du juin au juin, chaque équipe devra s'affronter afin de remporter l'ultime coupe “Verdier”. Les vainqueurs auront le privilège d'aller assister à la finale de la coupe de France.");


UPDATE actuality
SET image = "rentrée.webp"
WHERE id = 1;
UPDATE actuality
SET image = "jportes-ouverte.webp"
WHERE id = 2;
UPDATE actuality
SET image = "calendrier.webp"
WHERE id = 3;
UPDATE actuality
SET image = "internat.webp"
WHERE id = 4;
UPDATE actuality
SET image = "Forum-metiers.webp"
WHERE id = 5;
UPDATE actuality
SET image = "anverss.webp"
WHERE id = 6;
UPDATE actuality
SET image = "charité.webp"
WHERE id = 7;
UPDATE actuality

SET image = "meeting.webp"
SET image = "cap-anvers.webp"

WHERE id = 8;
UPDATE actuality
SET image = "concours-couture.webp"
WHERE id = 9;
UPDATE actuality

SET image = "jverdier-cup.webp"
WHERE id = 10;
=======
SET image = "charité.webp"
WHERE id = 10;
