select * from Grade;

select * from Poem;

select * from Emotion;

SELECT * FROM Gender;

select COUNT(Id) as PoemCount from Poem;

select TOP 76 Name from Author
Order by Name;

select TOP 76 a.Name, g.Name  
from Author a
INNER JOIN Grade g ON a.GradeId = g.Id
Order by a.Name;

select TOP 76 a.Name, g.Name, ge.Name  
from Author a
INNER JOIN Grade g ON a.GradeId = g.Id
Inner JOIN Gender ge ON a.GenderId = ge.Id
Order by a.Name;

select SUM(WordCount) as TotalWords from Poem;

Select TOP 1 CharCount from Poem
order by CharCount;

SELECT COUNT(a.Id) from Author a
INNER JOIN Grade g ON a.GradeId = g.Id
where g.Name = '3rd Grade';

SELECT COUNT(a.Id) from Author a
INNER JOIN Grade g ON a.GradeId = g.Id
where g.Name = '3rd Grade' OR g.Name = '2nd Grade' OR g.Name = '1st Grade';

SELECT COUNT(p.id) from Poem p
INNER JOIN Author a ON p.AuthorId = A.Id
INNER JOIN Grade g ON g.Id = A.GradeId
where g.Name = '4th Grade';

SELECT COUNT(p.id) as AMOUNTWRITTEN, g.Name from Poem p
INNER JOIN Author a ON p.AuthorId = A.Id
INNER JOIN Grade g ON g.Id = A.GradeId
GROUP BY g.Name;

select TOP 1 CharCount, Title
FROM poem
ORDER BY CharCount DESC;

SELECT COUNT(p.Id), a.Id, MAX(a.Name) as People
from Poem p
INNER JOIN Author a on a.Id = p.AuthorId
GROUP BY a.Id
ORDER BY COUNT(a.Id) DESC;

SELECT COUNT(p.Id), e.Name
from Poem p
INNER JOIN PoemEmotion pm ON p.Id = pm.PoemId
INNER JOIN Emotion e ON e.Id = pm.EmotionId
GROUP BY e.Name;

SELECT COUNT(p.Id)
from Poem p
LEFT JOIN PoemEmotion pm ON p.Id = pm.PoemId
LEFT JOIN Emotion e ON e.Id = pm.EmotionId
where e.Name IS NULL;

SELECT COUNT(p.Id), e.Name
from Poem p
LEFT JOIN PoemEmotion pm ON p.Id = pm.PoemId
LEFT JOIN Emotion e ON e.Id = pm.EmotionId
GROUP BY e.Name
ORDER BY COUNT(p.Id);

SELECT TOP 1 COUNT(P.Id) as JoyCount, g.Name
From Emotion e 
INNER JOIN PoemEmotion pm ON pm.EmotionId = e.Id
INNER JOIN  Poem p ON p.Id = pm.PoemId
INNER JOIN Author a ON a.Id	= p.AuthorId
INNER JOIN Grade g ON g.Id = a.GradeId
where e.Id = 4
GROUP BY g.Name
ORDER BY COUNT(P.Id) DESC;

SELECT COUNT(P.Id) as FearCount, g.Name
From Emotion e 
INNER JOIN PoemEmotion pm ON pm.EmotionId = e.Id
INNER JOIN  Poem p ON p.Id = pm.PoemId
INNER JOIN Author a ON a.Id	= p.AuthorId
INNER JOIN Gender g ON g.Id = a.GenderId
where e.Id = 2
GROUP BY g.Name
ORDER BY COUNT(P.Id);
