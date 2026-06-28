import { Skeleton } from "@/components/ui/skeleton"

export function SkeletonCards({ count = 8 }: { count?: number }) {
  return (
    <div className="grid gap-5 grid-cols-[repeat(auto-fill,minmax(280px,1fr))]">
      {Array.from({ length: count }).map((_, i) => (
        <div key={i} className="rounded-xl border bg-card p-6 flex flex-col gap-4">
          <div className="flex items-center gap-3">
            <Skeleton className="h-12 w-12 rounded-full" />
            <div className="flex-1 space-y-2">
              <Skeleton className="h-4 w-3/4" />
              <Skeleton className="h-3 w-1/2" />
            </div>
          </div>
          <Skeleton className="h-3 w-full" />
          <Skeleton className="h-3 w-5/6" />
          <Skeleton className="h-9 w-full mt-2" />
        </div>
      ))}
    </div>
  )
}
