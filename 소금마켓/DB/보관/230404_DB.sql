DROP TABLE TRADE;
DROP TABLE DECLARATION;
DROP TABLE NOTE;
DROP TABLE REPLY;
DROP TABLE QNA;
DROP TABLE IMG_FILE;
DROP TABLE SHARE_BOARD;
DROP TABLE FREE_BOARD;
DROP TABLE PRODUCT;
DROP TABLE USER_INFO;
DROP TABLE NOTICE;
DROP TABLE GRADE;
DROP TABLE CATEGORY;
DROP TABLE REGION;

DROP SEQUENCE SEQ_TRADE;
DROP SEQUENCE SEQ_DECLARATION;
DROP SEQUENCE SEQ_NOTE;
DROP SEQUENCE SEQ_REPLY;
DROP SEQUENCE SEQ_SHARE_BOARD;
DROP SEQUENCE SEQ_FREE_BOARD;
DROP SEQUENCE SEQ_QNA;
DROP SEQUENCE SEQ_IMG_FILE;
DROP SEQUENCE SEQ_PRODUCT;
DROP SEQUENCE SEQ_USER_INFO;
DROP SEQUENCE SEQ_NOTICE;
DROP SEQUENCE SEQ_CATEGORY;
DROP SEQUENCE SEQ_REGION;

CREATE SEQUENCE SEQ_TRADE;
CREATE SEQUENCE SEQ_DECLARATION;
CREATE SEQUENCE SEQ_NOTE;
CREATE SEQUENCE SEQ_REPLY;
CREATE SEQUENCE SEQ_SHARE_BOARD;
CREATE SEQUENCE SEQ_FREE_BOARD;
CREATE SEQUENCE SEQ_QNA;
CREATE SEQUENCE SEQ_IMG_FILE;
CREATE SEQUENCE SEQ_PRODUCT;
CREATE SEQUENCE SEQ_USER_INFO;
CREATE SEQUENCE SEQ_NOTICE;
CREATE SEQUENCE SEQ_CATEGORY;
CREATE SEQUENCE SEQ_REGION;

--------------------------------------------------
--------------    지역     ------------------	
--------------------------------------------------
CREATE TABLE REGION (
	REGION_NO NUMBER PRIMARY KEY,
	REGION_NAME VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN REGION.REGION_NO IS '지역코드';
COMMENT ON COLUMN REGION.REGION_NAME IS '지역명';

INSERT INTO REGION VALUES(SEQ_REGION.NEXTVAL, '서울시 마포구');
INSERT INTO REGION VALUES(SEQ_REGION.NEXTVAL, '부산시 해운대구');
INSERT INTO REGION VALUES(SEQ_REGION.NEXTVAL, '대전시 유성구');

--------------------------------------------------
--------------    카테고리     ------------------	
--------------------------------------------------
CREATE TABLE CATEGORY(
    CATEGORY_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(100) NOT NULL
    );
COMMENT ON COLUMN CATEGORY.CATEGORY_NO IS '카테고리 번호';
COMMENT ON COLUMN CATEGORY.CATEGORY_NAME IS '카테고리 이름';

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '디지털 가전');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '가구/인테리어');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '의류');

--------------------------------------------------
--------------     회원 등급     ------------------	
--------------------------------------------------
CREATE TABLE GRADE (
	GRADE_NO NUMBER DEFAULT 3 NOT NULL,
	GRADE_NAME VARCHAR2(100) DEFAULT '천일염' NOT NULL,
	MIN_GRADE NUMBER,
	MAX_GRADE NUMBER
);
COMMENT ON COLUMN GRADE.GRADE_NO IS '등급번호';
COMMENT ON COLUMN GRADE.GRADE_NAME IS '등급명';
COMMENT ON COLUMN GRADE.MIN_GRADE IS '최소값';
COMMENT ON COLUMN GRADE.MAX_GRADE IS '최대값';

