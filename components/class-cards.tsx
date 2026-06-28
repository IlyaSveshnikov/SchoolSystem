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

import { Pencil, DoorOpen, Users } from "lucide-react"
import type { SchoolClass } from "@/lib/classes"

type Props = {
  classes: SchoolClass[]
  onEdit: (cls: SchoolClass) => void
}

export default function ClassCards({ classes, onEdit }: Props) {
  return (
    <div className="grid gap-5 grid-cols-[repeat(auto-fill,minmax(220px,1fr))]">
      {classes.map((cls) => (
        <Card key={cls.id_class} className="gap-4 transition-shadow hover:shadow-md">
          <CardHeader>
            <div className="flex items-center justify-between gap-2">
              <CardTitle className="text-2xl">{cls.name}</CardTitle>
              <Badge variant="default"><Users className="h-3 w-3" />{cls.student_count}</Badge>
            </div>
          </CardHeader>
          <CardDescription><Separator /></CardDescription>
          <CardContent className="text-sm">
            <p className="flex items-center gap-2">
              <DoorOpen className="h-4 w-4 text-muted-foreground shrink-0" />
              Кабинет: {cls.classroom || <span className="text-muted-foreground">не указан</span>}
            </p>
          </CardContent>
          <CardDescription><Separator /></CardDescription>
          <CardFooter>
            <Button className="w-full" onClick={() => onEdit(cls)}>
              <Pencil />Редактировать
            </Button>
          </CardFooter>
        </Card>
      ))}
    </div>
  );
}
