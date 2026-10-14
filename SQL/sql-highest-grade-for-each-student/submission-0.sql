SELECT student_id, exam_id, score
FROM (
    SELECT
        e.student_id,
        e.exam_id,
        e.score,
        ROW_NUMBER() OVER (
            PARTITION BY e.student_id
            ORDER BY e.score DESC, e.exam_id ASC
        ) AS rn
    FROM exam_results e
) ranked
WHERE rn = 1
ORDER BY student_id ASC;