INSERT INTO GRADE
VALUES (1, '히말라야 핑크솔트', 70, 99.9);
INSERT INTO GRADE
VALUES (2, '트러플 솔트', 45, 69.9);
INSERT INTO GRADE
VALUES (3, '천일염', 30, 44.9);
INSERT INTO GRADE
VALUES (4, '맛소금', 15, 29.9);
INSERT INTO GRADE
VALUES (5, '나트륨', 0, 14.9);

--------------------------------------------------
--------------    공지사항     ------------------	
--------------------------------------------------
CREATE TABLE NOTICE ( -- 공지사항 테이블 생성
NOTICE_NO NUMBER PRIMARY KEY,
NOTICE_TITLE VARCHAR2(200) NOT NULL,
NOTICE_CONTENT VARCHAR2(1000) NOT NULL,
CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
NOTICE_VIEWS NUMBER DEFAULT 0 NOT NULL,
DELETE_STATUS CHAR(1) DEFAULT 'N' CHECK(DELETE_STATUS IN ('Y', 'N')) NOT NULL );

INSERT INTO NOTICE (NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT) VALUES (SEQ_NOTICE.NEXTVAL, 'TITLE1', 'CONTENT1');
INSERT INTO NOTICE (NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT) VALUES (SEQ_NOTICE.NEXTVAL, 'TITLE2', 'CONTENT2');
INSERT INTO NOTICE (NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT) VALUES (SEQ_NOTICE.NEXTVAL, 'TITLE3', 'CONTENT3');


--------------------------------------------------
--------------     회원 정보     ------------------	
--------------------------------------------------
CREATE TABLE USER_INFO (
	USER_NO NUMBER PRIMARY KEY,
	USER_PWD VARCHAR2(20) NOT NULL,
	USER_NAME VARCHAR2(20) NOT NULL,
	BIRTH DATE DEFAULT SYSDATE NOT NULL,
	PHONE CHAR(11) NOT NULL,
	EMAIL VARCHAR2(45),
	USER_ID VARCHAR2(20) NOT NULL UNIQUE,
	ENROLL_DATE DATE DEFAULT SYSDATE,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
	SALTY_SCORE NUMBER DEFAULT 36.5,
    GRADE_NO NUMBER DEFAULT 3 NOT NULL,
    REGION_NO NUMBER NOT NULL,
    FOREIGN KEY(GRADE_NO) REFERENCES GRADE(GRADE_NO),
    FOREIGN KEY(REGION_NO) REFERENCES REGION(REGION_NO)
);
COMMENT ON COLUMN USER_INFO.USER_NO IS '회원번호';
COMMENT ON COLUMN USER_INFO.USER_PWD IS '회원비밀번호';
COMMENT ON COLUMN USER_INFO.USER_NAME IS '닉네임';
COMMENT ON COLUMN USER_INFO.BIRTH IS '생년월일';
COMMENT ON COLUMN USER_INFO.PHONE IS '전화번호';
COMMENT ON COLUMN USER_INFO.EMAIL IS '이메일';
COMMENT ON COLUMN USER_INFO.USER_ID IS '회원아이디';
COMMENT ON COLUMN USER_INFO.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN USER_INFO.STATUS IS '회원탈퇴여부';
COMMENT ON COLUMN USER_INFO.SALTY_SCORE IS '염도';
COMMENT ON COLUMN USER_INFO.GRADE_NO IS '등급번호';
COMMENT ON COLUMN USER_INFO.REGION_NO IS '지역코드';

INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'pass1234', '관리자1', DEFAULT, '01011112222', 
    'admin01@kh.or.kr', 'admin01', SYSDATE, DEFAULT, DEFAULT, DEFAULT, 1);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'pass1234', '관리자2', DEFAULT, '01022223333', 
    'admin02@kh.or.kr', 'admin02', SYSDATE, DEFAULT, DEFAULT, DEFAULT, 1);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'pass01', '홍길동', '2000-01-01', '01012345678', 
    'user01@kh.or.kr', 'user01', SYSDATE, DEFAULT, DEFAULT, DEFAULT, 2);


