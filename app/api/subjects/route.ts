import { NextRequest, NextResponse } from "next/server"
import { z } from "zod"
import { GetSubjects, AddSubject, UpdateSubject, DeleteSubject, SubjectNameExists } from "@/lib/subjects"
import { handle, parseBody, HttpError } from "@/lib/api"

const addSchema = z.object({
  name: z.string().trim().min(1, "Укажите название предмета."),
  teacherIds: z.array(z.number()).default([]),
  description: z.string().optional().default(""),
})

const putSchema = addSchema.extend({ id_subject: z.number() })
const idSchema = z.object({ id_subject: z.number() })

export async function GET() {
  return handle(async () => NextResponse.json(await GetSubjects()))
}

export async function POST(req: NextRequest) {
  return handle(async () => {
    const { name, teacherIds, description } = await parseBody(req, addSchema)
    if (await SubjectNameExists(name)) {
      throw new HttpError(409, "Предмет с таким названием уже существует.")
    }
    await AddSubject(name, teacherIds, description)
    return NextResponse.json({ success: true })
  })
}

export async function PUT(req: NextRequest) {
  return handle(async () => {
    const { id_subject, name, teacherIds, description } = await parseBody(req, putSchema)
    if (await SubjectNameExists(name, id_subject)) {
      throw new HttpError(409, "Предмет с таким названием уже существует.")
    }
    await UpdateSubject(id_subject, name, teacherIds, description)
    return NextResponse.json({ success: true })
  })
}

export async function DELETE(req: NextRequest) {
  return handle(async () => {
    const { id_subject } = await parseBody(req, idSchema)
    await DeleteSubject(id_subject)
    return NextResponse.json({ success: true })
  })
}
