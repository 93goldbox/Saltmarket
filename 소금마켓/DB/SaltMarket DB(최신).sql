DROP TABLE TRADE;
DROP TABLE DECLARATION;
DROP TABLE NOTE;
DROP TABLE REPLY;
DROP TABLE PROFILE_IMG;
DROP TABLE ATTACHMENT;
DROP TABLE QNA;
DROP TABLE IMG_FILE;
DROP TABLE SHARE_BOARD;
DROP TABLE FREE_BOARD;
DROP TABLE WISHLIST;
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
DROP SEQUENCE SEQ_PROFILE_IMG;
DROP SEQUENCE SEQ_SHARE_BOARD;
DROP SEQUENCE SEQ_FREE_BOARD;
DROP SEQUENCE SEQ_ATTACHMENT;
DROP SEQUENCE SEQ_QNA;
DROP SEQUENCE SEQ_IMG_FILE;
DROP SEQUENCE SEQ_WISHLIST;
DROP SEQUENCE SEQ_PRODUCT;
DROP SEQUENCE SEQ_USER_INFO;
DROP SEQUENCE SEQ_NOTICE;
DROP SEQUENCE SEQ_CATEGORY;
DROP SEQUENCE SEQ_REGION;

CREATE SEQUENCE SEQ_TRADE;
CREATE SEQUENCE SEQ_DECLARATION;
CREATE SEQUENCE SEQ_NOTE;
CREATE SEQUENCE SEQ_REPLY;
CREATE SEQUENCE SEQ_PROFILE_IMG;
CREATE SEQUENCE SEQ_SHARE_BOARD;
CREATE SEQUENCE SEQ_FREE_BOARD;
CREATE SEQUENCE SEQ_QNA;
CREATE SEQUENCE SEQ_ATTACHMENT;
CREATE SEQUENCE SEQ_IMG_FILE;
CREATE SEQUENCE SEQ_WISHLIST;
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

