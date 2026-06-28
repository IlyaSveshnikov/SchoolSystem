"use client"

import { useEffect, useState } from "react"
import Link from "next/link"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"
import { Users, GraduationCap, LibraryBig, DoorOpen, Calendar, ChartColumnBig, School, ArrowRight } from "lucide-react"

type Totals = { students: number; teachers: number; subjects: number; classes: number; marks: number }

const SECTIONS = [
  { title: "Предметы", desc: "Учебные курсы и преподаватели", url: "/subjects", icon: LibraryBig, grad: "from-violet-500 to-purple-600" },
  { title: "Учителя", desc: "Преподавательский состав", url: "/teachers", icon: Users, grad: "from-sky-500 to-blue-600" },
  { title: "Ученики", desc: "Список учащихся и оценки", url: "/students", icon: GraduationCap, grad: "from-indigo-500 to-violet-600" },
  { title: "Классы", desc: "Параллели и кабинеты", url: "/classes", icon: DoorOpen, grad: "from-teal-500 to-emerald-600" },
  { title: "Расписание", desc: "Сетка уроков по классам", url: "/schedule", icon: Calendar, grad: "from-amber-500 to-orange-600" },
  { title: "Аналитика", desc: "Метрики и успеваемость", url: "/analytics", icon: ChartColumnBig, grad: "from-fuchsia-500 to-pink-600" },
]

export default function Home() {
  const [totals, setTotals] = useState<Totals | null>(null)

  useEffect(() => {
    fetch("/api/analytics").then(r => r.json()).then(d => setTotals(d.totals)).catch(() => setTotals(null))
  }, [])

  const metrics = [
    { label: "Ученики", value: totals?.students, icon: GraduationCap, grad: "from-indigo-500 to-violet-600" },
    { label: "Учителя", value: totals?.teachers, icon: Users, grad: "from-sky-500 to-blue-600" },
    { label: "Классы", value: totals?.classes, icon: DoorOpen, grad: "from-teal-500 to-emerald-600" },
    { label: "Предметы", value: totals?.subjects, icon: LibraryBig, grad: "from-violet-500 to-purple-600" },
  ]

  return (
    <div className="p-2 flex flex-col gap-8">
      {/* Hero */}
      <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-indigo-600 via-violet-600 to-fuchsia-600 p-8 md:p-10 text-white shadow-xl">
        {/* световые блики */}
        <div className="pointer-events-none absolute -top-24 -right-16 h-64 w-64 rounded-full bg-white/20 blur-3xl" />
        <div className="pointer-events-none absolute -bottom-28 -left-10 h-64 w-64 rounded-full bg-fuchsia-300/20 blur-3xl" />
        {/* сетка */}
        <div
          className="pointer-events-none absolute inset-0 opacity-[0.12]"
          style={{
            backgroundImage:
              "linear-gradient(to right, white 1px, transparent 1px), linear-gradient(to bottom, white 1px, transparent 1px)",
            backgroundSize: "32px 32px",
          }}
        />
        <div className="relative flex items-center gap-5">
          <div className="flex h-20 w-20 items-center justify-center rounded-2xl bg-white/15 ring-1 ring-white/30 backdrop-blur shrink-0">
            <School className="h-11 w-11" />
          </div>
          <div>
            <h1 className="text-3xl md:text-4xl font-bold tracking-tight">ЭИС «Школа»</h1>
            <p className="text-white/80 mt-1.5 max-w-xl">
              Единая панель управления школой: предметы, учителя, ученики, классы, расписание и аналитика.
            </p>
          </div>
        </div>
      </div>

      {/* Сводка */}
      <div className="grid gap-4 grid-cols-[repeat(auto-fit,minmax(180px,1fr))]">
        {metrics.map(({ label, value, icon: Icon, grad }) => (
          <Card key={label} className="relative overflow-hidden transition-all hover:-translate-y-0.5 hover:shadow-md">
            <div className={`pointer-events-none absolute -right-6 -top-6 h-20 w-20 rounded-full bg-gradient-to-br ${grad} opacity-10`} />
            <CardContent className="relative flex items-center gap-3 py-1">
              <div className={`flex h-12 w-12 items-center justify-center rounded-xl bg-gradient-to-br ${grad} text-white shadow-sm shrink-0`}>
                <Icon className="h-6 w-6" />
              </div>
              <div>
                <div className="text-3xl font-bold tabular-nums leading-none">{value ?? "—"}</div>
                <div className="text-sm text-muted-foreground mt-1">{label}</div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Быстрые ссылки */}
      <div>
        <p className="text-lg font-semibold mb-4">Разделы</p>
        <div className="grid gap-4 grid-cols-[repeat(auto-fill,minmax(240px,1fr))]">
          {SECTIONS.map(({ title, desc, url, icon: Icon, grad }) => (
            <Link key={url} href={url} className="group">
              <Card className="h-full transition-all hover:-translate-y-1 hover:shadow-lg hover:border-primary/40">
                <CardHeader>
                  <div className="flex items-center gap-3">
                    <div className={`flex h-11 w-11 items-center justify-center rounded-xl bg-gradient-to-br ${grad} text-white shadow-sm shrink-0`}>
                      <Icon className="h-5 w-5" />
                    </div>
                    <CardTitle className="text-base flex-1">{title}</CardTitle>
                    <ArrowRight className="h-4 w-4 text-muted-foreground transition-transform group-hover:translate-x-1 group-hover:text-primary" />
                  </div>
                  <p className="text-sm text-muted-foreground mt-2">{desc}</p>
                </CardHeader>
              </Card>
            </Link>
          ))}
        </div>
      </div>
    </div>
  )
}
