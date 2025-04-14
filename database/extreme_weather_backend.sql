-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 14, 2025 at 08:32 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extreme_weather_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `region`, `latitude`, `longitude`) VALUES
(1, 'Toronto', 'Ontario', 43.651070, -79.347015),
(2, 'Vancouver', 'British Columbia', 49.282700, -123.120700),
(3, 'Montreal', 'Quebec', 45.501700, -73.567300),
(4, 'Ottawa', 'Ontario', 45.421500, -75.699800),
(5, 'Calgary', 'Alberta', 51.044700, -114.071900),
(6, 'Edmonton', 'Alberta', 53.544400, -113.490900),
(7, 'Quebec City', 'Quebec', 46.813900, -71.208200),
(8, 'Halifax', 'Nova Scotia', 44.648800, -63.575200),
(9, 'Winnipeg', 'Manitoba', 49.895100, -97.138400),
(10, 'Victoria', 'British Columbia', 48.428400, -123.365600),
(11, 'Regina', 'Saskatchewan', 50.445400, -104.618900),
(12, 'Saskatoon', 'Saskatchewan', 52.133200, -106.670000),
(13, 'St. John\'s', 'Newfoundland and Labrador', 47.561500, -52.712600),
(14, 'Whitehorse', 'Yukon', 60.721200, -135.056800),
(15, 'Yellowknife', 'Northwest Territories', 62.454000, -114.371800),
(16, 'Iqaluit', 'Nunavut', 63.746700, -68.516700);

-- --------------------------------------------------------

--
-- Table structure for table `weather_reports`
--

DROP TABLE IF EXISTS `weather_reports`;
CREATE TABLE IF NOT EXISTS `weather_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location_id` int NOT NULL,
  `reported_date` date NOT NULL,
  `weather_image` varchar(255) NOT NULL,
  `temperature` varchar(10) DEFAULT NULL,
  `humidity` varchar(10) DEFAULT NULL,
  `wind_speed` varchar(10) DEFAULT NULL,
  `condition_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weather_reports`
--

