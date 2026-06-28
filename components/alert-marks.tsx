"use client"

import {
  AlertDialog,
  AlertDialogContent,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogCancel,
} from "@/components/ui/alert-dialog"

import { useEffect, useState, useCallback } from "react";

import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Plus, Trash2 } from "lucide-react";
import { toast } from "sonner";
import { markColor } from "@/lib/utils";
import type { Student } from "@/lib/students";
import type { Mark } from "@/lib/marks";

type SubjectOption = { id_subject: number; name: string }

type Props = {
  open: boolean
  student: Student | null
  onClose: () => void
}

export function AlertMarks({ open, student, onClose }: Props) {
  const [marks, setMarks] = useState<Mark[]>([])
  const [subjects, setSubjects] = useState<SubjectOption[]>([])

  const [subjectId, setSubjectId] = useState<number>(0)
  const [term, setTerm] = useState<number>(1)
  const [mark, setMark] = useState<number>(5)
  const [date, setDate] = useState("")

  const loadMarks = useCallback(async () => {
    if (!student) return
    const res = await fetch(`/api/marks?student=${student.id_student}`)
    setMarks(await res.json())
  }, [student])

  useEffect(() => {
    if (!open || !student) return
    let active = true
    ;(async () => {
      const [marksRes, subjRes] = await Promise.all([
        fetch(`/api/marks?student=${student.id_student}`),
        fetch("/api/subjects"),
      ])
      const marksData = await marksRes.json()
      const subjData: SubjectOption[] = await subjRes.json()
      if (!active) return
      setMarks(marksData)
      setSubjects(subjData)
      setSubjectId(prev => prev || (subjData[0]?.id_subject ?? 0))
    })()
    return () => { active = false }
  }, [open, student])

  async function addMark() {
    if (!student || !subjectId) return
    await fetch("/api/marks", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        id_student: student.id_student,
        id_subject: subjectId,
        term,
        mark,
        mark_date: date || null,
      }),
    })
    setDate("")
    toast.success("Оценка добавлена.")
    loadMarks()
  }

  async function removeMark(id_mark: number) {
    await fetch("/api/marks", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ id_mark }),
    })
    toast.success("Оценка удалена.")
    loadMarks()
  }

  const selectClass =
    "h-9 rounded-md border border-input bg-transparent px-2 text-sm shadow-xs outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"

  return (
    <AlertDialog open={open} onOpenChange={o => !o && onClose()}>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Оценки — {student?.full_name}</AlertDialogTitle>
          <AlertDialogDescription asChild>
            <div>
              {/* Список оценок */}
              <div className="max-h-60 overflow-auto flex flex-col gap-1 mt-1">
                {marks.length === 0 ? (
                  <p className="text-sm text-muted-foreground">Оценок пока нет.</p>
                ) : marks.map(m => (
                  <div key={m.id_mark} className="flex items-center gap-2 text-sm border-b py-1">
                    <span className="flex-1 truncate">{m.subject_name}</span>
                    <span className="text-muted-foreground">{m.term} четв.</span>
                    <span className={"inline-flex h-6 w-6 items-center justify-center rounded-md font-bold " + markColor(m.mark)}>{m.mark}</span>
                    <span className="text-muted-foreground w-24 text-right">{m.mark_date ?? ""}</span>
                    <button onClick={() => removeMark(m.id_mark)} className="text-destructive hover:opacity-70">
                      <Trash2 className="h-4 w-4" />
                    </button>
                  </div>
                ))}
              </div>

              {/* Форма добавления */}
              <div className="mt-4 mb-1 font-medium text-foreground">Добавить оценку:</div>
              <div className="flex flex-wrap items-center gap-2">
                <select className={selectClass + " flex-1 min-w-32"} value={subjectId} onChange={e => setSubjectId(Number(e.target.value))}>
                  {subjects.map(s => <option key={s.id_subject} value={s.id_subject}>{s.name}</option>)}
                </select>
                <select className={selectClass} value={term} onChange={e => setTerm(Number(e.target.value))}>
                  {[1, 2, 3, 4].map(t => <option key={t} value={t}>{t} четв.</option>)}
                </select>
                <select className={selectClass} value={mark} onChange={e => setMark(Number(e.target.value))}>
                  {[2, 3, 4, 5].map(m => <option key={m} value={m}>{m}</option>)}
                </select>
                <Input type="date" value={date} onChange={e => setDate(e.target.value)} className="w-36 h-9" />
                <Button type="button" size="sm" onClick={addMark}><Plus /> Добавить</Button>
              </div>
            </div>
          </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter>
          <AlertDialogCancel>Закрыть</AlertDialogCancel>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  )
}
