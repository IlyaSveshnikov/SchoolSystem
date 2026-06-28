import { NextRequest, NextResponse } from 'next/server'
import { z } from "zod"
import { DeleteLesson, GetSchedule, UpdateLesson } from '@/lib/schedule'
import { handle, parseBody } from "@/lib/api"

const getSchema = z.object({ className: z.string().min(1) })

const putSchema = z.object({
  className: z.string().min(1),
  day: z.string().min(1),
  lessonNum: z.number(),
  subject: z.string(),
  classroom: z.string(),
  teacher: z.string(),
})

const deleteSchema = z.object({
  className: z.string().min(1),
  day: z.string().min(1),
  lessonNum: z.number(),
})

export async function POST(req: NextRequest) {
  return handle(async () => {
    const { className } = await parseBody(req, getSchema)
    const schedule = await GetSchedule(className)
    return NextResponse.json({ success: true, data: schedule })
  })
}

export async function PUT(req: NextRequest) {
  return handle(async () => {
    const { className, day, lessonNum, subject, classroom, teacher } = await parseBody(req, putSchema)
    await UpdateLesson(className, day, lessonNum, subject, classroom, teacher)
    return NextResponse.json({ success: true, message: 'Урок успешно обновлен.' })
  })
}

export async function DELETE(req: NextRequest) {
  return handle(async () => {
    const { className, day, lessonNum } = await parseBody(req, deleteSchema)
    await DeleteLesson(className, day, lessonNum)
    return NextResponse.json({ success: true, message: 'Урок успешно удален.' })
  })
}
