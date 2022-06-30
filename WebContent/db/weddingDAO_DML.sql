-- ★ ★ 1. 회원(MEMBER) 테이블 DAO ★ ★ --

-- 1. 아이디 중복체크
SELECT * FROM MEMBER WHERE MID='aaa';

-- 2. 회원가입하기 
INSERT INTO MEMBER(MID, MPW, MNAME, MTEL, MEMAIL, MBIRTH, MADDRESS)VALUES(
                    'aaa', '1111', '홍길동', '010-0000-0000', 'hong@naver.com','1990-01-01','서울 강남구');
INSERT INTO MEMBER(MID, MPW, MNAME, MTEL, MEMAIL, MBIRTH, MADDRESS)VALUES(
                    'bbb', '2222', '서길동', '010-1111-1111', 'seo@naver.com','1990-02-01','서울 마포구');
-- 3. 로그인(MID/MPW)
SELECT * FROM MEMBER WHERE MID='aaa' AND MPW='1';

-- 4. MID로 DTO 불러오기 (GETMEMBER)
SELECT * FROM MEMBER WHERE MID='aaa';
-- 5. 회원정보수정 
UPDATE MEMBER SET MPW = '1111',
                    MNAME = '이길동',
                    MEMAIL = 'yi@naver.com',
                    MADDRESS = '서울 구로구'
        WHERE MId='aaa';
SELECT * FROM MEMBER;
-- 6. 회원리스트
SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
                        (SELECT * FROM MEMBER ORDER BY MRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 2;
-- 7. 총 가입된 회원 수  
SELECT COUNT(*) CNT FROM MEMBER;
-- 8. 회원정보삭제 
DELETE FROM MEMBER WHERE MID = 'aaa';
-- 9. 이메일 중복체크 
SELECT * FROM MEMBER;
SELECT * FROM MEMBER WHERE MEMAIL='yi@naver.com';
COMMIT;

-- ★ ★ 2. 관리자(ADMIN) 테이블 DAO ★ ★ --
-- 1. 관리자 등록하기 (AID, APW, ACODE)  //ACODE를 정해놓고 '111'이 아니면 '틀렸습니다'뿌리기
INSERT INTO ADMIN (AID, APW, ACODE) VALUES ('adminaa','111','ABCD');
INSERT INTO ADMIN (AID, APW, ACODE) VALUES ('admin','1','a');

-- 2. 로그인(MID, APW) 
SELECT * FROM ADMIN WHERE AID='adminaa' AND APW='111';
-- 3. 로그인 후 세션에 넣을 용도 ADMIN ID로 DTO 가지고 오기 
SELECT * FROM ADMIN WHERE AID = 'adminaa';

-- ★ ★ 3. 후기게시판(REVIEW) 테이블 DAO ★ ★ --
-- 1. 글 목록 
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE R.MID=M.MID 
                ORDER BY RDATE DESC) A)
    WHERE RN BETWEEN 1 AND 11;
    
-- 2. 글 갯수
SELECT COUNT(*) RCNT FROM REVIEWBOARD; 

-- 3. 글쓰기
INSERT INTO REVIEWBOARD (RNO, MID, RTITLE, RCONTENT, RFILENAME, RIP)
    VALUES (REVIEW_SEQ.NEXTVAL, 'aaa','title','content',null, 
         '192.168.10.151');

INSERT INTO REVIEWBOARD (RNO, MID, RTITLE, RCONTENT, RFILENAME, RIP)
    VALUES (REVIEW_SEQ.NEXTVAL, 'bbb','title2','content2',null, 
         '192.168.10.152');

-- 4. HIT 올리기
UPDATE REVIEWBOARD SET RHIT = RHIT+1 WHERE RNO=2;
SELECT * FROM REVIEWBOARD;

-- 5. 게시판 프라이머키로 DTO 가지고 오기 
SELECT * FROM REVIEWBOARD WHERE RNO=2;
-- 6. 글 수정하기 
UPDATE REVIEWBOARD SET RTITLE = '바뀐제목',
                    RCONTENT = '본문',
                    RFILENAME = NULL,
                    RIP = '192.168.151.10',
                    RDATE = SYSDATE
            WHERE RNO = 2; 
-- 7. 글 삭제하기
DELETE REVIEWBOARD WHERE RNO='1';
-- 8. 회원탈퇴하려는 사람이 쓴 글 모두 삭제 
DELETE FROM REVIEWBOARD WHERE MID = 'aaa';

-- ★ ★ 4. 문의게시판(QNA) 테이블 DAO ★ ★ --

