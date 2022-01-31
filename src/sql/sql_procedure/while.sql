BEGIN
    DECLARE @cnt INT = 1

    WHILE (@cnt < 10)
        BEGIN
            PRINT CONVERT(VARCHAR(20), @cnt)


            IF (@cnt = 3)
                BEGIN
                    SET @cnt += 2

                    PRINT '+2 JUMP'
                    CONTINUE /* WHILE 최상단으로 이동 */
                END

            IF (@cnt = 8)
                BEGIN
                    PRINT 'BREAK'
                    BREAK /* WHILE 문 탈출 */
                END

            SET @cnt += 1
        END
END