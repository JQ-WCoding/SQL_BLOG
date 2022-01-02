/* 프로시저 생성 */
CREATE PROCEDURE dbo.[TEST_PROC](
    /* 전역변수 */
    @I_INPUT VARCHAR(10), /* 입력받는 변수 */
    @O_OUTPUT VARCHAR(10) OUT /* 반환하는 변수 */
)
AS
BEGIN
    /* 지역변수 */
    DECLARE @v_local VARCHAR(20)

    /* 지역변수 선언 및 초기화 */
    DECLARE @v_local_set INT = 10

    SET @I_INPUT = 10
    SET @O_OUTPUT = 20
    SELECT @v_local, @v_local_set /*  */

    /*  */
    IF (@I_INPUT < 10)
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