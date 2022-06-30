
SELECT COUNT(*)AS amount, a.gameIdx, a.gameTitle, a.gameImg 
FROM gameInfo AS a LEFT OUTER JOIN recordInfo AS B ON a.gameIdx = b.gameIdx
group BY a.gameIdx
ORDER BY amount desc LIMIT 0, 10
