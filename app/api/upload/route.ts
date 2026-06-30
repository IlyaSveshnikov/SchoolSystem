import { NextRequest, NextResponse } from "next/server"
import path from "path"
import { handle, HttpError } from "@/lib/api"

const MAX_SIZE = 5 * 1024 * 1024 // 5 МБ
const ALLOWED = new Set([".png", ".jpg", ".jpeg", ".webp", ".gif"])

export async function POST(req: NextRequest) {
  return handle(async () => {
    const formData = await req.formData()
    const file = formData.get("file")

    if (!(file instanceof File)) {
      throw new HttpError(400, "Файл не передан.")
    }
    if (!file.type.startsWith("image/")) {
      throw new HttpError(400, "Можно загружать только изображения.")
    }
    if (file.size > MAX_SIZE) {
      throw new HttpError(400, "Файл слишком большой (максимум 5 МБ).")
    }

    const ext = (path.extname(file.name) || ".png").toLowerCase()
    if (!ALLOWED.has(ext)) {
      throw new HttpError(400, "Недопустимый формат файла.")
    }

    const fileName = `${Date.now()}-${Math.random().toString(36).slice(2, 8)}${ext}`

    // Прод/облако: загрузка в Vercel Blob
    if (process.env.BLOB_READ_WRITE_TOKEN) {
      const { put } = await import("@vercel/blob")
      const blob = await put(`uploads/${fileName}`, file, { access: "public" })
      return NextResponse.json({ success: true, url: blob.url })
    }

    // На Vercel писать на диск нельзя — сообщаем понятно вместо падения mkdir
    if (process.env.VERCEL) {
      throw new HttpError(500, "Хранилище фото не настроено: добавьте Vercel Blob (BLOB_READ_WRITE_TOKEN) и сделайте redeploy.")
    }

    // Локально: сохраняем в public/uploads
    const { writeFile, mkdir } = await import("fs/promises")
    const bytes = Buffer.from(await file.arrayBuffer())
    const uploadDir = path.join(process.cwd(), "public", "uploads")
    await mkdir(uploadDir, { recursive: true })
    await writeFile(path.join(uploadDir, fileName), bytes)
    return NextResponse.json({ success: true, url: `/uploads/${fileName}` })
  })
}
