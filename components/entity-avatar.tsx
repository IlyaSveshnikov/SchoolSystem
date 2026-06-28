import { cn } from "@/lib/utils"

// Палитра «фон + текст» для аватаров-инициалов (в светлой и тёмной теме читаемо)
const PALETTE = [
  "bg-red-100 text-red-700 dark:bg-red-500/20 dark:text-red-300",
  "bg-orange-100 text-orange-700 dark:bg-orange-500/20 dark:text-orange-300",
  "bg-amber-100 text-amber-700 dark:bg-amber-500/20 dark:text-amber-300",
  "bg-green-100 text-green-700 dark:bg-green-500/20 dark:text-green-300",
  "bg-teal-100 text-teal-700 dark:bg-teal-500/20 dark:text-teal-300",
  "bg-sky-100 text-sky-700 dark:bg-sky-500/20 dark:text-sky-300",
  "bg-indigo-100 text-indigo-700 dark:bg-indigo-500/20 dark:text-indigo-300",
  "bg-violet-100 text-violet-700 dark:bg-violet-500/20 dark:text-violet-300",
  "bg-pink-100 text-pink-700 dark:bg-pink-500/20 dark:text-pink-300",
]

function initials(name: string): string {
  const parts = name.trim().split(/\s+/).filter(Boolean)
  return ((parts[0]?.[0] ?? "") + (parts[1]?.[0] ?? "")).toUpperCase() || "?"
}

function colorFor(name: string): string {
  let hash = 0
  for (let i = 0; i < name.length; i++) hash = (hash * 31 + name.charCodeAt(i)) | 0
  return PALETTE[Math.abs(hash) % PALETTE.length]
}

type Props = {
  name: string
  src?: string | null
  className?: string
}

export function EntityAvatar({ name, src, className }: Props) {
  return (
    <div className={cn("rounded-full overflow-hidden shrink-0 flex items-center justify-center font-semibold", !src && colorFor(name), className)}>
      {src
        ? <img src={src} alt="" className="h-full w-full object-cover" />
        : <span>{initials(name)}</span>}
    </div>
  )
}
