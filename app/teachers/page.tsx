"use client"

import { useState } from "react"

import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Search, CirclePlus } from "lucide-react";
import TeacherCards from "@/components/teacher-cards";
import { PageHeader } from "@/components/page-header";
import { SkeletonCards } from "@/components/skeleton-cards";
import { AlertEditTeacher } from "@/components/alert-edit-teacher";
import { AlertAddTeacher } from "@/components/alert-add-teacher";
import type { Teacher } from "@/lib/teachers";
import { useList } from "@/hooks/use-list";


export default function Teachers() {
  const { data: teachers, refresh: fetchTeachers, loading } = useList<Teacher>("/api/teachers");
  const [query, setQuery] = useState("");
  const [editTeacher, setEditTeacher] = useState<Teacher | null>(null);
  const [addOpen, setAddOpen] = useState(false);

  const filtered = teachers.filter(t =>
    t.full_name.toLowerCase().includes(query.toLowerCase())
  );

  return (
    <div className="p-2">
      <PageHeader title="Учителя">
        <div className="relative w-64">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input className="pl-9" placeholder="Поиск по ФИО..." value={query} onChange={e => setQuery(e.target.value)} />
        </div>
        <Button onClick={() => setAddOpen(true)}><CirclePlus /> Добавить учителя</Button>
      </PageHeader>

      <AlertAddTeacher open={addOpen} onClose={() => { setAddOpen(false); fetchTeachers() }} />
      <AlertEditTeacher
        key={editTeacher?.id_teacher ?? "none"}
        open={editTeacher !== null}
        teacher={editTeacher}
        onClose={() => { setEditTeacher(null); fetchTeachers() }}
      />

      {loading ? (
        <SkeletonCards />
      ) : filtered.length === 0 ? (
        <p className="text-center text-muted-foreground py-16">Ничего не найдено.</p>
      ) : (
        <TeacherCards teachers={filtered} onEdit={setEditTeacher} />
      )}
    </div>
  );
}
