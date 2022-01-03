/* 프로시저 생성 */
CREATE PROCEDURE dbo.[TEST_PROC](
    /* 전역변수 */
    @I_INPUT VARCHAR(10), /* 입력받는 변수 */
    @O_OUTPUT VARCHAR(10) OUTPUT, /* 반환하는 변수(OUT 과 동일) */
    @PARAMETER VARCHAR(10) READONLY /* READONLY 읽기만 가능 (프로시저 내에서 변수 초기화 불가능) */
)
AS
BEGIN
    /* 지역변수 */
    DECLARE @v_local VARCHAR(20)

    /* 지역변수 선언 및 초기화 */
    DECLARE @v_local_set INT = 10

/*    SET @I_INPUT = 10
    SET @O_OUTPUT = 20*/
    SELECT @v_local, @v_local_set

    SET @PARAMETER = 10
    SELECT @PARAMETER

    /* 지역변수 범위 확인하기 */
    IF (@v_local_set < 10)
        /* BEGIN ~ END 한 블록 */
        BEGIN
            DECLARE @v_inner_local VARCHAR(10)

            SET @v_inner_local = 10

            SELECT @v_inner_local
        END
    ELSE
        BEGIN
            /* SELECT @v_inner_local */
        END
    /* SELECT @v_inner_local 에러가 발생함 */
END