INSERT INTO REGION VALUES (1, '강원도 강릉시');
INSERT INTO REGION VALUES (2, '강원도 고성군');
INSERT INTO REGION VALUES (3, '강원도 동해시');
INSERT INTO REGION VALUES (4, '강원도 삼척시');
INSERT INTO REGION VALUES (5, '강원도 속초시');
INSERT INTO REGION VALUES (6, '강원도 양구군');
INSERT INTO REGION VALUES (7, '강원도 양양군');
INSERT INTO REGION VALUES (8, '강원도 영월군');
INSERT INTO REGION VALUES (9, '강원도 원주시');
INSERT INTO REGION VALUES (10, '강원도 인제군');
INSERT INTO REGION VALUES (11, '강원도 정선군');
INSERT INTO REGION VALUES (12, '강원도 철원군');
INSERT INTO REGION VALUES (13, '강원도 춘천시');
INSERT INTO REGION VALUES (14, '강원도 태백시');
INSERT INTO REGION VALUES (15, '강원도 평창군');
INSERT INTO REGION VALUES (16, '강원도 홍천군');
INSERT INTO REGION VALUES (17, '강원도 화천군');
INSERT INTO REGION VALUES (18, '강원도 횡성군');
INSERT INTO REGION VALUES (19, '경기도 가평군');
INSERT INTO REGION VALUES (20, '경기도 고양시');
INSERT INTO REGION VALUES (21, '경기도 과천시');
INSERT INTO REGION VALUES (22, '경기도 광명시');
INSERT INTO REGION VALUES (23, '경기도 광주시');
INSERT INTO REGION VALUES (24, '경기도 구리시');
INSERT INTO REGION VALUES (25, '경기도 군포시');
INSERT INTO REGION VALUES (26, '경기도 김포시');
INSERT INTO REGION VALUES (27, '경기도 남양주시');
INSERT INTO REGION VALUES (28, '경기도 동두천시');
INSERT INTO REGION VALUES (29, '경기도 부천시');
INSERT INTO REGION VALUES (30, '경기도 성남시');
INSERT INTO REGION VALUES (31, '경기도 수원시');
INSERT INTO REGION VALUES (32, '경기도 시흥시');
INSERT INTO REGION VALUES (33, '경기도 안산시');
INSERT INTO REGION VALUES (34, '경기도 안성시');
INSERT INTO REGION VALUES (35, '경기도 안양시');
INSERT INTO REGION VALUES (36, '경기도 양주시');
INSERT INTO REGION VALUES (37, '경기도 양평군');
INSERT INTO REGION VALUES (38, '경기도 여주시');
INSERT INTO REGION VALUES (39, '경기도 연천군');
INSERT INTO REGION VALUES (40, '경기도 오산시');
INSERT INTO REGION VALUES (41, '경기도 용인시');
INSERT INTO REGION VALUES (42, '경기도 의왕시');
INSERT INTO REGION VALUES (43, '경기도 의정부시');
INSERT INTO REGION VALUES (44, '경기도 이천시');
INSERT INTO REGION VALUES (45, '경기도 파주시');
INSERT INTO REGION VALUES (46, '경기도 평택시');
INSERT INTO REGION VALUES (47, '경기도 포천시');
INSERT INTO REGION VALUES (48, '경기도 하남시');
INSERT INTO REGION VALUES (49, '경기도 화성시');
INSERT INTO REGION VALUES (50, '경상남도 거제시');
INSERT INTO REGION VALUES (51, '경상남도 거창군');
INSERT INTO REGION VALUES (52, '경상남도 김해시');
INSERT INTO REGION VALUES (53, '경상남도 남해군');
INSERT INTO REGION VALUES (54, '경상남도 밀양시');
INSERT INTO REGION VALUES (55, '경상남도 사천시');
INSERT INTO REGION VALUES (56, '경상남도 산청군');
INSERT INTO REGION VALUES (57, '경상남도 양산시');
INSERT INTO REGION VALUES (58, '경상남도 의령군');
INSERT INTO REGION VALUES (59, '경상남도 진주시');
INSERT INTO REGION VALUES (60, '경상남도 창녕군');
INSERT INTO REGION VALUES (61, '경상남도 창원시');
INSERT INTO REGION VALUES (62, '경상남도 통영시');
INSERT INTO REGION VALUES (63, '경상남도 하동군');
INSERT INTO REGION VALUES (64, '경상남도 함안군');
INSERT INTO REGION VALUES (65, '경상남도 함양군');
INSERT INTO REGION VALUES (66, '경상남도 합천군');
INSERT INTO REGION VALUES (67, '경상북도 경산시');
INSERT INTO REGION VALUES (68, '경상북도 경주시');
INSERT INTO REGION VALUES (69, '경상북도 고령군');
INSERT INTO REGION VALUES (70, '경상북도 구미시');
INSERT INTO REGION VALUES (71, '경상북도 군위군');
INSERT INTO REGION VALUES (72, '경상북도 김천시');
INSERT INTO REGION VALUES (73, '경상북도 문경시');
INSERT INTO REGION VALUES (74, '경상북도 봉화군');
INSERT INTO REGION VALUES (75, '경상북도 상주시');
INSERT INTO REGION VALUES (76, '경상북도 성주군');
INSERT INTO REGION VALUES (77, '경상북도 안동시');
INSERT INTO REGION VALUES (78, '경상북도 영덕군');
INSERT INTO REGION VALUES (79, '경상북도 영양군');
INSERT INTO REGION VALUES (80, '경상북도 영주시');
INSERT INTO REGION VALUES (81, '경상북도 영천시');
INSERT INTO REGION VALUES (82, '경상북도 예천군');
INSERT INTO REGION VALUES (83, '경상북도 울릉군');
INSERT INTO REGION VALUES (84, '경상북도 울진군');
INSERT INTO REGION VALUES (85, '경상북도 의성군');
INSERT INTO REGION VALUES (86, '경상북도 청도군');
INSERT INTO REGION VALUES (87, '경상북도 청송군');
INSERT INTO REGION VALUES (88, '경상북도 칠곡군');
INSERT INTO REGION VALUES (89, '경상북도 포항시');
INSERT INTO REGION VALUES (90, '광주광역시 광산구');
INSERT INTO REGION VALUES (91, '광주광역시 남구');
INSERT INTO REGION VALUES (92, '광주광역시 동구');
INSERT INTO REGION VALUES (93, '광주광역시 북구');
INSERT INTO REGION VALUES (94, '광주광역시 서구');
INSERT INTO REGION VALUES (95, '대구광역시 달서구');
INSERT INTO REGION VALUES (96, '대구광역시 달성군');
INSERT INTO REGION VALUES (97, '대구광역시 수성구');
INSERT INTO REGION VALUES (98, '대구광역시 중구');
INSERT INTO REGION VALUES (99, '대전광역시 대덕구');
INSERT INTO REGION VALUES (100, '대전광역시 유성구');
INSERT INTO REGION VALUES (101, '부산광역시 강서구');
INSERT INTO REGION VALUES (102, '부산광역시 금정구');
INSERT INTO REGION VALUES (103, '부산광역시 기장군');
INSERT INTO REGION VALUES (104, '부산광역시 동래구');
INSERT INTO REGION VALUES (105, '부산광역시 부산진구');
INSERT INTO REGION VALUES (106, '부산광역시 사상구');
INSERT INTO REGION VALUES (107, '부산광역시 사하구');
INSERT INTO REGION VALUES (108, '부산광역시 수영구');
INSERT INTO REGION VALUES (109, '부산광역시 연제구');
INSERT INTO REGION VALUES (110, '부산광역시 영도구');
INSERT INTO REGION VALUES (111, '부산광역시 해운대구');
INSERT INTO REGION VALUES (112, '서울특별시 강남구');
INSERT INTO REGION VALUES (113, '서울특별시 강동구');
INSERT INTO REGION VALUES (207, '서울특별시 강서구');
INSERT INTO REGION VALUES (114, '서울특별시 강북구');
INSERT INTO REGION VALUES (115, '서울특별시 관악구');
INSERT INTO REGION VALUES (116, '서울특별시 광진구');
INSERT INTO REGION VALUES (117, '서울특별시 구로구');
INSERT INTO REGION VALUES (118, '서울특별시 금천구');
INSERT INTO REGION VALUES (119, '서울특별시 노원구');
INSERT INTO REGION VALUES (120, '서울특별시 도봉구');
INSERT INTO REGION VALUES (121, '서울특별시 동대문구');
INSERT INTO REGION VALUES (122, '서울특별시 동작구');
INSERT INTO REGION VALUES (123, '서울특별시 마포구');
INSERT INTO REGION VALUES (124, '서울특별시 서대문구');
INSERT INTO REGION VALUES (125, '서울특별시 서초구');
INSERT INTO REGION VALUES (126, '서울특별시 성동구');
INSERT INTO REGION VALUES (127, '서울특별시 성북구');
INSERT INTO REGION VALUES (128, '서울특별시 송파구');
INSERT INTO REGION VALUES (129, '서울특별시 양천구');
INSERT INTO REGION VALUES (130, '서울특별시 영등포구');
INSERT INTO REGION VALUES (131, '서울특별시 용산구');
INSERT INTO REGION VALUES (132, '서울특별시 은평구');
INSERT INTO REGION VALUES (133, '서울특별시 종로구');
INSERT INTO REGION VALUES (134, '서울특별시 중랑구');
INSERT INTO REGION VALUES (135, '울산광역시 울주군');
INSERT INTO REGION VALUES (136, '인천광역시 강화군');
INSERT INTO REGION VALUES (137, '인천광역시 계양구');
INSERT INTO REGION VALUES (138, '인천광역시 남동구');
INSERT INTO REGION VALUES (139, '인천광역시 미추홀구');
INSERT INTO REGION VALUES (140, '인천광역시 부평구');
INSERT INTO REGION VALUES (141, '인천광역시 연수구');
INSERT INTO REGION VALUES (142, '인천광역시 옹진군');
INSERT INTO REGION VALUES (143, '전라남도 강진군');
INSERT INTO REGION VALUES (144, '전라남도 고흥군');
INSERT INTO REGION VALUES (145, '전라남도 곡성군');
INSERT INTO REGION VALUES (146, '전라남도 광양시');
INSERT INTO REGION VALUES (147, '전라남도 구례군');
INSERT INTO REGION VALUES (148, '전라남도 나주시');
INSERT INTO REGION VALUES (149, '전라남도 담양군');
INSERT INTO REGION VALUES (150, '전라남도 목포시');
INSERT INTO REGION VALUES (151, '전라남도 무안군');
INSERT INTO REGION VALUES (152, '전라남도 보성군');
INSERT INTO REGION VALUES (153, '전라남도 순천시');
INSERT INTO REGION VALUES (154, '전라남도 신안군');
INSERT INTO REGION VALUES (155, '전라남도 여수시');
INSERT INTO REGION VALUES (156, '전라남도 영광군');
INSERT INTO REGION VALUES (157, '전라남도 영암군');
INSERT INTO REGION VALUES (158, '전라남도 완도군');
INSERT INTO REGION VALUES (159, '전라남도 장성군');
INSERT INTO REGION VALUES (160, '전라남도 장흥군');
INSERT INTO REGION VALUES (161, '전라남도 진도군');
INSERT INTO REGION VALUES (162, '전라남도 함평군');
INSERT INTO REGION VALUES (163, '전라남도 해남군');
INSERT INTO REGION VALUES (164, '전라남도 화순군');
INSERT INTO REGION VALUES (165, '전라북도 고창군');
INSERT INTO REGION VALUES (166, '전라북도 군산시');
INSERT INTO REGION VALUES (167, '전라북도 김제시');
INSERT INTO REGION VALUES (168, '전라북도 남원시');
INSERT INTO REGION VALUES (169, '전라북도 무주군');
INSERT INTO REGION VALUES (170, '전라북도 부안군');
INSERT INTO REGION VALUES (171, '전라북도 순창군');
INSERT INTO REGION VALUES (172, '전라북도 완주군');
INSERT INTO REGION VALUES (173, '전라북도 익산시');
INSERT INTO REGION VALUES (174, '전라북도 임실군');
INSERT INTO REGION VALUES (175, '전라북도 장수군');
INSERT INTO REGION VALUES (176, '전라북도 전주시');
INSERT INTO REGION VALUES (177, '전라북도 정읍시');
INSERT INTO REGION VALUES (178, '전라북도 진안군');
INSERT INTO REGION VALUES (179, '제주특별자치도 서귀포시');
INSERT INTO REGION VALUES (180, '제주특별자치도 제주시');
INSERT INTO REGION VALUES (181, '충청남도 계룡시');
INSERT INTO REGION VALUES (182, '충청남도 공주시');
INSERT INTO REGION VALUES (183, '충청남도 금산군');
INSERT INTO REGION VALUES (184, '충청남도 논산시');
INSERT INTO REGION VALUES (185, '충청남도 당진시');
INSERT INTO REGION VALUES (186, '충청남도 보령시');
INSERT INTO REGION VALUES (187, '충청남도 부여군');
INSERT INTO REGION VALUES (188, '충청남도 서산시');
INSERT INTO REGION VALUES (189, '충청남도 서천군');
INSERT INTO REGION VALUES (190, '충청남도 아산시');
INSERT INTO REGION VALUES (191, '충청남도 예산군');
INSERT INTO REGION VALUES (192, '충청남도 천안시');
INSERT INTO REGION VALUES (193, '충청남도 청양군');
INSERT INTO REGION VALUES (194, '충청남도 태안군');
INSERT INTO REGION VALUES (195, '충청남도 홍성군');
INSERT INTO REGION VALUES (196, '충청북도 괴산군');
INSERT INTO REGION VALUES (197, '충청북도 단양군');
INSERT INTO REGION VALUES (198, '충청북도 보은군');
INSERT INTO REGION VALUES (199, '충청북도 영동군');
INSERT INTO REGION VALUES (200, '충청북도 옥천군');
INSERT INTO REGION VALUES (201, '충청북도 음성군');
INSERT INTO REGION VALUES (202, '충청북도 제천시');
INSERT INTO REGION VALUES (203, '충청북도 증평군');
INSERT INTO REGION VALUES (204, '충청북도 진천군');
INSERT INTO REGION VALUES (205, '충청북도 청주시');
INSERT INTO REGION VALUES (206, '충청북도 충주시');