--------------------------------------------------
--------------    매물     ------------------	
--------------------------------------------------
create table product( -- PRODUCT 테이블 생성 
    product_no number primary key,
    product_name varchar2(100) not null,
    product_status char(1) default 'N' check (product_status in ('Y','N')) not null,
    price number not null,
    created_at date default sysdate not null,
    delete_status char(1) default 'N' check (delete_status in ('Y','N')) not null,
    description varchar(1000) not null,
    category_no number,
    foreign key (category_no) references category(category_no),
    user_no number,
    foreign key (user_no) references user_info(user_no),
    region_no number references region(region_no)
    );

insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, 'product1', 10000, 'description1', 1, 1, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, 'product2', 20000, 'description2', 1, 1, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, 'product3', 30000, 'description3', 1, 1, 1);

--------------------------------------------------
----------------    자유게시판  	------------------
--------------------------------------------------
CREATE TABLE FREE_BOARD (
	FREE_BOARD_NO NUMBER PRIMARY KEY,
	USER_NO NUMBER NOT NULL,
	BOARD_TITLE VARCHAR2(100) NOT NULL,
	BOARD_CONTENT VARCHAR2(2000) NOT NULL,
	CREATED_DATE DATE DEFAULT SYSDATE NOT NULL,
	BOARD_VIEWS NUMBER DEFAULT 0,
	DELETE_STATUS CHAR(1) DEFAULT 'Y' CHECK (DELETE_STATUS IN('Y', 'N')),
	CATEGORY VARCHAR2(100) NOT NULL,
    FOREIGN KEY (USER_NO) REFERENCES USER_INFO (USER_NO)
);

COMMENT ON COLUMN FREE_BOARD.FREE_BOARD_NO IS '게시판번호';
COMMENT ON COLUMN FREE_BOARD.USER_NO IS '작성자회원번호';
COMMENT ON COLUMN FREE_BOARD.BOARD_TITLE IS '게시판제목';
COMMENT ON COLUMN FREE_BOARD.BOARD_CONTENT IS '게시판내용';
COMMENT ON COLUMN FREE_BOARD.CREATED_DATE IS '게시판작성일';
COMMENT ON COLUMN FREE_BOARD.BOARD_VIEWS IS '조회수';
COMMENT ON COLUMN FREE_BOARD.DELETE_STATUS IS 'Y/N-삭제되지않음/삭제됨';
COMMENT ON COLUMN FREE_BOARD.CATEGORY IS '수다, 질문, 꿀팁 .. 하드코딩';

INSERT INTO FREE_BOARD VALUES (SEQ_FREE_BOARD.NEXTVAL, 1, '정말 힘드네요', '요즘 5000원 안으로 점심1끼 떼울데가 있나요?', '2023-03-01', DEFAULT, DEFAULT, '수다');
INSERT INTO FREE_BOARD VALUES (SEQ_FREE_BOARD.NEXTVAL, 2, '장난 똥때리나', ' 어제 무단횡단자 때문에 인생 종칠 뻔', '2023-03-02', DEFAULT, DEFAULT, '수다');
INSERT INTO FREE_BOARD VALUES (SEQ_FREE_BOARD.NEXTVAL, 3, '질문 있는데요', ' 지하철에 알리 주문 해 보신 분 있나요?', '2023-03-03', DEFAULT, DEFAULT, '질문');

--------------------------------------------------
----------------    나눔게시판  	------------------
--------------------------------------------------

CREATE TABLE SHARE_BOARD (
	SHARE_BOARD_NO NUMBER PRIMARY KEY,
	REGION_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
	BOARD_TITLE	VARCHAR2(100) NOT NULL,
	BOARD_CONTENT VARCHAR2(2000) NOT NULL,
	CREATED_DATE DATE DEFAULT SYSDATE NOT NULL,
	BOARD_VIEWS NUMBER DEFAULT 0,
	DELETE_STATUS CHAR(1) DEFAULT 'Y' CHECK (DELETE_STATUS IN('Y', 'N')),
	SHARE_STATUS CHAR(1) DEFAULT 'N' CHECK (SHARE_STATUS IN('Y', 'N')),
    FOREIGN KEY (REGION_NO) REFERENCES REGION (REGION_NO),
	FOREIGN KEY (USER_NO) REFERENCES USER_INFO (USER_NO)
);

