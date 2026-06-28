"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { School, LogIn, Loader2 } from "lucide-react"

export default function Login() {
  const router = useRouter()
  const [username, setUsername] = useState("")
  const [password, setPassword] = useState("")
  const [error, setError] = useState("")
  const [loading, setLoading] = useState(false)

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError("")
    setLoading(true)
    try {
      const res = await fetch("/api/auth/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username, password }),
      })
      const data = await res.json()
      if (data.success) {
        router.replace("/")
        router.refresh()
      } else {
        setError(data.message ?? "Ошибка входа.")
      }
    } catch {
      setError("Ошибка сети.")
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center p-4 bg-muted/30">
      <Card className="w-full max-w-sm">
        <CardHeader className="text-center">
          <div className="mx-auto flex h-14 w-14 items-center justify-center rounded-2xl bg-primary text-primary-foreground mb-2">
            <School className="h-7 w-7" />
          </div>
          <CardTitle className="text-xl">Вход в ЭИС «Школа»</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit} className="flex flex-col gap-3">
            <div>
              <div className="mb-1 text-sm">Логин</div>
              <Input value={username} onChange={e => setUsername(e.target.value)} autoFocus />
            </div>
            <div>
              <div className="mb-1 text-sm">Пароль</div>
              <Input type="password" value={password} onChange={e => setPassword(e.target.value)} />
            </div>
            {error && <p className="text-sm text-destructive">{error}</p>}
            <Button type="submit" className="mt-1" disabled={loading}>
              {loading ? <Loader2 className="animate-spin" /> : <LogIn />} Войти
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}
