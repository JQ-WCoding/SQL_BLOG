/*
임시 테이블과 테이블 변수의 차이점 구분
*/

BEGIN
    DECLARE @cnt INT = 1

    DECLARE @TEMP_TABLE TABLE
                        (
                            NO           INT IDENTITY (1,1) NOT NULL,
                            INS_DATETIME DATETIME           NOT NULL
                        )

    WHILE (@cnt < 100)
        BEGIN
            INSERT INTO @TEMP_TABLE(INS_DATETIME)
            VALUES (GETDATE())

            SET @cnt += 1
        END

    /* 테이블 변수 */
    SELECT *
    FROM @TEMP_TABLE
    ORDER BY INS_DATETIME DESC
END


BEGIN
    DECLARE @cnt INT = 1

    CREATE TABLE #TEMP_TABLE
    (
        NO           INT IDENTITY (1,1) NOT NULL,
        INS_DATETIME DATETIME           NOT NULL
    )

    WHILE (@cnt < 100)
        BEGIN
            INSERT INTO #TEMP_TABLE(INS_DATETIME)
            VALUES (GETDATE())

            SET @cnt += 1
        END

    /* 임시 테이블 */
    SELECT *
    FROM #TEMP_TABLE
    ORDER BY INS_DATETIME DESC

    DROP TABLE #TEMP_TABLE
END


BEGIN
    BEGIN TRANSACTION
        DECLARE @cnt INT = 1

        DECLARE @TEMP_TABLE TABLE
                            (
                                NO           INT IDENTITY (1,1) NOT NULL,
                                INS_DATETIME DATETIME           NOT NULL
                            )

        WHILE (@cnt < 100000)
            BEGIN
                INSERT INTO @TEMP_TABLE(INS_DATETIME)
                VALUES (GETDATE())

                SET @cnt += 1
            END

        /* 테이블 변수 */
        SELECT *
        FROM @TEMP_TABLE
        ORDER BY INS_DATETIME DESC
    ROLLBACK TRANSACTION
END


BEGIN
    BEGIN TRANSACTION
        DECLARE @cnt INT = 1

        CREATE TABLE #TEMP_TABLE
        (
            NO           INT IDENTITY (1,1) NOT NULL,
            INS_DATETIME DATETIME           NOT NULL
        )

        WHILE (@cnt < 100000)
            BEGIN
                INSERT INTO #TEMP_TABLE(INS_DATETIME)
                VALUES (GETDATE())

                SET @cnt += 1
            END

        /* 임시 테이블 */
        SELECT *
        FROM #TEMP_TABLE
        ORDER BY INS_DATETIME DESC

        DROP TABLE #TEMP_TABLE
    ROLLBACK TRANSACTION
END