--------------------------------------------------
--------------    카테고리     ------------------	
--------------------------------------------------
CREATE TABLE CATEGORY(
    CATEGORY_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(100) NOT NULL
    );
COMMENT ON COLUMN CATEGORY.CATEGORY_NO IS '카테고리 번호';
COMMENT ON COLUMN CATEGORY.CATEGORY_NAME IS '카테고리 이름';

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '전체');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '패션/잡화');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '디지털/가전');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '스포츠/레저');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '도서/티켓/문구');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '뷰티/미용');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '가구/인테리어');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '생활/주방용품');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '반려동물용품');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '기타');

--------------------------------------------------
--------------     회원 등급     ------------------	
--------------------------------------------------
CREATE TABLE GRADE (
	GRADE_NO NUMBER PRIMARY KEY,
	GRADE_NAME VARCHAR2(100),
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
	USER_ID VARCHAR2(20) NOT NULL UNIQUE,    
	USER_PWD VARCHAR2(20) NOT NULL,
	USER_NAME VARCHAR2(45) NOT NULL,
	PHONE CHAR(11),
	EMAIL VARCHAR2(45),
    ADDRESS VARCHAR2(100) NOT NULL,
	ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
	STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
	SALTY_SCORE NUMBER DEFAULT 36.5 NOT NULL,
    GRADE_NO NUMBER DEFAULT 3 NOT NULL,
    REGION_NO NUMBER,
    FOREIGN KEY(GRADE_NO) REFERENCES GRADE(GRADE_NO),
    FOREIGN KEY(REGION_NO) REFERENCES REGION(REGION_NO)
);
COMMENT ON COLUMN USER_INFO.USER_NO IS '회원번호';
COMMENT ON COLUMN USER_INFO.USER_ID IS '회원아이디';
COMMENT ON COLUMN USER_INFO.USER_PWD IS '회원비밀번호';
COMMENT ON COLUMN USER_INFO.USER_NAME IS '닉네임';
COMMENT ON COLUMN USER_INFO.PHONE IS '전화번호';
COMMENT ON COLUMN USER_INFO.EMAIL IS '이메일';
COMMENT ON COLUMN USER_INFO.ADDRESS IS '주소';
COMMENT ON COLUMN USER_INFO.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN USER_INFO.STATUS IS '회원탈퇴여부';
COMMENT ON COLUMN USER_INFO.SALTY_SCORE IS '염도';
COMMENT ON COLUMN USER_INFO.GRADE_NO IS '등급번호';
COMMENT ON COLUMN USER_INFO.REGION_NO IS '지역코드';

INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'admin01', '1234', '관리자1', '01011112222', 
    'admin01@kh.or.kr', '서울특별시 영등포구', SYSDATE, DEFAULT, DEFAULT, DEFAULT, 130);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'admin02', '1234', '관리자2', '01022223333', 
    'admin02@kh.or.kr', '서울특별시 영등포구', SYSDATE, DEFAULT, DEFAULT, DEFAULT, 130);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user01', 'pass01', '소금홀릭', '01012341111', 
    'user01@naver.com', '서울특별시 마포구', SYSDATE, DEFAULT, DEFAULT, 4, 123);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user02', 'pass02', '김소금', '01012342222', 
    'user02@naver.com', '서울특별시 마포구', SYSDATE, DEFAULT, DEFAULT, 5, 123);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user03', 'pass03', '보노보노', '01012343333', 
    'user03@naver.com', '서울특별시 마포구', SYSDATE, DEFAULT, DEFAULT, 1, 123);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user04', 'pass04', '솔트러버', '01012344444', 
    'user04@naver.com', '서울특별시 마포구', SYSDATE, DEFAULT, DEFAULT, 1, 123);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user05', 'pass05', '치맥', '01012345555',
    'user05@naver.com', '인천광역시 계양구', SYSDATE, DEFAULT, 59, 2, 137);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user06', 'pass06', '소담', '01012346666',
    'user06@naver.com', '서울특별시 은평구', SYSDATE, DEFAULT, DEFAULT, 3, 132);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user07', 'pass07', '쩝쩝박사', '01012347777',
    'user07@naver.com', '경기도 고양시', SYSDATE, DEFAULT, DEFAULT, 3, 20);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user08', 'pass08', '소금빵', '01012348888',
    'user08@naver.com', '경기도 안산시', SYSDATE, DEFAULT, DEFAULT, 3, 33);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user09', 'pass09', '펭하', '01012349999',
    'user09@naver.com', '강원도 삼척시', SYSDATE, DEFAULT, 26.5, 4, 4);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user10', 'pass10', '디마루스', '01012340010',
    'user10@naver.com', '경상북도 구미시', SYSDATE, DEFAULT, DEFAULT, 3, 70);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user11', 'pass11', '피오스카', '01012340011',
    'user11@naver.com', '서울특별시 은평구', SYSDATE, DEFAULT, 29, 4, 132);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user12', 'pass12', '빈츠', '01012340012',
    'user12@naver.com', '광주광역시 남구', SYSDATE, DEFAULT, 47, 2, 91);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user13', 'pass13', '민초파', '01012340013',
    'user13@naver.com', '경기도 고양시', SYSDATE, DEFAULT, DEFAULT, 3, 20);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user14', 'pass14', '아메리카노', '01012340014',
    'user14@naver.com', '대구광역시 달서구', SYSDATE, DEFAULT, 38, 3, 95);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user15', 'pass15', '블루', '01012340015',
    'user15@naver.com', '부산광역시 해운대구', SYSDATE, DEFAULT, 12, 5, 111);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user16', 'pass16', '아폴로', '01012340016',
    'user16@naver.com', '경기도 고양시', SYSDATE, DEFAULT, DEFAULT, 3, 20);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user17', 'pass17', '에이다', '01012340017',
    'user17@naver.com', '서울특별시 마포구', SYSDATE, DEFAULT, 60, 2, 123);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user18', 'pass18', '아란치니', '01012340018',
    'user18@naver.com', '전라남도 군산시', SYSDATE, DEFAULT, DEFAULT, 3, 166);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user19', 'pass19', '키시아', '01012340019',
    'user19@naver.com', '충청북도 충주시', SYSDATE, DEFAULT, DEFAULT, 3, 206);
INSERT INTO USER_INFO
VALUES (SEQ_USER_INFO.NEXTVAL, 'user20', 'pass20', '오와리', '01012340020',
    'user20@naver.com', '서울특별시 마포구', SYSDATE, DEFAULT, 43, 3, 123);


--------------------------------------------------
--------------    매물     ------------------	
--------------------------------------------------
create table product( -- PRODUCT 테이블 생성 
    product_no number primary key,
    product_name varchar2(100) not null,
    product_status char(1) default 'Y' check (product_status in ('Y','N')) not null,
    price number not null,
    created_at date default sysdate not null,
    delete_status char(1) default 'N' check (delete_status in ('Y','N')) not null,
    description varchar(1000) not null,
    product_views number default 0,
    category_no number,
    foreign key (category_no) references category(category_no),
    user_no number,
    foreign key (user_no) references user_info(user_no),
    region_no number references region(region_no)
    );

insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '로렉스 오이스터 퍼페츄얼 6516무브 시계', 10000, 'description1', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '일꼬르소 오버핏 윈드브레이커 105', 20000, 'description2', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '나이키 조던 바람막이(XL)', 30000, 'description3', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '디스퀘어드 청바지 팝니다 28~29사이즈', 10000, 'description1', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '새상품) 달릿 벨벳 반팔 롱원피스', 20000, 'description2', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '스파이더 회색 츄리닝반바지 34-36인치', 30000, 'description3', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '[새상품]레노마 수영복 랩스커트 커버업', 10000, 'description1', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '골든구스 실버탭 35 풀박', 20000, 'description2', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '여름 쪼리 슬리퍼 우포스 블랙 새상품', 30000, 'description3', 1, 155, 1);

insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '(새상품)크록스 샌들 280', 10000, 'description1', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '폴로 블랙 레드포니볼캡모자 CK4601', 10000, 'description1', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '플렉스파워 가성비 배드민턴 라켓', 20000, 'description2', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, 'BETHEL (BLACK) 블루라이트 차단 안경', 30000, 'description3', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '소니 블루투스 헤드셋 WH-CH520 블랙', 10000, 'description1', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '강아지 하네스 s사이즈 (베니스 하네스)', 20000, 'description2', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '리바이스 523 남성청바지 28인치', 30000, 'description3', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '마르지엘라 타비 첼시 부츠 44사이즈', 10000, 'description1', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '여성 여름 슬리퍼 235 정리', 20000, 'description2', 1, 155, 1);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, 'RRACE square fav bag (White)', 30000, 'description3', 1, 155, 1);

<<<<<<< Updated upstream
=======
-- 매물데이터
>>>>>>> Stashed changes
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '니트로랩 뉴욕웨이 WPC 초코맛 2kg', 45000, '단백질 파우더', 6, 100, 3);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '강아지 삑삑이 공 터그놀이 라텍스 장난감', 1000, '강아지 장난감', 9, 121, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '지샥 DW-5600BB-1', 60000, '지샥 손목 시계', 2, 50, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '내셔널지오그래픽 파치 백팩 N231ABG590', 90000, '백팩', 2, 70, 6);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '닥터지 블랙 스네일 크림 50ml', 5500, '달팽이 크림 화장품', 6, 43, 3);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '클렙튼 1인용 리클라이너 소파 전동 K05M', 175000, '1인용소파', 7, 88, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '[크로커다일레이디] 스텐카라 셔츠형 자켓_CL0MJK901', 14500, '여성용 자켓', 2, 71, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '크록스 바야밴드 클로그 205089-126', 30000, '남자 신발', 2, 160, 7);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '신제품LG전자 LG그램 15ZD90RT-GX56K', 1100000, 'LG 노트북', 3, 132, 3);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '문교 소프트오일파스텔 72색 MOPV', 21500, '파스텔', 5, 196, 4);

insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '해바라기버너 이소 가스 강염 스토브', 182000, '캠핑용 버너', 4, 94, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '티와이에스 에델코첸 이지프리즘 프라이팬 얼그레이', 19200, '프라이팬', 8, 82, 8);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '스탠리 아이스플로우 플립 스트로 텀블러 887ml', 31000, '텀블러', 8, 24, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '르무통 메이트 발 편한 메리노울 운동화', 80000, '여성용 운동화', 2, 123, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '스트레치 사파리 점퍼', 59000, '남성용 점퍼', 2, 48, 9);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '디베아 ALLNEW29000', 199000, '청소기', 3, 138, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '산과들에 하루견과 순수가온 20g x 100봉', 26400, '견과', 10, 122, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '샤넬 코코 마드모아젤 우먼 오 드 퍼퓸', 59200, '향수', 6, 111, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '카본체어 TYPE-2 ', 248000, '사무용 의자', 7, 76, 10);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '컷팅 블링 원터치 링 귀걸이 ', 89500, '반지', 2, 145, 4);

insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '여성 통바지 하이웨스트 와이드팬츠 밴딩 슬랙스바지', 8900, '여성용 통바지', 2, 83, 6);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '이나바 챠오츄르 참치 14g 4p SC-71', 1000, '고양이 츄르', 9, 179, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '삼성전자 삼성 LH55BEAHLGFXKR', 554000, '삼성 TV', 3, 126, 9);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '씨투엠뉴 에이블 코지 프리미엄 트라이크 유모차', 275000, '유모차', 10, 165, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '삼성전자 갤럭시 버즈2 프로 SM-R510', 162000, '버즈2 블루투스이어폰', 3, 144, 6);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '남자 냉장고 바지 여름 밴딩', 9900, '남자 슬랙스', 2, 121, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '설화수 자음 2종 세트', 46800, '설화수 화장품', 6, 67, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '쌍용씨앤비 CODI 순수한 데코 3겹 30m 30롤', 6900, '두루마리 휴지', 8, 11, 7);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '로지텍G G304 LIGHTSPEED WIRELESS', 27800, '무선 마우스', 3, 72, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '나이키 에어맥스 엑시스 AA2146-100', 76500, '남녀 공용 나이키 신발', 2, 45, 11);

insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, 'KD조구 민물낚시의자', 69800, '낚시용 접의식 의자', 4, 56,  7);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '아이브 정규 앨범 1집 Ive IVE 포토북 3종세트', 15000, '아이브 1집 앨범', 10, 78, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '버버리 스트라이프 포이베 버킷백 8026737', 398000, '여성용 명품 가방', 2, 28, 8);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '에이픽스 1인용 컴퓨터 게이밍 데스크 GD001 1200', 75000, '게이밍 책상', 7, 62, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '몽블랑 사토리얼 6CC 116326', 61000, '남성용 지갑', 2, 47, 8);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '펀앤펀 토트넘 유니폼 키즈 유소년 성인 상의 하의 양말', 18900, '토트넘 유니폼', 2, 25, 8);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, 'MF매직하우스 알라딘 매직 논슬립옷걸이', 200, '옷걸이 개당 200원', 8, 125, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '어니우니 20수 무지 반팔 티셔츠 기본 라운드 면티', 4900, '남성용 반팔 티', 2, 111, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '쿠쿠전자 쿠쿠 CFM-F200DS', 157800, '믹서기', 8, 142, 7);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '모르간 MORGAN 케이블 반팔 니트 4종', 69000, '여성용 반팔 니트', 2, 135, 4);

insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '불스원 크리스탈 코트 플러스 셀프 유리막 코팅제 500ml', 6900, '유리막 코팅제', 8, 143, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '위즈윈 덴탈 마스크 KFAD', 8000, '마스크', 10, 178, 9);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '테이퍼드 레귤러핏 스판 데님 청바지', 19900, '여성용 청바지', 2, 124, 5);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '브리츠 BT4000 ANC', 72500, '헤드폰', 3, 152, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '더블에이 A4용지 복사용지 80g 2500매', 6000, 'A4 용지', 5, 137, 6);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '크록스 클래식 올터레인 클로그 206340-001', 37600, '남자 클로크', 2, 174, 8);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '한샘 노뜨컴포트 포켓스프링 매트리스 SS', 142000, '매트리스', 7, 3, 7);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '올뉴 TS 샴푸 500g', 8900, '탈모 방지 샴푸', 8, 121, 6);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, '10 더엣지 뉴 프렌치 린넨 100 니트 3종', 78900, '여성용 니트', 2, 46, 4);
insert into product (product_no, product_name, price, description, category_no, region_no,user_no) values (seq_product.nextval, 'WD NEW My Passport Gen3', 72300, '1TB 외장하드', 3, 154, 4);



