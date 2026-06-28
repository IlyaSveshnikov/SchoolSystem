"use client"

import { useEffect, useState } from "react"
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"
import { PageHeader } from "@/components/page-header"
import { Users, GraduationCap, LibraryBig, DoorOpen, ClipboardList, Loader2 } from "lucide-react"
import {
  ResponsiveContainer, BarChart, Bar, XAxis, YAxis, Tooltip, CartesianGrid, Cell,
} from "recharts"

type Analytics = {
  totals: { students: number; teachers: number; subjects: number; classes: number; marks: number }
  avgByClass: { name: string; avg: number }[]
  avgBySubject: { name: string; avg: number }[]
  distribution: { mark: number; count: number }[]
}

const ACCENT = "#6366f1"
const MARK_COLORS: Record<number, string> = { 2: "#ef4444", 3: "#f59e0b", 4: "#84cc16", 5: "#22c55e" }
const AXIS = "#9ca3af"

const METRICS = [
  { key: "students", label: "Ученики", icon: GraduationCap, color: "bg-indigo-500" },
  { key: "teachers", label: "Учителя", icon: Users, color: "bg-sky-500" },
  { key: "classes", label: "Классы", icon: DoorOpen, color: "bg-teal-500" },
  { key: "subjects", label: "Предметы", icon: LibraryBig, color: "bg-violet-500" },
  { key: "marks", label: "Оценки", icon: ClipboardList, color: "bg-amber-500" },
] as const

export default function Analytics() {
  const [data, setData] = useState<Analytics | null>(null)

  useEffect(() => {
    fetch("/api/analytics").then(r => r.json()).then(setData).catch(() => setData(null))
  }, [])

  if (!data) {
    return (
      <div className="flex h-60 items-center justify-center text-muted-foreground">
        <Loader2 className="h-6 w-6 animate-spin" />
      </div>
    )
  }

  return (
    <div className="p-2">
      <PageHeader title="Аналитика" />

      {/* Метрики */}
      <div className="grid gap-4 grid-cols-[repeat(auto-fit,minmax(150px,1fr))] mb-8">
        {METRICS.map(({ key, label, icon: Icon, color }) => (
          <Card key={key}>
            <CardContent className="flex items-center gap-3 py-1">
              <div className={`flex h-11 w-11 items-center justify-center rounded-lg text-white shrink-0 ${color}`}>
                <Icon className="h-5 w-5" />
              </div>
              <div>
                <div className="text-2xl font-bold tabular-nums leading-none">{data.totals[key]}</div>
                <div className="text-sm text-muted-foreground mt-1">{label}</div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      <div className="grid gap-6 lg:grid-cols-2">
        {/* Средний балл по классам */}
        <Card>
          <CardHeader><CardTitle>Средний балл по классам</CardTitle></CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={280}>
              <BarChart data={data.avgByClass} margin={{ top: 8, right: 8, left: -20, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke={AXIS} strokeOpacity={0.2} vertical={false} />
                <XAxis dataKey="name" tick={{ fontSize: 12, fill: AXIS }} />
                <YAxis domain={[0, 5]} tick={{ fontSize: 12, fill: AXIS }} />
                <Tooltip cursor={{ fill: AXIS, fillOpacity: 0.1 }} />
                <Bar dataKey="avg" name="Средний балл" fill={ACCENT} radius={[4, 4, 0, 0]} />
              </BarChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>

        {/* Распределение оценок */}
        <Card>
          <CardHeader><CardTitle>Распределение оценок</CardTitle></CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={280}>
              <BarChart data={data.distribution} margin={{ top: 8, right: 8, left: -20, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke={AXIS} strokeOpacity={0.2} vertical={false} />
                <XAxis dataKey="mark" tick={{ fontSize: 12, fill: AXIS }} />
                <YAxis tick={{ fontSize: 12, fill: AXIS }} />
                <Tooltip cursor={{ fill: AXIS, fillOpacity: 0.1 }} />
                <Bar dataKey="count" name="Количество" radius={[4, 4, 0, 0]}>
                  {data.distribution.map((d) => (
                    <Cell key={d.mark} fill={MARK_COLORS[d.mark] ?? ACCENT} />
                  ))}
                </Bar>
              </BarChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>

        {/* Средний балл по предметам */}
        <Card className="lg:col-span-2">
          <CardHeader><CardTitle>Средний балл по предметам</CardTitle></CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={Math.max(280, data.avgBySubject.length * 28)}>
              <BarChart data={data.avgBySubject} layout="vertical" margin={{ top: 0, right: 16, left: 40, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke={AXIS} strokeOpacity={0.2} horizontal={false} />
                <XAxis type="number" domain={[0, 5]} tick={{ fontSize: 12, fill: AXIS }} />
                <YAxis type="category" dataKey="name" width={120} tick={{ fontSize: 12, fill: AXIS }} />
                <Tooltip cursor={{ fill: AXIS, fillOpacity: 0.1 }} />
                <Bar dataKey="avg" name="Средний балл" fill={ACCENT} radius={[0, 4, 4, 0]} />
              </BarChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
