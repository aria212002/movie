SELECT*FROM JSP;
DELETE from JSP;

insert into jsp values('����');
insert into jsp values('se');
insert into jsp values('gg');
insert into jsp values('hh');
insert into jsp values('nn');

--------------------------------------------------------------------------------------------
/*
    DATE : 23.05.17
*/
--------------------------------------------------------------------------------------------
-- MEMBERDTO�ʵ�� �����ؼ� MEMBERDTO ���̺� �����
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

INSERT INTO MEMBERDTO VALUES('incheon1','1111','��õ1','����','1997-06-15','almae@naver.com','010-1122-3344');

SELECT * FROM MEMBERDTO WHERE MEMID = 'tset';
DELETE FROM MEMBERDTO WHERE MEMID = 'incheon1';

ROLLBACK;
COMMIT;


----------------------------------------------------------------------------
/*
    �Խñ� ���̺� �����
    BOARDDTO ���̺�
*/

 -- BOARDDTO ���̺� ����
 DROP TABLE BOARDDTO;
 CREATE TABLE BOARDDTO(
    BNUM         NUMBER PRIMARY  KEY,    --  �Խñ� ��ȣ
    BWRITER      NVARCHAR2 (20),         --  �Խñ� �ۼ���
            --  �Խñ� ��й�ȣ
    BTITLE       NVARCHAR2 (50),         --  �Խñ� ����
    BCONTENT     NVARCHAR2 (500),        --  �Խñ� ����
    BDATE        DATE,                   --  �Խñ� �ۼ���
    BHIT         NUMBER,                 --  �Խñ� ��ȸ��
    BFILENAME    NVARCHAR2 (50)          --  �Խõ� ÷������
 );
 -- SEQUENCE : �ڵ� ���� ���� 
 -- ���� : CREATE SEQUENCE [SQE_NAME] START WITH [���۰�] INCREMENT BY [������];
 -- ���� : ALTER SEQUENCE [SQE_NAME] START WITH [���۰�] INCREMENT BY [������];
 -- ���� : DROP SEQUENCE [SQE_NAME];
 CREATE SEQUENCE BNUM_SQE START WITH 1 INCREMENT BY 1; 
commit;
drop sequence BNUM_SQE;
select * from boarddto;
--------------------------------------------------------------------------------

 -- view
  -- �ϳ� �̻��� �䳪 ���̺��� �̿��Ͽ� �����Ǵ� ���� ���̺�
  -- ��ȸ �뵵�� ���
  -- ����, ���� ���� ���濡 ������ ����
  -- ����
  --    > CREATE VIEW View_Name AS COL1_Name, ... , COLn_Name FROM Table_Name

--   - view ������ ���� �ű��� ROW_NUMBER Ȱ��

--    > ROW_NUMBER() OVER(ORDER BY COL_Name DESC)

--     > ORDER BY �� �ݵ�� �ʿ�

--     > DESC ������ ASC�� Default

CREATE VIEW PAGINGBOARD AS SELECT ROW_NUMBER() OVER(ORDER BY BNUM DESC) RN,
    BOARDDTO.* FROM BOARDDTO;

--------------------------------------------------------------------------------
    -- 23.06.01
--------------------------------------------------------------------------------
-- ȸ���� �Խ��� MEMEBER ���̺�
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
-- MID PK ����
ALTER TABLE MEMBERT
ADD CONSTRAINT MEMBERT_MID_PK
PRIMARY KEY (MID);

select * from membert;
INSERT INTO MEMBERT VALUES('icia', '123456!q', '��õ�Ϻ�', '2023-06-01', '��', 'icia@naver.com', '032-657-4684','��õ�� ����Ȧ�� ���͵�','default.png');
commit;


CREATE VIEW PAGINGMEM AS SELECT ROW_NUMBER() OVER(ORDER BY MID) RN,
    MEMBERT.* FROM MEMBERT;
    
DROP VIEW PAGINGMEM;


SELECT * FROM PAGINGMEM;
ALTER TABLE membert RENAME COLUMN MBRITH TO MBIRTH;

-----------------------------------------------------------------------------------
--23.06.05

