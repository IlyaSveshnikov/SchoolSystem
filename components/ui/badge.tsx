import * as React from "react"
import { cn } from "@/lib/utils"

type BadgeProps = React.ComponentProps<"span"> & {
  variant?: "default" | "secondary" | "outline"
}

function Badge({ className, variant = "secondary", ...props }: BadgeProps) {
  const variants = {
    default: "bg-primary text-primary-foreground border-transparent",
    secondary: "bg-muted text-muted-foreground border-transparent",
    outline: "text-foreground",
  }
  return (
    <span
      className={cn(
        "inline-flex items-center gap-1 rounded-full border px-2 py-0.5 text-xs font-medium whitespace-nowrap",
        variants[variant],
        className
      )}
      {...props}
    />
  )
}

export { Badge }
