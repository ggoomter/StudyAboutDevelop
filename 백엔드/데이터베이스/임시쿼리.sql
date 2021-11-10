/* 테이블 생성 */
CREATE TABLE user(
userid varchar(30) NOT NULL,
auth_id   varchar(30) NOT NULL,
pw varchar(30) NOT NULL,
name varchar(30) NOT NULL,
gender varchar(2) NOT NULL,
brith_yyyy varchar(30) NOT NULL,
birth_mm varchar(30) NOT NULL,
bitrh_dd varchar(30) NOT NULL,
email varchar(30) NOT NULL,
phone int(11) NOT NULL,
adr1 varchar(30) NOT NULL,
adr2 varchar(30) NOT NULL,
reg_date datetime default current_timestamp   NOT NULL
);

CREATE TABLE `comment` (
   `comment_no`   int(3)   NULL,
   `post_no`   int(3)   NOT NULL,
   `board_no`   int(3)   NOT NULL,
   `comment_content`   varchar(100)   NOT NULL,
   `comment_user`   varchar(30)   NOT NULL,
   `reg_date`   datetime default current_timestamp   NOT NULL,
   `comment_modi`   varchar(30)   NULL,
   `comment_modidate`   datetime default current_timestamp   NULL
);

CREATE TABLE `coffee` (
   `class_id`   varchar(30)   NOT NULL,
   `class_name`   varchar(30)   NOT NULL,
   `class_content`   varchar(100)   NOT NULL,
   `class_img`   varchar(30)   NOT NULL
);

CREATE TABLE `func` (
   `func_id`   varchar(30)   NOT NULL,
   `func_cc`   varchar(30)   NOT NULL,
   `func_name`   varchar(30)   NOT NULL,
   `func_ctor`   varchar(30)   NULL,
   `func_date`   datetime default current_timestamp   NULL,
   `func_modi`   varchar(30)   NULL,
   `func_modi_date` datetime default current_timestamp   NULL
);

CREATE TABLE `auth_func` (
   `func_id`   varchar(30)   NOT NULL,
   `auth_id`   varchar(30)   NULL,
   `ctor`   varchar(30)   NULL,
   `ctor_date`   datetime default current_timestamp   NULL,
   `modifier`   varchar(30)   NULL,
   `modi_date`   datetime default current_timestamp   NULL
);

CREATE TABLE `auth` (
   `auth_id`   varchar(30)   NULL,
   `auth_name`   varchar(30)   NOT NULL,
   `auth_highid`   varchar(30)   NULL,
   `auth_ctor`   varchar(30)   NULL,
   `auth_date`   datetime default current_timestamp   NULL,
   `auth_modi`   varchar(30)   NULL,
   `auth_modi_date`   datetime default current_timestamp   NULL
);

CREATE TABLE `file` (
   `file_pid`   varchar(30)   NOT NULL,
   `post_no`   int(3)   NOT NULL,
   `board_no`   int(3)   NOT NULL,
   `file_id`   varchar(30)   NOT NULL,
   `file_class`   varchar(30)   NOT NULL,
   `file_extension`   varchar(10)   NOT NULL,
   `file_size`   varchar(30)   NOT NULL
);

CREATE TABLE `brand_coffee` (
   `brand_id`   varchar(30)   NOT NULL,
   `class_id`   varchar(30)   NOT NULL,
   `userid`   varchar(30)   NULL,
   `bc_content`   varchar(100)   NULL,
   `bc_image`   varchar(30)   NULL
);

CREATE TABLE `brand` (
   `brand_id`   varchar(30)   NOT NULL,
   `brand_name`   varchar(30)   NOT NULL,
   `brand_content`   varchar(30)   NOT NULL,
   `brand_logo`   varchar(30)   NOT NULL
);

CREATE TABLE `board` (
   `board_no`   int(3)   NOT NULL,
   `writer`   varchar(30)   NOT NULL,
   `board_name`   varchar(30)   NOT NULL,
   `board_code`   int(3)   NOT NULL,
   `regdate`   datetime default current_timestamp   NOT NULL,
   `board_modi`   varchar(30)   NULL,
   `board_modidate`   datetime default current_timestamp   NULL
);

