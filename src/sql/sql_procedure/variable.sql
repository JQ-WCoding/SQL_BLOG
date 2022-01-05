CREATE PROCEDURE dbo.[TEST](
    /* 매개변수 */
    @public INT
)
AS
BEGIN
    /* 지역변수 */
    DECLARE @local INT = 1

    /* 변수 @local 값이 10이하이면 @local 값을 조회한다 */
    IF (@local < 10)
        BEGIN
            SELECT @local

            SELECT @public
        END

    /*
        변수 @local 값이 10까지 반복한다
    */
    WHILE (@local = 10)
        BEGIN
            /* while 내부 지역변수 */
            DECLARE @addNum INT = 1

            PRINT CONVERT(VARCHAR, @local)

            SET @local += @addNum
        END

--     SELECT @addNum 사용 불가능

    SELECT @public

    /* 전역변수 */
    SELECT @@ERROR -- 마지막 오류번호

    SELECT @@IDENTITY -- 마지막 IDENTITY 값
END