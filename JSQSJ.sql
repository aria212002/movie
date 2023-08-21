SELECT*FROM JSP;
DELETE from JSP;

insert into jsp values('가나');
insert into jsp values('se');
insert into jsp values('gg');
insert into jsp values('hh');
insert into jsp values('nn');

--------------------------------------------------------------------------------------------
/*
    DATE : 23.05.17
*/
--------------------------------------------------------------------------------------------
-- MEMBERDTO필드와 연계해서 MEMBERDTO 테이블 만들기
DROP TABLE MEMBERDTO;
CREATE TABLE MEMBERDTO(
    MID       NVARCHAR2(20),
    MPW       NVARCHAR2(20),
    MNAME     NVARCHAR2(10),
    MGENDER   NVARCHAR2(10),
    MBIRTH    NVARCHAR2(20),
    MEMAIL    NVARCHAR2(50),
    MPHONE    NVARCHAR2(15)
);
commit;
SELECT * FROM MEMBERDTO;
DELETE FROM MEMBERDTO;

INSERT INTO MEMBERDTO VALUES('incheon1','1111','인천1','남자','1997-06-15','almae@naver.com','010-1122-3344');

SELECT * FROM MEMBERDTO WHERE MEMID = 'tset';
DELETE FROM MEMBERDTO WHERE MEMID = 'incheon1';

ROLLBACK;
COMMIT;


----------------------------------------------------------------------------
/*
    게시글 테이블 만들기
    BOARDDTO 테이블
*/

 -- BOARDDTO 테이블 생성
 DROP TABLE BOARDDTO;
 CREATE TABLE BOARDDTO(
    BNUM         NUMBER PRIMARY  KEY,    --  게시글 번호
    BWRITER      NVARCHAR2 (20),         --  게시글 작성자
            --  게시글 비밀번호
    BTITLE       NVARCHAR2 (50),         --  게시글 제목
    BCONTENT     NVARCHAR2 (500),        --  게시글 내용
    BDATE        DATE,                   --  게시글 작성일
    BHIT         NUMBER,                 --  게시글 조회수
    BFILENAME    NVARCHAR2 (50)          --  게시들 첨부파일
 );
 -- SEQUENCE : 자동 순차 증가 
 -- 생성 : CREATE SEQUENCE [SQE_NAME] START WITH [시작값] INCREMENT BY [증가값];
 -- 수정 : ALTER SEQUENCE [SQE_NAME] START WITH [시작값] INCREMENT BY [증가값];
 -- 삭제 : DROP SEQUENCE [SQE_NAME];
 CREATE SEQUENCE BNUM_SQE START WITH 1 INCREMENT BY 1; 
commit;
drop sequence BNUM_SQE;
select * from boarddto;
--------------------------------------------------------------------------------

 -- view
  -- 하나 이상의 뷰나 테이블을 이용하여 생성되는 가상 테이블
  -- 조회 용도로 사용
  -- 수정, 삭제 등의 변경에 제한이 있음
  -- 생성
  --    > CREATE VIEW View_Name AS COL1_Name, ... , COLn_Name FROM Table_Name

--   - view 생성시 순번 매기기용 ROW_NUMBER 활용

--    > ROW_NUMBER() OVER(ORDER BY COL_Name DESC)

--     > ORDER BY 는 반드시 필요

--     > DESC 생략시 ASC가 Default

CREATE VIEW PAGINGBOARD AS SELECT ROW_NUMBER() OVER(ORDER BY BNUM DESC) RN,
    BOARDDTO.* FROM BOARDDTO;

--------------------------------------------------------------------------------
    -- 23.06.01
--------------------------------------------------------------------------------
-- 회원제 게시판 MEMEBER 테이블
DROP TABLE MEMBERT;

CREATE TABLE MEMBERT(
    MID         NVARCHAR2(20), 
    MPW         NVARCHAR2(60),
    MNAME       NVARCHAR2(5),
    MBIRTH      NVARCHAR2(20),
    MGENDER     NVARCHAR2(2),
    MEMAIL      NVARCHAR2(50),
    MPHONE      NVARCHAR2(20),
    MADDR       NVARCHAR2(100),
    MPROFILENAME    NVARCHAR2(50)
);
select *from membert;
-- MID PK 지정
ALTER TABLE MEMBERT
ADD CONSTRAINT MEMBERT_MID_PK
PRIMARY KEY (MID);

select * from membert;
INSERT INTO MEMBERT VALUES('icia', '123456!q', '인천일보', '2023-06-01', '모름', 'icia@naver.com', '032-657-4684','인천시 미추홀구 학익동','default.png');
commit;


CREATE VIEW PAGINGMEM AS SELECT ROW_NUMBER() OVER(ORDER BY MID) RN,
    MEMBERT.* FROM MEMBERT;
    
