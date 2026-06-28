import { db } from "./db"

export interface Mark {
  id_mark: number
  id_subject: number
  subject_name: string
  term: number
  mark: number
  mark_date: string | null
}

export async function GetMarksByStudent(id_student: number): Promise<Mark[]> {
  const result = await db.query(`
    SELECT
      m.id_mark, m.id_subject, s.name AS subject_name,
      m.term, m.mark, to_char(m.mark_date, 'YYYY-MM-DD') AS mark_date
    FROM marks m
    JOIN subjects s ON s.id_subject = m.id_subject
    WHERE m.id_student = $1
    ORDER BY s.name, m.term;
  `, [id_student])
  return result.rows as Mark[]
}

export async function AddMark(id_student: number, id_subject: number, term: number, mark: number, mark_date: string | null): Promise<number> {
  const res = await db.query(
    `INSERT INTO marks (id_student, id_subject, term, mark, mark_date)
     VALUES ($1, $2, $3, $4, $5) RETURNING id_mark`,
    [id_student, id_subject, term, mark, mark_date || null]
  )
  return res.rows[0].id_mark
}

export async function DeleteMark(id_mark: number) {
  await db.query("DELETE FROM marks WHERE id_mark = $1", [id_mark])
}

export interface Analytics {
  totals: { students: number; teachers: number; subjects: number; classes: number; marks: number }
  avgByClass: { name: string; avg: number }[]
  avgBySubject: { name: string; avg: number }[]
  distribution: { mark: number; count: number }[]
}

export async function GetAnalytics(): Promise<Analytics> {
  const totalsRes = await db.query(`
    SELECT
      (SELECT count(*) FROM students)::int AS students,
      (SELECT count(*) FROM teachers)::int AS teachers,
      (SELECT count(*) FROM subjects)::int AS subjects,
      (SELECT count(*) FROM classes)::int  AS classes,
      (SELECT count(*) FROM marks)::int    AS marks
  `)

  const avgByClass = await db.query(`
    SELECT c.name, round(avg(m.mark), 2)::float AS avg
    FROM marks m
    JOIN students st ON st.id_student = m.id_student
    JOIN classes c ON c.id_class = st.id_class
    GROUP BY c.name
    ORDER BY NULLIF(regexp_replace(c.name, '\\D', '', 'g'), '')::int, c.name;
  `)

  const avgBySubject = await db.query(`
    SELECT s.name, round(avg(m.mark), 2)::float AS avg
    FROM marks m
    JOIN subjects s ON s.id_subject = m.id_subject
    GROUP BY s.name
    ORDER BY avg DESC;
  `)

  const distribution = await db.query(`
    SELECT mark, count(*)::int AS count
    FROM marks
    GROUP BY mark
    ORDER BY mark;
  `)

  return {
    totals: totalsRes.rows[0],
    avgByClass: avgByClass.rows,
    avgBySubject: avgBySubject.rows,
    distribution: distribution.rows,
  }
}