CREATE TABLE `post` (
   `post_no`   int(3)   NOT NULL,
   `board_no`   int(3)   NOT NULL,
   `brand_id`   varchar(30)   NULL,
   `class_id`   varchar(30)   NULL,
   `writer`   varchar(30)   NOT NULL,
   `post_name`   varchar(30)   NOT NULL,
   `regdate`   datetime default current_timestamp   NOT NULL,
   `post_modi`   varchar(30)   NULL,
   `post_modidate`   datetime default current_timestamp   NULL,
   `viewcount`   int(5)   NOT NULL
);

CREATE TABLE `post_content` (
    `post_no` INT(3) NOT NULL,
    `board_no` INT(3) NOT NULL,
    `post_content` VARCHAR(100) NOT NULL,
    `img` VARCHAR(30) NULL
);


/* PK설정 */
ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
   `userid`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
   `comment_no`,
   `post_no`,
   `board_no`
);

ALTER TABLE `coffee` ADD CONSTRAINT `PK_COFFEE` PRIMARY KEY (
   `class_id`
);

ALTER TABLE `func` ADD CONSTRAINT `PK_FUNC` PRIMARY KEY (
   `func_id`
);

ALTER TABLE `auth_func` ADD CONSTRAINT `PK_AUTH_FUNC` PRIMARY KEY (
   `func_id`,
   `auth_id`
);

ALTER TABLE `auth` ADD CONSTRAINT `PK_AUTH` PRIMARY KEY (
   `auth_id`
);

ALTER TABLE `file` ADD CONSTRAINT `PK_FILE` PRIMARY KEY (
   `file_pid`,
   `post_no`,
   `board_no`
);

ALTER TABLE `brand_coffee` ADD CONSTRAINT `PK_BRAND_COFFEE` PRIMARY KEY (
   `brand_id`,
   `class_id`
);

ALTER TABLE `brand` ADD CONSTRAINT `PK_BRAND` PRIMARY KEY (
   `brand_id`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
   `board_no`
);

ALTER TABLE `post` ADD CONSTRAINT `PK_POST` PRIMARY KEY (
   `post_no`,
   `board_no`
);

ALTER TABLE `post_content` ADD CONSTRAINT `PK_POST_CONTENT` PRIMARY KEY (
   `post_no`,
   `board_no`
);





/* FK설정 */

ALTER TABLE `user` ADD CONSTRAINT `FK_auth_TO_user_1` FOREIGN KEY (
   `auth_id`
)
REFERENCES `auth` (
   `auth_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_post_TO_comment_1` FOREIGN KEY (
   `post_no`, `board_no`
)
REFERENCES `post` (
   `post_no`, `board_no`
);
-- ok

--------------------------------------------------------------------------------
ALTER TABLE `auth_func` ADD CONSTRAINT `FK_func_TO_auth_func_1` FOREIGN KEY (
   `func_id`
)
REFERENCES `func` (
   `func_id`
);

ALTER TABLE `auth_func` ADD CONSTRAINT `FK_auth_TO_auth_func_1` FOREIGN KEY (
   `auth_id`
)
REFERENCES `auth` (
   `auth_id`
);


----------------------------------------------------------------------------------- 이 사이만 에러
-- ok
ALTER TABLE `file` ADD CONSTRAINT `FK_post_TO_file_1` FOREIGN KEY (
   `post_no`, `board_no`
)
REFERENCES `post` (
   `post_no`, `board_no`
);


!-----------------------------------------------------------------------------------
ALTER TABLE `brand_coffee` ADD CONSTRAINT `FK_brand_TO_brand_coffee_1` FOREIGN KEY (
   `brand_id`, `class_id`
)
REFERENCES `brand` (
   `brand_id`, `class_id`
);


ALTER TABLE `board` ADD CONSTRAINT `FK_user_TO_board_1` FOREIGN KEY (
   `writer`
)
REFERENCES `user` (
   `userid`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_board_TO_post_1` FOREIGN KEY (
   `board_no`, `brand_id`, `class_id`, `writer`
)
REFERENCES `board`, `brand`, `coffee`, `user`  (
   `board_no`, `brand_id`, `class_id`, `userid`
);
!------------------------------------------------------------------------------------ 이 사이만 에러

-- ok
ALTER TABLE `post_content` ADD CONSTRAINT `FK_post_TO_post_content_1` FOREIGN KEY (
   `post_no`, `board_no`
)
REFERENCES `post` (
   `post_no`, `board_no`
);
