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
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { Checkbox } from "@/components/ui/checkbox";
import { Button } from "@/components/ui/button";
import { Trash2, Save } from "lucide-react";
import { toast } from "sonner";
import type { SubjectWithTeachers } from "@/lib/subjects";

type Teacher = {
  id_teacher: number
  full_name: string
}

type Props = {
  open: boolean
  subject: SubjectWithTeachers | null
  onClose: () => void
  existingNames: string[]
}

export function AlertEdit({ open, subject, onClose, existingNames }: Props) {

  const [teachers, setTeachers] = useState<Teacher[]>([]);
  useEffect(() => {
    async function fetchTeachers() {
      const res = await fetch("/api/teachers");
      const data = await res.json();
      setTeachers(data);
    }
    if (open) fetchTeachers();
  }, [open]);

  // Инициализация из пропса; компонент перемонтируется по key при смене предмета.
  const [subjectName, setSubjectName] = useState(subject?.name ?? "")
  const [description, setDescription] = useState(subject?.description ?? "")
  const [selectedTeachers, setSelectedTeachers] = useState<number[]>(subject?.teachers.map(t => t.id_teacher) ?? [])

  function toggleTeacher(id: number) {
    setSelectedTeachers(prev =>
      prev.includes(id)
        ? prev.filter(i => i !== id)
        : [...prev, id]
    )
  }

  async function handleSave() {
    if (!subject) return
    const name = subjectName.trim()
    if (!name) {
      toast.error("Введите название предмета.")
      return
    }
    // Нельзя переименовать в название другого существующего предмета
    const clash = existingNames.some(
      n => n.trim().toLowerCase() === name.toLowerCase()
        && n.trim().toLowerCase() !== subject.name.trim().toLowerCase()
    )
    if (clash) {
      toast.error("Предмет с таким названием уже существует.")
      return
    }
    await fetch("/api/subjects", {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        id_subject: subject.id_subject,
        name: subjectName,
        description: description,
        teacherIds: selectedTeachers,
      }),
    })
    toast.success("Изменения сохранены.")
    onClose()
  }

  async function handleDelete() {
    if (!subject) return
    const res = await fetch("/api/subjects", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ id_subject: subject.id_subject }),
    })
    const data = await res.json()
    if (!data.success) {
      toast.error(data.message ?? "Не удалось удалить предмет.")
      return
    }
    toast.success("Предмет удалён.")
    onClose()
  }

  return (
    <AlertDialog open={open} onOpenChange={open => !open && onClose()}>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Редактирование учебного курса</AlertDialogTitle>
          <AlertDialogDescription asChild>
           <div>
            <div className="mt-1 mb-1">Название курса:</div>
            <Input value={subjectName} onChange={e => setSubjectName(e.target.value)} />
            <div className="mt-3 mb-1">Описание:</div>
            <Textarea value={description} onChange={e => setDescription(e.target.value)} />
            <div className="mt-3 mb-1">Преподаватели курса:</div>

            <div className="flex flex-col gap-2">
              {teachers.map((teacher) => (
                <div className="flex gap-3" key={teacher.id_teacher}>
                  <Checkbox
                    id={"edit-" + teacher.id_teacher}
                    checked={selectedTeachers.includes(teacher.id_teacher)}
                    onCheckedChange={() => toggleTeacher(teacher.id_teacher)}/>
                  <Label htmlFor={"edit-" + teacher.id_teacher}>{teacher.full_name}</Label>
                </div>
              ))}
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
              <Save /> Сохранить
            </Button>
          </div>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  )
}
