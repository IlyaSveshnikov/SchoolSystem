"use client"

import { useState } from "react"

import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { CirclePlus, Search } from "lucide-react";
import SubjectsCards from "@/components/subj-cards";
import { PageHeader } from "@/components/page-header";
import { SkeletonCards } from "@/components/skeleton-cards";
import { AlertAdd } from "@/components/alert-add";
import { AlertEdit } from "@/components/alert-edit";
import type { SubjectWithTeachers } from "@/lib/subjects";
import { useList } from "@/hooks/use-list";


export default function Subjects() {
  const [open, setOpen] = useState(false)
  const [editSubject, setEditSubject] = useState<SubjectWithTeachers | null>(null)
  const [query, setQuery] = useState("")

  const { data: subjects, refresh: fetchSubjects, loading } = useList<SubjectWithTeachers>("/api/subjects");

  const q = query.toLowerCase().trim();
  const filtered = subjects.filter(s =>
    s.name.toLowerCase().includes(q) ||
    s.teachers.some(t => t.full_name.toLowerCase().includes(q))
  );

  return (
    <div className="p-2">
      <PageHeader title="Предметы">
        <div className="relative w-64">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input className="pl-9" placeholder="Поиск по предмету или учителю..." value={query} onChange={e => setQuery(e.target.value)} />
        </div>
        <Button onClick={() => setOpen(true)}><CirclePlus /> Добавить предмет</Button>
      </PageHeader>

      <AlertAdd open={open} onClose={() => { setOpen(false); fetchSubjects() }} existingNames={subjects.map(s => s.name)} />
      <AlertEdit
        key={editSubject?.id_subject ?? "none"}
        open={editSubject !== null}
        subject={editSubject}
        onClose={() => { setEditSubject(null); fetchSubjects() }}
        existingNames={subjects.map(s => s.name)}
      />

      {loading ? (
        <SkeletonCards />
      ) : filtered.length === 0 ? (
        <p className="text-center text-muted-foreground py-16">Ничего не найдено.</p>
      ) : (
        <SubjectsCards subjects={filtered} onEdit={setEditSubject} />
      )}
    </div>
  );
}
