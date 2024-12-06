use hogwarts;
SELECT DISTINCT
              u.id,
                u.name,
                u.last_names,
                u.phone,
                u.email,
                u.username,
                u.image,
                u.role_id,
                s.active
            FROM 
                student_teacher_relations ts
            JOIN 
                students s ON ts.students_id = s.id
            JOIN 
                users u ON s.id = u.id
            WHERE 
                ts.teachers_id = 10;
          
