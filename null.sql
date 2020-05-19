-- NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN
--1
SELECT name
FROM teacher
WHERE dept IS NULL
--2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
 ON (teacher.dept=dept.id)

--Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON (teacher.dept = dept.id)
--Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON (teacher.dept = dept.id)
--Using the COALESCE function
SELECT name,
COALESCE(mobile, '07986 444 2266')
FROM teacher
--Use the string 'None' where there is no department.
SELECT teacher.name,
COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept ON (teacher.dept = dept.id)
--Use COUNT to show the number of teachers and the number of mobile phones.
SELECT
COUNT(name),
COUNT(mobile)
FROM teacher
--8
SELECT dept.name,
COUNT(teacher.name)
FROM dept
LEFT JOIN teacher ON (dept.id = teacher.dept)
GROUP BY dept.name

--9
SELECT teacher.name,
  CASE
    WHEN dept = 1
    OR dept = 2 THEN 'Sci'
    ELSE 'Art'
  END
FROM teacher