--------------------------------------------------
----------------    찜  	------------------
--------------------------------------------------
CREATE TABLE WISHLIST (
    WISHLIST_NO NUMBER PRIMARY KEY,
    USER_NO NUMBER NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    FOREIGN KEY (USER_NO) REFERENCES USER_INFO (USER_NO),
    FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO)
);

--------------------------------------------------
----------------    자유게시판  	------------------
--------------------------------------------------
CREATE TABLE FREE_BOARD (
	FREE_BOARD_NO NUMBER PRIMARY KEY,
	USER_NO NUMBER NOT NULL,
	BOARD_TITLE VARCHAR2(100) NOT NULL,
	BOARD_CONTENT VARCHAR2(2000) NOT NULL,
	CREATED_DATE DATE DEFAULT SYSDATE NOT NULL,
	BOARD_VIEWS NUMBER DEFAULT 0 NOT NULL,
    LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
    DISLIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
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
COMMENT ON COLUMN FREE_BOARD.LIKE_COUNT IS '좋아요개수';
COMMENT ON COLUMN FREE_BOARD.DISLIKE_COUNT IS '싫어요개수';
COMMENT ON COLUMN FREE_BOARD.CATEGORY IS '수다, 질문, 꿀팁 .. 하드코딩';

INSERT INTO FREE_BOARD VALUES (SEQ_FREE_BOARD.NEXTVAL, 1, '정말 힘드네요', '요즘 5000원 안으로 점심1끼 떼울데가 있나요?', '2023-03-01', 200, DEFAULT, DEFAULT, DEFAULT, '고민');
INSERT INTO FREE_BOARD VALUES (SEQ_FREE_BOARD.NEXTVAL, 2, '장난 똥때리나', ' 어제 무단횡단자 때문에 인생 종칠 뻔', '2023-03-02', 175, DEFAULT, DEFAULT, DEFAULT, '잡담');
INSERT INTO FREE_BOARD VALUES (SEQ_FREE_BOARD.NEXTVAL, 3, '질문 있는데요', ' 지하철에 알리 주문 해 보신 분 있나요?', '2023-03-03', 150, DEFAULT, DEFAULT, DEFAULT, '질문');

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
	BOARD_VIEWS NUMBER DEFAULT 0 NOT NULL,
    LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
    DISLIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
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

INSERT INTO SHARE_BOARD VALUES (SEQ_SHARE_BOARD.NEXTVAL, 155, 1, '가방 나눔합니다!!', '필요하신분 연락주세요 감사합니다!!', '2023-03-01', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO SHARE_BOARD VALUES (SEQ_SHARE_BOARD.NEXTVAL, 2, 2, '포켓몬카드 나눔', '필요하신분 연락주세요 감사합니다!!', '2023-03-02', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO SHARE_BOARD VALUES (SEQ_SHARE_BOARD.NEXTVAL, 3, 3, '아이폰14PRO MAX 나눔', '필요하신분 연락주세요 감사합니다!!', '2023-03-03', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);



--------------------------------------------------
--------------    상품 이미지     ------------------	
--------------------------------------------------
CREATE TABLE IMG_FILE (
	FILE_NO NUMBER PRIMARY KEY,
    ORIGIN_NAME VARCHAR2(100) NOT NULL,
	CHANGE_FILE_NAME VARCHAR2(100) NOT NULL,
    FILE_PATH VARCHAR2(1000),
	CREATED_AT DATE DEFAULT SYSDATE NOT NULL,
	DELETE_STATUS CHAR(1) DEFAULT 'N' CHECK(DELETE_STATUS IN('Y', 'N')),
	FILE_LEVEL NUMBER NOT NULL,
	PRODUCT_NO NUMBER,
	FREE_BOARD_NO NUMBER,
	SHARE_BOARD_NO NUMBER,
	FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT(PRODUCT_NO),
	FOREIGN KEY (FREE_BOARD_NO) REFERENCES FREE_BOARD(FREE_BOARD_NO),
	FOREIGN KEY (SHARE_BOARD_NO) REFERENCES SHARE_BOARD(SHARE_BOARD_NO)
);

-- 매물 이미지 추가일경우
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main1.jpg', 'resources/product_upfiles/', DEFAULT, 1, 1);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main2.jpg', 'resources/product_upfiles/', DEFAULT, 1, 2);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main3.jpg', 'resources/product_upfiles/', DEFAULT, 1, 3);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main4.jpg', 'resources/product_upfiles/', DEFAULT, 1, 4);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main5.jpg', 'resources/product_upfiles/', DEFAULT, 1, 5);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main6.jpg', 'resources/product_upfiles/', DEFAULT, 1, 6);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main7.jpg', 'resources/product_upfiles/', DEFAULT, 1, 7);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main8.jpg', 'resources/product_upfiles/', DEFAULT, 1, 8);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main9.jpg', 'resources/product_upfiles/', DEFAULT, 1, 9);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main10.jpg', 'resources/product_upfiles/', DEFAULT, 1, 10);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main11.jpg', 'resources/product_upfiles/', DEFAULT, 1, 11);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main12.jpg', 'resources/product_upfiles/', DEFAULT, 1, 12);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main13.jpg', 'resources/product_upfiles/', DEFAULT, 1, 13);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main14.jpg', 'resources/product_upfiles/', DEFAULT, 1, 14);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main15.jpg', 'resources/product_upfiles/', DEFAULT, 1, 15);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main16.jpg', 'resources/product_upfiles/', DEFAULT, 1, 16);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main17.jpg', 'resources/product_upfiles/', DEFAULT, 1, 17);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main18.jpg', 'resources/product_upfiles/', DEFAULT, 1, 18);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'main19.jpg', 'resources/product_upfiles/', DEFAULT, 1, 19);