-- 1. 글 목록 (FOREIGN으로연결되어 있지 않은 상황에서의 글 목록 출력) 
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT * FROM QNABOARD
                ORDER BY QGROUP DESC, QSTEP) A)
    WHERE RN BETWEEN 1 AND 11;
-- 2. 글 개수
SELECT COUNT(*) QCNT FROM QNABOARD; 

-- 3. 글 쓰기(원글)
INSERT INTO QNABOARD (QNO, QID, QTITLE, QCONTENT,  QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa','title','content', QNA_SEQ.CURRVAL, 0, 0, '192.168.10.151');
INSERT INTO QNABOARD (QNO, QID, QTITLE, QCONTENT,  QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNA_SEQ.NEXTVAL, 'bbb','title2','content2', QNA_SEQ.CURRVAL, 0, 0, '191.168.10.151');
INSERT INTO QNABOARD (QNO, QID, QTITLE, QCONTENT,  QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNA_SEQ.NEXTVAL, 'ccc','title3','content3', QNA_SEQ.CURRVAL, 0, 0, '193.168.10.151');
INSERT INTO QNABOARD (QNO, QID, QTITLE, QCONTENT,  QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNA_SEQ.NEXTVAL, 'ddd','title4','content4', QNA_SEQ.CURRVAL, 0, 0, '194.168.10.151');
SELECT * FROM QNABOARD;
-- 4. FHIT 하나 올리기
UPDATE QNABOARD SET QHIT = QHIT +1 WHERE QNO=1;
-- 5. 게시판 프라이머키로 DTO 가지고 오기 
SELECT * FROM QNABOARD WHERE QNO=1;
-- 6. 글 수정하기 
UPDATE QNABOARD SET QTITLE='바뀐제목',
                    QCONTENT='본문',
                    QIP ='182.1.182.10'
                    WHERE QNO = 1;
-- 7. 글 삭제하기 
COMMIT;
DELETE FROM QNABOARD WHERE QNO=1;
ROLLBACK;
-- 8. 답변글 추가전 STEP a 수행
UPDATE QNABOARD SET QSTEP = QSTEP+1 WHERE QGROUP =1 AND QSTEP>0;
-- 9. 답변글 쓰기 
INSERT INTO QNABOARD (QNO, QID, QTITLE, QCONTENT,  QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNA_SEQ.NEXTVAL, '관리자','REPLY','content', 1, 1, 1, '192.168.10.151');

SELECT * FROM QNABOARD ORDER BY QGROUP DESC, QSTEP;
-- 10. 회원탈퇴 하려는 사람이 쓴 글 모두 삭제
DELETE FROM QNABOARD WHERE QID='aaa';
COMMIT;

-- ★ ★ 5. 웨딩홀(WEDDINGHALL) 테이블 DAO ★ ★ --
-- 1. 등록된 웨딩홀 목록(전체 LIST) -- 신규 업로드 순으로 출력
SELECT * FROM WEDDINGHALL ORDER BY WNO;
SELECT wno, wname||'('||(select count(*) from WEDDINGREPLY where wno=w.wno group by wno)||')' wname, waddress, wcontent, wprice, wimage, wloc  FROM WEDDINGHALL w ORDER BY WNO;

SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT WNO, WNAME ||'('||(SELECT COUNT(*) FROM WEDDINGREPLY WHERE WNO=W.WNO GROUP BY WNO)||')' WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC FROM WEDDINGHALL w ORDER BY WNO) A)
    WHERE RN BETWEEN 1 AND 11;

SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT *  FROM WEDDINGHALL ORDER BY WNO) A)
    WHERE RN BETWEEN 1 AND 11;

SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT *  FROM WEDDINGHALL WHERE WLOC='소형견' ORDER BY WNO ) A)
    WHERE RN BETWEEN 1 AND 11;

-- 2. 등록된 웨딩홀 목록 (WLOC ) 별로 선택 
SELECT wno, wname||'('||(select count(*) from WEDDINGREPLY where wno=w.wno group by wno)||')' wname, waddress, wcontent, wprice, wimage, wloc  FROM WEDDINGHALL W WHERE WLOC='영등포' ORDER BY WNO;

SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
    (SELECT WNO, WNAME||'('||(SELECT COUNT(*) FROM WEDDINGREPLY WHERE WNO=W.WNO GROUP BY WNO)||')' WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC  FROM WEDDINGHALL W WHERE WLOC='영등포' ORDER BY WNO) A)
    WHERE RN BETWEEN 1 AND 11;


-- 3. 등록된 웨딩홀 수 
SELECT COUNT(*) WCNT FROM WEDDINGHALL;

