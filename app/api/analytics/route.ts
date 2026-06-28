import { NextResponse } from "next/server"
import { GetAnalytics } from "@/lib/marks"
import { handle } from "@/lib/api"

export async function GET() {
  return handle(async () => NextResponse.json(await GetAnalytics()))
}
