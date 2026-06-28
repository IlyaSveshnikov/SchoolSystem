import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

// Цвет бейджа оценки (2 — красный … 5 — зелёный)
export function markColor(mark: number): string {
  switch (mark) {
    case 5: return "bg-green-100 text-green-700 dark:bg-green-500/20 dark:text-green-300"
    case 4: return "bg-lime-100 text-lime-700 dark:bg-lime-500/20 dark:text-lime-300"
    case 3: return "bg-amber-100 text-amber-700 dark:bg-amber-500/20 dark:text-amber-300"
    default: return "bg-red-100 text-red-700 dark:bg-red-500/20 dark:text-red-300"
  }
}

// "Смирнова Ольга Викторовна" -> "Смирнова О.В."
export function shortTeacherName(fullName: string): string {
  const parts = fullName.trim().split(/\s+/)
  const surname = parts[0] ?? ""
  const initials = parts.slice(1).map(p => p[0].toUpperCase() + ".").join("")
  return initials ? `${surname} ${initials}` : surname
}
