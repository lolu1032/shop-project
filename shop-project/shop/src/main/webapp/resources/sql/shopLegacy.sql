
-- 유저테이블
CREATE TABLE IF NOT EXISTS `shop`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `pw` VARCHAR(255) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `nick` VARCHAR(100) NOT NULL,
  `grade` VARCHAR(50) NULL DEFAULT NULL,
  `number` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `joinDay` DATETIME NULL DEFAULT NULL,
  `modiDate` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- 카드테이블
CREATE TABLE IF NOT EXISTS `shop`.`card` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(100) NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_card_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_card_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `shop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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


-- 장바구니 테이블 
CREATE TABLE IF NOT EXISTS `shop`.`cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `goods_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cart_goods1_idx` (`goods_id` ASC) VISIBLE,
  INDEX `fk_cart_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `shop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- 주문테이블
CREATE TABLE IF NOT EXISTS `shop`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `addr` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `goodsPrice` INT NOT NULL,
  `payPrice` INT NOT NULL,
  `discountPrice` INT NULL DEFAULT NULL,
  `request` VARCHAR(255) NULL DEFAULT NULL,
  `orderDay` DATETIME NOT NULL,
  `card_id` INT NOT NULL,
  `cart_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_card1_idx` (`card_id` ASC) VISIBLE,
  INDEX `fk_orders_cart1_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_card1`
    FOREIGN KEY (`card_id`)
    REFERENCES `shop`.`card` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `shop`.`cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- 계좌테이블
CREATE TABLE IF NOT EXISTS `shop`.`account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `payPrice` INT NOT NULL,
  `num` VARCHAR(20) NOT NULL,
  `orders_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_account_orders1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `shop`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- 관리자테이블
CREATE TABLE IF NOT EXISTS `shop`.`admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `pw` VARCHAR(255) NOT NULL,
  `part` VARCHAR(25) NOT NULL,
  `joinDay` DATETIME NULL DEFAULT NULL,
  `modiDate` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- 공통코드 테이블
CREATE TABLE IF NOT EXISTS `shop`.`commcode` (
  `code` VARCHAR(50) NOT NULL,
  `topCode` VARCHAR(50) NULL DEFAULT NULL,
  `name` VARCHAR(25) NULL DEFAULT NULL,
  `explanation` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`code`))
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


-- 업체 테이블
CREATE TABLE IF NOT EXISTS `shop`.`company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `pw` VARCHAR(255) NOT NULL,
  `compName` VARCHAR(100) NOT NULL,
  `number` VARCHAR(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `joinDay` DATETIME NOT NULL,
  `modiDate` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
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


-- 찜하기 테이블
CREATE TABLE IF NOT EXISTS `shop`.`like` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `favDate` DATETIME NOT NULL,
  `goods_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_like_goods1_idx` (`goods_id` ASC) VISIBLE,
  CONSTRAINT `fk_like_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- 공지사항 테이블
CREATE TABLE IF NOT EXISTS `shop`.`notice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `createDay` DATETIME NULL DEFAULT NULL,
  `img` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- 문의사항 테이블
CREATE TABLE IF NOT EXISTS `shop`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contents` VARCHAR(500) NOT NULL,
  `produceDay` DATETIME NOT NULL,
  `delDate` DATETIME NULL DEFAULT NULL,
  `modiDate` DATETIME NULL DEFAULT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_question_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_question_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `shop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- 문의사항관련 댓글 테이블
CREATE TABLE IF NOT EXISTS `shop`.`recomment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contents` VARCHAR(255) NOT NULL,
  `createDay` DATETIME NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recomment_question1_idx` (`question_id` ASC) VISIBLE,
  CONSTRAINT `fk_recomment_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `shop`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
