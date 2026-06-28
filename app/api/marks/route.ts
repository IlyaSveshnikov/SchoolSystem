import { NextRequest, NextResponse } from "next/server"
import { z } from "zod"
import { GetMarksByStudent, AddMark, DeleteMark } from "@/lib/marks"
import { handle, parseBody, HttpError } from "@/lib/api"

export async function GET(req: NextRequest) {
  return handle(async () => {
    const idParam = req.nextUrl.searchParams.get("student")
    const id_student = Number(idParam)
    if (!idParam || Number.isNaN(id_student)) {
      throw new HttpError(400, "Не указан ученик.")
    }
    return NextResponse.json(await GetMarksByStudent(id_student))
  })
}

const addSchema = z.object({
  id_student: z.number(),
  id_subject: z.number({ message: "Выберите предмет." }),
  term: z.number().int().min(1).max(4),
  mark: z.number().int().min(2).max(5),
  mark_date: z.string().nullable().optional().default(null),
})

const idSchema = z.object({ id_mark: z.number() })

export async function POST(req: NextRequest) {
  return handle(async () => {
    const m = await parseBody(req, addSchema)
    const id_mark = await AddMark(m.id_student, m.id_subject, m.term, m.mark, m.mark_date)
    return NextResponse.json({ success: true, id_mark })
  })
}

export async function DELETE(req: NextRequest) {
  return handle(async () => {
    const { id_mark } = await parseBody(req, idSchema)
    await DeleteMark(id_mark)
    return NextResponse.json({ success: true })
  })
}