--BOARDT ���̺� ����
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
--BOARDT_SEQ ������ ����
 CREATE SEQUENCE BOARDT_SEQ START WITH 1 INCREMENT BY 1; 
 drop SEQUENCE BOARDT_SQE;

--BOARDLIST �� ����
CREATE VIEW BOARDLIST AS SELECT ROW_NUMBER() OVER(ORDER BY BNUM DESC) RN,
    BOARDT.* FROM BOARDT;
    
COMMIT;
select * from boardt;
DROP view BOARDLIST;
delete from boardt;


-- COMMENT ��� ���̺� �����
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

-- ��۹�ȣ CNUM�� ���� ������ ����
CREATE SEQUENCE CNUM_SQE START WITH 1 INCREMENT BY 1; 
SELECT * FROM COMMENTT;
COMMIT;

delete from commentt;

--------------------------------------------------------------------------------

--  ���� ������Ʈ ��ȭ���� ����Ʈ ���̺�
-- 230612


---------------------------------------------------------------------------------
DROP TABLE MTICKETING;
DROP TABLE MSCHEDULE;
DROP TABLE MREVIEW;
DROP TABLE MMEMBER;
DROP TABLE MINFO;
DROP TABLE MTHEATER;

-- MEMBER ���̺�
CREATE TABLE MMEMBER(

    MBID        NVARCHAR2(20) PRIMARY KEY,  -- ȸ�� ���̵�
    MBPW        NVARCHAR2(60),              -- ȸ�� ��й�ȣ
    MBNAME      NVARCHAR2(5),               -- ȸ�� �̸�
    MBGENDER    NVARCHAR2(3),               -- ȸ�� ����
    MBBIRTH     NVARCHAR2(20),              -- ȸ�� �������
    MBADDR      NVARCHAR2(100),             -- ȸ�� �ּ�
    MBPHONE     NVARCHAR2(15),              -- ȸ�� ����ó
    MBEMAIL     NVARCHAR2(50)               -- ȸ�� �̸���
);

-- ��ȭ ���� ���̺�

CREATE TABLE MINFO(
    MINAME      NVARCHAR2(100) PRIMARY KEY, -- ��ȭ�̸�
    MIGENRE1    NVARCHAR2(10),             -- ��ȭ �帣
    MIGENRE2    NVARCHAR2(10),             -- ��ȭ �帣
    MIGENRE3    NVARCHAR2(10),             -- ��ȭ �帣
    MIDIRECTER  NVARCHAR2(20),             -- ��ȭ ����
    MIACTOR     NVARCHAR2(200),             -- ��ȭ ���
    MISYNOPSIS  NVARCHAR2(500),            -- ��ȭ �ٰŸ�
    MIAGE       NVARCHAR2(10),             -- ���� ���
    MIRUNTIME   NVARCHAR2(5),              -- �� �ð�
    MIPOSTER    NVARCHAR2(100),            -- ��ȭ ������
    MIRELEASE   NVARCHAR2(20),             -- ��ȭ ������
    MITEASER    NVARCHAR2(100),            -- ��ȭ ������
    MISTILLCUT1 NVARCHAR2(100),            -- ��ȭ ��ƿ��1
    MISTILLCUT2 NVARCHAR2(100),            -- ��ȭ ��ƿ��2
    MISTILLCUT3 NVARCHAR2(100),            -- ��ȭ ��ƿ��3
    MISTILLCUT4 NVARCHAR2(100),            -- ��ȭ ��ƿ��4
    MISTILLCUT5 NVARCHAR2(100),            -- ��ȭ ��ƿ��5
    MISTILLCUT6 NVARCHAR2(100)             -- ��ȭ ��ƿ��6
);



-- �󿵰� ���̺�

CREATE TABLE MTHEATER(
    MTTHEATER       NVARCHAR2(10) PRIMARY KEY,      -- �󿵰�
    MTKIND          NVARCHAR2(10),                  -- �󿵰� ����
    MTSEATS         NUMBER,                         -- �¼���
    MTCOMMON        NUMBER,                         -- ���� ����
    MTCHILD         NUMBER                          -- ��� ����
);