DROP VIEW PAGINGMEM;


SELECT * FROM PAGINGMEM;
ALTER TABLE membert RENAME COLUMN MBRITH TO MBIRTH;

-----------------------------------------------------------------------------------
--23.06.05

--BOARDT 테이블 생성
drop table boardt;
CREATE TABLE BOARDT(
    BNUM        NUMBER  PRIMARY KEY,
    BWRITER     NVARCHAR2(20),
    BTITLE      NVARCHAR2(100),
    BCONTENT    NVARCHAR2(1000),
    BDATE       DATE,
    BHIT        NUMBER,
    BFILENAME   NVARCHAR2(100),
    CONSTRAINT FK_MID FOREIGN KEY(BWRITER) REFERENCES MEMBERT(MID)
);
desc boardt;
select * from boardt;
delete from boardt;
--BOARDT_SEQ 시퀀스 생성
 CREATE SEQUENCE BOARDT_SEQ START WITH 1 INCREMENT BY 1; 
 drop SEQUENCE BOARDT_SQE;

--BOARDLIST 뷰 생성
CREATE VIEW BOARDLIST AS SELECT ROW_NUMBER() OVER(ORDER BY BNUM DESC) RN,
    BOARDT.* FROM BOARDT;
    
COMMIT;
select * from boardt;
DROP view BOARDLIST;
delete from boardt;


-- COMMENT 댓글 테이블 만들기
DROP TABLE COMMENTT;
CREATE TABLE COMMENTT(
    CNUM        NUMBER,
    CBNUM       NUMBER,
    CWRITER     NVARCHAR2(20),
    CCONTENT    NVARCHAR2(200),
    CDATE       DATE,
    CONSTRAINT FK_MID_CWRITER FOREIGN KEY(CWRITER) REFERENCES MEMBERT(MID),
    CONSTRAINT FK_MID_CBNUM FOREIGN KEY(CBNUM) REFERENCES BOARDT(BNUM)
);
delete from commentt;

-- 댓글번호 CNUM에 대한 시퀀스 생성
CREATE SEQUENCE CNUM_SQE START WITH 1 INCREMENT BY 1; 
SELECT * FROM COMMENTT;
COMMIT;

delete from commentt;

--------------------------------------------------------------------------------

--  세미 프로젝트 영화예매 사이트 테이블
-- 230612


---------------------------------------------------------------------------------
DROP TABLE MTICKETING;
DROP TABLE MSCHEDULE;
DROP TABLE MREVIEW;
DROP TABLE MMEMBER;
DROP TABLE MINFO;
DROP TABLE MTHEATER;

-- MEMBER 테이블
CREATE TABLE MMEMBER(

    MBID        NVARCHAR2(20) PRIMARY KEY,  -- 회원 아이디
    MBPW        NVARCHAR2(60),              -- 회원 비밀번호
    MBNAME      NVARCHAR2(5),               -- 회원 이름
    MBGENDER    NVARCHAR2(3),               -- 회원 성별
    MBBIRTH     NVARCHAR2(20),              -- 회원 생년월일
    MBADDR      NVARCHAR2(100),             -- 회원 주소
    MBPHONE     NVARCHAR2(15),              -- 회원 연락처
    MBEMAIL     NVARCHAR2(50)               -- 회원 이메일
);

-- 영화 정보 테이블

CREATE TABLE MINFO(
    MINAME      NVARCHAR2(100) PRIMARY KEY, -- 영화이름
    MIGENRE1    NVARCHAR2(10),             -- 영화 장르
    MIGENRE2    NVARCHAR2(10),             -- 영화 장르
    MIGENRE3    NVARCHAR2(10),             -- 영화 장르
    MIDIRECTER  NVARCHAR2(20),             -- 영화 감독
    MIACTOR     NVARCHAR2(200),             -- 영화 배우
    MISYNOPSIS  NVARCHAR2(500),            -- 영화 줄거리
    MIAGE       NVARCHAR2(10),             -- 관람 등급
    MIRUNTIME   NVARCHAR2(5),              -- 상영 시간
    MIPOSTER    NVARCHAR2(100),            -- 영화 포스터
    MIRELEASE   NVARCHAR2(20),             -- 영화 개봉일
    MITEASER    NVARCHAR2(100),            -- 영화 예고편
    MISTILLCUT1 NVARCHAR2(100),            -- 영화 스틸컷1
    MISTILLCUT2 NVARCHAR2(100),            -- 영화 스틸컷2
    MISTILLCUT3 NVARCHAR2(100),            -- 영화 스틸컷3
    MISTILLCUT4 NVARCHAR2(100),            -- 영화 스틸컷4
    MISTILLCUT5 NVARCHAR2(100),            -- 영화 스틸컷5
    MISTILLCUT6 NVARCHAR2(100)             -- 영화 스틸컷6
);



