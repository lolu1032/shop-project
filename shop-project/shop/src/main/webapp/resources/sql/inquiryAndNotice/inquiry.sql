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
