
SELECT COUNT(*)AS amount, a.gameIdx, a.gameTitle, a.gameImg 
FROM gameInfo AS a JOIN recordInfo AS B
WHERE a.gameIdx = b.gameIdx 
group BY a.gameIdx
ORDER BY amount desc LIMIT 0, 8
