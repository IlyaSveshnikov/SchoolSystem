import { db } from "./db"

export interface SubjectWithTeachers {
  id_subject: number
  name: string
  description: string | null
  teachers: { id_teacher: number; full_name: string }[]
}

// Список предметов вместе с ведущими их учителями
export async function GetSubjects(): Promise<SubjectWithTeachers[]> {
  const result = await db.query(`
    SELECT
      s.id_subject,
      s.name,
      s.description,
      t.id_teacher,
      t.full_name
    FROM subjects s
    LEFT JOIN teachersubjects ts ON ts.id_subject = s.id_subject
    LEFT JOIN teachers t ON t.id_teacher = ts.id_teacher
    ORDER BY s.id_subject, t.full_name;
  `)

  const map = new Map<number, SubjectWithTeachers>()
  for (const row of result.rows) {
    if (!map.has(row.id_subject)) {
      map.set(row.id_subject, { id_subject: row.id_subject, name: row.name, description: row.description, teachers: [] })
    }
    if (row.id_teacher != null) {
      map.get(row.id_subject)!.teachers.push({ id_teacher: row.id_teacher, full_name: row.full_name })
    }
  }
  return Array.from(map.values())
}

// Существует ли предмет с таким названием (без учёта регистра), исключая указанный id
export async function SubjectNameExists(name: string, excludeId = 0): Promise<boolean> {
  const r = await db.query(
    "SELECT 1 FROM subjects WHERE lower(name) = lower($1) AND id_subject <> $2 LIMIT 1",
    [name.trim(), excludeId]
  )
  return r.rows.length > 0
}

export async function AddSubject(name: string, teacherIds: number[], description: string) {
  const insertRes = await db.query(
    "INSERT INTO subjects (name, description) VALUES ($1, $2) RETURNING id_subject",
    [name, description]
  )
  const subjectId = insertRes.rows[0].id_subject

  for (const teacherId of teacherIds) {
    await db.query(
      "INSERT INTO teachersubjects (id_teacher, id_subject) VALUES ($1, $2)",
      [teacherId, subjectId]
    )
  }
}

export async function UpdateSubject(id_subject: number, name: string, teacherIds: number[], description: string) {
  await db.query("UPDATE subjects SET name = $1, description = $2 WHERE id_subject = $3", [name, description, id_subject])

  // Перезаписываем список учителей предмета
  await db.query("DELETE FROM teachersubjects WHERE id_subject = $1", [id_subject])
  for (const teacherId of teacherIds) {
    await db.query(
      "INSERT INTO teachersubjects (id_teacher, id_subject) VALUES ($1, $2)",
      [teacherId, id_subject]
    )
  }
}

export async function DeleteSubject(id_subject: number) {
  await db.query("DELETE FROM subjects WHERE id_subject = $1", [id_subject])
}