COMMENT ON COLUMN SHARE_BOARD.SHARE_BOARD_NO IS '게시판번호';
COMMENT ON COLUMN SHARE_BOARD.REGION_NO IS '지역코드';
COMMENT ON COLUMN SHARE_BOARD.USER_NO IS '작성자회원번호';
COMMENT ON COLUMN SHARE_BOARD.BOARD_TITLE IS '게시판제목';
COMMENT ON COLUMN SHARE_BOARD.BOARD_CONTENT IS '게시판내용';
COMMENT ON COLUMN SHARE_BOARD.CREATED_DATE IS '게시판작성일';
COMMENT ON COLUMN SHARE_BOARD.BOARD_VIEWS IS '조회수';
COMMENT ON COLUMN SHARE_BOARD.DELETE_STATUS IS 'Y/N-삭제되지않음/삭제됨';
COMMENT ON COLUMN SHARE_BOARD.SHARE_STATUS IS 'Y/N-완료/진행중 // 나눔완료 시 평점 +5점';

INSERT INTO SHARE_BOARD VALUES (SEQ_SHARE_BOARD.NEXTVAL, 1, 1, '가방 나눔합니다!!', '필요하신분 연락주세요 감사합니다!!', '2023-03-01', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO SHARE_BOARD VALUES (SEQ_SHARE_BOARD.NEXTVAL, 2, 2, '포켓몬카드 나눔', '필요하신분 연락주세요 감사합니다!!', '2023-03-02', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO SHARE_BOARD VALUES (SEQ_SHARE_BOARD.NEXTVAL, 3, 3, '아이폰14PRO MAX 나눔', '필요하신분 연락주세요 감사합니다!!', '2023-03-03', DEFAULT, DEFAULT, DEFAULT);



--------------------------------------------------
--------------    상품 이미지     ------------------	
--------------------------------------------------
CREATE TABLE IMG_FILE (
	FILE_NO NUMBER PRIMARY KEY,
	CHANGE_FILE_NAME VARCHAR2(100) NOT NULL,
	CREATED_AT DATE DEFAULT SYSDATE NOT NULL,
	DELETE_STATUS CHAR(1) DEFAULT 'Y' NOT NULL,
	FILE_LEVEL CHAR(1) NOT NULL,
	PRODUCT_NO NUMBER DEFAULT NULL,
	FREE_BOARD_NO NUMBER DEFAULT NULL,
	SHARE_BOARD_NO NUMBER DEFAULT NULL,
	FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO),
	FOREIGN KEY (FREE_BOARD_NO) REFERENCES FREE_BOARD(FREE_BOARD_NO),
	FOREIGN KEY (SHARE_BOARD_NO) REFERENCES SHARE_BOARD(SHARE_BOARD_NO)
);

-- 매물 이미지 추가일경우
INSERT INTO IMG_FILE(FILE_NO
                   , CHANGE_FILE_NAME
                   , FILE_LEVEL
                   , PRODUCT_NO)
              VALUES(SEQ_IMG_FILE.NEXTVAL
                   , '~~~~~.jpg'
                   , 1
                   , 1);
                   
-- 자유게시판 이미지 추가일경우
INSERT INTO IMG_FILE(FILE_NO
                   , CHANGE_FILE_NAME
                   , FILE_LEVEL
                   , FREE_BOARD_NO)
              VALUES(SEQ_IMG_FILE.NEXTVAL
                   , '~~~~~.jpg'
                   , 1
                   , 2);
                   
-- 나눔게시판 이미지 추가일경우
INSERT INTO IMG_FILE(FILE_NO
                   , CHANGE_FILE_NAME
                   , FILE_LEVEL
                   , SHARE_BOARD_NO)
              VALUES(SEQ_IMG_FILE.NEXTVAL
                   , '~~~~~.jpg'
                   , 1
                   , 3);

--------------------------------------------------
--------------    1:1 문의     ------------------	
--------------------------------------------------
CREATE TABLE QNA( -- QNA 테이블 생성
    QNA_NO NUMBER PRIMARY KEY,
    Q_TITLE VARCHAR2(20) NOT NULL,
    Q_CONTENT VARCHAR2(1000) NOT NULL,
    Q_DATE DATE DEFAULT SYSDATE NOT NULL,
    QNA_VIEWS NUMBER DEFAULT 0 NOT NULL,
    A_CONTENT VARCHAR2(1000) NOT NULL,
    A_DATE DATE DEFAULT SYSDATE NOT NULL,
    USER_NO NUMBER NOT NULL,
    FOREIGN KEY (USER_NO) REFERENCES USER_INFO(USER_NO)
);

INSERT INTO QNA (QNA_NO, Q_TITLE, Q_CONTENT, A_CONTENT, USER_NO) VALUES ( SEQ_QNA.NEXTVAL, 'Q_TITLE1', 'Q_CONTENT1', 'A_CONTENT1',1);
INSERT INTO QNA (QNA_NO, Q_TITLE, Q_CONTENT, A_CONTENT, USER_NO) VALUES ( SEQ_QNA.NEXTVAL, 'Q_TITLE2', 'Q_CONTENT2', 'A_CONTENT2',1);
INSERT INTO QNA (QNA_NO, Q_TITLE, Q_CONTENT, A_CONTENT, USER_NO) VALUES ( SEQ_QNA.NEXTVAL, 'Q_TITLE3', 'Q_CONTENT3', 'A_CONTENT3',1);


--------------------------------------------------
----------------    댓글   	---------------------
--------------------------------------------------
CREATE TABLE REPLY (
    REPLY_NO NUMBER PRIMARY KEY,
    FREE_BOARD_NO NUMBER DEFAULT NULL,
    SHARE_BOARD_NO NUMBER DEFAULT NULL,
    USER_NO NUMBER NOT NULL,
    REPLY_CONTENT VARCHAR2 (2000) NOT NULL, 
    CREATED_DATE DATE DEFAULT SYSDATE NOT NULL,
    DELETE_STATUS CHAR (1) DEFAULT 'Y' CHECK (DELETE_STATUS IN('Y', 'N')),
    FOREIGN KEY (FREE_BOARD_NO) REFERENCES FREE_BOARD (FREE_BOARD_NO),
    FOREIGN KEY (SHARE_BOARD_NO) REFERENCES SHARE_BOARD (SHARE_BOARD_NO),
    FOREIGN KEY (USER_NO) REFERENCES USER_INFO (USER_NO)
);

-- 자유게시판 댓글인 경우
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 1, NULL, 1, '게시판댓글내용1', '2023-03-01', DEFAULT);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, NULL, 2, 2, '게시판댓글내용2', '2023-03-02', DEFAULT);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 3, NULL, 3, '게시판댓글내용3', '2023-03-03', DEFAULT);


