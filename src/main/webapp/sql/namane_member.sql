create table namane_member(
    NAME    varchar2(30) not null,
    ID      varchar2(30) primary key, --기본키, unique, not null, 무결성 제약 조건
    PWD     varchar2(30) not null,
    EMAIL   varchar2(20) not null,
    TEL     varchar2(30),
    LOGTIME DATE DEFAULT SYSDATE
);