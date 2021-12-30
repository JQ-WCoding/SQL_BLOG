/* 프로시저 생성 */
CREATE PROCEDURE dbo.[TEST_PROC](
    /* 입력받는 변수 */
    @I_INPUT VARCHAR(10),
    /* 반환하는 변수 */
    @O_OUTPUT VARCHAR(10) OUT
)
AS
BEGIN
    /* 지역변수 선언 */
    DECLARE @v_local VARCHAR(20)

    /* 지역변수 선언 및 초기화 */
    DECLARE @v_local_set INT = 10

    SET @I_INPUT = 10
    SET @O_OUTPUT = 20
    SELECT @v_local, @v_local_set
END