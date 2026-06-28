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

import { useEffect, useState } from "react";

import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { PhotoInput } from "@/components/photo-input";
import { Save, Trash2 } from "lucide-react";
import { toast } from "sonner";
import type { Student } from "@/lib/students";
import type { SchoolClass } from "@/lib/classes";

type Props = {
  open: boolean
  student: Student | null
  onClose: () => void
}

export function AlertEditStudent({ open, student, onClose }: Props) {

  const [classes, setClasses] = useState<SchoolClass[]>([]);
  useEffect(() => {
    async function fetchClasses() {
      const res = await fetch("/api/classes");
      const data = await res.json();
      setClasses(data);
    }
    if (open) fetchClasses();
  }, [open]);

  // Инициализация из пропса; компонент перемонтируется по key при смене ученика.
  const [fullName, setFullName] = useState(student?.full_name ?? "")
  const [classId, setClassId] = useState<number>(student?.id_class ?? 0)
  const [birthDate, setBirthDate] = useState(student?.birth_date ?? "")
  const [gender, setGender] = useState(student?.gender ?? "")
  const [parentName, setParentName] = useState(student?.parent_name ?? "")
  const [parentPhone, setParentPhone] = useState(student?.parent_phone ?? "")
  const [photoUrl, setPhotoUrl] = useState(student?.photo_url ?? "")

  async function handleSave() {
    if (!student) return
    await fetch("/api/students", {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        id_student: student.id_student,
        full_name: fullName,
        id_class: classId,
        birth_date: birthDate || null,
        gender,
        parent_name: parentName,
        parent_phone: parentPhone,
        photo_url: photoUrl || null,
      }),
    })
    toast.success("Изменения сохранены.")
    onClose()
  }

  async function handleDelete() {
    if (!student) return
    if (!confirm(`Удалить ученика «${student.full_name}»?`)) return
    const res = await fetch("/api/students", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ id_student: student.id_student }),
    })
    const data = await res.json()
    if (!data.success) {
      toast.error(data.message ?? "Не удалось удалить ученика.")
      return
    }
    toast.success("Ученик удалён.")
    onClose()
  }

  const selectClass =
    "h-9 w-full rounded-md border border-input bg-transparent px-3 text-sm shadow-xs outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"

  return (
    <AlertDialog open={open} onOpenChange={open => !open && onClose()}>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Редактирование данных ученика</AlertDialogTitle>
          <AlertDialogDescription asChild>
           <div>
            <div className="mb-2"><PhotoInput value={photoUrl} onChange={setPhotoUrl} /></div>
            <div className="mt-1 mb-1">ФИО:</div>
            <Input value={fullName} onChange={e => setFullName(e.target.value)} />
            <div className="grid grid-cols-2 gap-3">
              <div>
                <div className="mt-3 mb-1">Класс:</div>
                <select className={selectClass} value={classId} onChange={e => setClassId(Number(e.target.value))}>
                  {classes.map(c => (
                    <option key={c.id_class} value={c.id_class}>{c.name}</option>
                  ))}
                </select>
              </div>
              <div>
                <div className="mt-3 mb-1">Пол:</div>
                <select className={selectClass} value={gender} onChange={e => setGender(e.target.value)}>
                  <option value="">—</option>
                  <option value="М">М</option>
                  <option value="Ж">Ж</option>
                </select>
              </div>
            </div>
            <div className="mt-3 mb-1">Дата рождения:</div>
            <Input type="date" value={birthDate} onChange={e => setBirthDate(e.target.value)} />
            <div className="mt-3 mb-1">Родитель (ФИО):</div>
            <Input value={parentName} onChange={e => setParentName(e.target.value)} />
            <div className="mt-3 mb-1">Телефон родителя:</div>
            <Input value={parentPhone} onChange={e => setParentPhone(e.target.value)} />
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
