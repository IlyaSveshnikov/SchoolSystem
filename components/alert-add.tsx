"use client"

import {
  AlertDialog,
  AlertDialogContent,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogCancel,
  AlertDialogAction,
} from "@/components/ui/alert-dialog"

import { useEffect, useState } from "react";

import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { Checkbox } from "@/components/ui/checkbox";
import { Save } from "lucide-react";
import { toast } from "sonner";

type Teacher = {
  id_teacher: number
  full_name: string
}

type Props = {
  open: boolean
  onClose: () => void
  existingNames: string[]
}

export function AlertAdd({ open, onClose, existingNames }: Props) {

  const [teachers, setTeachers] = useState<Teacher[]>([]);
  useEffect(() => {
    async function fetchTeachers() {
      const res = await fetch("/api/teachers");
      const data = await res.json();
      setTeachers(data);
    }
    if (open) fetchTeachers();
  }, [open]);

  const [subjectName, setSubjectName] = useState("")
  const [description, setDescription] = useState("")
  const [selectedTeachers, setSelectedTeachers] = useState<number[]>([])
  function toggleTeacher(id: number) {
    setSelectedTeachers(prev =>
      prev.includes(id)
        ? prev.filter(i => i !== id)
        : [...prev, id]
    )
  }

  async function handleSave() {
    const name = subjectName.trim()
    if (!name) {
      toast.error("Введите название предмета.")
      return
    }
    const exists = existingNames.some(n => n.trim().toLowerCase() === name.toLowerCase())
    if (exists) {
      toast.error("Такой предмет уже существует.")
      return
    }
    await fetch("/api/subjects", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        name: subjectName,
        description: description,
        teacherIds: selectedTeachers,
      }),
    })
    toast.success("Предмет добавлен.")
    setSubjectName("")
    setDescription("")
    setSelectedTeachers([])
    onClose()
  }

  return (
    <AlertDialog open={open} onOpenChange={open => !open && onClose()}>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Создание нового учебного курса</AlertDialogTitle>
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
                    id={String(teacher.id_teacher)}
                    checked={selectedTeachers.includes(teacher.id_teacher)}
                    onCheckedChange={() => toggleTeacher(teacher.id_teacher)}/>
                  <Label htmlFor={String(teacher.id_teacher)}>{teacher.full_name}</Label>
                </div>
              ))}
            </div>
           </div>
          </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter>
          <AlertDialogCancel>Отмена</AlertDialogCancel>
          <AlertDialogAction onClick={handleSave}><Save /> Сохранить</AlertDialogAction>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  )
}
