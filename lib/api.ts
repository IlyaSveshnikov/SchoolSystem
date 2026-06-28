import { NextResponse } from "next/server"
import { ZodError, type ZodType } from "zod"

// Ошибка с явным HTTP-статусом, которую безопасно показать клиенту
export class HttpError extends Error {
  constructor(public status: number, message: string) {
    super(message)
  }
}

// Разбор и валидация тела запроса по zod-схеме
export async function parseBody<T>(req: Request, schema: ZodType<T>): Promise<T> {
  const json = await req.json().catch(() => {
    throw new HttpError(400, "Ожидается корректный JSON.")
  })
  const result = schema.safeParse(json)
  if (!result.success) {
    throw new HttpError(400, result.error.issues[0]?.message ?? "Некорректные данные.")
  }
  return result.data
}

// Единая обёртка обработчиков API: централизует обработку ошибок
export async function handle(fn: () => Promise<NextResponse>): Promise<NextResponse> {
  try {
    return await fn()
  } catch (e: unknown) {
    if (e instanceof HttpError) {
      return NextResponse.json({ success: false, message: e.message }, { status: e.status })
    }
    if (e instanceof ZodError) {
      return NextResponse.json(
        { success: false, message: e.issues[0]?.message ?? "Некорректные данные." },
        { status: 400 }
      )
    }
    const code = (e as { code?: string })?.code
    if (code === "23505") {
      return NextResponse.json({ success: false, message: "Запись с такими данными уже существует." }, { status: 409 })
    }
    if (code === "23503") {
      return NextResponse.json({ success: false, message: "Нельзя выполнить: есть связанные записи." }, { status: 409 })
    }
    console.error("API error:", e)
    return NextResponse.json({ success: false, message: "Внутренняя ошибка сервера." }, { status: 500 })
  }
}
