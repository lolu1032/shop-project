
-- 상품의 브랜드 테이블
CREATE TABLE IF NOT EXISTS `shop`.`brand` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `type` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- 상품 테이블 
CREATE TABLE IF NOT EXISTS `shop`.`goods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `goods_type` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `price` INT NOT NULL,
  `colorType` VARCHAR(25) NOT NULL,
  `discount_price` INT NULL DEFAULT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_goods_brand1_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_goods_brand1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `shop`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- 상품리뷰댓글 테이블 // 대댓글도 포함
CREATE TABLE IF NOT EXISTS `shop`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contents` VARCHAR(500) NOT NULL,
  `produceDay` DATETIME NOT NULL,
  `modiDate` DATETIME NULL DEFAULT NULL,
  `comment_id` INT NOT NULL,
  `goods_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_comment1_idx` (`comment_id` ASC) VISIBLE,
  INDEX `fk_comment_goods1_idx` (`goods_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `shop`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- 상품등록 테이블
CREATE TABLE IF NOT EXISTS `shop`.`goodspost` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `contents` VARCHAR(500) NOT NULL,
  `tag` VARCHAR(25) NULL DEFAULT NULL,
  `produceDay` DATETIME NOT NULL,
  `goods_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_goodspost_goods1_idx` (`goods_id` ASC) VISIBLE,
  INDEX `fk_goodspost_company1_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_goodspost_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_goodspost_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `shop`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- 상품관련 이미지 테이블
CREATE TABLE IF NOT EXISTS `shop`.`img` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `path` VARCHAR(100) NOT NULL,
  `type` VARCHAR(100) NOT NULL,
  `createDay` DATETIME NULL DEFAULT NULL,
  `goods_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_img_goods1_idx` (`goods_id` ASC) VISIBLE,
  CONSTRAINT `fk_img_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- 상품 관련 옵션 테이블
CREATE TABLE IF NOT EXISTS `shop`.`options` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `goods_id` INT NOT NULL,
  `color` VARCHAR(25) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `price` INT NOT NULL,
  `discount_price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_options_goods_idx` (`goods_id` ASC) VISIBLE,
  CONSTRAINT `fk_options_goods`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- 상품의 재고관리 테이블
CREATE TABLE IF NOT EXISTS `shop`.`inven` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `goods_id` INT NOT NULL,
  `options_id` INT NOT NULL,
  `storeDay` DATETIME NOT NULL,
  `modiDate` DATETIME NULL DEFAULT NULL,
  `count` INT NOT NULL,
  `lastUpdate` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inven_goods1_idx` (`goods_id` ASC) VISIBLE,
  INDEX `fk_inven_options1_idx` (`options_id` ASC) VISIBLE,
  CONSTRAINT `fk_inven_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inven_options1`
    FOREIGN KEY (`options_id`)
    REFERENCES `shop`.`options` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
