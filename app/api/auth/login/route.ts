import { NextRequest, NextResponse } from "next/server"
import { z } from "zod"
import { handle, parseBody, HttpError } from "@/lib/api"

const schema = z.object({
  username: z.string(),
  password: z.string(),
})

export async function POST(req: NextRequest) {
  return handle(async () => {
    const { username, password } = await parseBody(req, schema)
    if (username !== process.env.ADMIN_USERNAME || password !== process.env.ADMIN_PASSWORD) {
      throw new HttpError(401, "Неверный логин или пароль.")
    }
    const res = NextResponse.json({ success: true })
    res.cookies.set("session", process.env.AUTH_SECRET ?? "", {
      httpOnly: true,
      sameSite: "lax",
      path: "/",
      maxAge: 60 * 60 * 24 * 7, // 7 дней
    })
    return res
  })
}
