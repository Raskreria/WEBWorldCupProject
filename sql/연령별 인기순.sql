SELECT COUNT(0)AS amount, a.gameIdx, a.gameTitle, a.gameImg, b.gameIdx, c.age
FROM (gameInfo AS a LEFT OUTER JOIN recordInfo AS b ON a.gameIdx = b.gameIdx) JOIN memberinfo AS c ON  b.playMemberIdx = c.memberIdx and  c.age=32
group BY a.gameIdx
ORDER BY amount DESC LIMIT 0, 10