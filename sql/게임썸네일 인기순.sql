
SELECT COUNT(*)AS amount, a.gameIdx, a.gameTitle, a.gameImg 
FROM gameInfo AS a LEFT OUTER JOIN recordInfo AS B ON a.gameIdx = b.gameIdx
group BY a.gameIdx
ORDER BY amount desc LIMIT 0, 10

카테고리 공지사항/커뮤니티

로그인한 사용자 -> 커뮤니티

로그인한 사용자 중에서 관리자 -> 공지사항 커뮤니티