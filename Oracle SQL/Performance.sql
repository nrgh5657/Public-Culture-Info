CREATE TABLE performance (
  pno             NUMBER PRIMARY KEY,
  category        VARCHAR2(100),
  image           VARCHAR2(500),
  eventname       VARCHAR2(500),
  period          VARCHAR2(100),
  place           VARCHAR2(300),
  target_audience VARCHAR2(255),
  is_free         VARCHAR2(50),
  fee             VARCHAR2(255),
  homepage        VARCHAR2(500),
  img_key         VARCHAR2(255)
);

select * from performance;

-- CSV파일을 데이터 임포트 해야 됩니다. 이미지 키값을 만드려면 데이터가 필요해요.
-- Performance 테이블 우클릭 -> 데이터 임포트
-- 데이터 파일 임포트 에서 찾아보기 클릭 -> csv파일 선택 , 인코딩 utf-8
-- 다음 누르고 다음 누르고 임포트할 데이터 선택
-- csv 데이터랑 db테이블 칼럼이랑 일치 시키기
-- □ = PNO
-- 분류 = CATEGORY
-- 공연/행사명 = EVENTNAME
-- 날짜/시간 = PERIOD
-- 장소 = PLACE
-- 이용대상 = TARGET_AUDIENCE
-- 이용요금 = FEE
-- 홈페이지 주소 = HOMPAGE
-- 대표이미지 = IMAGE
-- 유무료 = IS_FREE
-- 이후 완료누르면 데이터가 insert 됩니다, 오류가 없으면 데이터가 한번에 쭉 들어갑니다.


--이미지 키값 생성, IMAGE 데이터에서 atchFielId= 이후 고유 값 부분을 키값으로 추출합니다  
--api랑 db를 비교해서 데이터를 조회하는데 활용 됩니다 
UPDATE performance
SET img_key = REGEXP_SUBSTR(image, 'atchFileId=([^&]+)', 1, 1, NULL, 1)
WHERE image LIKE '%atchFileId=%'; --키값 추출 해서 img_key값 update

--img_key 중복 방지를 위해 unique설정
ALTER TABLE performance ADD CONSTRAINT unique_img_key UNIQUE (img_key);

select * from performance order by pno desc;

--pno 자동증가 시퀀스
CREATE SEQUENCE performance_seq
  START WITH 1444 -- 임포트한 데이터 마지막 번호 이후 증가
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--pno 자동증가 트리거, insert구문 실행시 pno 자동증가  
CREATE OR REPLACE TRIGGER performance_before_insert
BEFORE INSERT ON performance
FOR EACH ROW
BEGIN
  IF :NEW.pno IS NULL THEN
    SELECT performance_seq.NEXTVAL INTO :NEW.pno FROM dual;
  END IF;
END;
/

