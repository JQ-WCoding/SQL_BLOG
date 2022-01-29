BEGIN
    /* 테이블 변수 */
    DECLARE @TABLE_TEST TABLE
                        (
                            IDX   INT IDENTITY (1,1) NOT NULL,
                            TITLE VARCHAR(20)        NOT NULL
                        )

    DECLARE @cnt INT = 1


    /* 단순 데이터 입력을 위한 행위 */
    WHILE (@cnt < 100)
        BEGIN
            INSERT INTO @TABLE_TEST (TITLE) VALUES ('A')

            SET @cnt += 1
        END


    BEGIN TRAN
        INSERT INTO @TABLE_TEST (TITLE) VALUES ('B')

        /* 변경확인 */
        SELECT *
        FROM @TABLE_TEST
        ORDER BY IDX DESC
    ROLLBACK TRAN

    SELECT *
    FROM @TABLE_TEST
    ORDER BY IDX DESC
END