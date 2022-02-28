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
           , '서울 종로구 '
           , '효자로 12 '
           , '국립고궁박물관')

    -- SEQ 1의 주소 합치기
    SELECT ADDR1 + ADDR2 + ADDR3 AS ADDR
    FROM @TEMP
    WHERE SEQ = 1

    INSERT INTO @TEMP
    VALUES ( 2
           , '서울 종로구 '
           , '사직로 161 '
           , null)

    -- 값이 합쳐지지 않고 null 이 나온다
    SELECT ADDR1 + ADDR2 + ADDR3 AS ADDR
    FROM @TEMP
    WHERE SEQ = 2

    -- ISNULL 을 통해 null인 경우 '' 을 이용해 합친다
    SELECT ISNULL(ADDR1, '') + ISNULL(ADDR2, '') + ISNULL(ADDR3, '') AS ADDR
    FROM @TEMP
    WHERE SEQ = 2
END