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

import { Pencil, Users } from "lucide-react"
import type { SubjectWithTeachers } from "@/lib/subjects"

type Props = {
  subjects: SubjectWithTeachers[]
  onEdit: (subject: SubjectWithTeachers) => void
}

export default function SubjectsCards({ subjects, onEdit }: Props) {
  return (
    <div className="grid gap-5 grid-cols-[repeat(auto-fill,minmax(280px,1fr))]">
      {subjects.map((subject) => (
        <Card key={subject.id_subject} className="gap-4 transition-shadow hover:shadow-md">
          <CardHeader>
            <div className="flex items-start justify-between gap-2">
              <CardTitle>{subject.name}</CardTitle>
              <Badge className="shrink-0"><Users className="h-3 w-3" />{subject.teachers.length}</Badge>
            </div>
            {subject.description && (
              <p className="text-sm text-muted-foreground mt-1 line-clamp-3">{subject.description}</p>
            )}
          </CardHeader>
          <CardDescription><Separator /></CardDescription>
          <CardContent className="h-24 overflow-auto text-sm">
            <p className="text-xs text-muted-foreground mb-1">Преподаватели:</p>
            {subject.teachers.length > 0 ? (
              subject.teachers.map((teacher) => (
                <p key={teacher.id_teacher}>{teacher.full_name}</p>
              ))
            ) : (
              <p className="text-muted-foreground">Учителя не назначены</p>
            )}
          </CardContent>
          <CardDescription><Separator /></CardDescription>
          <CardFooter>
            <Button className="w-full" onClick={() => onEdit(subject)}>
              <Pencil />Редактировать данные
            </Button>
          </CardFooter>
        </Card>
      ))}
    </div>
  );
}
