
--What grades are stored in the database?
select * from Grade;

select * from Poem;
--What emotions may be associated with a poem?
select * from Emotion;

SELECT * FROM Gender;
--How many poems are in the database?
select COUNT(Id) as PoemCount from Poem;
--Sort authors alphabetically by name. What are the names of the top 76 authors?
select TOP 76 Name from Author
Order by Name;
--Starting with the above query, add the grade of each of the authors.
select TOP 76 a.Name, g.Name  
from Author a
INNER JOIN Grade g ON a.GradeId = g.Id
Order by a.Name;
--Starting with the above query, add the recorded gender of each of the authors.
select TOP 76 a.Name, g.Name, ge.Name  
from Author a
INNER JOIN Grade g ON a.GradeId = g.Id
Inner JOIN Gender ge ON a.GenderId = ge.Id
Order by a.Name;
--What is the total number of words in all poems in the database?
select SUM(WordCount) as TotalWords from Poem;
--Which poem has the fewest characters?
Select TOP 1 CharCount from Poem
order by CharCount;
--How many authors are in the third grade?
SELECT COUNT(a.Id) from Author a
INNER JOIN Grade g ON a.GradeId = g.Id
where g.Name = '3rd Grade';
--How many total authors are in the first through third grades?
SELECT COUNT(a.Id) from Author a
INNER JOIN Grade g ON a.GradeId = g.Id
where g.Name = '3rd Grade' OR g.Name = '2nd Grade' OR g.Name = '1st Grade';
--What is the total number of poems written by fourth graders?
SELECT COUNT(p.id) from Poem p
INNER JOIN Author a ON p.AuthorId = A.Id
INNER JOIN Grade g ON g.Id = A.GradeId
where g.Name = '4th Grade';
--How many poems are there per grade?
SELECT COUNT(p.id) as AMOUNTWRITTEN, g.Name from Poem p
INNER JOIN Author a ON p.AuthorId = A.Id
INNER JOIN Grade g ON g.Id = A.GradeId
GROUP BY g.Name;
--What is the title of the poem that has the most words?
select TOP 1 CharCount, Title
FROM poem
ORDER BY CharCount DESC;
--Which author(s) have the most poems? (Remember authors can have the same name.)
SELECT COUNT(p.Id), a.Id, MAX(a.Name) as People
from Poem p
INNER JOIN Author a on a.Id = p.AuthorId
GROUP BY a.Id
ORDER BY COUNT(a.Id) DESC;
--How many poems have an emotion of sadness?
SELECT COUNT(p.Id), e.Name
from Poem p
INNER JOIN PoemEmotion pm ON p.Id = pm.PoemId
INNER JOIN Emotion e ON e.Id = pm.EmotionId
GROUP BY e.Name;
--How many poems are not associated with any emotion?
SELECT COUNT(p.Id)
from Poem p
LEFT JOIN PoemEmotion pm ON p.Id = pm.PoemId
LEFT JOIN Emotion e ON e.Id = pm.EmotionId
where e.Name IS NULL;
--Which emotion is associated with the least number of poems?
SELECT COUNT(p.Id), e.Name
from Poem p
LEFT JOIN PoemEmotion pm ON p.Id = pm.PoemId
LEFT JOIN Emotion e ON e.Id = pm.EmotionId
GROUP BY e.Name
ORDER BY COUNT(p.Id);
--Which grade has the largest number of poems with an emotion of joy?
SELECT TOP 1 COUNT(P.Id) as JoyCount, g.Name
From Emotion e 
INNER JOIN PoemEmotion pm ON pm.EmotionId = e.Id
INNER JOIN  Poem p ON p.Id = pm.PoemId
INNER JOIN Author a ON a.Id	= p.AuthorId
INNER JOIN Grade g ON g.Id = a.GradeId
where e.Id = 4
GROUP BY g.Name
ORDER BY COUNT(P.Id) DESC;
--Which gender has the least number of poems with an emotion of fear?
SELECT COUNT(P.Id) as FearCount, g.Name
From Emotion e 
INNER JOIN PoemEmotion pm ON pm.EmotionId = e.Id
INNER JOIN  Poem p ON p.Id = pm.PoemId
INNER JOIN Author a ON a.Id	= p.AuthorId
INNER JOIN Gender g ON g.Id = a.GenderId
where e.Id = 2
GROUP BY g.Name
ORDER BY COUNT(P.Id);

--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
SELECT COUNT(a.ID), g.Name
from Grade g
INNER JOIN Author a ON g.Id = a.GradeId
GROUP BY g.Name
ORDER BY g.Name;
