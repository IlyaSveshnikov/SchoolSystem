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
import { Save, Trash2 } from "lucide-react";
import { toast } from "sonner";
import type { SchoolClass } from "@/lib/classes";

type Props = {
  open: boolean
  // null -> режим добавления, иначе редактирование
  cls: SchoolClass | null
  onClose: () => void
}

export function AlertClass({ open, cls, onClose }: Props) {
  // Инициализация из пропса; компонент перемонтируется по key (см. страницу).
  const [name, setName] = useState(cls?.name ?? "")
  const [classroom, setClassroom] = useState(cls?.classroom ?? "")

  async function handleSave() {
    if (!name.trim()) {
      toast.error("Введите название класса.")
      return
    }
    if (cls) {
      await fetch("/api/classes", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id_class: cls.id_class, name, classroom }),
      })
    } else {
      await fetch("/api/classes", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, classroom }),
      })
    }
    toast.success(cls ? "Класс обновлён." : "Класс добавлен.")
    onClose()
  }

  async function handleDelete() {
    if (!cls) return
    if (!confirm(`Удалить класс «${cls.name}»?`)) return
    const res = await fetch("/api/classes", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ id_class: cls.id_class }),
    })
    const data = await res.json()
    if (!data.success) {
      toast.error(data.message ?? "Не удалось удалить класс.")
      return
    }
    toast.success("Класс удалён.")
    onClose()
  }

  return (
    <AlertDialog open={open} onOpenChange={o => !o && onClose()}>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>{cls ? "Редактирование класса" : "Добавление класса"}</AlertDialogTitle>
          <AlertDialogDescription asChild>
            <div>
              <div className="mt-1 mb-1">Название (например, 5А):</div>
              <Input value={name} onChange={e => setName(e.target.value)} />
              <div className="mt-3 mb-1">Кабинет:</div>
              <Input value={classroom} onChange={e => setClassroom(e.target.value)} />
            </div>
          </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter className={cls ? "sm:justify-between" : undefined}>
          {cls && (
            <Button variant="destructive" onClick={handleDelete}>
              <Trash2 /> Удалить
            </Button>
          )}
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