-- 상영관 테이블

CREATE TABLE MTHEATER(
    MTTHEATER       NVARCHAR2(10) PRIMARY KEY,      -- 상영관
    MTKIND          NVARCHAR2(10),                  -- 상영관 종류
    MTSEATS         NUMBER,                         -- 좌석수
    MTCOMMON        NUMBER,                         -- 성인 가격
    MTCHILD         NUMBER                          -- 어린이 가격
);

-- 영화 스케쥴 테이블
CREATE TABLE MSCHEDULE(
    MSNUMBER    NUMBER PRIMARY KEY,        -- 스케쥴번호
    MSNAME      NVARCHAR2(100) CONSTRAINT MINA_MSNA_FK REFERENCES MINFO(MINAME),    -- 영화 제목
    MSSTARTTIME NVARCHAR2(30),              -- 시작 시간
    MSENDTIME   NVARCHAR2(30),              -- 종료 시간
    MSDATE      NVARCHAR2(30),                       -- 상영일
    MSTHEATER   NVARCHAR2(10) CONSTRAINT MTTH_MSTH_FK REFERENCES MTHEATER(MTTHEATER)  -- 상영관
);



-- 리뷰 테이블

CREATE TABLE MREVIEW(
    MRNAME      NVARCHAR2(100) CONSTRAINT MINA_MRNA_FK REFERENCES MINFO(MINAME), -- 영화 제목
    MRREVIEW    NVARCHAR2(200),                                                 -- 영화 리뷰
    MRID        NVARCHAR2(20) CONSTRAINT MBID_MRID_FK REFERENCES MMEMBER(MBID), -- 작성자
    MRDATE      DATE
);


-- 얘매 테이블

DROP TABLE MTICKETING;
CREATE TABLE MTICKETING(
    MTNUMBER        NUMBER,             -- 예매 번호
    MTSNUMBER       NUMBER CONSTRAINT MSNU_MTSN_FK REFERENCES MSCHEDULE(MSNUMBER),  -- 스케쥴 번호
    MTNAME          NVARCHAR2(100) CONSTRAINT MINA_MTNA_FK REFERENCES MINFO(MINAME),  -- 영화 제목
    MTSEAT          NVARCHAR2(30),             -- 좌석
    MTCOUNT         NUMBER,                    -- 인원 수
    MTPRICE         NUMBER,                    -- 총 가격
    MTPAYMENT       NVARCHAR2(10),             -- 결제 여부
    MTID            NVARCHAR2(20)  CONSTRAINT MBID_MTID_FK REFERENCES MMEMBER(MBID) -- 회원 아이디
);

-- 스케줄 번호 시퀀스
CREATE SEQUENCE SCHEDULE_SEQ START WITH 1 INCREMENT BY 1;

-- 고객센터 게시판 테이블
CREATE TABLE MBOARD (
        BDNUM                    NUMBER      PRIMARY KEY,
        BDWRITER             NVARCHAR2 (20),
        BDTITLE                 NVARCHAR2 (50),
        BDCONTENT          NVARCHAR2 (1000),
        BDDATE                  DATE,
        CONSTRAINT FK_MBID FOREIGN KEY (BDWRITER) REFERENCES  MMEMBER (MBID)
);

 -- MBOARD_SEQ 시퀀스 생성
CREATE SEQUENCE MBOARD_SEQ START WITH 1 INCREMENT BY 1;
 
 -- MVBLIST 뷰 생성
 CREATE VIEW MVBLIST AS 
 SELECT
            ROW_NUMBER() OVER(ORDER BY BDNUM DESC) AS RN,
            MBOARD.*
FROM MBOARD;

-- 댓글(COMMENT) 테이블 만들기
CREATE TABLE COSCOMMENT (
        CMNUM                    NUMBER PRIMARY KEY,
        CMBNUM                 NUMBER,
        CMWRITER             NVARCHAR2(20),
        CMCONTENT          NVARCHAR2(200),   
        CMDATE                  DATE,
        
        CONSTRAINT FK_MBID_CMWRITER FOREIGN KEY (CMWRITER) REFERENCES  MMEMBER (MBID),
        CONSTRAINT FK_MBID_CMBNUM FOREIGN KEY (CMBNUM) REFERENCES  MBOARD (BDNUM)
);

 -- 댓글번호 CMNUM에 대한 시퀀스 생성
CREATE SEQUENCE CMNUM_SEQ START WITH 1 INCREMENT BY 1;

-- 조인 뷰--
CREATE VIEW ADTICKETING AS SELECT ROW_NUMBER() OVER(ORDER BY MTNUMBER DESC) AS RN, a.*,b.* FROM MTICKETING a, MSCHEDULE b WHERE a.MTSNUMBER = b.MSNUMBER;

commit;