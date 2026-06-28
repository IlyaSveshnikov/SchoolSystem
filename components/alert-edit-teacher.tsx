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

import { useState } from "react";

import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { PhotoInput } from "@/components/photo-input";
import { Save, Trash2 } from "lucide-react";
import { toast } from "sonner";
import type { Teacher } from "@/lib/teachers";

type Props = {
  open: boolean
  teacher: Teacher | null
  onClose: () => void
}

const CATEGORIES = ["Высшая", "Первая", "Без категории"]

export function AlertEditTeacher({ open, teacher, onClose }: Props) {

  // Состояние инициализируется из пропса. Компонент перемонтируется по key
  // (см. страницу), поэтому при выборе другого учителя поля обновляются.
  const [fullName, setFullName] = useState(teacher?.full_name ?? "")
  const [phone, setPhone] = useState(teacher?.phone ?? "")
  const [email, setEmail] = useState(teacher?.email ?? "")
  const [birthDate, setBirthDate] = useState(teacher?.birth_date ?? "")
  const [education, setEducation] = useState(teacher?.education ?? "")
  const [experience, setExperience] = useState(teacher?.experience_years != null ? String(teacher.experience_years) : "")
  const [category, setCategory] = useState(teacher?.category ?? "")
  const [photoUrl, setPhotoUrl] = useState(teacher?.photo_url ?? "")

  async function handleSave() {
    if (!teacher) return
    await fetch("/api/teachers", {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        id_teacher: teacher.id_teacher,
        full_name: fullName,
        phone,
        email,
        birth_date: birthDate || null,
        education,
        experience_years: experience ? Number(experience) : null,
        category,
        photo_url: photoUrl || null,
      }),
    })
    toast.success("Изменения сохранены.")
    onClose()
  }

  async function handleDelete() {
    if (!teacher) return
    if (!confirm(`Удалить учителя «${teacher.full_name}»?`)) return
    const res = await fetch("/api/teachers", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ id_teacher: teacher.id_teacher }),
    })
    const data = await res.json()
    if (!data.success) {
      toast.error(data.message ?? "Не удалось удалить учителя.")
      return
    }
    toast.success("Учитель удалён.")
    onClose()
  }

  const selectClass =
    "h-9 w-full rounded-md border border-input bg-transparent px-3 text-sm shadow-xs outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"

  return (
    <AlertDialog open={open} onOpenChange={open => !open && onClose()}>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Редактирование данных учителя</AlertDialogTitle>
          <AlertDialogDescription asChild>
           <div>
            <div className="mb-2"><PhotoInput value={photoUrl} onChange={setPhotoUrl} /></div>
            <div className="mt-1 mb-1">ФИО:</div>
            <Input value={fullName} onChange={e => setFullName(e.target.value)} />
            <div className="grid grid-cols-2 gap-3">
              <div>
                <div className="mt-3 mb-1">Телефон:</div>
                <Input value={phone} onChange={e => setPhone(e.target.value)} />
              </div>
              <div>
                <div className="mt-3 mb-1">Дата рождения:</div>
                <Input type="date" value={birthDate} onChange={e => setBirthDate(e.target.value)} />
              </div>
            </div>
            <div className="mt-3 mb-1">Email:</div>
            <Input value={email} onChange={e => setEmail(e.target.value)} />
            <div className="mt-3 mb-1">Образование:</div>
            <Input value={education} onChange={e => setEducation(e.target.value)} />
            <div className="grid grid-cols-2 gap-3">
              <div>
                <div className="mt-3 mb-1">Стаж (лет):</div>
                <Input type="number" value={experience} onChange={e => setExperience(e.target.value)} />
              </div>
              <div>
                <div className="mt-3 mb-1">Категория:</div>
                <select className={selectClass} value={category} onChange={e => setCategory(e.target.value)}>
                  <option value="">— не указана —</option>
                  {CATEGORIES.map(c => <option key={c} value={c}>{c}</option>)}
                </select>
              </div>
            </div>
           </div>
          </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter className="sm:justify-between">
          <Button variant="destructive" onClick={handleDelete}>
            <Trash2 /> Удалить
          </Button>
          <div className="flex flex-col-reverse gap-2 sm:flex-row">
            <AlertDialogCancel>Отмена</AlertDialogCancel>
            <Button onClick={handleSave}>
              <Save /> Сохранить изменения
            </Button>
          </div>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  )
}
