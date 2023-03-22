

/*
    Double-check we are connected to `dvdrental` database
*/
\connect dvdrental




/*
    Create `detailed_table`
*/
CREATE TABLE detailed_table (
    detailed_id SERIAL PRIMARY KEY,
    category TEXT NOT NULL,
    rental_date_local TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    rental_id INTEGER UNIQUE NOT NULL,
    amount NUMERIC(8,2)
);

ALTER TABLE ONLY public.detailed_table
    ADD CONSTRAINT detailed_table_rental_id_fkey
    FOREIGN KEY (rental_id)
    REFERENCES public.rental(rental_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;




/*
    Create `summary_table`
*/
CREATE TABLE summary_table (
    category TEXT PRIMARY KEY NOT NULL,
    rental_sales numeric(8,2) NOT NULL
);




/*
    Create and populate table for looking up UTC offsets for cities
*/
CREATE TABLE utc_offsets_for_cities (
    city_id smallint primary key not null, 
    city_name text not null, 
    utc_offset real not null
);

INSERT INTO utc_offsets_for_cities VALUES
(1, 'A Corua (La Corua)', 2), 
(2, 'Abha', 3), 
(3, 'Abu Dhabi', 4), 
(4, 'Acua', -5), 
(5, 'Adana', 3), 
(6, 'Addis Abeba', 3), 
(7, 'Aden', 3), 
(8, 'Adoni', 5.5), 
(9, 'Ahmadnagar', 5.5), 
(10, 'Akishima', 9), 
(11, 'Akron', -4), 
(12, 'al-Ayn', 4), 
(13, 'al-Hawiya', 3), 
(14, 'al-Manama', 3), 
(15, 'al-Qadarif', 2), 
(16, 'al-Qatif', 3), 
(17, 'Alessandria', 2), 
(18, 'Allappuzha (Alleppey)', 5.5), 
(19, 'Allende', -5), 
(20, 'Almirante Brown', -3), 
(21, 'Alvorada', -3), 
(22, 'Ambattur', 5.5), 
(23, 'Amersfoort', 2), 
(24, 'Amroha', 5.5), 
(25, 'Angra dos Reis', -3), 
(26, 'Anpolis', -3), 
(27, 'Antofagasta', -4), 
(28, 'Aparecida de Goinia', -3), 
(29, 'Apeldoorn', 2), 
(30, 'Araatuba', -3), 
(31, 'Arak', 4.5), 
(32, 'Arecibo', -4), 
(33, 'Arlington', -5), 
(34, 'Ashdod', 3), 
(35, 'Ashgabat', 5), 
(36, 'Ashqelon', 3), 
(37, 'Asuncin', -4), 
(38, 'Athenai', 3), 
(39, 'Atinsk', 7), 
(40, 'Atlixco', -5), 
(41, 'Augusta-Richmond County', -4), 
(42, 'Aurora', -5), 
(43, 'Avellaneda', -3), 
(44, 'Bag', -3), 
(45, 'Baha Blanca', -3), 
(46, 'Baicheng', 8), 
(47, 'Baiyin', 8), 
(48, 'Baku', 4), 
(49, 'Balaiha', 3), 
(50, 'Balikesir', 3), 
(51, 'Balurghat', 5.5), 
(52, 'Bamenda', 1), 
(53, 'Bandar Seri Begawan', 8), 
(54, 'Banjul', 0), 
(55, 'Barcelona', -4), 
(56, 'Basel', 2), 
(57, 'Bat Yam', 3), 
(58, 'Batman', 3), 
(59, 'Batna', 1), 
(60, 'Battambang', 7), 
(61, 'Baybay', 8), 
(62, 'Bayugan', 8), 
(63, 'Bchar', 1), 
(64, 'Beira', 2), 
(65, 'Bellevue', -7), 
(66, 'Belm', -3), 
(67, 'Benguela', 1), 
(68, 'Beni-Mellal', 0), 
(69, 'Benin City', 1), 
(70, 'Bergamo', 2), 
(71, 'Berhampore (Baharampur)', 5.5), 
(72, 'Bern', 2), 
(73, 'Bhavnagar', 5.5), 
(74, 'Bhilwara', 5.5), 
(75, 'Bhimavaram', 5.5), 
(76, 'Bhopal', 5.5), 
(77, 'Bhusawal', 5.5), 
(78, 'Bijapur', 5.5), 
(79, 'Bilbays', 2), 
(80, 'Binzhou', 8), 
(81, 'Birgunj', 104), 
(82, 'Bislig', 8), 
(83, 'Blumenau', -3), 
(84, 'Boa Vista', -4), 
(85, 'Boksburg', 2), 
(86, 'Botosani', 3), 
(87, 'Botshabelo', 2), 
(88, 'Bradford', 1), 
(89, 'Braslia', -4), 
(90, 'Bratislava', 2), 
(91, 'Brescia', 2), 
(92, 'Brest', 2), 
(93, 'Brindisi', 2), 
(94, 'Brockton', -4), 
(95, 'Bucuresti', 3), 
(96, 'Buenaventura', -5), 
(97, 'Bydgoszcz', 2), 
(98, 'Cabuyao', 8), 
(99, 'Callao', -5), 
(100, 'Cam Ranh', 7), 
(101, 'Cape Coral', -4), 
(102, 'Caracas', -4), 
(103, 'Carmen', -5), 
(104, 'Cavite', 8), 
(105, 'Cayenne', -3), 
(106, 'Celaya', -5), 
(107, 'Chandrapur', 5.5), 
(108, 'Changhwa', 8), 
(109, 'Changzhou', 8), 
(110, 'Chapra', 5.5), 
(111, 'Charlotte Amalie', -4), 
(112, 'Chatsworth', 2), 
(113, 'Cheju', 9), 
(114, 'Chiayi', 8), 
(115, 'Chisinau', 3), 
(116, 'Chungho', 8), 
(117, 'Cianjur', 7), 
(118, 'Ciomas', 7), 
(119, 'Ciparay', 7), 
(120, 'Citrus Heights', -7), 
(121, 'Citt del Vaticano', 2), 
(122, 'Ciudad del Este', -4), 
(123, 'Clarksville', -5), 
(124, 'Coacalco de Berriozbal', -5), 
(125, 'Coatzacoalcos', -5), 
(126, 'Compton', -7), 
(127, 'Coquimbo', -4), 
(128, 'Crdoba', -3), 
(129, 'Cuauhtmoc', -5), 
(130, 'Cuautla', -5), 
(131, 'Cuernavaca', -5), 
(132, 'Cuman', -4), 
(133, 'Czestochowa', 2), 
(134, 'Dadu', 5), 
(135, 'Dallas', -5), 
(136, 'Datong', 8), 
(137, 'Daugavpils', 3), 
(138, 'Davao', 8), 
(139, 'Daxian', 8), 
(140, 'Dayton', -4), 
(141, 'Deba Habe', 1), 
(142, 'Denizli', 3), 
(143, 'Dhaka', 6), 
(144, 'Dhule (Dhulia)', 5.5), 
(145, 'Dongying', 8), 
(146, 'Donostia-San Sebastin', 2), 
(147, 'Dos Quebradas', -5), 
(148, 'Duisburg', 2), 
(149, 'Dundee', 1), 
(150, 'Dzerzinsk', 3), 
(151, 'Ede', 2), 
(152, 'Effon-Alaiye', 1), 
(153, 'El Alto', -4), 
(154, 'El Fuerte', -6), 
(155, 'El Monte', -7), 
(156, 'Elista', 3), 
(157, 'Emeishan', 8), 
(158, 'Emmen', 2), 
(159, 'Enshi', 8), 
(160, 'Erlangen', 2), 
(161, 'Escobar', -3), 
(162, 'Esfahan', 4.5), 
(163, 'Eskisehir', 3), 
(164, 'Etawah', 5.5), 
(165, 'Ezeiza', -3), 
(166, 'Ezhou', 8), 
(167, 'Faaa', -10), 
(168, 'Fengshan', 8), 
(169, 'Firozabad', 5.5), 
(170, 'Florencia', -5), 
(171, 'Fontana', -7), 
(172, 'Fukuyama', 9), 
(173, 'Funafuti', 12), 
(174, 'Fuyu', 8), 
(175, 'Fuzhou', 8), 
(176, 'Gandhinagar', 5.5), 
(177, 'Garden Grove', -7), 
(178, 'Garland', -5), 
(179, 'Gatineau', -4), 
(180, 'Gaziantep', 3), 
(181, 'Gijn', 2), 
(182, 'Gingoog', 8), 
(183, 'Goinia', -3), 
(184, 'Gorontalo', 8), 
(185, 'Grand Prairie', -5), 
(186, 'Graz', 2), 
(187, 'Greensboro', -4), 
(188, 'Guadalajara', -5), 
(189, 'Guaruj', -3), 
(190, 'guas Lindas de Gois', -3), 
(191, 'Gulbarga', 5.5), 
(192, 'Hagonoy', 8), 
(193, 'Haining', 8), 
(194, 'Haiphong', 7), 
(195, 'Haldia', 5.5), 
(196, 'Halifax', -3), 
(197, 'Halisahar', 5.5), 
(198, 'Halle/Saale', 2), 
(199, 'Hami', 8), 
(200, 'Hamilton', 12), 
(201, 'Hanoi', 7), 
(202, 'Hidalgo', -5), 
(203, 'Higashiosaka', 9), 
(204, 'Hino', 9), 
(205, 'Hiroshima', 9), 
(206, 'Hodeida', 3), 
(207, 'Hohhot', 8), 
(208, 'Hoshiarpur', 5.5), 
(209, 'Hsichuh', 8), 
(210, 'Huaian', 8), 
(211, 'Hubli-Dharwad', 5.5), 
(212, 'Huejutla de Reyes', -5), 
(213, 'Huixquilucan', -5), 
(214, 'Hunuco', -5), 
(215, 'Ibirit', -3), 
(216, 'Idfu', 2), 
(217, 'Ife', 1), 
(218, 'Ikerre', 1), 
(219, 'Iligan', 8), 
(220, 'Ilorin', 1), 
(221, 'Imus', 8), 
(222, 'Inegl', 3), 
(223, 'Ipoh', 8), 
(224, 'Isesaki', 9), 
(225, 'Ivanovo', 3), 
(226, 'Iwaki', 9), 
(227, 'Iwakuni', 9), 
(228, 'Iwatsuki', 9), 
(229, 'Izumisano', 9), 
(230, 'Jaffna', 5.5), 
(231, 'Jaipur', 5.5), 
(232, 'Jakarta', 7), 
(233, 'Jalib al-Shuyukh', 3), 
(234, 'Jamalpur', 6), 
(235, 'Jaroslavl', 3), 
(236, 'Jastrzebie-Zdrj', 2), 
(237, 'Jedda', 3), 
(238, 'Jelets', 3), 
(239, 'Jhansi', 5.5), 
(240, 'Jinchang', 8), 
(241, 'Jining', 8), 
(242, 'Jinzhou', 8), 
(243, 'Jodhpur', 5.5), 
(244, 'Johannesburg', 2), 
(245, 'Joliet', -5), 
(246, 'Jos Azueta', -5), 
(247, 'Juazeiro do Norte', -3), 
(248, 'Juiz de Fora', -3), 
(249, 'Junan', 8), 
(250, 'Jurez', -5), 
(251, 'Kabul', 4.5), 
(252, 'Kaduna', 1), 
(253, 'Kakamigahara', 9), 
(254, 'Kaliningrad', 2), 
(255, 'Kalisz', 2), 
(256, 'Kamakura', 9), 
(257, 'Kamarhati', 5.5), 
(258, 'Kamjanets-Podilskyi', 3), 
(259, 'Kamyin', 3), 
(260, 'Kanazawa', 9), 
(261, 'Kanchrapara', 5.5), 
(262, 'Kansas City', -5), 
(263, 'Karnal', 5.5), 
(264, 'Katihar', 5.5), 
(265, 'Kermanshah', 4.5), 
(266, 'Kilis', 3), 
(267, 'Kimberley', 2), 
(268, 'Kimchon', 9), 
(269, 'Kingstown', -4), 
(270, 'Kirovo-Tepetsk', 3), 
(271, 'Kisumu', 3), 
(272, 'Kitwe', 2), 
(273, 'Klerksdorp', 2), 
(274, 'Kolpino', 3), 
(275, 'Konotop', 3), 
(276, 'Koriyama', 9), 
(277, 'Korla', 8), 
(278, 'Korolev', 3), 
(279, 'Kowloon and New Kowloon', 8), 
(280, 'Kragujevac', 2), 
(281, 'Ktahya', 3), 
(282, 'Kuching', 8), 
(283, 'Kumbakonam', 5.5), 
(284, 'Kurashiki', 9), 
(285, 'Kurgan', 5), 
(286, 'Kursk', 3), 
(287, 'Kuwana', 9), 
(288, 'La Paz', -5), 
(289, 'La Plata', -3), 
(290, 'La Romana', -4), 
(291, 'Laiwu', 8), 
(292, 'Lancaster', -4), 
(293, 'Laohekou', 8), 
(294, 'Lapu-Lapu', 8), 
(295, 'Laredo', -5), 
(296, 'Lausanne', 2), 
(297, 'Le Mans', 2), 
(298, 'Lengshuijiang', 8), 
(299, 'Leshan', 8), 
(300, 'Lethbridge', -6), 
(301, 'Lhokseumawe', 7), 
(302, 'Liaocheng', 8), 
(303, 'Liepaja', 3), 
(304, 'Lilongwe', 2), 
(305, 'Lima', -5), 
(306, 'Lincoln', -5), 
(307, 'Linz', 2), 
(308, 'Lipetsk', 3), 
(309, 'Livorno', 2), 
(310, 'Ljubertsy', 3), 
(311, 'Loja', -5), 
(312, 'London', 1), 
(313, 'London', -4), 
(314, 'Lublin', 2), 
(315, 'Lubumbashi', 2), 
(316, 'Lungtan', 8), 
(317, 'Luzinia', -3), 
(318, 'Madiun', 7), 
(319, 'Mahajanga', 3), 
(320, 'Maikop', 3), 
(321, 'Malm', 2), 
(322, 'Manchester', -4), 
(323, 'Mandaluyong', 8), 
(324, 'Mandi Bahauddin', 5), 
(325, 'Mannheim', 2), 
(326, 'Maracabo', -4), 
(327, 'Mardan', 5), 
(328, 'Maring', -3), 
(329, 'Masqat', 4), 
(330, 'Matamoros', -5), 
(331, 'Matsue', 9), 
(332, 'Meixian', 8), 
(333, 'Memphis', -5), 
(334, 'Merlo', -3), 
(335, 'Mexicali', -7), 
(336, 'Miraj', 5.5), 
(337, 'Mit Ghamr', 2), 
(338, 'Miyakonojo', 9), 
(339, 'Mogiljov', 3), 
(340, 'Molodetno', 3), 
(341, 'Monclova', -5), 
(342, 'Monywa', 6.5), 
(343, 'Moscow', 3), 
(344, 'Mosul', 3), 
(345, 'Mukateve', 3), 
(346, 'Munger (Monghyr)', 5.5), 
(347, 'Mwanza', 3), 
(348, 'Mwene-Ditu', 2), 
(349, 'Myingyan', 6.5), 
(350, 'Mysore', 5.5), 
(351, 'Naala-Porto', 2), 
(352, 'Nabereznyje Telny', 3), 
(353, 'Nador', 0), 
(354, 'Nagaon', 5.5), 
(355, 'Nagareyama', 9), 
(356, 'Najafabad', 4.5), 
(357, 'Naju', 9), 
(358, 'Nakhon Sawan', 7), 
(359, 'Nam Dinh', 7), 
(360, 'Namibe', 1), 
(361, 'Nantou', 8), 
(362, 'Nanyang', 8), 
(363, 'NDjamna', 1), 
(364, 'Newcastle', 2), 
(365, 'Nezahualcyotl', -5), 
(366, 'Nha Trang', 7), 
(367, 'Niznekamsk', 3), 
(368, 'Novi Sad', 2), 
(369, 'Novoterkassk', 3), 
(370, 'Nukualofa', 13), 
(371, 'Nuuk', -2), 
(372, 'Nyeri', 3), 
(373, 'Ocumare del Tuy', -4), 
(374, 'Ogbomosho', 1), 
(375, 'Okara', 5), 
(376, 'Okayama', 9), 
(377, 'Okinawa', 9), 
(378, 'Olomouc', 2), 
(379, 'Omdurman', 2), 
(380, 'Omiya', 9), 
(381, 'Ondo', 1), 
(382, 'Onomichi', 9), 
(383, 'Oshawa', -4), 
(384, 'Osmaniye', 3), 
(385, 'ostka', 3), 
(386, 'Otsu', 9), 
(387, 'Oulu', 3), 
(388, 'Ourense (Orense)', 2), 
(389, 'Owo', 1), 
(390, 'Oyo', 1), 
(391, 'Ozamis', 8), 
(392, 'Paarl', 2), 
(393, 'Pachuca de Soto', -5), 
(394, 'Pak Kret', 7), 
(395, 'Palghat (Palakkad)', 5.5), 
(396, 'Pangkal Pinang', 7), 
(397, 'Papeete', -10), 
(398, 'Parbhani', 5.5), 
(399, 'Pathankot', 5.5), 
(400, 'Patiala', 5.5), 
(401, 'Patras', 3), 
(402, 'Pavlodar', 6), 
(403, 'Pemalang', 7), 
(404, 'Peoria', -5), 
(405, 'Pereira', -5), 
(406, 'Phnom Penh', 7), 
(407, 'Pingxiang', 8), 
(408, 'Pjatigorsk', 3), 
(409, 'Plock', 2), 
(410, 'Po', 2), 
(411, 'Ponce', -4), 
(412, 'Pontianak', 7), 
(413, 'Poos de Caldas', -3), 
(414, 'Portoviejo', -5), 
(415, 'Probolinggo', 7), 
(416, 'Pudukkottai', 5.5), 
(417, 'Pune', 5.5), 
(418, 'Purnea (Purnia)', 5.5), 
(419, 'Purwakarta', 7), 
(420, 'Pyongyang', 9), 
(421, 'Qalyub', 2), 
(422, 'Qinhuangdao', 8), 
(423, 'Qomsheh', 4.5), 
(424, 'Quilmes', -3), 
(425, 'Rae Bareli', 5.5), 
(426, 'Rajkot', 5.5), 
(427, 'Rampur', 5.5), 
(428, 'Rancagua', -4), 
(429, 'Ranchi', 5.5), 
(430, 'Richmond Hill', -4), 
(431, 'Rio Claro', -3), 
(432, 'Rizhao', 8), 
(433, 'Roanoke', -4), 
(434, 'Robamba', -5), 
(435, 'Rockford', -5), 
(436, 'Ruse', 3), 
(437, 'Rustenburg', 2), 
(438, 's-Hertogenbosch', 2), 
(439, 'Saarbrcken', 2), 
(440, 'Sagamihara', 9), 
(441, 'Saint Louis', -5), 
(442, 'Saint-Denis', 4), 
(443, 'Sal', -4), 
(444, 'Salala', 4), 
(445, 'Salamanca', -5), 
(446, 'Salinas', -7), 
(447, 'Salzburg', 2), 
(448, 'Sambhal', 5.5), 
(449, 'San Bernardino', -7), 
(450, 'San Felipe de Puerto Plata', -4), 
(451, 'San Felipe del Progreso', -5), 
(452, 'San Juan Bautista Tuxtepec', -5), 
(453, 'San Lorenzo', -4), 
(454, 'San Miguel de Tucumn', -3), 
(455, 'Sanaa', 3), 
(456, 'Santa Brbara dOeste', -3), 
(457, 'Santa F', -3), 
(458, 'Santa Rosa', 8), 
(459, 'Santiago de Compostela', 2), 
(460, 'Santiago de los Caballeros', -4), 
(461, 'Santo Andr', -3), 
(462, 'Sanya', 8), 
(463, 'Sasebo', 9), 
(464, 'Satna', 5.5), 
(465, 'Sawhaj', 2), 
(466, 'Serpuhov', 3), 
(467, 'Shahr-e Kord', 4.5), 
(468, 'Shanwei', 8), 
(469, 'Shaoguan', 8), 
(470, 'Sharja', 4), 
(471, 'Shenzhen', 8), 
(472, 'Shikarpur', 5), 
(473, 'Shimoga', 5.5), 
(474, 'Shimonoseki', 9), 
(475, 'Shivapuri', 5.5), 
(476, 'Shubra al-Khayma', 2), 
(477, 'Siegen', 2), 
(478, 'Siliguri (Shiliguri)', 5.5), 
(479, 'Simferopol', 3), 
(480, 'Sincelejo', -5), 
(481, 'Sirjan', 4.5), 
(482, 'Sivas', 3), 
(483, 'Skikda', 1), 
(484, 'Smolensk', 3), 
(485, 'So Bernardo do Campo', -3), 
(486, 'So Leopoldo', -3), 
(487, 'Sogamoso', -5), 
(488, 'Sokoto', 1), 
(489, 'Songkhla', 7), 
(490, 'Sorocaba', -3), 
(491, 'Soshanguve', 2), 
(492, 'Sousse', 1), 
(493, 'South Hill', -4), 
(494, 'Southampton', 1), 
(495, 'Southend-on-Sea', 1), 
(496, 'Southport', 1), 
(497, 'Springs', 2), 
(498, 'Stara Zagora', 3), 
(499, 'Sterling Heights', -4), 
(500, 'Stockport', 1), 
(501, 'Sucre', -4), 
(502, 'Suihua', 8), 
(503, 'Sullana', -5), 
(504, 'Sultanbeyli', 3), 
(505, 'Sumqayit', 4), 
(506, 'Sumy', 3), 
(507, 'Sungai Petani', 8), 
(508, 'Sunnyvale', -7), 
(509, 'Surakarta', 7), 
(510, 'Syktyvkar', 3), 
(511, 'Syrakusa', 2), 
(512, 'Szkesfehrvr', 2), 
(513, 'Tabora', 3), 
(514, 'Tabriz', 4.5), 
(515, 'Tabuk', 3), 
(516, 'Tafuna', -11), 
(517, 'Taguig', 8), 
(518, 'Taizz', 3), 
(519, 'Talavera', 8), 
(520, 'Tallahassee', -4), 
(521, 'Tama', 9), 
(522, 'Tambaram', 5.5), 
(523, 'Tanauan', 8), 
(524, 'Tandil', -3), 
(525, 'Tangail', 6), 
(526, 'Tanshui', 8), 
(527, 'Tanza', 8), 
(528, 'Tarlac', 8), 
(529, 'Tarsus', 3), 
(530, 'Tartu', 3), 
(531, 'Teboksary', 3), 
(532, 'Tegal', 7), 
(533, 'Tel Aviv-Jaffa', 3), 
(534, 'Tete', 2), 
(535, 'Tianjin', 8), 
(536, 'Tiefa', 8), 
(537, 'Tieli', 8), 
(538, 'Tokat', 3), 
(539, 'Tonghae', 9), 
(540, 'Tongliao', 8), 
(541, 'Torren', 2), 
(542, 'Touliu', 8), 
(543, 'Toulon', 2), 
(544, 'Toulouse', 2), 
(545, 'Trshavn', 1), 
(546, 'Tsaotun', 8), 
(547, 'Tsuyama', 9), 
(548, 'Tuguegarao', 8), 
(549, 'Tychy', 2), 
(550, 'Udaipur', 5.5), 
(551, 'Udine', 2), 
(552, 'Ueda', 9), 
(553, 'Uijongbu', 9), 
(554, 'Uluberia', 5.5), 
(555, 'Urawa', 9), 
(556, 'Uruapan', -5), 
(557, 'Usak', 3), 
(558, 'Usolje-Sibirskoje', 8), 
(559, 'Uttarpara-Kotrung', 5.5), 
(560, 'Vaduz', 2), 
(561, 'Valencia', -4), 
(562, 'Valle de la Pascua', -4), 
(563, 'Valle de Santiago', -5), 
(564, 'Valparai', 5.5), 
(565, 'Vancouver', -7), 
(566, 'Varanasi (Benares)', 5.5), 
(567, 'Vicente Lpez', -3), 
(568, 'Vijayawada', 5.5), 
(569, 'Vila Velha', -3), 
(570, 'Vilnius', 3), 
(571, 'Vinh', 7), 
(572, 'Vitria de Santo Anto', -3), 
(573, 'Warren', -5), 
(574, 'Weifang', 8), 
(575, 'Witten', 2), 
(576, 'Woodridge', 8), 
(577, 'Wroclaw', 2), 
(578, 'Xiangfan', 8), 
(579, 'Xiangtan', 8), 
(580, 'Xintai', 8), 
(581, 'Xinxiang', 8), 
(582, 'Yamuna Nagar', 5.5), 
(583, 'Yangor', 12), 
(584, 'Yantai', 8), 
(585, 'Yaound', 1), 
(586, 'Yerevan', 4), 
(587, 'Yinchuan', 8), 
(588, 'Yingkou', 8), 
(589, 'York', 1), 
(590, 'Yuncheng', 8), 
(591, 'Yuzhou', 8), 
(592, 'Zalantun', 8), 
(593, 'Zanzibar', 3), 
(594, 'Zaoyang', 8), 
(595, 'Zapopan', -5), 
(596, 'Zaria', 1), 
(597, 'Zeleznogorsk', 7), 
(598, 'Zhezqazghan', 6), 
(599, 'Zhoushan', 8), 
(600, 'Ziguinchor', 0);




/*
    Function: get_local_timestamp(the_rental_id INTEGER)
*/
CREATE OR REPLACE FUNCTION get_local_timestamp(the_rental_id INTEGER)
RETURNS TIMESTAMP AS $$
DECLARE
    the_customer_city_id INTEGER;
    the_utc_offset_in_hours REAL;
    the_utc_offset_in_seconds INTEGER;
    the_rental_timestamp TIMESTAMP;
    the_local_timestamp TIMESTAMP;
BEGIN
    the_customer_city_id :=
        (SELECT address.city_id
            FROM rental
                JOIN customer USING (customer_id)
                JOIN address USING (address_id)
            WHERE rental.rental_id = the_rental_id);
    the_utc_offset_in_hours :=
        (SELECT utc_offset
            FROM utc_offsets_for_cities
            WHERE city_id = the_customer_city_id);
    the_utc_offset_in_seconds :=
        (SELECT CAST(the_utc_offset_in_hours * 3600 AS INTEGER));
    the_rental_timestamp :=
        (SELECT rental.rental_date
            FROM rental
            WHERE rental.rental_id = the_rental_id);
    the_local_timestamp :=
        (SELECT (the_rental_timestamp::timestamp + (INTERVAL '1 sec' * the_utc_offset_in_seconds::integer)));
    RETURN the_local_timestamp;
END;
$$ LANGUAGE 'plpgsql';




/*
    Function: day_of_week(the_ts TIMESTAMP)
*/
CREATE OR REPLACE FUNCTION day_of_week(the_ts TIMESTAMP)
RETURNS INT AS $$
DECLARE
    the_dow INTEGER;
BEGIN
    SELECT EXTRACT(DOW FROM the_ts) INTO the_dow;
    RETURN the_dow;
END;
$$ LANGUAGE 'plpgsql';




/*
    Function: is_weekend(the_ts TIMESTAMP)
*/
CREATE OR REPLACE FUNCTION is_weekend(the_ts TIMESTAMP)
RETURNS BOOLEAN AS $$
BEGIN
    IF
        (day_of_week(the_ts) = 5 AND the_ts::time >= '17:00:00'::time)
        OR day_of_week(the_ts) = 6
        OR day_of_week(the_ts) = 0
    THEN
        RETURN true;
    ELSE
        RETURN false;
    END IF;
END;
$$ LANGUAGE 'plpgsql';




/*
    Extract raw data from `dvdrental` to `detailed_table`, using the
    "ON CONFLICT ... DO NOTHING" technique to avoid duplicating rows
*/
INSERT INTO detailed_table (category, rental_date_local, rental_id, amount)
    (SELECT
        category.name AS "Category",
        get_local_timestamp(rental.rental_id) AS "Rental Date (Local)",
        rental.rental_id AS "Rental ID",
        payment.amount AS "Amount"
    FROM payment
        JOIN rental USING (rental_id)
        JOIN inventory USING (inventory_id)
        JOIN film USING (film_id)
        JOIN film_category USING (film_id)
        JOIN category USING (category_id)
    ) ON CONFLICT (rental_id) DO NOTHING;




/*
    Update `summary_table`
*/
CREATE OR REPLACE FUNCTION summary_table_update()
RETURNS trigger AS $$
BEGIN
    DELETE FROM summary_table;
    INSERT INTO summary_table (category, rental_sales)
        SELECT
            category,
            SUM(amount)
        FROM
            detailed_table
        WHERE
            is_weekend(rental_date_local) = true
        GROUP BY category
        ORDER BY SUM(amount) DESC;
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER update_summary_table
    AFTER INSERT ON detailed_table
    FOR EACH STATEMENT
    EXECUTE PROCEDURE summary_table_update();




CREATE OR REPLACE PROCEDURE refresh_detailed_and_summary_tables()
/*
    Procedure: `refresh_detailed_and_summary_tables()`
    Purpose:   Refresh the detailed_table and summary_table to include recent
                    weekend rental sales
    Author:    Tim Stewart
    Frequency: call this procedure weekly on Tuesday mornings
*/
LANGUAGE 'plpgsql' AS $$
BEGIN
/*  Clear contents of `detailed_table` */
DELETE FROM detailed_table;
/*  Clear contents of `summary_table` */
DELETE FROM summary_table;
/*  Load raw data into `detailed_table`. Note that because we already have a
    trigger installed on `detailed_table`, we don't have to explicitly refresh
    the `summary_table`. The `INSERT INTO detailed_table` statement will
    automatically invoke the trigger `update_summary_table` that is shown in
    Part E of the report.
*/
INSERT INTO detailed_table (category, rental_date_local, rental_id, amount)
    (SELECT
        category.name AS "Category",
        get_local_timestamp(rental.rental_id) AS "Rental Date (Local)",
        rental.rental_id AS "Rental ID",
        payment.amount AS "Amount"
    FROM payment
        JOIN rental USING (rental_id)
        JOIN inventory USING (inventory_id)
        JOIN film USING (film_id)
        JOIN film_category USING (film_id)
        JOIN category USING (category_id)
    ) ON CONFLICT (rental_id) DO NOTHING;
END
$$;