-- 4. 웨딩홀 상세보기 
SELECT * FROM WEDDINGHALL WHERE WNO='1';

SELECT wno, wname||'('||(select count(*) from WEDDINGREPLY where wno=w.wno group by wno)||')' wname, waddress, wcontent, wprice, wimage, wloc FROM WEDDINGHALL w WHERE WNO='1';
select wno, count(*) from WEDDINGREPLY where wno=1 group by wno;
-- 웨딩홀 등록하기 

INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '위더스웨딩홀','서울특별시 영등포구 영중로 55','위더스웨딩입니다',700,'1.png','영등포');
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '더채플앳청담','서울특별시 강남구 선릉로 757','더채플앳청담입니다',400,'2.png','강남');
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '호텔PJ','서울특별시 중구 마른내로 71','호텔PJ입니다',500,'3.png','중구');
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '루나미엘레','서울특별시 영등포구 여의공원로 101','루나미엘레입니다',400,'4.png','영등포');

-- ★ ★ 5. 댓글쓰기 테이블 DAO ★ ★ --
-- 1. 댓글쓰기
INSERT INTO WEDDINGREPLY (WRENO, WMEMO, MID, WNO)
VALUES (REPLY_SEQ.NEXTVAL, '홀이 너무 예뻐요','aaa',1);
SELECT * FROM WEDDINGREPLY;
INSERT INTO WEDDINGREPLY (WRENO, WMEMO, MID, WNO)
VALUES (REPLY_SEQ.NEXTVAL, '홀이 커요','bbb',1);
INSERT INTO WEDDINGREPLY (WRENO, WMEMO, MID, WNO)
VALUES (REPLY_SEQ.NEXTVAL, '상담사가 별로에요','bbb',2);
-- 2. 댓글 목록 출력하기 -- 페이징 처리(STARTROW, ENDROW)   // rownum 해주기

SELECT * FROM WEDDINGREPLY WHERE WNO='1' ORDER BY WRENO;

-- 영등포 웨딩홀이 인기가 많음. 댓글이 많이 달림 .. 영등ㅇ포 웨딩홀 댓글은 100개고 10개 
-- 댓글 갯수 

-- ★ ★ 7. 예약관련(RESERVATION) 테이블 DAO ★ ★ --DD
-- 1. 예약하기 INSERT 해서 RESERVATEION TABLE에 넣기yerinye 
INSERT INTO WEDDING_RS(RSNO, MID, WNO, WDATE)
VALUES(RS_SEQ.NEXTVAL, 'aaa', 1, TO_DATE('2022-05-31 15:00','YYYY-MM-DD HH24:MI')); 

SELECT * FROM WEDDING_RS;
-- 2. 예약한 LIST 뽑기 (사람 이름, 예약 날짜, 예약 시간 ) 
SELECT * FROM WEDDING_RS WHERE MID='aaa';
-- 3. 예약 취소하기 
DELETE FROM WEDDING_RS WHERE RSNO=1;


-- ★ ★ 5.찜하기  테이블 DAO ★ ★ --

-- insert into (내아이디는 session 있을 거고,  
-- 찜 하기 누르면 정보가 테이블로 들어옴 
INSERT INTO ZIM(ZNO, MID, WNO) VALUES (ZIM_SEQ.NEXTVAL,'aaa', '1');
INSERT INTO ZIM(ZNO, MID, WNO) VALUES (ZIM_SEQ.NEXTVAL,'aaa', '2');

-- select count(*) from 찜 테이블 where mid = sessionid and wno='1';
-- 찜 눌렀는지 안눌렀는지 여부 
SELECT COUNT(*) FROM ZIM WHERE MID='aaa' AND WNO='1';

-- 찜 취소 
DELETE FROM ZIM WHERE MID='aaa' AND WNO='2';
ROLLBACK;
-- 내가 찜한 리스트 
SELECT * FROM ZIM WHERE MID='aaa' ORDER BY ZDATE DESC;

-- //찜 테이블 클릭했을때 .do로 가라 , request.setAttribute 에다가 count 를입력 , 상세보기 페이지에 0이면 찜 취소 .do , 그 아이가 1이면 insert.do로 가라   scott ACCOUNT UNLOCK;
COMMIT;
SELECT * FROM MEMBER;
SELECT * FROM REVIEWBOARD;
SELECT * FROM QNABOARD;
SELECT * FROM ADMIN;
SELECT * FROM WEDDINGHALL;
SELECT * FROM WEDDINGREPLY;
SELECT * FROM WEDDING_RS;
COMMIT;
SELECT * FROM ADMIN;