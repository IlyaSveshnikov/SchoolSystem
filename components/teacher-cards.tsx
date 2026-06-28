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

import { Pencil, Phone, Mail, GraduationCap, Clock } from "lucide-react"
import type { Teacher } from "@/lib/teachers"

type Props = {
  teachers: Teacher[]
  onEdit: (teacher: Teacher) => void
}

export default function TeacherCards({ teachers, onEdit }: Props) {
  return (
    <div className="grid gap-5 grid-cols-[repeat(auto-fill,minmax(280px,1fr))]">
      {teachers.map((teacher) => (
        <Card key={teacher.id_teacher} className="gap-4 transition-shadow hover:shadow-md">
          <CardHeader>
            <div className="flex items-center gap-3 min-w-0">
              <EntityAvatar name={teacher.full_name} src={teacher.photo_url} className="h-12 w-12 text-base" />
              <div className="min-w-0">
                <CardTitle className="line-clamp-2 break-words">{teacher.full_name}</CardTitle>
                {teacher.category && <Badge className="mt-1">{teacher.category}</Badge>}
              </div>
            </div>
          </CardHeader>
          <CardDescription><Separator /></CardDescription>
          <CardContent className="flex flex-col gap-2 text-sm">
            <p className="flex items-center gap-2">
              <Phone className="h-4 w-4 text-muted-foreground shrink-0" />
              {teacher.phone || <span className="text-muted-foreground">не указан</span>}
            </p>
            <p className="flex items-center gap-2 break-all">
              <Mail className="h-4 w-4 text-muted-foreground shrink-0" />
              {teacher.email || <span className="text-muted-foreground">не указан</span>}
            </p>
            <p className="flex items-center gap-2">
              <GraduationCap className="h-4 w-4 text-muted-foreground shrink-0" />
              {teacher.education || <span className="text-muted-foreground">не указано</span>}
            </p>
            <p className="flex items-center gap-2">
              <Clock className="h-4 w-4 text-muted-foreground shrink-0" />
              Стаж: {teacher.experience_years != null ? `${teacher.experience_years} лет` : "—"}
            </p>
          </CardContent>
          <CardFooter>
            <Button className="w-full" onClick={() => onEdit(teacher)}>
              <Pencil />Редактировать данные
            </Button>
          </CardFooter>
        </Card>
      ))}
    </div>
  );
}
