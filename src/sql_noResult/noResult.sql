-----------------------------------------------------------
-- 0. 준비단계
-----------------------------------------------------------
/* 변수 선언 */
DECLARE @v_result INT

/* 테이블 변수 선언 */
DECLARE @TEMP_TABLE TABLE
                    (
                        NAME     VARCHAR(5),
                        ID       VARCHAR(20),
                        PASSWORD VARCHAR(20)
                    )
/* 빈테이블 확인 */
SELECT *
FROM @TEMP_TABLE

-----------------------------------------------------------
-- 1. IF ELSE
-----------------------------------------------------------
/* 조건 */
IF EXISTS(
        SELECT *
        FROM @TEMP_TABLE
    )
    /* 존재한다면 */
    BEGIN
        SET @v_result = 1
    END
    /* 값이 존재하지 않는다면  */
ELSE
    BEGIN
        SET @v_result = 0
    END

SELECT @v_result AS RESULT
/* PRINT CONVERT(VARCHAR, @v_result) */

-----------------------------------------------------------
-- 2. CASE WHEN
-----------------------------------------------------------
SET @v_result = CASE
                    WHEN EXISTS(SELECT *
                                FROM @TEMP_TABLE)
                        THEN 1
                    ELSE 0
    END

SELECT @v_result AS RESULT

-----------------------------------------------------------
-- 3. IIF
-----------------------------------------------------------
SET @v_result = IIF(EXISTS(SELECT *
                           FROM @TEMP_TABLE), 1, 0)

SELECT @v_result AS RESULT