--------------------------------------------------
----------------     쪽지   	---------------------
--------------------------------------------------

CREATE TABLE NOTE (
    NOTE_NO NUMBER PRIMARY KEY,
    RECEIVER_ID NUMBER NOT NULL,
    SENDER_ID NUMBER NOT NULL,
    SEND_TIME DATE DEFAULT SYSDATE NOT NULL,
    MESSAGE VARCHAR2 (2000) NOT NULL,
    FOREIGN KEY (RECEIVER_ID) REFERENCES USER_INFO(USER_NO),
    FOREIGN KEY (SENDER_ID) REFERENCES USER_INFO(USER_NO)
);

INSERT INTO NOTE 
VALUES (SEQ_NOTE.NEXTVAL
              , 1
              , 1
              , '2023-03-01'
              , '쪽지내용1');

INSERT INTO NOTE 
VALUES (SEQ_NOTE.NEXTVAL
              , 2
              , 2
              , '2023-03-02'
              , '쪽지내용2');

INSERT INTO NOTE 
VALUES (SEQ_NOTE.NEXTVAL
              , 3
              , 3
              , '2023-03-03'
            , '쪽지내용3');


--------------------------------------------------
----------------     신고   	---------------------
--------------------------------------------------
CREATE TABLE DECLARATION (
	DECLARE_NO NUMBER PRIMARY KEY,
	DECLARE_TITLE VARCHAR2(100) NOT NULL,
	DECLARE_CONTENT VARCHAR2(2000) NOT NULL,
	DECLARE_TYPE VARCHAR2(20) NOT NULL,
	DECLARE_CHECK NUMBER DEFAULT 1 NOT NULL,
	DECLARE_DATE DATE DEFAULT SYSDATE NOT NULL,
	DECLARE_REASON VARCHAR2(2000) NOT NULL,
	DECLARE_CHECK_DATE DATE DEFAULT SYSDATE NOT NULL,
    FREE_BOARD_NO NUMBER NOT NULL,
    SHARE_BOARD_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    FOREIGN KEY (FREE_BOARD_NO) REFERENCES FREE_BOARD(FREE_BOARD_NO),
	FOREIGN KEY (SHARE_BOARD_NO) REFERENCES SHARE_BOARD(SHARE_BOARD_NO),
    FOREIGN KEY (USER_NO) REFERENCES USER_INFO(USER_NO)
);
 
    

