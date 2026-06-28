"use client"

import { useRef, useState } from "react"
import { Button } from "@/components/ui/button"
import { ImagePlus, Loader2 } from "lucide-react"

type Props = {
  value: string
  onChange: (url: string) => void
}

export function PhotoInput({ value, onChange }: Props) {
  const inputRef = useRef<HTMLInputElement>(null)
  const [uploading, setUploading] = useState(false)

  async function handleFile(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return
    setUploading(true)
    try {
      const fd = new FormData()
      fd.append("file", file)
      const res = await fetch("/api/upload", { method: "POST", body: fd })
      const data = await res.json()
      if (data.success) onChange(data.url)
    } finally {
      setUploading(false)
    }
  }

  return (
    <div className="flex items-center gap-3">
      <div className="h-16 w-16 rounded-full overflow-hidden bg-muted flex items-center justify-center shrink-0 border">
        {value
          ? <img src={value} alt="" className="h-full w-full object-cover" />
          : <ImagePlus className="h-6 w-6 text-muted-foreground" />}
      </div>
      <input ref={inputRef} type="file" accept="image/*" className="hidden" onChange={handleFile} />
      <Button type="button" variant="outline" onClick={() => inputRef.current?.click()} disabled={uploading}>
        {uploading ? <Loader2 className="animate-spin" /> : <ImagePlus />}
        {value ? "Заменить фото" : "Загрузить фото"}
      </Button>
    </div>
  )
}
