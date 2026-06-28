import { db } from "./db"

export interface Student {
  id_student: number
  full_name: string
  id_class: number
  class_name: string
  birth_date: string | null
  gender: string | null
  parent_name: string | null
  parent_phone: string | null
  photo_url: string | null
}

export async function GetStudents(): Promise<Student[]> {
  const result = await db.query(`
    SELECT
      st.id_student,
      st.full_name,
      st.id_class,
      c.name AS class_name,
      to_char(st.birth_date, 'YYYY-MM-DD') AS birth_date,
      st.gender,
      st.parent_name,
      st.parent_phone,
      st.photo_url
    FROM students st
    JOIN classes c ON c.id_class = st.id_class
    ORDER BY c.name, st.full_name;
  `)
  return result.rows as Student[]
}

export async function AddStudent(
  full_name: string,
  id_class: number,
  birth_date: string | null,
  gender: string,
  parent_name: string,
  parent_phone: string,
  photo_url: string | null
): Promise<number> {
  const res = await db.query(
    `INSERT INTO students (full_name, id_class, birth_date, gender, parent_name, parent_phone, photo_url)
     VALUES ($1, $2, $3, $4, $5, $6, $7)
     RETURNING id_student`,
    [full_name, id_class, birth_date || null, gender, parent_name, parent_phone, photo_url || null]
  )
  return res.rows[0].id_student
}

export async function DeleteStudent(id_student: number) {
  await db.query("DELETE FROM students WHERE id_student = $1", [id_student])
}

export async function UpdateStudent(
  id_student: number,
  full_name: string,
  id_class: number,
  birth_date: string | null,
  gender: string,
  parent_name: string,
  parent_phone: string,
  photo_url: string | null
) {
  await db.query(
    `UPDATE students
     SET full_name = $1, id_class = $2, birth_date = $3,
         gender = $4, parent_name = $5, parent_phone = $6, photo_url = $7
     WHERE id_student = $8`,
    [full_name, id_class, birth_date || null, gender, parent_name, parent_phone, photo_url || null, id_student]
  )
}
