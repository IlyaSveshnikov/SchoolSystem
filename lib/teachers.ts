import { db } from "./db"

export interface Teacher {
  id_teacher: number
  full_name: string
  phone: string | null
  email: string | null
  birth_date: string | null
  education: string | null
  experience_years: number | null
  category: string | null
  photo_url: string | null
}

export async function GetTeachers(): Promise<Teacher[]> {
  const result = await db.query(`
    SELECT id_teacher, full_name, phone, email,
           to_char(birth_date, 'YYYY-MM-DD') AS birth_date,
           education, experience_years, category, photo_url
    FROM teachers
    ORDER BY full_name;
  `)
  return result.rows as Teacher[]
}

export async function AddTeacher(
  full_name: string,
  phone: string,
  email: string,
  birth_date: string | null,
  education: string,
  experience_years: number | null,
  category: string,
  photo_url: string | null
): Promise<number> {
  const res = await db.query(
    `INSERT INTO teachers (full_name, phone, email, birth_date, education, experience_years, category, photo_url)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
     RETURNING id_teacher`,
    [full_name, phone, email, birth_date || null, education, experience_years, category, photo_url || null]
  )
  return res.rows[0].id_teacher
}

export async function DeleteTeacher(id_teacher: number) {
  await db.query("DELETE FROM teachers WHERE id_teacher = $1", [id_teacher])
}

export async function UpdateTeacher(
  id_teacher: number,
  full_name: string,
  phone: string,
  email: string,
  birth_date: string | null,
  education: string,
  experience_years: number | null,
  category: string,
  photo_url: string | null
) {
  await db.query(
    `UPDATE teachers
     SET full_name = $1, phone = $2, email = $3,
         birth_date = $4, education = $5, experience_years = $6, category = $7, photo_url = $8
     WHERE id_teacher = $9`,
    [full_name, phone, email, birth_date || null, education, experience_years, category, photo_url || null, id_teacher]
  )
}
