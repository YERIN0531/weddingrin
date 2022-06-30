-- 테이블 & 시퀀스 DROP 및 CREATE

-- 1. MEMBER 테이블 
DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    MID         VARCHAR2(50) PRIMARY KEY,
    MPW         VARCHAR2(50) NOT NULL,
    MNAME       VARCHAR2(50) NOT NULL,
    MTEL        VARCHAR2(50) NOT NULL,
    MEMAIL      VARCHAR2(50),
    MBIRTH      DATE NOT NULL,
    MADDRESS    VARCHAR2(250),
    MRDATE      DATE DEFAULT SYSDATE
);
SELECT * FROM MEMBER;

-- 2. 후기(REVIEW) 시퀀스 & 테이블 
DROP SEQUENCE RIVIEW_SEQ;
DROP TABLE REVIEWBOARD;
CREATE SEQUENCE REVIEW_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE REVIEWBOARD(
    RNO         NUMBER(6) PRIMARY KEY,
    MID         VARCHAR2(50) REFERENCES MEMBER(MID),
    RTITLE      VARCHAR2(250) NOT NULL,
    RCONTENT    VARCHAR2(4000),
    RFILENAME   VARCHAR2(4000), 
    RHIT        NUMBER(7) DEFAULT 0 NOT NULL,
    RDATE       DATE DEFAULT SYSDATE NOT NULL,
    RIP         VARCHAR2(50) NOT NULL
);
SELECT * FROM REVIEWBOARD;

DROP SEQUENCE QNA_SEQ;
DROP TABLE QNABOARD;

-- 3. 문의(QNA) 시퀀스 & 테이블
CREATE SEQUENCE QNA_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE QNABOARD(
    QNO         NUMBER(6) PRIMARY KEY,
    QID         VARCHAR2(50) NOT NULL,
    QTITLE      VARCHAR2(50) NOT NULL,
    QCONTENT    VARCHAR2(250),
    QHIT        NUMBER(7) DEFAULT 0 NOT NULL,
    QDATE       DATE DEFAULT SYSDATE NOT NULL,
    QGROUP      NUMBER(7) NOT NULL,
    QSTEP       NUMBER(7) NOT NULL,
    QINDENT     NUMBER(7) NOT NULL,
    QIP         VARCHAR2(50) NOT NULL
);
SELECT * FROM QNABOARD;

DROP TABLE ADMIN;
-- 4. 관리자(ADMIN) 테이블
CREATE TABLE ADMIN (
    AID         VARCHAR2(50) NOT NULL,
    APW         VARCHAR2(50) NOT NULL,
    ACODE       VARCHAR2(50) NOT NULL
);
SELECT * FROM ADMIN;

DROP SEQUENCE WEDDING_SEQ;
DROP TABLE WEDDINGHALL;

-- 5. 웨딩홀(WEDDINGHALL) 시퀀스 & 테이블
CREATE SEQUENCE WEDDING_SEQ MAXVALUE 99999 NOCACHE NOCYCLE; 
CREATE TABLE WEDDINGHALL(
    WNO         NUMBER(6) PRIMARY KEY,
    WNAME       VARCHAR2(250) NOT NULL,
    WADDRESS    VARCHAR2(250) NOT NULL,
    WCONTENT    VARCHAR2(4000),
    WPRICE      NUMBER(7) NOT NULL,
    WIMAGE      VARCHAR2(30) NOT NULL,
    WLOC        VARCHAR2(50) NOT NULL
);
SELECT * FROM WEDDINGHALL;

DROP SEQUENCE REPLY_SEQ;
DROP TABLE WEDDINGREPLY;

-- 6. 댓글한줄평(REPLY) 시퀀스 & 테이블
CREATE SEQUENCE REPLY_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE WEDDINGREPLY(
    WRENO       NUMBER(6) PRIMARY KEY,
    WMEMO       VARCHAR2(1000) NOT NULL,
    MID         VARCHAR2(50) REFERENCES MEMBER(MID),
    WNO         NUMBER(6) REFERENCES WEDDINGHALL(WNO),
    WREDATE     DATE DEFAULT SYSDATE NOT NULL
);


-- 7. 예약(RESERVATION) 시퀀스 & 테이블
DROP SEQUENCE RS_SEQ;
DROP TABLE WEDDING_RS;
CREATE SEQUENCE RS_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE WEDDING_RS(
    RSNO        NUMBER(6) PRIMARY KEY,
    MID         VARCHAR2(50) REFERENCES MEMBER(MID),
    WNO         NUMBER(6) REFERENCES WEDDINGHALL(WNO),
    WDATE       DATE NOT NULL
);

SELECT * FROM WEDDING_RS WHERE MID='aaa' AND WDATE='';


-- 찜 테이블에 mid, wno, primarykey -- 찜한 리스트 볼 때 ( 최신 부터 rdate)
-- insert into (내아이디는 session 있을 거고, 
-- select count(*) from 찜 테이블 where mid = sessionid and wno='1'; 
-- //찜 테이블 클릭했을때 .do로 가라 , request.setAttribute 에다가 count 를입력 , 상세보기 페이지에 0이면 찜 취소 .do , 그 아이가 1이면 insert.do로 가라  
-- delete (찜 취소) 
-- 내가 찜한 리스트 select * from 찜 테이블 

DROP SEQUENCE ZIM_SEQ;
DROP TABLE ZIM;
CREATE SEQUENCE ZIM_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE ZIM(
    ZNO         NUMBER(6) PRIMARY KEY,
    MID         VARCHAR2(50) REFERENCES MEMBER(MID),
    WNO         NUMBER(6) REFERENCES WEDDINGHALL(WNO),
    ZDATE       DATE DEFAULT SYSDATE NOT NULL
);
SELECT * FROM ZIM;












