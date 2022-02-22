BEGIN
    /* 시간을 날짜로 변환 */
    SELECT *
    FROM WMT_COB_OUTBOUND_HR
    WHERE INS_DATETIME BETWEEN CONVERT(VARCHAR(8), GETDATE(), 112) AND CONVERT(VARCHAR(8), GETDATE(), 112)

    /* 문자열을 날짜로 변환 */
    SELECT *
    FROM WMT_COB_OUTBOUND_HR
    WHERE INS_DATETIME > CONVERT(DATETIME, '20220222')
      AND INS_DATETIME < DATEADD(DD, 1, CONVERT(DATETIME, '20220222'))

    -- yyyymmdd
    SELECT CONVERT(VARCHAR(8), '20220222', 112)

    -- 밀리세컨즈까지 전부 출력 (DATETIME 으로 전환)
    SELECT CONVERT(DATETIME, '20220222')

    -- (dd) 는 일을 의미 -> + 1일
    SELECT DATEADD(DD, 1, CONVERT(DATETIME, '20220222'))
END