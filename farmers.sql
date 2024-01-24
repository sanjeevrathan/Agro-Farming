SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `addagroproducts` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productdesc` text NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `addagroproducts` (`username`, `email`, `pid`, `productname`, `productdesc`, `price`) VALUES
('test', 'test@gmail.com', 1, 'GIRIJA CAULIFLOWER', ' Tips for Growing Cauliflower. Well drained medium loam and or sandy loam soils are suitable.', 520),
('test', 'test@gmail.com', 2, 'COTTON', 'Cotton is a soft, fluffy staple fiber that grows in a boll,around the seeds of the cotton ', 563),
('sanjeev', 'sanjeev@gmail.com', 3, 'silk', 'silk is best business developed from coocon for saries preparation and so on', 582);



CREATE TABLE `farming` (
  `fid` int(11) NOT NULL,
  `farmingtype` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `farming` (`fid`, `farmingtype`) VALUES
(1, 'Seed Farming'),
(2, 'coccon'),
(3, 'silk');



CREATE TABLE `register` (
  `rid` int(11) NOT NULL,
  `farmername` varchar(50) NOT NULL,
  `adharnumber` varchar(20) NOT NULL,
  `age` int(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phonenumber` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL,
  `farming` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DELIMITER $$
CREATE TRIGGER `deletion` BEFORE DELETE ON `register` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.rid,'FARMER DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertion` AFTER INSERT ON `register` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rid,'Farmer Inserted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updation` AFTER UPDATE ON `register` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rid,'FARMER UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------



CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `test` (`id`, `name`) VALUES
(1, 'sanjeev');



CREATE TABLE `trig` (
  `id` int(11) NOT NULL,
  `fid` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `trig` (`id`, `fid`, `action`, `timestamp`) VALUES
(1, '2', 'FARMER UPDATED', '2021-01-19 23:04:44'),
(2, '2', 'FARMER DELETED', '2021-01-19 23:04:58'),
(3, '8', 'Farmer Inserted', '2021-01-19 23:16:52'),
(4, '8', 'FARMER UPDATED', '2021-01-19 23:17:17'),
(5, '8', 'FARMER DELETED', '2021-01-19 23:18:54');

-- --------------------------------------------------------


CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(5, 'sanjeev', 'sanjeev@gmail.com', 'pbkdf2:sha256:150000$TfhDWqOr$d4cf40cc6cbfccbdcd1410f9e155ef2aa660620b0439a60c4d74085dbf007a4a');




ALTER TABLE `addagroproducts`
  ADD PRIMARY KEY (`pid`);


ALTER TABLE `farming`
  ADD PRIMARY KEY (`fid`);


ALTER TABLE `register`
  ADD PRIMARY KEY (`rid`);


ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `trig`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);



ALTER TABLE `addagroproducts`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `farming`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `register`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `trig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