-- ��ȭ ������ ���̺�
CREATE TABLE MSCHEDULE(
    MSNUMBER    NUMBER PRIMARY KEY,        -- �������ȣ
    MSNAME      NVARCHAR2(100) CONSTRAINT MINA_MSNA_FK REFERENCES MINFO(MINAME),    -- ��ȭ ����
    MSSTARTTIME NVARCHAR2(30),              -- ���� �ð�
    MSENDTIME   NVARCHAR2(30),              -- ���� �ð�
    MSDATE      NVARCHAR2(30),                       -- ����
    MSTHEATER   NVARCHAR2(10) CONSTRAINT MTTH_MSTH_FK REFERENCES MTHEATER(MTTHEATER)  -- �󿵰�
);



-- ���� ���̺�

CREATE TABLE MREVIEW(
    MRNAME      NVARCHAR2(100) CONSTRAINT MINA_MRNA_FK REFERENCES MINFO(MINAME), -- ��ȭ ����
    MRREVIEW    NVARCHAR2(200),                                                 -- ��ȭ ����
    MRID        NVARCHAR2(20) CONSTRAINT MBID_MRID_FK REFERENCES MMEMBER(MBID), -- �ۼ���
    MRDATE      DATE
);


-- ��� ���̺�

DROP TABLE MTICKETING;
CREATE TABLE MTICKETING(
    MTNUMBER        NUMBER,             -- ���� ��ȣ
    MTSNUMBER       NUMBER CONSTRAINT MSNU_MTSN_FK REFERENCES MSCHEDULE(MSNUMBER),  -- ������ ��ȣ
    MTNAME          NVARCHAR2(100) CONSTRAINT MINA_MTNA_FK REFERENCES MINFO(MINAME),  -- ��ȭ ����
    MTSEAT          NVARCHAR2(30),             -- �¼�
    MTCOUNT         NUMBER,                    -- �ο� ��
    MTPRICE         NUMBER,                    -- �� ����
    MTPAYMENT       NVARCHAR2(10),             -- ���� ����
    MTID            NVARCHAR2(20)  CONSTRAINT MBID_MTID_FK REFERENCES MMEMBER(MBID) -- ȸ�� ���̵�
);

-- ������ ��ȣ ������
CREATE SEQUENCE SCHEDULE_SEQ START WITH 1 INCREMENT BY 1;

-- ������ �Խ��� ���̺�
CREATE TABLE MBOARD (
        BDNUM                    NUMBER      PRIMARY KEY,
        BDWRITER             NVARCHAR2 (20),
        BDTITLE                 NVARCHAR2 (50),
        BDCONTENT          NVARCHAR2 (1000),
        BDDATE                  DATE,
        CONSTRAINT FK_MBID FOREIGN KEY (BDWRITER) REFERENCES  MMEMBER (MBID)
);

 -- MBOARD_SEQ ������ ����
CREATE SEQUENCE MBOARD_SEQ START WITH 1 INCREMENT BY 1;
 
 -- MVBLIST �� ����
 CREATE VIEW MVBLIST AS 
 SELECT
            ROW_NUMBER() OVER(ORDER BY BDNUM DESC) AS RN,
            MBOARD.*
FROM MBOARD;

-- ���(COMMENT) ���̺� �����
CREATE TABLE COSCOMMENT (
        CMNUM                    NUMBER PRIMARY KEY,
        CMBNUM                 NUMBER,
        CMWRITER             NVARCHAR2(20),
        CMCONTENT          NVARCHAR2(200),   
        CMDATE                  DATE,
        
        CONSTRAINT FK_MBID_CMWRITER FOREIGN KEY (CMWRITER) REFERENCES  MMEMBER (MBID),
        CONSTRAINT FK_MBID_CMBNUM FOREIGN KEY (CMBNUM) REFERENCES  MBOARD (BDNUM)
);

 -- ��۹�ȣ CMNUM�� ���� ������ ����
CREATE SEQUENCE CMNUM_SEQ START WITH 1 INCREMENT BY 1;

-- ���� ��--
CREATE VIEW ADTICKETING AS SELECT ROW_NUMBER() OVER(ORDER BY MTNUMBER DESC) AS RN, a.*,b.* FROM MTICKETING a, MSCHEDULE b WHERE a.MTSNUMBER = b.MSNUMBER;

commit;