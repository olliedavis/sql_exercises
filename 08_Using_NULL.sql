
-- teacher
-- id	dept	name	phone	mobile
-- 101	1	Shrivell	2753	07986 555 1234
-- 102	1	Throd	2754	07122 555 1920
-- 103	1	Splint	2293	
-- 104		Spiregrain	3287	
-- 105	2	Cutflower	3212	07996 555 6574
-- 106		Deadyawn	3345	
-- ...
-- dept
-- id	name
-- 1	Computing
-- 2	Design
-- 3	Engineering
-- ...

-- 1.
-- List the teachers who have NULL for their department.

SELECT name
  FROM teacher
 WHERE dept IS NULL

-- 2
-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

    SELECT teacher.name, dept.name
      FROM teacher 
INNER JOIN dept ON teacher.dept = dept.id

-- 3
-- Use a different JOIN so that all teachers are listed.

   SELECT teacher.name, dept.name
     FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id