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
import { Save } from "lucide-react";
import { toast } from "sonner";

type Props = {
  open: boolean
  onClose: () => void
}

const CATEGORIES = ["Высшая", "Первая", "Без категории"]

export function AlertAddTeacher({ open, onClose }: Props) {
  const [fullName, setFullName] = useState("")
  const [phone, setPhone] = useState("")
  const [email, setEmail] = useState("")
  const [birthDate, setBirthDate] = useState("")
  const [education, setEducation] = useState("")
  const [experience, setExperience] = useState("")
  const [category, setCategory] = useState("")
  const [photoUrl, setPhotoUrl] = useState("")

  function reset() {
    setFullName(""); setPhone(""); setEmail(""); setBirthDate("")
    setEducation(""); setExperience(""); setCategory(""); setPhotoUrl("")
  }

  async function handleSave() {
    if (!fullName.trim()) {
      toast.error("Введите ФИО учителя.")
      return
    }
    await fetch("/api/teachers", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
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
    toast.success("Учитель добавлен.")
    reset()
    onClose()
  }

  const selectClass =
    "h-9 w-full rounded-md border border-input bg-transparent px-3 text-sm shadow-xs outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"

  return (
    <AlertDialog open={open} onOpenChange={o => !o && onClose()}>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Добавление учителя</AlertDialogTitle>
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
