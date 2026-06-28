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
import { Save } from "lucide-react";
import { toast } from "sonner";

type SchoolClass = {
  id_class: number
  name: string
}

type Props = {
  open: boolean
  onClose: () => void
}

export function AlertAddStudent({ open, onClose }: Props) {
  const [classes, setClasses] = useState<SchoolClass[]>([]);
  useEffect(() => {
    async function fetchClasses() {
      const res = await fetch("/api/classes");
      const data = await res.json();
      setClasses(data);
      if (data.length && !classId) setClassId(data[0].id_class);
    }
    if (open) fetchClasses();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [open]);

  const [fullName, setFullName] = useState("")
  const [classId, setClassId] = useState<number>(0)
  const [birthDate, setBirthDate] = useState("")
  const [gender, setGender] = useState("")
  const [parentName, setParentName] = useState("")
  const [parentPhone, setParentPhone] = useState("")
  const [photoUrl, setPhotoUrl] = useState("")

  function reset() {
    setFullName(""); setBirthDate(""); setGender("")
    setParentName(""); setParentPhone(""); setPhotoUrl("")
  }

  async function handleSave() {
    if (!fullName.trim()) {
      toast.error("Введите ФИО ученика.")
      return
    }
    if (!classId) {
      toast.error("Выберите класс.")
      return
    }
    await fetch("/api/students", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        full_name: fullName,
        id_class: classId,
        birth_date: birthDate || null,
        gender,
        parent_name: parentName,
        parent_phone: parentPhone,
        photo_url: photoUrl || null,
      }),
    })
    toast.success("Ученик добавлен.")
    reset()
    onClose()
  }

  const selectClass =
    "h-9 w-full rounded-md border border-input bg-transparent px-3 text-sm shadow-xs outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"

  return (
    <AlertDialog open={open} onOpenChange={o => !o && onClose()}>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Добавление ученика</AlertDialogTitle>
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
        <AlertDialogFooter>
          <AlertDialogCancel onClick={reset}>Отмена</AlertDialogCancel>
          <Button onClick={handleSave}>
            <Save /> Сохранить
          </Button>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  )
}