COMMENT ON COLUMN DECLARATION.DECLARE_CHECK IS '신고상태';
COMMENT ON COLUMN DECLARATION.DECLARE_REASON IS '사유';


INSERT INTO DECLARATION VALUES(SEQ_DECLARATION.NEXTVAL, 'title1', 'content1', '커뮤니티', DEFAULT, DEFAULT, 'reason1', DEFAULT, 1, 1, 1);
INSERT INTO DECLARATION VALUES(SEQ_DECLARATION.NEXTVAL, 'title2', 'content2', '거래', DEFAULT, DEFAULT, 'reason1', DEFAULT, 1 , 1, 1);
INSERT INTO DECLARATION VALUES(SEQ_DECLARATION.NEXTVAL, 'title3', 'content3', '커뮤니티', 2, DEFAULT, 'reason1', DEFAULT, 1 , 1, 1);

--------------------------------------------------
--------------    거래     ------------------	
--------------------------------------------------
CREATE TABLE TRADE(
    TRADE_NO NUMBER PRIMARY KEY,
    TRADE_DATE DATE,
    TRADE_SCORE NUMBER,
    REVIEW_CONTENT VARCHAR2(2000),
    REVIEW_DATE DATE DEFAULT SYSDATE,
    USER_NO NUMBER NOT NULL,
    FOREIGN KEY (USER_NO) REFERENCES USER_INFO(USER_NO),
    PRODUCT_NO NUMBER NOT NULL,
    FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO)
    );
COMMENT ON COLUMN TRADE.TRADE_NO IS '거래번호';
COMMENT ON COLUMN TRADE.TRADE_DATE IS '거래일';
COMMENT ON COLUMN TRADE.TRADE_SCORE IS '평점';
COMMENT ON COLUMN TRADE.REVIEW_CONTENT IS '후기내용';
COMMENT ON COLUMN TRADE.REVIEW_DATE IS '후기등록일';

INSERT INTO TRADE VALUES(SEQ_TRADE.NEXTVAL, '2023-04-01', 3, '매너가 좋아요', '2023-04-02', 1, 1);
INSERT INTO TRADE VALUES(SEQ_TRADE.NEXTVAL, '2023-03-01', 1, '별로에요', DEFAULT, 2, 2);
INSERT INTO TRADE VALUES(SEQ_TRADE.NEXTVAL, '2023-02-15', 3, '품질이 나빠요', '2023-03-03', 3, 3);

COMMIT;