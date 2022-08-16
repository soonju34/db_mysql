CREATE TABLE 제품 (
	제품번호 CHAR(3) NOT NULL,
    제품명 VARCHAR(20),
    재고량 INT,
    단가 INT,
    제조업체 VARCHAR(20),
    PRIMARY KEY(제품번호),
    CHECK (재고량 >=0 AND 재고량 <=10000)
);

CREATE TABLE 주문 (
	주문번호 CHAR(3) NOT NULL,
    주문고객 VARCHAR(20),
    주문제품 CHAR(3),
    수량 INT,
    배송지 VARCHAR(30),
    주문일자 DATE,
    PRIMARY KEY (주문번호),
    FOREIGN KEY (주문고객) REFERENCES 고객(고객아이디),
    FOREIGN KEY (주문제품) REFERENCES 제품(제품번호)
);

CREATE TABLE 배송업체 (
	업체번호 CHAR(3) NOT NULL,
    업체명 VARCHAR(20),
    주소 VARCHAR(100),
    전화번호 VARCHAR(20),
    PRIMARY KEY (업체번호)
);
SELECT 고객아이디, 고객이름, 등급
FROM 고객;

SELECT DISTINCT 제조업체
FROM 제품;

SELECT 제품명, 단가 AS 가격
FROM 제품;

SELECT 제품명, 재고량, 단가
FROM 제품
WHERE 제조업체 = 'CJ';

SELECT 주문제품,수량,주문일자
FROM 주문
WHERE 주문고객='apple' AND 수량>=15;

# LIKE
## LIKE 'DATA%' -> DATA로 시작하는 문자열  
## LIKE '%DATA' -> DATA로 끝나는 문자열
## LIKE '%DATA%' -> DATA가 포함된 문자열
## LIKE 'DATA___' -> DATA로 시작하는 6자 길이의 문자열
## LIKE '__한%' -> 세번쨰글자가 '한'인 문자열

SELECT 고객이름, 나이, 등급
FROM 고객
WHERE 고객이름 LIKE '김%' ; 

SELECT 고객아이디, 고객이름, 등급
FROM 고객
WHERE 고객아이디 LIKE '_____';

SELECT 고객이름
FROM 고객
WHERE 나이 IS NULL;

# 정렬검색
SELECT 고객이름, 등급,나이
FROM 고객
ORDER BY 나이 DESC;

# 집계함수
## NULL 제외하고 계산
## WHERE 사용 불가 HAVING 가능

SELECT SUM(재고량) AS "재고량 합계"
FROM 제품
WHERE 제조업체 = 'CJ';

SELECT COUNT(고객아이디) AS 고객수 
FROM 고객;

SELECT COUNT(DISTINCT 제조업체) AS "제조업체 수"
FROM 제품;

SELECT 주문제품, SUM(수량) AS 총주문수량
FROM 주문
GROUP BY 주문제품;

SELECT 제조업체, COUNT(*) AS 제품수, MAX(단가) AS 최고가
FROM 제품 
GROUP BY 제조업체;

SELECT 제조업체, COUNT(*) AS 제품수, MAX(단가) AS 최고가
FROM 제품 
GROUP BY 제조업체 HAVING COUNT(*) >=3;

