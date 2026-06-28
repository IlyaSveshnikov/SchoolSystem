"use client"

import { useState } from "react"

import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Search, CirclePlus } from "lucide-react";
import ClassCards from "@/components/class-cards";
import { PageHeader } from "@/components/page-header";
import { SkeletonCards } from "@/components/skeleton-cards";
import { AlertClass } from "@/components/alert-class";
import type { SchoolClass } from "@/lib/classes";
import { useList } from "@/hooks/use-list";


export default function Classes() {
  const { data: classes, refresh: fetchClasses, loading } = useList<SchoolClass>("/api/classes");
  const [query, setQuery] = useState("");
  const [editClass, setEditClass] = useState<SchoolClass | null>(null);
  const [addOpen, setAddOpen] = useState(false);

  const q = query.toLowerCase().trim();
  const filtered = classes.filter(c =>
    c.name.toLowerCase().includes(q) ||
    (c.classroom ?? "").toLowerCase().includes(q)
  );

  return (
    <div className="p-2">
      <PageHeader title="Классы">
        <div className="relative w-64">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input className="pl-9" placeholder="Поиск по классу или кабинету..." value={query} onChange={e => setQuery(e.target.value)} />
        </div>
        <Button onClick={() => setAddOpen(true)}><CirclePlus /> Добавить класс</Button>
      </PageHeader>

      <AlertClass key={`add-${addOpen}`} open={addOpen} cls={null} onClose={() => { setAddOpen(false); fetchClasses() }} />
      <AlertClass
        key={editClass?.id_class ?? "edit-none"}
        open={editClass !== null}
        cls={editClass}
        onClose={() => { setEditClass(null); fetchClasses() }}
      />

      {loading ? (
        <SkeletonCards count={6} />
      ) : filtered.length === 0 ? (
        <p className="text-center text-muted-foreground py-16">Ничего не найдено.</p>
      ) : (
        <ClassCards classes={filtered} onEdit={setEditClass} />
      )}
    </div>
  );
}
