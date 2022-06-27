-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: mysql.abdn.ac.uk
-- Generation Time: Nov 23, 2021 at 09:41 PM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `t10rc21_AFC`
--

-- --------------------------------------------------------

--
-- Table structure for table `Artists`
--

CREATE TABLE `Artists` (
  `Artists_Name` varchar(16) NOT NULL,
  `Date_Born` date NOT NULL,
  `Date_Died` date DEFAULT NULL,
  `Country_of_origin` text NOT NULL,
  `Epoch` text NOT NULL,
  `Main_style` text NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Artists`
--

INSERT INTO `Artists` (`Artists_Name`, `Date_Born`, `Date_Died`, `Country_of_origin`, `Epoch`, `Main_style`, `Description`) VALUES
('Alexandros ', '1156-02-07', '1206-01-06', 'France', 'Greek sculptor', 'wandering artist', 'Alexandros of Antioch was a Greek sculptor of the Hellenistic age. He is thought to be the sculptor of the famous Venus de Milo statue.'),
('Auguste Rodin', '1840-11-12', '1917-11-17', 'France', 'French sculptor', ' modern sculpture', 'François Auguste René Rodin (12 November 1840 – 17 November 1917) was a French sculptor generally considered the founder of modern sculpture. He was schooled traditionally and took a craftsman-like approach to his work. Rodin possessed a unique ability to model a complex, turbulent, and deeply pocketed surface in clay. He is known for such sculptures as The Thinker, Monument to Balzac, The Kiss, The Burghers of Calais, and The Gates of Hell.'),
('Barbara Hepworth', '1903-01-10', '1975-05-20', 'England', 'English artist and sculptor', ' Modern sculpture', 'Dame Jocelyn Barbara Hepworth DBE (10 January 1903 – 20 May 1975) was an English artist and sculptor. Her work exemplifies Modernism and in particular modern sculpture. Along with artists such as Ben Nicholson and Naum Gabo, Hepworth was a leading figure in the colony of artists who resided in St Ives during the Second World War.'),
('David Allan', '1744-02-13', '1796-08-06', 'United Kingdom', 'Scottish', 'Historical Painting', 'David Allan was a Scottish painter, limner and illustrator, best known for historical subjects and genre works.'),
('John Altoon', '1925-11-05', '1969-02-08', 'United States of America', 'Painting', 'figurative drawings', 'John Altoon (November 5, 1925 – February 8, 1969) was an American artist. Born in Los Angeles to immigrant Armenian parents, from 1947–1949 he attended the Otis Art Institute, from 1947 to 1950 he also attended the Art Center College of Design in Los Angeles, and in 1950 the Chouinard Art Institute. Altoon was a prominent figure in the LA art scene in the 1950s and 1960s. Exhibitions of his work have been held at the Museum of Contemporary Art San Diego, Whitney Museum of American Art, New York, Corcoran Gallery, Washington D.C, Fine Arts Museums of San Francisco, The Baxter Museum, Pasadena, and The Los Angeles County Museum of Art (opened June 2014).'),
('Leonardo ', '1452-04-15', '1519-05-02', 'France', 'Italian polymath', 'painter', 'Leonardo da Vinci was an Italian polymath of the High Renaissance who was active as a painter, draughtsman, engineer, scientist, theorist, sculptor and architect.'),
('Lysippos', '1925-11-23', '1999-10-06', 'Greek', ' Greek sculptor', 'Classical Greek', 'Lysippos was a Greek sculptor . Together with Scopas and Praxiteles, he is considered one of the three greatest sculptors of the Classical Greek era, bringing transition into the Hellenistic period.'),
('Salvador Dalí', '1904-02-03', '1989-02-08', 'Spain', 'Spanish surrealist artist', 'surrealist artist', 'Salvador Domingo Felipe Jacinto Dalí i Domènech, 1st Marquess of Dalí of Púbol gcYC was a Spanish surrealist artist renowned for his technical skill, precise draftsmanship, and the striking and bizarre images in his work. Born in Figueres, Catalonia, Spain, Dalí received his formal education in fine arts in Madrid'),
('Vincent', '1853-03-13', '1890-06-29', 'Neatherlands', 'Dutch', 'Impressionist painter', 'Vincent Willem van Gogh was a Dutch Post-Impressionist painter who posthumously became one of the most famous and influential figures in Western art history. In a decade, he created about 2,100 artworks, including around 860 oil paintings, most of which date from the last two years of his life.'),
('Alfred', '1954-02-01', '2005-04-01', 'United States of America', 'photojournalist', 'staff photographer', 'Alfred Eisenstaedt was a German-born American photographer and photojournalist. He began his career in Germany prior to World War II but achieved prominence as a staff photographer for Life magazine after moving to the U.S.');

-- --------------------------------------------------------

--
-- Table structure for table `Arts_Friend_Circle`
--

CREATE TABLE `Arts_Friend_Circle` (
  `Name_of_Museum` text NOT NULL,
  `Address` text NOT NULL,
  `Phone` int(11) NOT NULL,
  `Name_of _current _contract` text NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Arts_Friend_Circle`
--

INSERT INTO `Arts_Friend_Circle` (`Name_of_Museum`, `Address`, `Phone`, `Name_of _current _contract`, `Description`) VALUES
('Louvre Museum', 'Rue de Rivoli, 75001 Paris, France', 331402050, 'Jean-Luc Martinez', 'The Louvre, or the Louvre Museum, is the world\'s most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo.'),
('Museum of Contemporary Art San Diego', 'San Diego, California, US', 1234567890, 'Kathryn Kanjo', 'The Museum of Contemporary Art San Diego (or MCASD), in San Diego, California, US, is an art museum focused on the collection, preservation, exhibition, and interpretation of works of art from 1950 to the present.'),
('The British Museum', 'Great Russell St, London WC1B 3DG', 2073238299, 'Hartwig Fischer', 'The British Museum is a public institution dedicated to human history, art and culture located in the Bloomsbury area of London, England. Its permanent collection of some eight million works is among the largest and most comprehensive in existence, having been widely collected during the era of the British Empire');

-- --------------------------------------------------------

--
-- Table structure for table `Exhibition`
--

CREATE TABLE `Exhibition` (
  `Name_of_Exhibition` text NOT NULL,
  `Type_of_Exhibition` varchar(11) NOT NULL COMMENT '=loyal_Visitors.Exhibition_Preference',
  `Featured` enum('Yes','No') NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Display_Galleries` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Exhibition`
--

INSERT INTO `Exhibition` (`Name_of_Exhibition`, `Type_of_Exhibition`, `Featured`, `Start_Date`, `End_Date`, `Display_Galleries`) VALUES
('ABCD OF 2021', 'COLLECTIVE', 'Yes', '2021-12-07', '2022-03-11', 4),
('EFGH OF 2021', 'SOLO ', 'Yes', '2021-10-19', '2021-11-02', 1),
('IJK OF 2021', 'TEMPORARY ', 'No', '2021-11-16', '2021-12-01', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Loyal_Visitors`
--

CREATE TABLE `Loyal_Visitors` (
  `U_Loyality_no` text NOT NULL,
  `Exhibition_Preference` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Loyal_Visitors`
--

INSERT INTO `Loyal_Visitors` (`U_Loyality_no`, `Exhibition_Preference`) VALUES
('LM5268', 'COLLECTIVE'),
('LM7458', 'COLLECTIVE'),
('LM8524', 'SOLO');

-- --------------------------------------------------------

--
-- Table structure for table `others`
--

CREATE TABLE `others` (
  `UID_Art` varchar(16) NOT NULL,
  `Artist_Name` text NOT NULL,
  `Type` text NOT NULL,
  `Style` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `others`
--

INSERT INTO `others` (`UID_Art`, `Artist_Name`, `Type`, `Style`) VALUES
('AO4213', 'Alfred', 'Photo', 'Print Paper'),
('AO4559', 'Richard Drew', 'Photo', 'Dark Photography'),
('AO4885', ' Robert Capa', 'Photo', 'black and white photograph');

-- --------------------------------------------------------

--
-- Table structure for table `Painting`
--

CREATE TABLE `Painting` (
  `UID_Art` varchar(16) NOT NULL,
  `Artist_Name` text NOT NULL,
  `Category` enum('Painting') NOT NULL,
  `Type` text NOT NULL,
  `Material` text NOT NULL,
  `Style` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Painting`
--

INSERT INTO `Painting` (`UID_Art`, `Artist_Name`, `Category`, `Type`, `Material`, `Style`) VALUES
('AO3124', 'Vincent', 'Painting', 'Oil', 'Canvas', 'Abstract'),
('AO3658', 'Salvador Dalí', 'Painting', 'Watercolor', 'Paper', 'Modern'),
('AO3951', 'Leonardo', 'Painting', 'Oil', 'Poplar panel', 'Portrait ');

-- --------------------------------------------------------

--
-- Table structure for table `PublicArt_Object`
--

CREATE TABLE `PublicArt_Object` (
  `UID_Art` varchar(16) NOT NULL,
  `Title` text NOT NULL,
  `Type` enum('Paintings','Sculpture','Statue','others') NOT NULL,
  `Year_of_Creating` int(4) DEFAULT NULL,
  `Country_of_Origin` text NOT NULL,
  `Culture_of_Origin` text NOT NULL,
  `Epoch` text NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PublicArt_Object`
--

INSERT INTO `PublicArt_Object` (`UID_Art`, `Title`, `Type`, `Year_of_Creating`, `Country_of_Origin`, `Culture_of_Origin`, `Epoch`, `Description`) VALUES
('AO1214', 'Victorious Youth', 'Sculpture', 120, 'Greek', 'Greek', 'history of Greek art', 'The Victorious Youth, also known as Atleta di Fano, or Lisippo di Fano is a Greek bronze sculpture, made between 300 and 100 BC, in the collections of the J. Paul Getty Museum, Pacific Palisades, California. On its first rediscovery Bernard Ashmole and other scholars attributed it to Lysippos, a grand name in the history of Greek art; modern concerns are less with such traditional attributions than with the original social context: where the sculpture was made, for what context and who he might be.'),
('AO1234', 'The Thinker', 'Sculpture', 1904, 'France', 'French', ' The Gates of Hell', 'The Thinker (French: Le Penseur) is a bronze sculpture by Auguste Rodin, usually placed on a stone pedestal. The work depicts a nude male figure of heroic size sitting on a rock. He is seen leaning over, his right elbow placed on his left thigh, holding the weight of his chin on the back of his right hand. The pose is one of deep thought and contemplation, and the statue is often used as an image to represent philosophy.'),
('AO1284', 'Venus De Milo', 'Sculpture', 1705, 'Greek', 'Panhelleric Greek', 'Panhelleric Greek', 'The Venus de Milo is an ancient Greek sculpture from the Hellenistic period, depicting a Greek goddess. It is one of the most famous works of ancient Greek sculpture.'),
('AO3124', 'The Starry Night', 'Paintings', 1889, 'Netherlands ', 'Dutch', 'Dutch Post-Impressionist', 'The Starry Night is an oil-on-canvas painting by the Dutch Post-Impressionist painter Vincent van Gogh. Painted in June 1889, it depicts the view from the east-facing window of his asylum room at Saint-Rémy-de-Provence, just before sunrise, with the addition of an imaginary village.'),
('AO3658', 'The Persistence of Memory', 'Paintings', 1931, 'United states of America', 'Surrealism', 'Modern Art', 'The Persistence of Memory is a 1931 painting by artist Salvador Dalí and one of the most recognizable works of Surrealism. First shown at the Julien Levy Gallery in 1932, since 1934 the painting has been in the collection of the Museum of Modern Art in New York City, which received it from an anonymous donor. '),
('AO3951', 'Mona Lisa', 'Paintings', 1517, 'Italy', ' Italian Renaissance', 'Italian ', 'The Mona Lisa is a half-length portrait painting by Italian artist Leonardo da Vinci. Considered an archetypal masterpiece of the Italian Renaissance, it has been described as \"the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world\".'),
('AO4213', 'V-J Day in Times Square\r\n', 'others', 1945, 'United States Of America', 'photographs of celebrators', 'Modern', 'V-J Day in Times Square is a photograph by Alfred Eisenstaedt that portrays a U.S. Navy sailor embracing and kissing a total stranger—a dental assistant—on Victory over Japan Day in New York City\'s Times Square on August 14, 1945. '),
('AO4559', 'The Falling Man', 'others', 2001, 'United States of America', 'Dark', 'Modern', 'The Falling Man is a photograph taken by Associated Press photographer Richard Drew of a man falling from the World Trade Center during the September 11 attacks in New York City.'),
('AO4885', 'The Falling Soldier', 'others', 1936, 'Spain', 'Spanish War', 'Historic ', 'The Falling Soldier is a black and white photograph by Robert Capa, claimed to have been taken on Saturday, September 5, 1936. It was said to depict the death of a Republican Iberian Federation of Libertarian Youth soldier, during the Battle of Cerro Muriano in the Spanish Civil War.');

-- --------------------------------------------------------

--
-- Table structure for table `Record_Art_object`
--

CREATE TABLE `Record_Art_object` (
  `UID_Art` varchar(16) NOT NULL,
  `Date_of_Acquisition/Borrow` date NOT NULL,
  `Status` text NOT NULL,
  `Name_of_Exhibition` text,
  `Status_of_ownership` enum('Borrowed','Acquired') NOT NULL,
  `Date_of_return` date DEFAULT NULL,
  `Current Owner` text NOT NULL,
  `Source_of_Art` text NOT NULL,
  `Cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Record_Art_object`
--

INSERT INTO `Record_Art_object` (`UID_Art`, `Date_of_Acquisition/Borrow`, `Status`, `Name_of_Exhibition`, `Status_of_ownership`, `Date_of_return`, `Current Owner`, `Source_of_Art`, `Cost`) VALUES
('AO1122', '2021-11-10', 'Not on Display', NULL, 'Acquired', NULL, 'Museum of Contemporary Art San Diego\r\n', 'Louvre Museum', 2313414),
('AO1214', '2020-11-10', 'On Display at Regular Exhibition', NULL, 'Acquired', NULL, 'Museum of Contemporary Art San Diego', 'The British Museum', 75218),
('AO1234', '2021-06-15', 'On Display at Regular Exhibition', NULL, 'Acquired', NULL, 'Louvre Museum', 'Museum of Contemporary Art San Diego', 45264),
('AO1284', '2021-09-06', 'On Display at Regular Exhibition', NULL, 'Acquired', NULL, 'Museum of Contemporary Art San Diego', 'Louvre Museum', 57572),
('AO1558', '2021-11-22', 'Not on Display', NULL, 'Acquired', NULL, 'Louvre Museum', 'Salvatore Garau', 5856),
('AO3124', '2021-11-15', 'Not on display', NULL, 'Borrowed', '2022-05-17', 'Louvre Museum', 'Salvatore Garau', 245457),
('AO3658', '2021-08-24', 'On Display at Featured Exhibition', 'ABCD OF 2021', 'Acquired', NULL, 'The British Museum', 'Louvre Museum', 427575),
('AO3951', '2021-11-01', 'On Display at Featured Exhibition', 'ABCD OF 2021', 'Borrowed', '2022-02-18', 'Louvre Museum', 'The British Museum', 3234),
('AO4213', '2021-11-04', 'On Display at Featured Exhibition', 'EFGH OF 2021', 'Acquired', NULL, 'The British Museum', 'Salvatore Garau', 121332),
('AO4559', '2020-03-17', 'Not on Display', NULL, 'Borrowed', '2022-01-19', 'Museum of Contemporary Art San Diego', 'Louvre Museum', 12321),
('AO4885', '2021-11-03', 'On Display at Featured Exhibition', 'EFGH OF 2021', 'Borrowed', '2022-01-20', 'The British Museum', 'Museum of Contemporary Art San Diego', 4456);

-- --------------------------------------------------------

--
-- Table structure for table `Sculpture_Statue`
--

CREATE TABLE `Sculpture_Statue` (
  `UID_Art` varchar(16) NOT NULL,
  `Artist_Name` text NOT NULL,
  `Category` enum('Sculpture','Statue') NOT NULL,
  `Material` text NOT NULL,
  `Height` int(11) NOT NULL,
  `Weight` int(11) NOT NULL,
  `Style` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sculpture_Statue`
--

INSERT INTO `Sculpture_Statue` (`UID_Art`, `Artist_Name`, `Category`, `Material`, `Height`, `Weight`, `Style`) VALUES
('AO1214', ' J. Paul Getty', 'Statue', 'Bronze', 151, 524, 'Greek Statue'),
('AO1234', 'Auguste Rodin', 'Statue', 'Bronze', 193, 3025, 'posthumous castings'),
('AO1284', 'Alexandros', 'Statue', 'Parian Marble', 204, 5546, 'Greek Statue');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `Type` enum('Gallery Supervisor','Curator') NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Number_of_Art` int(11) DEFAULT NULL,
  `Type_of_Art` enum('Painting','Sculpture','Statue','others') DEFAULT NULL,
  `Specific_Art_id` text,
  `Galleries_Supervising` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`Type`, `Name`, `Number_of_Art`, `Type_of_Art`, `Specific_Art_id`, `Galleries_Supervising`) VALUES
('Gallery Supervisor', 'Boniface', NULL, NULL, NULL, '5'),
('Gallery Supervisor', 'Edward', NULL, NULL, NULL, '1'),
('Gallery Supervisor', 'Jason', NULL, NULL, NULL, '3'),
('Curator', 'Raheem', 5, 'Sculpture', 'AO1214', NULL),
('Curator', 'Zandeer', 2, 'Painting', 'AO3658', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Artists`
--
ALTER TABLE `Artists`
  ADD UNIQUE KEY `Name` (`Artists_Name`,`Date_Born`,`Date_Died`);

--
-- Indexes for table `Arts_Friend_Circle`
--
ALTER TABLE `Arts_Friend_Circle`
  ADD PRIMARY KEY (`Name_of_Museum`(16));

--
-- Indexes for table `Exhibition`
--
ALTER TABLE `Exhibition`
  ADD UNIQUE KEY `Type_of_Exhibition` (`Type_of_Exhibition`,`Start_Date`,`End_Date`);

--
-- Indexes for table `Loyal_Visitors`
--
ALTER TABLE `Loyal_Visitors`
  ADD PRIMARY KEY (`U_Loyality_no`(16));

--
-- Indexes for table `others`
--
ALTER TABLE `others`
  ADD PRIMARY KEY (`UID_Art`);

--
-- Indexes for table `Painting`
--
ALTER TABLE `Painting`
  ADD PRIMARY KEY (`UID_Art`);

--
-- Indexes for table `PublicArt_Object`
--
ALTER TABLE `PublicArt_Object`
  ADD PRIMARY KEY (`UID_Art`) USING BTREE;

--
-- Indexes for table `Record_Art_object`
--
ALTER TABLE `Record_Art_object`
  ADD PRIMARY KEY (`UID_Art`);

--
-- Indexes for table `Sculpture_Statue`
--
ALTER TABLE `Sculpture_Statue`
  ADD PRIMARY KEY (`UID_Art`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Painting`
--
ALTER TABLE `Painting`
  ADD CONSTRAINT `Painting_ibfk_1` FOREIGN KEY (`UID_Art`) REFERENCES `PublicArt_Object` (`UID_Art`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
