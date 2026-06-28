"use client"

import { useState } from "react"

import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Search, CirclePlus } from "lucide-react";
import StudentCards from "@/components/student-cards";
import { PageHeader } from "@/components/page-header";
import { SkeletonCards } from "@/components/skeleton-cards";
import { AlertEditStudent } from "@/components/alert-edit-student";
import { AlertAddStudent } from "@/components/alert-add-student";
import { AlertMarks } from "@/components/alert-marks";
import type { Student } from "@/lib/students";
import { useList } from "@/hooks/use-list";


export default function Students() {
  const { data: students, refresh: fetchStudents, loading } = useList<Student>("/api/students");
  const [query, setQuery] = useState("");
  const [editStudent, setEditStudent] = useState<Student | null>(null);
  const [marksStudent, setMarksStudent] = useState<Student | null>(null);
  const [addOpen, setAddOpen] = useState(false);

  const q = query.toLowerCase().trim();
  const filtered = students.filter(s =>
    s.full_name.toLowerCase().includes(q) ||
    s.class_name.toLowerCase().includes(q)
  );

  // Группируем учеников по классам
  const byClass = filtered.reduce<Record<string, Student[]>>((acc, student) => {
    (acc[student.class_name] ??= []).push(student)
    return acc
  }, {})

  return (
    <div className="p-2">
      <PageHeader title="Ученики">
        <div className="relative w-64">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input className="pl-9" placeholder="Поиск по ФИО или классу..." value={query} onChange={e => setQuery(e.target.value)} />
        </div>
        <Button onClick={() => setAddOpen(true)}><CirclePlus /> Добавить ученика</Button>
      </PageHeader>

      <AlertAddStudent open={addOpen} onClose={() => { setAddOpen(false); fetchStudents() }} />
      <AlertEditStudent
        key={editStudent?.id_student ?? "none"}
        open={editStudent !== null}
        student={editStudent}
        onClose={() => { setEditStudent(null); fetchStudents() }}
      />
      <AlertMarks
        key={"marks-" + (marksStudent?.id_student ?? "none")}
        open={marksStudent !== null}
        student={marksStudent}
        onClose={() => setMarksStudent(null)}
      />

      {loading ? (
        <SkeletonCards />
      ) : filtered.length === 0 ? (
        <p className="text-center text-muted-foreground py-16">Ничего не найдено.</p>
      ) : (
        <div className="flex flex-col gap-8">
          {Object.entries(byClass).map(([className, classStudents]) => (
            <div key={className}>
              <p className="text-lg font-semibold mb-3">Класс {className}</p>
              <StudentCards students={classStudents} onEdit={setEditStudent} onMarks={setMarksStudent} />
            </div>
          ))}
        </div>
      )}

    </div>
  );
}
