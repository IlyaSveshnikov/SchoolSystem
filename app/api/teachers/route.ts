import { NextRequest, NextResponse } from "next/server"
import { z } from "zod"
import { GetTeachers, AddTeacher, UpdateTeacher, DeleteTeacher } from "@/lib/teachers"
import { handle, parseBody } from "@/lib/api"

const baseSchema = z.object({
  full_name: z.string().trim().min(1, "Укажите ФИО учителя."),
  phone: z.string().optional().default(""),
  email: z.string().optional().default(""),
  birth_date: z.string().nullable().optional().default(null),
  education: z.string().optional().default(""),
  experience_years: z.number().nullable().optional().default(null),
  category: z.string().optional().default(""),
  photo_url: z.string().nullable().optional().default(null),
})

const putSchema = baseSchema.extend({ id_teacher: z.number() })
const idSchema = z.object({ id_teacher: z.number() })

export async function GET() {
  return handle(async () => NextResponse.json(await GetTeachers()))
}

export async function POST(req: NextRequest) {
  return handle(async () => {
    const t = await parseBody(req, baseSchema)
    const id_teacher = await AddTeacher(t.full_name, t.phone, t.email, t.birth_date, t.education, t.experience_years, t.category, t.photo_url)
    return NextResponse.json({ success: true, id_teacher })
  })
}

export async function PUT(req: NextRequest) {
  return handle(async () => {
    const t = await parseBody(req, putSchema)
    await UpdateTeacher(t.id_teacher, t.full_name, t.phone, t.email, t.birth_date, t.education, t.experience_years, t.category, t.photo_url)
    return NextResponse.json({ success: true })
  })
}

export async function DELETE(req: NextRequest) {
  return handle(async () => {
    const { id_teacher } = await parseBody(req, idSchema)
    await DeleteTeacher(id_teacher)
    return NextResponse.json({ success: true })
  })
}