<<<<<<< Updated upstream
=======
-- 이미지 파일
>>>>>>> Stashed changes
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'newyorkwhey.jpg', 'resources/product_upfiles/', DEFAULT, 1, 20);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'dogtoy.jpg', 'resources/product_upfiles/', DEFAULT, 1, 21);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'DW-5600BB-1.jpg', 'resources/product_upfiles/', DEFAULT, 1, 22);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'N231ABG590.jpg', 'resources/product_upfiles/', DEFAULT, 1, 23);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', 'snailcream.jpg', 'resources/product_upfiles/', DEFAULT, 1, 24);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '27927112522.20210714133301.jpg', 'resources/product_upfiles/', DEFAULT, 1, 25);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '1_P320773126_basic_1648556845573.jpg', 'resources/product_upfiles/', DEFAULT, 1, 26);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '39016364621.20230329111322.jpg', 'resources/product_upfiles/', DEFAULT, 1, 27);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '39343059618.20230412154550.jpg', 'resources/product_upfiles/', DEFAULT, 1, 28);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '24062566675.20210805115606.jpg', 'resources/product_upfiles/', DEFAULT, 1, 29);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '39317047219.20230412120650.jpg', 'resources/product_upfiles/', DEFAULT, 1, 30);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '39017274620.20230411160235.jpg', 'resources/product_upfiles/', DEFAULT, 1, 31);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '31638943619.20220406144432.jpg', 'resources/product_upfiles/', DEFAULT, 1, 32);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '35859710618.20230227141339.jpg', 'resources/product_upfiles/', DEFAULT, 1, 33);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '1_P335691748_basic_1676361365621.jpg', 'resources/product_upfiles/', DEFAULT, 1, 34);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '26758397523.20230302101017.jpg', 'resources/product_upfiles/', DEFAULT, 1, 35);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '29453271622.20230324145904.jpg', 'resources/product_upfiles/', DEFAULT, 1, 36);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '2600032275.20210527163344.jpg', 'resources/product_upfiles/', DEFAULT, 1, 37);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '5236c9a4c673c35eec8f99e421274cb2.jpg', 'resources/product_upfiles/', DEFAULT, 1, 38);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '39536581200.20230423070152.jpg', 'resources/product_upfiles/', DEFAULT, 1, 39);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '38679016542.20230315202638.jpg', 'resources/product_upfiles/', DEFAULT, 1, 40);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '27493720522.20210608173721.jpg', 'resources/product_upfiles/', DEFAULT, 1, 41);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '28121822524.202204071301142.jpg', 'resources/product_upfiles/', DEFAULT, 1, 42);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '33230308618.20230221113401.jpg', 'resources/product_upfiles/', DEFAULT, 1, 43);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '34108100618.20220816172630.jpg', 'resources/product_upfiles/', DEFAULT, 1, 44);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '38736638541.2.20230319133251.jpg', 'resources/product_upfiles/', DEFAULT, 1, 45);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '4157790954.20210723150307.jpg', 'resources/product_upfiles/', DEFAULT, 1, 46);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '9830444614.20220418134740.jpg', 'resources/product_upfiles/', DEFAULT, 1, 47);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '14364285018.20211207165501.jpg', 'resources/product_upfiles/', DEFAULT, 1, 48);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '14034046962.20210310103339.jpg', 'resources/product_upfiles/', DEFAULT, 1, 49);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '38833933975.20230322160058.jpg', 'resources/product_upfiles/', DEFAULT, 1, 50);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '38825692832.20230322090900.jpg', 'resources/product_upfiles/', DEFAULT, 1, 51);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '38544367620.20230310142318.jpg', 'resources/product_upfiles/', DEFAULT, 1, 52);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '21653917474.20200103135533.jpg', 'resources/product_upfiles/', DEFAULT, 1, 53);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '21653917474.20200103135533.jpg', 'resources/product_upfiles/', DEFAULT, 1, 54);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '38591881412.20230312133945.jpg', 'resources/product_upfiles/', DEFAULT, 1, 55);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '6490801519.20220330142432.jpg', 'resources/product_upfiles/', DEFAULT, 1, 56);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '32672162618.20220531091838.jpg', 'resources/product_upfiles/', DEFAULT, 1, 57);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '24860948522.20201116140056.jpg', 'resources/product_upfiles/', DEFAULT, 1, 58);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '39047687848.20230330131512.jpg', 'resources/product_upfiles/', DEFAULT, 1, 59);

INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '27805037523.20211118170347.jpg', 'resources/product_upfiles/', DEFAULT, 1, 60);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '37931721618.20230213150253.jpg', 'resources/product_upfiles/', DEFAULT, 1, 61);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '39269278087.20230409155225.jpg', 'resources/product_upfiles/', DEFAULT, 1, 62);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '30485533619.20221020103843.jpg', 'resources/product_upfiles/', DEFAULT, 1, 63);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '18054489982.20210303172646.jpg', 'resources/product_upfiles/', DEFAULT, 1, 64);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '38962910623.20230327122120.jpg', 'resources/product_upfiles/', DEFAULT, 1, 65);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '20291807091.20200406113259.jpg', 'resources/product_upfiles/', DEFAULT, 1, 66);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '10625038735.20180711095429.jpg', 'resources/product_upfiles/', DEFAULT, 1, 67);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '38988673368.20230328130505.jpg', 'resources/product_upfiles/', DEFAULT, 1, 68);
INSERT INTO IMG_FILE(FILE_NO, ORIGIN_NAME, CHANGE_FILE_NAME, FILE_PATH, CREATED_AT, FILE_LEVEL, PRODUCT_NO) VALUES(SEQ_IMG_FILE.NEXTVAL, 'originFileName', '21234238363.20200820180034.jpg', 'resources/product_upfiles/', DEFAULT, 1, 69);



<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes

-- 자유게시판 이미지 추가일경우
INSERT INTO IMG_FILE(FILE_NO
                   , ORIGIN_NAME
                   , CHANGE_FILE_NAME
                   , FILE_PATH
                   , CREATED_AT
                   , FILE_LEVEL
                   , FREE_BOARD_NO)
              VALUES(SEQ_IMG_FILE.NEXTVAL
                   , 'originFileName2'
                   , 'changeFileName2'
                   , '~~~~~.jpg'
                   , DEFAULT
                   , 1
                   , 2);
                   
