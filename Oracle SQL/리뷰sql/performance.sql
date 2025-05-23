SELECT * FROM performance WHERE place LIKE '%세종%';

SELECT * FROM performance
WHERE eventname LIKE '%앙상블%'
   OR place LIKE '%세종%'
   OR category LIKE '%클래식%'
AND ROWNUM < 10;

select * from tbl_performance;

SELECT * FROM tbl_performance ORDER BY bno DESC;

insert into tbl_performance(bno, img_url, title, writer, content)
values(
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=2a690809cd8c4c08a577fc07a780b8c9' || '&' || 'thumb=Y',
    '[서초문화재단] 서리풀 전곡 연주 시리즈 [하이든 교향곡 전곡 시리즈 26]', 
    'user9368', 
    '[서초문화재단] 서리풀 전곡 연주 시리즈 [하이든 교향곡 전곡 시리즈 26]를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!'
);


insert into tbl_performance(bno, img_url, title, writer, content)
values(
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=75a9ccc313ef4118bb4ad24042466977'|| '&' || 'thumb=Y',
    '[강북문화재단] 인디 고 그린
', 
    'user1487
', 
    '[강북문화재단] 인디 고 그린를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

insert into tbl_performance(bno, img_url, title, writer, content)
values(
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=be205ac9580c4708b3bac96c3af667e6'|| '&' || 'thumb=Y',
    '[구립증산정보도서관] 공연 연계형 가족 독서체험 [신비의 세계로! 우리 가족 상상 모험] 2탄 - 비밀의 도서관', 
    'user1806', 
    '[구립증산정보도서관] 공연 연계형 가족 독서체험 [신비의 세계로! 우리 가족 상상 모험] 2탄 - 비밀의 도서관를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!'
);
SET DEFINE OFF;
INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=e84f434059d0461498d1a86ff0c7ec0b&thumb=Y',
    '[서울생활문화센터 서교] 서울청년문화기획네트워크 ''2024 서교 청년 다 잇다''', 
    'user1135', 
    '[서울생활문화센터 서교] 서울청년문화기획네트워크 ''2024 서교 청년 다 잇다''를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=d85f6c4547a54b9c9476ba425f6cefc4&thumb=Y
',
    '[성북문화재단] 달빛마루도서관 - 12월, 책으로 놀자! [꽁꽁! 추워도 괜찮아]
', 
    'user4033
', 
    '[성북문화재단] 달빛마루도서관 - 12월, 책으로 놀자! [꽁꽁! 추워도 괜찮아]를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=a3b531da0b0046439425bd451c143600&thumb=Y
',
    '[세종문화회관] 김소연 피아노 리사이틀 [모차르트 피아노 솔로 전곡 시리즈 I]
', 
    'user3152
', 
    '[세종문화회관] 김소연 피아노 리사이틀 [모차르트 피아노 솔로 전곡 시리즈 I]를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=24eb8b810e2d4e2bae0bdd88bc27947a&thumb=Y

',
    '[마포구립서강도서관] 2025년 개관 17주년 기념 집중인문학 [타인의 기쁨과 슬픔]

', 
    'user9896

', 
    '[마포구립서강도서관] 2025년 개관 17주년 기념 집중인문학 [타인의 기쁨과 슬픔]를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!

'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=b0d9d89ef3764cc9bf596e602aa654b4&thumb=Y
',
    '[동작문화재단] 2024년 동작아트갤러리 전시기획공모사업 선정전시 2부 《지도의 끝, 이야기의 시작》
', 
    'user5651
', 
    '[동작문화재단] 2024년 동작아트갤러리 전시기획공모사업 선정전시 2부 《지도의 끝, 이야기의 시작》를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=64bfbe0a678240eea929e774b2ecb20a&thumb=Y
',
    '[서울역사박물관] 기획전 [서울의 지하철] 연계 교육
', 
    'user5066
', 
    '[서울역사박물관] 기획전 [서울의 지하철] 연계 교육를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=4d852eb66064434dac4b746d791af673&thumb=Y
',
    '2025 콘사노 체임버오케스트라 신년음악회
', 
    'user6981
', 
    '2025 콘사노 체임버오케스트라 신년음악회를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=5372753d74594dfc8dcd65e0edf40a83&thumb=Y

',
    '[세종문화회관] 시詩가 있는 무대臺 [가곡시대]

', 
    'user5941

', 
    '[세종문화회관] 시詩가 있는 무대臺 [가곡시대]를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!

'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=9c99853727344c9f90dd946350d499ab&thumb=Y

',
    '[서울공예박물관] 장인의 보물상자(화각공예)[3,4학년]

', 
    'user7907

', 
    '[서울공예박물관] 장인의 보물상자(화각공예)[3,4학년]를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!

'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=f39734f21811414888800a36fc422417&thumb=Y
',
    '[서울도서관] 서울 문화의 밤(6월) 행사 - 한다혜 작가와의 만남
', 
    'user9416
', 
    '[서울도서관] 서울 문화의 밤(6월) 행사 - 한다혜 작가와의 만남를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=b6f9a5ec06834613b4b9138c11021ac0&thumb=Y

',
    '[송파 청년아티스트센터] 예술가와 함께하는 풍납 탐구 생활_8월

', 
    'user1050

', 
    '[송파 청년아티스트센터] 예술가와 함께하는 풍납 탐구 생활_8월를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!

'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=52d61b11247347d58e5edc8c30367d2a&thumb=Y
',
    '[서울문화예술교육센터 양천] 예술 작업실 [공연으로 만나는 치유의 시간]
', 
    'user9679
', 
    '[서울문화예술교육센터 양천] 예술 작업실 [공연으로 만나는 치유의 시간]를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=563bdd80d5914f1c83547d8c4a45767b&thumb=Y

',
    '2024 공연봄날 학부모 특별공연
', 
    'user5794

', 
    '2024 공연봄날 학부모 특별공연를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!

'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=29a32ce192544548b85d84ff0427c850&thumb=Y

',
    '[노들섬] 아모레퍼시픽재단 초청 협력 야외 전시 [다시 보다, 희망의 빛 1332]
', 
    'user2607
', 
    '[노들섬] 아모레퍼시픽재단 초청 협력 야외 전시 [다시 보다, 희망의 빛 1332]를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!


'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=102f459d63d842d5907b4fc173a8ebaa&thumb=Y
',
    '[서울아트책보고] [서울아트플랫폼] 돌멩이냐옹 : 아크릴 펜으로 조약돌에 고양이 그리기
', 
    'user2967
', 
    '[서울아트책보고] [서울아트플랫폼] 돌멩이냐옹 : 아크릴 펜으로 조약돌에 고양이 그리기를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=75d8a6ec181745128edab37af1b2d3c3&thumb=Y
',
    '2025년 응봉산 개나리 축제
', 
    'user4526
', 
    '2025년 응봉산 개나리 축제를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!
'
);

INSERT INTO tbl_performance (bno, img_url, title, writer, content)
VALUES (
    seq_performance.nextval, 
    'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=ad0f3e32fb7f4ad280464e12ea296901&thumb=Y

',
    '2024 서울로미디어캔버스 4회전시

', 
    'user9866

', 
    '2024 서울로미디어캔버스 4회전시를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!

'
);

SET DEFINE ON;

commit;

