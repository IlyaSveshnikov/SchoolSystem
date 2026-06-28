import { NextRequest, NextResponse } from "next/server"

export function proxy(req: NextRequest) {
  const authed = req.cookies.get("session")?.value === process.env.AUTH_SECRET
  if (authed) return NextResponse.next()

  const { pathname } = req.nextUrl
  // Неавторизованным API отвечаем 401, страницы — редирект на /login
  if (pathname.startsWith("/api")) {
    return NextResponse.json({ success: false, message: "Требуется авторизация." }, { status: 401 })
  }
  const url = req.nextUrl.clone()
  url.pathname = "/login"
  return NextResponse.redirect(url)
}

export const config = {
  // Защищаем всё, кроме страницы входа, эндпоинтов авторизации, статики и загруженных фото
  matcher: ["/((?!login|api/auth|_next/static|_next/image|favicon.ico|uploads).*)"],
}
