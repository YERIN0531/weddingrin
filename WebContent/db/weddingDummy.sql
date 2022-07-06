-- 웨딩홀 리스트  Insert
-- 강서구
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '베뉴지_강서','서울특별시 강서구 강서로 388','베뉴지입니다',300,'11.png','강서');
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '메이필드호텔_강서','서울특별시 강서구 방화대로 94','페이필드호텔입니다',500,'12.png','강서');    
    select * from weddinghall;
-- 양천구
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '더케이스타웨딩_양천','서울특별시 양천구 목동서로 201','더케이스타웨딩입니다',300,'10.png','양천');
-- 구로구
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '지타워컨벤션','서울특별시 구로구 디지털로26길 38 ','지타워컨벤션',450,'13.png','구로');
    INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '제이오스티엘','서울특별시 구로구 경인로 565 ','제이오스티엘입니다',930,'14.png','구로');
    INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '신도림S컨벤션','서울특별시 구로구 경인로 610 코리아빌딩 ','신도림S컨벤션입니다',400,'15.png','구로');
    INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '테크노마트웨딩시티','서울특별시 구로구 새말로 97 신도림테크노마트 8층 ','테크노마트 웨딩시티',300,'16.png','구로');
-- 금천구
-- 영등포구
    INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '전경련플라자','서울 영등포구 여의대로 24 (여의도동, 전국경제인연합회회관) 컨퍼런스 센터 1층 ','전경련플라자입니다',300,'17.png','영등포');
    INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '더파티움여의도','서울 영등포구 은행로 30 (여의도동, 중소기업중앙회) 더파티움 여의도','더파티움여의도 입니다',500,'18.png','영등포');
        INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '웨스턴베니비스','서울시 영등포구 당산동3가 393 ','웨스턴베니비스 입니다',500,'19.png','영등포');
        INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '해군호텔 W웨딩홀','서울특별시 영등포구 신길7동 101-1','해군호텔 W웨딩홀 입니다',100,'20.png','영등포');
    select * from weddinghall where wloc='동작';
    
-- 동작구 
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '아르테스웨딩홀','서울특별시 동작구 동작대로 59','아르테스웨딩홀 입니다',120,'21.png','동작');
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '더에스비웨딩홀','서울 동작구 보라매로5길 15','더에스비웨딩홀 입니다',400,'22.png','동작');
-- 관악구

-- 서초구
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '엘루체컨벤션','서울특별시 서초구 신반포로 23 엘루체','엘루체컨벤션 입니다',400,'23.png','서초');
    INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '더화이트베일','서울특별시 서초구 서초중앙로 14 (주)진로','더화이트베일 입니다',500,'24.png','서초');
-- 강남구
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '헤리츠 컨벤션','서울특별시 강남구 논현로 662 (논현동 215, 헤리츠타워)','헤리츠웨딩홀입니다',900,'5.png','강남');
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '더클래스청담','서울특별시 강남구 압구정로60길','더클래스청담입니다',1200,'6.png','강남');
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '드레스가든','서울특별시 강남구 영동대로 707','드레스가든입니다',1700,'7.png','강남');
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '빌라드지디 더그레이스','서울특별시 강남구 학동로','빌라드지디입니다',500,'8.png','강남');
INSERT INTO WEDDINGHALL (WNO, WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC)
    VALUES (WEDDING_SEQ.NEXTVAL, '더컨벤션신사','서울특별시 강남구 신사로','더컨벤션신사입니다',300,'9.png','강남');

SELECT * FROM WEDDINGHALL;
-- 송파구
-- 강동구
-- 마포구
-- 용산구
-- 서대문구
-- 은평구
-- 중구
-- 종로구
-- 성동구
-- 광진구
-- 동대문구
-- 성북구
-- 강북구
-- 도봉구
-- 노원구
-- 중랑구 

COMMIT;