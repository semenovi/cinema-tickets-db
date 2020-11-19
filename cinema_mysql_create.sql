CREATE TABLE `Заявки` (
	`Номер заявки` DECIMAL(8) NOT NULL AUTO_INCREMENT,
	`Фамилия клиента` varchar(32),
	`Имя клиента` varchar(32) NOT NULL,
	`Отчество клиента` varchar(32),
	`Номер сеанса` DECIMAL(8) NOT NULL,
	`Номер места` DECIMAL(8),
	PRIMARY KEY (`Номер заявки`)
);

CREATE TABLE `Сеансы` (
	`Номер сеанса` DECIMAL(8) NOT NULL AUTO_INCREMENT,
	`Название фильма` varchar(32) NOT NULL,
	`Время начана сеанса` DATETIME NOT NULL,
	`Время конца сеанса` DATETIME NOT NULL,
	`Стоимость элитных мест` DECIMAL(8) NOT NULL,
	`Стоимость комфортных мест` DECIMAL(8) NOT NULL,
	`Стоимость обычных мест` DECIMAL(8) NOT NULL,
	`Номер зала` DECIMAL(8) NOT NULL,
	PRIMARY KEY (`Номер сеанса`)
);

CREATE TABLE `Залы` (
	`Номер зала` DECIMAL(8) NOT NULL AUTO_INCREMENT,
	`Начало диапазона номеров мест` DECIMAL(8) NOT NULL,
	`Конец диапазона номеров мест` DECIMAL(8) NOT NULL,
	PRIMARY KEY (`Номер зала`)
);

CREATE TABLE `Места` (
	`Номер места` DECIMAL(8) NOT NULL AUTO_INCREMENT,
	`Тип места` DECIMAL(1) NOT NULL,
	`Номер места в зале (отображаемый)` DECIMAL(8) NOT NULL,
	PRIMARY KEY (`Номер места`)
);

CREATE TABLE `Бронь` (
	`Номер места` varchar(8) NOT NULL,
	`Номер сеанса` DECIMAL(8) NOT NULL,
	`Забронированность` varchar(1) NOT NULL
);

ALTER TABLE `Заявки` ADD CONSTRAINT `Заявки_fk0` FOREIGN KEY (`Номер сеанса`) REFERENCES `Сеансы`(`Номер сеанса`);

ALTER TABLE `Заявки` ADD CONSTRAINT `Заявки_fk1` FOREIGN KEY (`Номер места`) REFERENCES `Места`(`Номер места`);

ALTER TABLE `Сеансы` ADD CONSTRAINT `Сеансы_fk0` FOREIGN KEY (`Номер зала`) REFERENCES `Залы`(`Номер зала`);

ALTER TABLE `Залы` ADD CONSTRAINT `Залы_fk0` FOREIGN KEY (`Начало диапазона номеров мест`) REFERENCES `Места`(`Номер места`);

ALTER TABLE `Залы` ADD CONSTRAINT `Залы_fk1` FOREIGN KEY (`Конец диапазона номеров мест`) REFERENCES `Места`(`Номер места`);

ALTER TABLE `Бронь` ADD CONSTRAINT `Бронь_fk0` FOREIGN KEY (`Номер места`) REFERENCES `Места`(`Номер места`);

ALTER TABLE `Бронь` ADD CONSTRAINT `Бронь_fk1` FOREIGN KEY (`Номер сеанса`) REFERENCES `Сеансы`(`Номер сеанса`);

