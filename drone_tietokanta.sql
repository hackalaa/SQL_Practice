SET 
  NAMES utf8;
SET 
  time_zone = '+00:00';
SET 
  foreign_key_checks = 0;
SET 
  sql_mode = 'NO_AUTO_VALUE_ON_ZERO';
DROP 
  TABLE IF EXISTS `drone`;
CREATE TABLE `drone` (
  `id` int NOT NULL, 
  `nimi` varchar(45) DEFAULT NULL, 
  `merkki` varchar(45) NOT NULL, 
  `malli` varchar(45) NOT NULL, 
  `lisätieto` varchar(120) DEFAULT NULL, 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
INSERT INTO `drone` (
  `id`, `nimi`, `merkki`, `malli`, `lisätieto`
) 
VALUES 
  (
    1, 'Drontti', 'Parrot', 'Anafi', 'Kamera: 21 megapikseliä, lentoaika: 25 minuuttia, kantama: 4 km'
  ), 
  (
    2, 'DJI Mavic Air 2', 'DJI', 'Mavic Air 2', 
    '4K-kameralla'
  ), 
  (
    3, 'Parrot Anafi USA', 'Parrot', 'Anafi USA', 
    'Thermal-kameralla'
  ), 
  (
    4, 'Autel Robotics EVO II', 'Autel Robotics', 
    'EVO II', '8K-kameralla'
  ), 
  (
    5, 'DJI Phantom 4 Pro V2.0', 'DJI', 
    'Phantom 4 Pro V2.0', '20 MP-kameralla'
  ), 
  (
    6, 'Yuneec Typhoon H Plus', 'Yuneec', 
    'Typhoon H Plus', '360 asteen kamera'
  ), 
  (
    7, 'Phantom 4', 'DJI', 'Phantom 4', 
    '4K-kamera'
  ), 
  (
    8, 'Mavic Air 2', 'DJI', 'Mavic Air 2', 
    'HDR-video'
  ), 
  (
    9, 'Spark', 'DJI', 'Spark', 'Elektroninen kuvanvakain'
  ), 
  (
    10, 'Inspire 2', 'DJI', 'Inspire 2', 
    'CinemaDNG- ja ProRes-tuki'
  ), 
  (
    11, 'Bebop 2', 'Parrot', 'Bebop 2', 
    '14 megapikselin kamera'
  );
DROP 
  TABLE IF EXISTS `dronen_varaus`;
CREATE TABLE `dronen_varaus` (
  `drone_id` int NOT NULL, 
  `käyttäjätunnus` varchar(45) NOT NULL, 
  `aloitus_pvm` datetime DEFAULT NULL, 
  `lopetus_pvm` datetime DEFAULT NULL, 
  PRIMARY KEY (`drone_id`, `käyttäjätunnus`), 
  KEY `fk_drone_has_käyttäjä_käyttäjä1_idx` (`käyttäjätunnus`), 
  KEY `fk_drone_has_käyttäjä_drone_idx` (`drone_id`), 
  CONSTRAINT `fk_drone_has_käyttäjä_drone` FOREIGN KEY (`drone_id`) REFERENCES `drone` (`id`), 
  CONSTRAINT `fk_drone_has_käyttäjä_käyttäjä1` FOREIGN KEY (`käyttäjätunnus`) REFERENCES `käyttäjä` (`käyttäjätunnus`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
INSERT INTO `dronen_varaus` (
  `drone_id`, `käyttäjätunnus`, 
  `aloitus_pvm`, `lopetus_pvm`
) 
VALUES 
  (
    1, 'Forbus', '2023-02-13 18:14:57', 
    '2023-03-24 18:15:15'
  ), 
  (
    1, 'sweetpotatoastronout', '2023-03-24 16:39:21', 
    NULL
  ), 
  (
    2, 'Forbus', '2023-03-24 18:16:08', 
    NULL
  ), 
  (
    3, 'potatochipstortoise', '2023-03-23 10:20:35', 
    NULL
  ), 
  (
    5, 'Teleca', '2023-03-21 08:16:30', 
    NULL
  ), 
  (
    6, 'winterberry', '2023-03-22 12:18:48', 
    NULL
  );
DROP 
  TABLE IF EXISTS `käyttäjä`;
CREATE TABLE `käyttäjä` (
  `käyttäjätunnus` varchar(45) NOT NULL, 
  SIVU 4 `nimi` varchar(80) NOT NULL, 
  `salasana` varchar(30) NOT NULL, 
  `token` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL, 
  PRIMARY KEY (`käyttäjätunnus`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
INSERT INTO `käyttäjä` (
  `käyttäjätunnus`, `nimi`, `salasana`, 
  `token`
) 
VALUES 
  (
    'darkmatter', 'Pepe Maria Grazia', 
    'letmein', 'qXI?G80LxyEcRHyB!EIPQvLm77=ughY=V9WL4YK7-
BwKx4GS40wSBgH8Q9OWS6h7'
  ), 
  (
    'Forbus', 'Jakov Ram', 'anasalas', 
    'Q2G?81BeSHsfGrez5n9xutJguMzJnq8!r=MkwI-0U9g4m6Hmvw2-D?!NilSyzkCJ'
  ), 
  (
    'potatochipstortoise', 'Sara Bente', 
    'dG7h8{vUGw-:aM3?', 'cjd7b2D0!hZlPuQgmZb==NimEfMT-
UPMu4NH?j?McjZQnd7/56BjUy4D=CBTN!TU'
  ), 
  (
    'sweetpotatoastronout', 'Amelia Fedelma', 
    'G~:75m]wn7JA_!_D', 'Dp0rT7Hps=pS4tF7fWEN4yDHBqM7x1!fvdKe=P6PK5jQc?9smY=f1QIXikQxby?4'
  ), 
  (
    'Teleca', 'Justin Hisham', 'siikret', 
    'zfqZnN2rfjMLwmm4HP8kGmED1SjBjiGNMbSb2SUamiXSjExsCVGf1YRh-N8=bdRy'
  ), 
  (
    'winterberry', 'Bertilo Lisa', 'seesam', 
    'Oy//3?qbJHtjCZMK8q-
9kqonVocZjWiO4WejLPQR5w346QQUmzr209QTnu6ms?U7'
  );
DROP 
  TABLE IF EXISTS `lähetysosoite`;
CREATE TABLE `lähetysosoite` (
  `id` int NOT NULL, 
  `osoite` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL, 
  `token` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL, 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
INSERT INTO `lähetysosoite` (`id`, `osoite`, `token`) 
VALUES 
  (
    1, 'https://analysointi-rajapinta.net/laheta-kuvat', 
    'EnAQN?QeYDpH=JOCuZ=u?e8fyfuoG/kxKYQRi1t5b/x7zIAruEbgoGfDmY9la5E2'
  ), 
  (
    2, 'https://example.com/analysointi', 
    'pb?GdwFaiOpW=/RyCu1xgfJhH2B-TNUll/5pSG99-
xMoYB7=QBRY8Un6VXwRwoi0'
  ), 
  (
    3, 'https://analysointipalvelu.fi/laheta', 
    'wjrsws6ZQEL6O84RfCQ=tKgwz6gkjoAIMnJpnpvbq=mnA-
?L4g//elm5bXPUNU/6'
  ), 
  (
    4, 'https://analysoi.dronekuvat.com', 
    'QusprTKlCC9sCOtYYiaaR6vX96Bncf=D6HVGXnYZqiW8cZifakBQdKsQQez?Pgq='
  ), 
  (
    5, 'https://analysointi.datacenter.net/laheta', 
    'E!x!pefKJH0J/BhnbhfvuK3zu1rq0GxF71OdfANPGQJ5aKwvpNbozgIGOzimz8HS'
  );
DROP 
  TABLE IF EXISTS `valokuva`;
CREATE TABLE `valokuva` (
  `id` int NOT NULL, 
  `nimi` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL, 
  `analyysi` varchar(45) DEFAULT NULL, 
  `leveysaste` float NOT NULL, 
  `pituusaste` float NOT NULL, 
  `päivämäärä` datetime NOT NULL, 
  `drone_id` int NOT NULL, 
  `käyttäjätunnus` varchar(45) NOT NULL, 
  `lähetysosoite_id` int NOT NULL, 
  PRIMARY KEY (
    `id`, `drone_id`, `käyttäjätunnus`, 
    `lähetysosoite_id`
  ), 
  KEY `fk_valokuva_dronen_varaus1_idx` (`drone_id`, `käyttäjätunnus`), 
  KEY `fk_valokuva_lähetysosoite1_idx` (`lähetysosoite_id`), 
  CONSTRAINT `fk_valokuva_dronen_varaus1` FOREIGN KEY (`drone_id`, `käyttäjätunnus`) REFERENCES `dronen_varaus` (`drone_id`, `käyttäjätunnus`), 
  CONSTRAINT `fk_valokuva_lähetysosoite1` FOREIGN KEY (`lähetysosoite_id`) REFERENCES `lähetysosoite` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
INSERT INTO `valokuva` (
  `id`, `nimi`, `analyysi`, `leveysaste`, 
  `pituusaste`, `päivämäärä`, 
  `drone_id`, `käyttäjätunnus`, 
  `lähetysosoite_id`
) 
VALUES 
  (
    1, 'korkealla.jpg', NULL, 61, 23, '2023-03-24 16:42:51', 
    1, 'sweetpotatoastronout', 1
  ), 
  (
    2, 'Teisko Golf', 'Maisemakuvaus', 
    61.6722, 23.7835, '2023-03-25 15:16:08', 
    2, 'Forbus', 3
  ), 
  (
    3, 'Siivikkalan pellot', 'Kasvustoseuranta', 
    61.5463, 23.8496, '2023-03-23 12:20:35', 
    3, 'potatochipstortoise', 2
  ), 
  SIVU 5 (
    4, 'Tampereen keskusta', 'Liikenteen seuranta', 
    61.4987, 23.7611, '2023-03-25 12:39:21', 
    1, 'sweetpotatoastronout', 4
  ), 
  (
    5, 'Pirkanmaan järvet', 'Vesistön tilan seuranta', 
    61.3435, 24.0161, '2023-03-21 10:16:30', 
    5, 'Teleca', 5
  ), 
  (
    6, 'Näsijärven rannat', 'Ympäristöseuranta', 
    61.5404, 24.0535, '2023-03-23 10:18:48', 
    6, 'winterberry', 5
  );
