CREATE TABLE tb_attach (
    idx INT NOT NULL AUTO_INCREMENT COMMENT '파일 번호 (PK)',
    board_idx INT NOT NULL COMMENT '게시글 번호 (FK)',
    original_name VARCHAR(260) NOT NULL COMMENT '원본 파일명',
    save_name VARCHAR(40) NOT NULL COMMENT '저장 파일명',
    size INT NOT NULL COMMENT '파일 크기',
    delete_yn ENUM('Y', 'N') NOT NULL DEFAULT 'N' COMMENT '삭제 여부',
    insert_time DATETIME NOT NULL DEFAULT NOW() COMMENT '등록일',
    delete_time DATETIME NULL COMMENT '삭제일',
    PRIMARY KEY (idx)
) comment '첨부 파일';

alter table tb_attach add constraint fk_attach_board_idx foreign key (board_idx) references tb_board(idx);

select *
from information_schema.TABLE_CONSTRAINTS
where TABLE_SCHEMA = 'board';