-- 나눔게시판 이미지 추가일경우
INSERT INTO IMG_FILE(FILE_NO
                   , ORIGIN_NAME
                   , CHANGE_FILE_NAME
                   , FILE_PATH
                   , CREATED_AT
                   , FILE_LEVEL
                   , SHARE_BOARD_NO)
              VALUES(SEQ_IMG_FILE.NEXTVAL
                   , 'originFileName3'
                   , 'changeFileName3'
                   , '~~~~~.jpg'
                   , DEFAULT
                   , 1
                   , 3);

--------------------------------------------------
--------------    1:1 문의     ------------------	
--------------------------------------------------
CREATE TABLE QNA( -- QNA 테이블 생성
    QNA_NO NUMBER PRIMARY KEY,
    Q_CATEGORY VARCHAR2(40) NOT NULL,
    Q_TITLE VARCHAR2(100) NOT NULL,
    Q_CONTENT VARCHAR2(1000) NOT NULL,
    Q_DATE DATE DEFAULT SYSDATE NOT NULL,
    Q_WRITER NUMBER NOT NULL,
    A_CONTENT VARCHAR2(1000),
    A_DATE DATE,
    DELETE_STATUS CHAR(1) DEFAULT 'N' CHECK(DELETE_STATUS IN('Y', 'N')),
    ANSWER_STATUS CHAR(1) DEFAULT 'N' CHECK(ANSWER_STATUS IN('Y', 'N')),
    FOREIGN KEY (Q_WRITER) REFERENCES USER_INFO(USER_NO)
);
INSERT INTO QNA (QNA_NO, Q_CATEGORY, Q_TITLE, Q_CONTENT, Q_WRITER) VALUES ( SEQ_QNA.NEXTVAL, '기타', 'Q_TITLE1', 'Q_CONTENT1', 1);
INSERT INTO QNA (QNA_NO, Q_CATEGORY, Q_TITLE, Q_CONTENT, Q_WRITER) VALUES ( SEQ_QNA.NEXTVAL, '기타', 'Q_TITLE2', 'Q_CONTENT2', 1);
INSERT INTO QNA (QNA_NO, Q_CATEGORY, Q_TITLE, Q_CONTENT, Q_WRITER) VALUES ( SEQ_QNA.NEXTVAL, '기타', 'Q_TITLE3', 'Q_CONTENT3', 1);


--------------------------------------------------
----------------    첨부파일   	---------------------
--------------------------------------------------

CREATE TABLE ATTACHMENT (
  FILE_NO NUMBER PRIMARY KEY,
  REF_QNO NUMBER,
  REF_PNO NUMBER,
  REF_NNO NUMBER,
  ORIGIN_NAME VARCHAR2(255) NOT NULL,
  CHANGE_NAME VARCHAR2(255) NOT NULL,
  FILE_PATH VARCHAR2(1000),
  UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
  FILE_LEVEL NUMBER,
  DELETE_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(DELETE_STATUS IN('Y', 'N')),
  FOREIGN KEY (REF_QNO) REFERENCES QNA(QNA_NO),
  FOREIGN KEY (REF_PNO) REFERENCES PRODUCT(PRODUCT_NO),
  FOREIGN KEY (REF_NNO) REFERENCES NOTICE(NOTICE_NO)
);

--------------------------------------------------
----------------    프로필 이미지   ----------------
--------------------------------------------------

CREATE TABLE PROFILE_IMG (
	FILE_NO NUMBER PRIMARY KEY,
    ORIGIN_NAME VARCHAR2(100) NOT NULL,
	CHANGE_NAME VARCHAR2(100) NOT NULL,
    FILE_PATH VARCHAR2(1000),
	UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
	DELETE_STATUS CHAR(1) DEFAULT 'N' CHECK(DELETE_STATUS IN('Y', 'N')),
    USER_NO NUMBER NOT NULL,
    FOREIGN KEY (USER_NO) REFERENCES USER_INFO (USER_NO)
);

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
    MESSAGE_TITLE VARCHAR2 (100) NOT NULL,
    MESSAGE_CONTENT VARCHAR2 (2000) NOT NULL,
    DELETE_STATUS char(1) default 'N' check (DELETE_STATUS in ('Y','N')) NOT NULL,
    FOREIGN KEY (RECEIVER_ID) REFERENCES USER_INFO(USER_NO),
    FOREIGN KEY (SENDER_ID) REFERENCES USER_INFO(USER_NO)
);

INSERT INTO NOTE 
VALUES (SEQ_NOTE.NEXTVAL
              , 1
              , 1
              , '2023-03-01'
              , '쪽지제목1'
              , '쪽지내용1'
              , 'N');

INSERT INTO NOTE 
VALUES (SEQ_NOTE.NEXTVAL
              , 2
              , 2
              , '2023-03-02'
              , '쪽지제목2'
              , '쪽지내용2'
              , 'N');

INSERT INTO NOTE 
VALUES (SEQ_NOTE.NEXTVAL
              , 3
              , 3
              , '2023-03-03'
              , '쪽지제목3'
              , '쪽지내용3'
              ,'N');


--------------------------------------------------
----------------     신고   	---------------------
--------------------------------------------------
CREATE TABLE DECLARATION (
	DECLARE_NO NUMBER PRIMARY KEY,
	DECLARE_TITLE VARCHAR2(100) NOT NULL,
	DECLARE_CONTENT VARCHAR2(2000) NOT NULL,
	DECLARE_TYPE VARCHAR2(20) NOT NULL,
	DECLARE_CHECK NUMBER DEFAULT 1,
	DECLARE_DATE DATE DEFAULT SYSDATE NOT NULL,
	DECLARE_REASON VARCHAR2(2000),
	DECLARE_CHECK_DATE DATE DEFAULT SYSDATE,
    FREE_BOARD_NO NUMBER,
    SHARE_BOARD_NO NUMBER,
    USER_NO NUMBER,
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
    REVIEW_DATE DATE DEFAULT SYSDATE NOT NULL,
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
