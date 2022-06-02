create table namane_reply (
    RESEQ   NUMBER          PRIMARY KEY,--댓글의 숫자
    ID      VARCHAR2(20)    NOT NULL,   --
    PWD     VARCHAR2(30)    NOT NULL,   --
    PSEQ    NUMBER          NOT NULL,   --
    CONTENT VARCHAR2(255)   NOT NULL,   --
    LOGTIME DATE DEFAULT SYSDATE
);