-- Queries on online learning database

-- Find the students who have bought “Coursera” subscription and thus have free access to the 
--courses and certificates?


SELECT s.student_id,s.name||" "||s.surname as fullname,sub.subscription_type
FROM student s
INNER JOIN subscription sub
ON s.subscription_id=sub.subscription_id
WHERE sub.subscription_type="free access"
ORDER BY s.student_id;

-- Give the list students who have enrolled in more than one course?


SELECT s.name||" "||s.surname as student_name,COUNT(sc.course_id) as no_of_courses
FROM student s
INNER JOIN student_course sc
ON s.student_id=sc.student_id
GROUP BY sc.student_id
HAVING COUNT(sc.course_id)>1
ORDER BY COUNT(sc.course_id) DESC;

-- Female students with free access type of the subscription.


SELECT s.name||" "||s.surname as student_name,s.gender,sub.subscription_type FROM student s
INNER JOIN subscription sub
ON s.subscription_id=sub.subscription_id 
WHERE s.gender="F" AND sub.subscription_type="free access";

-- Students who are male and are in the field of study related to computers, and the DSA courses
-- they enrolled in.


SELECT s.name||" "||s.surname as student_name, s.field_of_study,s.gender,c.name
FROM student_course sc
INNER JOIN student s ON s.student_id=sc.student_id
INNER JOIN course c ON c.course_id=sc.course_id
WHERE s.gender="M" AND s.field_of_study LIKE "Computer%" AND c.name LIKE "DSA%";

-- Instructors who teach courses that have a rating greater than 4, along with the course names
-- ordered by course rating in ascending order.


SELECT i.name,i.surname,i.occupation,c.name as course_name,c.rating
FROM instructor i
INNER JOIN course c
ON i.instructor_id=c.instructor_id
WHERE c.rating>3
ORDER BY c.rating;