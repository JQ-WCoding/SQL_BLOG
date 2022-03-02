BEGIN
    -- 테이블 변수 선언(임의 사용을 위함)
    DECLARE @TEMP TABLE
                  (
                      SEQ   INT,
                      ADDR1 VARCHAR(20),
                      ADDR2 VARCHAR(20),
                      ADDR3 VARCHAR(20)
                  )

    -- 임의 데이터 넣기(광화문 주소)
    INSERT INTO @TEMP
    VALUES ( 1
           , N'서울 종로구 '
           , N'효자로 12 '
           , N'국립고궁박물관')

    -- SEQ 1의 주소 합치기
    SELECT ADDR1 + ADDR2 + ADDR3 AS ADDR
    FROM @TEMP
    WHERE SEQ = 1

    -- 임의 데이터 넣기
    INSERT INTO @TEMP
    VALUES ( 2
           , N'서울 종로구 '
           , N'사직로 161 '
           , null)

    -- 값이 합쳐지지 않고 null 이 나온다 (하나라도 값이 null인 경우 varchar를 합치면 전부 null이 된다.)
    SELECT ADDR1 + ADDR2 + ADDR3 AS ADDR
    FROM @TEMP
    WHERE SEQ = 2

    -- ISNULL 을 통해 null인 경우 ''인 공란으로 변환시켜 varchar 형을 유지하면 varchar 합치기가 가능해진다
    SELECT ISNULL(ADDR1, '') + ISNULL(ADDR2, '') + ISNULL(ADDR3, '') AS ADDR
    FROM @TEMP
    WHERE SEQ = 2
END