-- 댓글 테이블
create table tbl_reply(
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create SEQUENCE seq_reply;

alter table tbl_reply add CONSTRAINT pk_reply
primary key(rno);

alter table tbl_reply add CONSTRAINT fk_reply FOREIGN key(bno) REFERENCES tbl_performance(bno);

desc tbl_reply;

select * from tbl_reply order by rno;

-- Test를 위한 댓글 추가
insert into tbl_reply(rno, bno, reply, replyer)
values(seq_reply.nextval, 2, '댓글 test 입력', '홍길동');

commit;

-- 댓글 확인
select * 
from tbl_reply
order by rno desc;

-- 페이징 처리 index 생성
create index idx_reply on tbl_reply (bno desc, rno asc);
