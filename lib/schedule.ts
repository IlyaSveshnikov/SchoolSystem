import { db } from "./db"

// Строка расписания конкретного класса
export interface ScheduleRow {
  id: number;
  day_of_week: string;
  lesson_number: number;
  subject: string;
  classroom: string;
  teacher: string;
}

// className — ключ класса вида "5_1" (номер_буква). Всё расписание хранится
// в единой таблице schedule, классы различаются колонкой class_key.
export async function GetSchedule(className: string): Promise<ScheduleRow[]> {
  const query = `
    SELECT id, day_of_week, lesson_number, subject, classroom, teacher
    FROM schedule
    WHERE class_key = $1
    ORDER BY
      array_position(
        ARRAY['Понедельник','Вторник','Среда','Четверг','Пятница'],
        day_of_week::text
      ),
      lesson_number
  `;
  const result = await db.query(query, [className]);
  return result.rows as ScheduleRow[];
}

export async function UpdateLesson(className: string, day: string, lessonNum: number, subject: string, classroom: string, teacher: string): Promise<void> {
  const updateRes = await db.query(
    `
      UPDATE schedule
      SET subject = $1, classroom = $2, teacher = $3
      WHERE class_key = $4 AND day_of_week = $5 AND lesson_number = $6
    `,
    [subject, classroom, teacher, className, day, lessonNum]
  );

  if (updateRes.rowCount === 0) {
    await db.query(
      `
        INSERT INTO schedule
          (class_key, day_of_week, lesson_number, subject, classroom, teacher)
        VALUES ($1, $2, $3, $4, $5, $6)
      `,
      [className, day, lessonNum, subject, classroom, teacher]
    );
  }
}

export async function DeleteLesson(className: string, day: string, lessonNum: number): Promise<void> {
  await db.query(
    `
      DELETE FROM schedule
      WHERE class_key = $1 AND day_of_week = $2 AND lesson_number = $3
    `,
    [className, day, lessonNum]
  );
}