INSERT INTO `weather_reports` (`id`, `title`, `description`, `location_id`, `reported_date`, `weather_image`, `temperature`, `humidity`, `wind_speed`, `condition_type`) VALUES
(1, 'Severe Snowstorm and Airport Incident', 'In February 2025, a severe snowstorm swept across Toronto, causing widespread disruption to daily life and transportation. The storm resulted in whiteout conditions, with visibility reduced to near zero, leading to hundreds of flight delays and cancellations at Toronto Pearson International Airport. Emergency crews worked tirelessly to clear roads, while residents were advised to stay indoors due to hazardous travel conditions. Power outages affected several neighborhoods, and local shelters opened their doors to assist those in need of warmth and safety.', 1, '2025-02-17', 'toronto_snowstorm_2025.jpg', ' -5°C', '80%', '35 km/h', 'Snowstorm'),
(2, 'Hailstorm in Montreal', 'On March 5, 2025, a powerful hailstorm hit Montreal, bringing large hailstones that damaged cars, rooftops, and windows across the city. The storm developed quickly and struck during rush hour, causing traffic chaos and minor injuries due to shattered glass and slippery roads. Emergency services responded to numerous calls, while meteorologists labeled it one of the strongest hailstorms to hit the region in recent years. The storm also affected spring crops in nearby agricultural zones, raising concerns for local farmers.', 3, '2025-03-05', 'montreal_hailstorm_2025.jpg', '5', '70', '40', 'Hailstorm'),
(3, 'Cold Front in Ottawa', 'On December 20, 2024, a sudden and intense cold front swept through Ottawa, plunging temperatures to -15°C overnight. The drastic temperature drop caught many off guard, leading to frozen pipes, traffic collisions on icy roads, and school closures. Local authorities issued frostbite warnings and urged citizens to minimize outdoor exposure. Homeless shelters experienced a spike in demand, prompting community outreach programs to distribute warm clothing and supplies. The cold front was part of a larger Arctic blast affecting much of eastern Canada.\r\n\r\n', 4, '2024-12-20', 'ottawa_coldfront_2024.jpg', '-15', '80', '30', 'Cold Front'),
(4, 'Wildfire in Calgary', 'In June 2025, a rapidly spreading wildfire erupted in the forested outskirts of Calgary. Fueled by dry conditions and strong winds, the fire prompted evacuation orders for several communities and temporarily closed major roadways. Firefighters from across Alberta were deployed, supported by aerial water bombers and ground crews. The smoke caused air quality alerts, and several events in the city were postponed or canceled. While no lives were lost, the wildfire caused significant property damage and raised awareness about the increasing risk of wildfires linked to climate change.', 5, '2025-06-10', 'calgary_wildfire_2025.jpg', '30', '40', '60', 'Wildfire'),
(5, 'Heavy Rainstorm in Edmonton', 'On April 25, 2025, a torrential rainstorm struck Edmonton, dumping heavy rainfall in a short period and overwhelming the city’s drainage system. Streets turned into rivers, with vehicles stranded in deep water and basements flooded in multiple neighborhoods. City workers responded to urgent drainage repairs and cleanup efforts, while several public transit routes were temporarily shut down. Local weather services recorded one of the highest rainfall totals for April on record. The storm underscored the need for improved urban flood infrastructure.', 6, '2025-04-25', 'edmonton_rainstorm_2025.jpg', '12', '90', '35', 'Rainstorm'),
(6, 'Tornado in Saskatchewan', 'A rare and powerful tornado touched down in rural Saskatchewan on May 15, 2025. The twister tore through farmlands and small towns, uprooting trees, damaging homes, and tossing vehicles. Witnesses described a roaring sound as the tornado carved a path through the province’s flat landscape. Luckily, there were no reported fatalities, thanks to early warnings and community preparedness. The storm caused millions in damages and drew national attention due to the unusual occurrence of such a strong tornado in the region.', 12, '2025-05-15', 'saskatchewan_tornado_2025.jpg', '20', '60', '70', 'Tornado'),
(7, 'Hurricane in St. John\'s', 'On October 10, 2025, a Category 2 hurricane made landfall near St. John’s, Newfoundland and Labrador, bringing intense winds and relentless rainfall. Coastal areas experienced storm surges and flooding, forcing the evacuation of several neighborhoods. The hurricane knocked out power to thousands of residents and caused extensive structural damage to buildings and docks. Recovery efforts began immediately as provincial and federal agencies coordinated relief and cleanup operations. The event served as a stark reminder of the increasing frequency of Atlantic storms reaching Canadian shores.', 13, '2025-10-10', 'stjohns_hurricane_2025.jpg', '18', '95', '90', 'Hurricane'),
(8, 'Blizzard in Whitehorse', 'On December 15, 2025, a fierce blizzard descended upon Whitehorse, Yukon, bringing freezing temperatures, blinding snow, and 45 km/h wind gusts. The storm paralyzed the city, closing schools, offices, and public transport. Snowdrifts piled high, and visibility on the roads was nearly nonexistent, prompting a city-wide travel advisory. Residents hunkered down as power lines struggled under the weight of snow and ice. While Whitehorse is no stranger to winter storms, the intensity of this blizzard ranked among the harshest in recent memory.', 14, '2025-12-15', 'whitehorse_blizzard_2025.jpg', '-18', '80', '45', 'Blizzard'),
(9, 'Heatwave in Iqaluit', 'In an unusual meteorological event, Iqaluit experienced a rare heatwave in July 2025, with temperatures soaring to 25°C. The prolonged heat was unprecedented in the Arctic region and raised alarms among scientists and residents alike. The warmth caused rapid snowmelt and thawing of permafrost, leading to localized flooding and infrastructure concerns. While many residents enjoyed the brief summer weather, environmental experts warned of the long-term implications of such temperature anomalies on the delicate Arctic ecosystem and wildlife.', 16, '2025-07-20', 'iqaluit_heatwave_2025.jpg', '25', '50', '20', 'Heatwave');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
