import { NextRequest, NextResponse } from "next/server"
import { z } from "zod"
import { GetStudents, AddStudent, UpdateStudent, DeleteStudent } from "@/lib/students"
import { handle, parseBody } from "@/lib/api"

const baseSchema = z.object({
  full_name: z.string().trim().min(1, "Укажите ФИО ученика."),
  id_class: z.number({ message: "Выберите класс." }).int().positive("Выберите класс."),
  birth_date: z.string().nullable().optional().default(null),
  gender: z.string().optional().default(""),
  parent_name: z.string().optional().default(""),
  parent_phone: z.string().optional().default(""),
  photo_url: z.string().nullable().optional().default(null),
})

const putSchema = baseSchema.extend({ id_student: z.number() })
const idSchema = z.object({ id_student: z.number() })

export async function GET() {
  return handle(async () => NextResponse.json(await GetStudents()))
}

export async function POST(req: NextRequest) {
  return handle(async () => {
    const s = await parseBody(req, baseSchema)
    const id_student = await AddStudent(s.full_name, s.id_class, s.birth_date, s.gender, s.parent_name, s.parent_phone, s.photo_url)
    return NextResponse.json({ success: true, id_student })
  })
}

export async function PUT(req: NextRequest) {
  return handle(async () => {
    const s = await parseBody(req, putSchema)
    await UpdateStudent(s.id_student, s.full_name, s.id_class, s.birth_date, s.gender, s.parent_name, s.parent_phone, s.photo_url)
    return NextResponse.json({ success: true })
  })
}

export async function DELETE(req: NextRequest) {
  return handle(async () => {
    const { id_student } = await parseBody(req, idSchema)
    await DeleteStudent(id_student)
    return NextResponse.json({ success: true })
  })
}
