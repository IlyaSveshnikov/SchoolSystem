"use client"

import React from "react";
import { useState, useEffect, useId } from "react";

import {
  Pagination,
  PaginationContent,
  PaginationItem,
  PaginationLink,
} from "@/components/ui/pagination";

import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";

import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";

import { Button } from "@/components/ui/button";

import { Loader2 } from "lucide-react";
import { toast } from "sonner";
import { shortTeacherName } from "@/lib/utils";

// Типы из твоего API
interface Lesson {
  id: number;
  day_of_week: string;
  lesson_number: number;
  subject: string;
  classroom: string;
  teacher: string;
}

export default function Schedule() {

  const classesLetters = ["А", "Б", "В", "Г"];
  const [selectedClassNumber, setSelectedClassNumber] = useState(0);
  const [selectedClassLetter, setSelectedClassLetter] = useState("");

  // Реально существующие классы из БД: параллель (число) -> буквы
  const [gradeLetters, setGradeLetters] = useState<Record<number, string[]>>({});
  const grades = Object.keys(gradeLetters).map(Number).sort((a, b) => a - b);

  useEffect(() => {
    async function fetchClasses() {
      const res = await fetch("/api/classes");
      const data: { name: string }[] = await res.json();
      const map: Record<number, string[]> = {};
      for (const c of data) {
        const m = c.name.match(/^(\d+)(.+)$/);
        if (!m) continue;
        const grade = Number(m[1]);
        const letter = m[2];
        if (!map[grade]) map[grade] = [];
        if (!map[grade].includes(letter)) map[grade].push(letter);
      }
      for (const g of Object.keys(map)) {
        map[Number(g)].sort((a, b) => classesLetters.indexOf(a) - classesLetters.indexOf(b));
      }
      setGradeLetters(map);
      // Выбираем первый существующий класс по умолчанию
      const firstGrade = Object.keys(map).map(Number).sort((a, b) => a - b)[0];
      if (firstGrade != null) {
        setSelectedClassNumber(firstGrade);
        setSelectedClassLetter(map[firstGrade][0]);
      }
    }
    fetchClasses();
  }, []);

  // При смене параллели подставляем первую доступную букву
  function selectGrade(grade: number) {
    setSelectedClassNumber(grade);
    const letters = gradeLetters[grade] ?? [];
    if (!letters.includes(selectedClassLetter)) {
      setSelectedClassLetter(letters[0] ?? "");
    }
  }

  const lessonsTimes = ["08:00 - 08:45", "09:00 - 09:45", "10:00 - 10:45", "11:00 - 11:45", "12:00 - 12:45", "13:00 - 13:45"];
  const days = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница"];

  // Новые состояния
  const [schedule, setSchedule] = useState<Lesson[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  // Списки предметов и учителей для выпадающих меню (из БД)
  const [subjectOptions, setSubjectOptions] = useState<string[]>([]);
  const [teacherOptions, setTeacherOptions] = useState<string[]>([]);
  // Карта "предмет -> учителя, которые его ведут" (фамилии с инициалами)
  const [subjectTeachers, setSubjectTeachers] = useState<Record<string, string[]>>({});

  useEffect(() => {
    async function fetchOptions() {
      const [sRes, tRes] = await Promise.all([
        fetch("/api/subjects"),
        fetch("/api/teachers"),
      ]);
      const subjects: { name: string; teachers: { full_name: string }[] }[] = await sRes.json();
      const teachers = await tRes.json();
      setSubjectOptions(subjects.map((s) => s.name));
      setTeacherOptions(teachers.map((t: { full_name: string }) => shortTeacherName(t.full_name)));

      const map: Record<string, string[]> = {};
      for (const s of subjects) {
        map[s.name] = s.teachers.map((t) => shortTeacherName(t.full_name));
      }
      setSubjectTeachers(map);
    }
    fetchOptions();
  }, []);

  // Функция загрузки расписания
  const fetchSchedule = async () => {
    const className = `${selectedClassNumber}_${classesLetters.indexOf(selectedClassLetter)+1}`;
    setLoading(true);
    setError('');
    
    try {
      const response = await fetch(`/api/schedule`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
        className: className,
      }),
      });
      const result = await response.json();
      
      if (result.success) {
        setSchedule(result.data);
      } else {
        setError('Расписание не найдено.');
        setSchedule([]);
      }
    } catch (err) {
      setError('Ошибка загрузки.');
      setSchedule([]);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
        fetchSchedule();
    }, [selectedClassNumber, selectedClassLetter]);

  // Получить урок для дня и номера
  const getLesson = (day: string, lessonNum: number): Lesson | null => {
    return schedule.find(l => 
      l.day_of_week === day && l.lesson_number === lessonNum
    ) || null;
  };

  const saveChangedLesson = async (day: string, lessonNum: number, values: { subject: string; classroom: string; teacher: string }) => {

    try {

      const lessonId = getLesson(day, lessonNum)?.id;

      const newLesson = {
        id: lessonId ? lessonId : schedule.length + 1,
        day_of_week: day,
        lesson_number: lessonNum,
        subject: values.subject,
        classroom: values.classroom,
        teacher: values.teacher,
      }

      const updatedData = {
        className: `${selectedClassNumber}_${classesLetters.indexOf(selectedClassLetter)+1}`,
        day: day,
        lessonNum: lessonNum,
        subject: values.subject,
        classroom: values.classroom,
        teacher: values.teacher,
      };

      const response = await fetch(`/api/schedule`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(updatedData),
      });
      const result = await response.json();
      
      if (result.success) {
        if (lessonId) {
          setSchedule(prev => prev.map(lesson =>
            lesson.id === lessonId ? { ...lesson, ...newLesson } : lesson
          ));
        } else {
          setSchedule(prev => [...prev, newLesson]);
        }
        toast.success('Урок сохранён.');
      } else {
        toast.error('Не удалось сохранить урок.');
      }
    } catch {
      toast.error('Не удалось сохранить урок.');
    }
  }

  const removeLesson = async (day: string, lessonNum: number) => {
    const lessonData = {
      className: `${selectedClassNumber}_${classesLetters.indexOf(selectedClassLetter)+1}`,
      day: day,
      lessonNum: lessonNum,
    };

    try {
      const response = await fetch(`/api/schedule`, {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(lessonData),
      });
      const result = await response.json();
      
      if (result.success) {
        setSchedule(prev => prev.filter(lesson =>
          !(lesson.day_of_week === day && lesson.lesson_number === lessonNum)
        ));
        toast.success('Урок удалён.');
      } else {
        toast.error('Не удалось удалить урок.');
      }
    } catch {
      toast.error('Не удалось удалить урок.');
    }
  }

  return (
    <div className="flex flex-col gap-2">

      <p className="text-center text-xl font-bold text-foreground">Классы школы</p>

      {/* List of classes numbers */}
      <Pagination>
        <PaginationContent>
          {grades.map((number) => (
            <PaginationItem key={number}>
              <PaginationLink
                href="#"
                isActive={selectedClassNumber === number}
                onClick={(e) => {e.preventDefault(); selectGrade(number) } }
              >
                {number}
              </PaginationLink>
            </PaginationItem>
          ))}
        </PaginationContent>
      </Pagination>

      {/* List of classes letters */}
      <Pagination>
        <PaginationContent>
          {(gradeLetters[selectedClassNumber] ?? []).map((letter) => (
            <PaginationItem key={letter}>
              <PaginationLink
                href="#"
                isActive={selectedClassLetter === letter}
                onClick={(e) => {e.preventDefault(); setSelectedClassLetter(letter)}}
              >
                {letter}
              </PaginationLink>
            </PaginationItem>
          ))}
        </PaginationContent>
      </Pagination>

      <p className="text-center text-xl font-bold text-foreground mt-4">Расписание выбранного класса</p>

      <Table>
        <TableCaption>Расписание класса {selectedClassNumber}{selectedClassLetter}</TableCaption>
        <TableHeader>
          <TableRow>
            <TableHead className="font-bold">Время</TableHead>
            {days.map((day) => (
              <TableHead className="font-bold text-center" key={day}>{day}</TableHead>
            ))}
          </TableRow>
        </TableHeader>
        <TableBody>
          {lessonsTimes.map((time, index) => (
            <TableRow key={index}>
              <TableCell className="font-medium">{time}</TableCell>
              {days.map((day) => {
                const lesson = getLesson(day, index + 1);
                return (
                  <TableCell key={day}>
                    {loading ? (
                      <Loader2 className="h-4 w-4 animate-spin mx-auto" />
                    ) : (
                      <Popover>
                        <PopoverTrigger className="w-full text-left hover:bg-accent p-2 rounded cursor-pointer">
                          {lesson ? (
                            <>
                              <p className="font-bold">{lesson.subject}</p>
                              <p className="text-sm text-muted-foreground">
                                {lesson.classroom} каб. | {lesson.teacher}
                              </p>
                            </>
                          ) : (<p className="text-sm text-center text-muted-foreground">Нет урока</p>)}
                        </PopoverTrigger>
                        <PopoverContent className="w-80">
                          <LessonEditor
                            lesson={lesson}
                            subjectOptions={subjectOptions}
                            teacherOptions={teacherOptions}
                            subjectTeachers={subjectTeachers}
                            onSave={(values) => saveChangedLesson(day, index + 1, values)}
                            onRemove={() => removeLesson(day, index + 1)}
                          />
                        </PopoverContent>
                      </Popover>
                    )}
                  </TableCell>
                );
              })}
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  );
}

// Редактор одной ячейки расписания (содержимое popover)
function LessonEditor({
  lesson,
  subjectOptions,
  teacherOptions,
  subjectTeachers,
  onSave,
  onRemove,
}: {
  lesson: Lesson | null;
  subjectOptions: string[];
  teacherOptions: string[];
  subjectTeachers: Record<string, string[]>;
  onSave: (values: { subject: string; classroom: string; teacher: string }) => void;
  onRemove: () => void;
}) {
  const uid = useId();
  const [subject, setSubject] = useState(lesson ? lesson.subject : "");
  const [classroom, setClassroom] = useState(lesson ? lesson.classroom : "");
  const [teacher, setTeacher] = useState(lesson ? lesson.teacher : "");

  // Если выбран предмет — показываем только ведущих его учителей, иначе всех.
  const baseTeacherList = subject && subjectTeachers[subject] ? subjectTeachers[subject] : teacherOptions;
  // Текущее значение оставляем в списке, чтобы не потерять его при открытии.
  const teacherList = teacher && !baseTeacherList.includes(teacher) ? [teacher, ...baseTeacherList] : baseTeacherList;
  const subjectList = subject && !subjectOptions.includes(subject) ? [subject, ...subjectOptions] : subjectOptions;

  function handleSubjectChange(value: string) {
    setSubject(value);
    // Если выбранный учитель не ведёт новый предмет — сбрасываем его.
    const allowed = subjectTeachers[value] ?? [];
    if (!allowed.includes(teacher)) {
      setTeacher("");
    }
  }

  const selectClass =
    "col-span-2 h-8 border-input rounded-md border bg-transparent px-2 text-sm shadow-xs outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]";

  return (
    <div className="grid gap-2">
      <div className="grid grid-cols-3 items-center gap-4">
        <Label htmlFor={`${uid}-subject`}>Предмет:</Label>
        <select id={`${uid}-subject`} value={subject} onChange={(e) => handleSubjectChange(e.target.value)} className={selectClass}>
          <option value="">— не выбрано —</option>
          {subjectList.map((name) => (
            <option key={name} value={name}>{name}</option>
          ))}
        </select>
      </div>
      <div className="grid grid-cols-3 items-center gap-4">
        <Label htmlFor={`${uid}-room`}>Кабинет:</Label>
        <Input id={`${uid}-room`} value={classroom} onChange={(e) => setClassroom(e.target.value)} className="col-span-2 h-8" />
      </div>
      <div className="grid grid-cols-3 items-center gap-4">
        <Label htmlFor={`${uid}-teacher`}>Учитель:</Label>
        <select id={`${uid}-teacher`} value={teacher} onChange={(e) => setTeacher(e.target.value)} className={selectClass}>
          <option value="">— не выбрано —</option>
          {teacherList.map((name) => (
            <option key={name} value={name}>{name}</option>
          ))}
        </select>
      </div>
      <div className="flex gap-4 w-full">
        <Button className="flex-1" variant="outline" onClick={(e) => { e.preventDefault(); onRemove(); }}>Убрать урок</Button>
        <Button className="flex-1" onClick={(e) => { e.preventDefault(); onSave({ subject, classroom, teacher }); }}>Сохранить</Button>
      </div>
    </div>
  );
}