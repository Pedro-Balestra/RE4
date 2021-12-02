DROP DATABASE IF EXISTS RE4;
CREATE DATABASE RE4;
USE RE4;

-- -----------------------------------------------------
-- Criando Tabela "Merchant"
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Merchant(
   idMerchant INT NOT NULL,
   items INT NOT NULL,
   PRIMARY KEY (idMerchant)
);

-- -----------------------------------------------------
-- Criando Tabela "Player"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Player (
  idPlayer INT NOT NULL AUTO_INCREMENT,
  namePlayer VARCHAR(45) NOT NULL,
  life DOUBLE NOT NULL,
  pasetas DOUBLE NOT NULL,
  inventory INT NOT NULL,
  idMerchant INT NOT NULL,
  PRIMARY KEY (idPlayer),
  CONSTRAINT fk_Player_Merchant1
    FOREIGN KEY (idMerchant)
    REFERENCES Merchant (idMerchant)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Criando Tabela "Item"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Item(
  idItem INT NOT NULL AUTO_INCREMENT,
  valueItem DOUBLE NOT NULL,
  typeItem VARCHAR(45) NOT NULL,
  nameItem VARCHAR(45) NOT NULL,
  idMerchant INT,
  PRIMARY KEY (idItem),
  CONSTRAINT fk_Item_Merchant1
    FOREIGN KEY (idMerchant)
    REFERENCES Merchant (idMerchant)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

-- -----------------------------------------------------
-- Criando Tabela "Gun"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Gun (
  idGun INT NOT NULL AUTO_INCREMENT,
  fire_power DOUBLE NOT NULL,
  firing_speed DOUBLE NOT NULL,
  reload_speed DOUBLE NOT NULL,
  capacity INT NOT NULL,
  rangeGun INT NOT NULL,
  explosion VARCHAR(10),
  capacity_total INT,
  num_bulls_mag INT,
  idItem INT NOT NULL,
  PRIMARY KEY (idGun),  
  CONSTRAINT fk_Gun_Item1
    FOREIGN KEY (idItem)
    REFERENCES Item (idItem)
    ON DELETE CASCADE
    ON UPDATE CASCADE
  );
  
-- -----------------------------------------------------
-- Criando Tabela "Belong"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Belong (
  idPlayer INT NOT NULL,
  idItem INT NOT NULL,
  PRIMARY KEY (idPlayer, idItem),
  CONSTRAINT fk_Player_has_Item_Player1
    FOREIGN KEY (idPlayer)
    REFERENCES Player (idPlayer)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Player_has_Item_Item1
    FOREIGN KEY (idItem)
    REFERENCES Item (idItem)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

select * from gun;
select * from item;