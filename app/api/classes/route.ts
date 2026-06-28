import { NextRequest, NextResponse } from "next/server"
import { z } from "zod"
import { GetClasses, AddClass, UpdateClass, DeleteClass } from "@/lib/classes"
import { handle, parseBody } from "@/lib/api"

const baseSchema = z.object({
  name: z.string().trim().min(1, "Укажите название класса."),
  classroom: z.string().optional().default(""),
})

const putSchema = baseSchema.extend({ id_class: z.number() })
const idSchema = z.object({ id_class: z.number() })

export async function GET() {
  return handle(async () => NextResponse.json(await GetClasses()))
}

export async function POST(req: NextRequest) {
  return handle(async () => {
    const { name, classroom } = await parseBody(req, baseSchema)
    const id_class = await AddClass(name, classroom)
    return NextResponse.json({ success: true, id_class })
  })
}

export async function PUT(req: NextRequest) {
  return handle(async () => {
    const { id_class, name, classroom } = await parseBody(req, putSchema)
    await UpdateClass(id_class, name, classroom)
    return NextResponse.json({ success: true })
  })
}

export async function DELETE(req: NextRequest) {
  return handle(async () => {
    const { id_class } = await parseBody(req, idSchema)
    await DeleteClass(id_class)
    return NextResponse.json({ success: true })
  })
}
