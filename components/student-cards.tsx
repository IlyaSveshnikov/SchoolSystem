"use client"

import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"
import { Separator } from "@/components/ui/separator"
import { EntityAvatar } from "@/components/entity-avatar"

import { Pencil, Cake, Users, Phone, ClipboardList } from "lucide-react"
import type { Student } from "@/lib/students"

type Props = {
  students: Student[]
  onEdit: (student: Student) => void
  onMarks: (student: Student) => void
}

export default function StudentCards({ students, onEdit, onMarks }: Props) {
  return (
    <div className="grid gap-5 grid-cols-[repeat(auto-fill,minmax(280px,1fr))]">
      {students.map((student) => (
        <Card key={student.id_student} className="gap-4 transition-shadow hover:shadow-md">
          <CardHeader>
            <div className="flex items-center gap-3 min-w-0">
              <EntityAvatar name={student.full_name} src={student.photo_url} className="h-12 w-12 text-base" />
              <div className="min-w-0">
                <CardTitle className="line-clamp-2 break-words">{student.full_name}</CardTitle>
                <div className="mt-1 flex gap-1">
                  <Badge variant="default">{student.class_name}</Badge>
                  {student.gender && <Badge>{student.gender === "М" ? "М" : "Ж"}</Badge>}
                </div>
              </div>
            </div>
          </CardHeader>
          <CardDescription><Separator /></CardDescription>
          <CardContent className="flex flex-col gap-2 text-sm">
            <p className="flex items-center gap-2">
              <Cake className="h-4 w-4 text-muted-foreground shrink-0" />
              {student.birth_date || <span className="text-muted-foreground">дата не указана</span>}
            </p>
            <p className="flex items-center gap-2">
              <Users className="h-4 w-4 text-muted-foreground shrink-0" />
              {student.parent_name || <span className="text-muted-foreground">родитель не указан</span>}
            </p>
            <p className="flex items-center gap-2">
              <Phone className="h-4 w-4 text-muted-foreground shrink-0" />
              {student.parent_phone || <span className="text-muted-foreground">не указан</span>}
            </p>
          </CardContent>
          <CardFooter className="flex flex-col gap-2">
            <Button className="w-full" variant="outline" onClick={() => onMarks(student)}>
              <ClipboardList />Оценки
            </Button>
            <Button className="w-full" onClick={() => onEdit(student)}>
              <Pencil />Редактировать данные
            </Button>
          </CardFooter>
        </Card>
      ))}
    </div>
  );
}
