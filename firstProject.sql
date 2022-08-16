SELECT * FROM shopdb.producttbl;

SELECT memberName, memberAddress FROM memberTBL;

SELECT * FROM memberTBL where memberName = "나슬"
-- 테이블명에 띄어쓰기가 있을경우 `` 사용
CREATE TABLE `my testTBL` (id INT) ;  

DROP TABLE `my testTBL` ;

CREATE VIEW uv_memberTBL
AS
  SELECT memberName, memberAddress
  FROM memberTBL
  
SELECT * FROM uv_memberTBL ; 