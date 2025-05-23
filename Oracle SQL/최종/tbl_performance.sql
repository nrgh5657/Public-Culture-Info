-- tbl_performance 생성
create SEQUENCE seq_performance;

create table tbl_performance(
    bno number(10,0),
    img_url varchar2(500) not null, 
    title varchar2(200) not null,
    writer varchar2(50) not null,
    readcount number(4) default 0,      -- 조회수
    regdate date default sysdate,       -- 작성일
    updatedate date default sysdate,     -- 수정일
    content varchar2(1000)
);

alter table tbl_performance add CONSTRAINT pk_performance
primary key(bno);

desc tbl_performance;

SET DEFINE OFF;

insert into tbl_performance(bno, img_url, title, writer, content)
values(seq_performance.nextval, 
'https://culture.seoul.go.kr/cmmn/file/getImage.do?atchFileId=5372753d74594dfc8dcd65e0edf40a83&thumb=Y',
'[세종문화회관] 시詩가 있는 무대臺 [가곡시대]', 'user5941', 
'[세종문화회관] 시詩가 있는 무대臺 [가곡시대]를 다녀왔는데 정말 인상 깊었어요. 무대 구성도 좋고 관람 환경도 쾌적했어요. 다음에도 꼭 다시 보고 싶은 공연입니다!');

commit;

select * from tbl_performance order by BNO;

-- replyCnt 추가
alter table tbl_performance
add (replyCnt number default 0);

-- 장소, 분류 추가
alter table tbl_performance
add (img_key VARCHAR2(255), place VARCHAR2(300), category VARCHAR2(100));



