/*
임시 테이블과 테이블 변수의 차이점 구분
*/

BEGIN TRAN
BEGIN
    DECLARE @TEMP_TABLE TABLE
                        (
                            ID       VARCHAR(10),
                            NAME     VARCHAR(10),
                            PASSWORD VARCHAR(10)
                        )

    INSERT INTO @TEMP_TABLE(ID, NAME, PASSWORD)
    VALUES ('AAA', 'LEE', '1234')

    CREATE TABLE ##TEMP_TABLE
    (
        ID       VARCHAR(10),
        NAME     VARCHAR(10),
        PASSWORD VARCHAR(10)
    )

    INSERT INTO ##TEMP_TABLE(ID, NAME, PASSWORD)
    VALUES ('AAA', 'LEE', '1234')


    SELECT *
    FROM @TEMP_TABLE

    SELECT *
    FROM ##TEMP_TABLE

    DROP TABLE ##TEMP_TABLE
END
ROLLBACK TRAN

