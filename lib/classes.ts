import { db } from "./db"

export interface SchoolClass {
  id_class: number
  name: string
  classroom: string | null
  student_count: number
}

// Сортировка по номеру параллели, затем по букве
const ORDER = "ORDER BY NULLIF(regexp_replace(name, '\\D', '', 'g'), '')::int, name"

export async function GetClasses(): Promise<SchoolClass[]> {
  const result = await db.query(`
    SELECT
      c.id_class,
      c.name,
      c.classroom,
      COUNT(st.id_student)::int AS student_count
    FROM classes c
    LEFT JOIN students st ON st.id_class = c.id_class
    GROUP BY c.id_class, c.name, c.classroom
    ${ORDER};
  `)
  return result.rows as SchoolClass[]
}

export async function AddClass(name: string, classroom: string): Promise<number> {
  const res = await db.query(
    "INSERT INTO classes (name, classroom) VALUES ($1, $2) RETURNING id_class",
    [name, classroom || null]
  )
  return res.rows[0].id_class
}

export async function UpdateClass(id_class: number, name: string, classroom: string) {
  await db.query(
    "UPDATE classes SET name = $1, classroom = $2 WHERE id_class = $3",
    [name, classroom || null, id_class]
  )
}

export async function DeleteClass(id_class: number) {
  await db.query("DELETE FROM classes WHERE id_class = $1", [id_class])
}
