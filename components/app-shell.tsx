"use client"

import { usePathname } from "next/navigation"
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar"
import { AppSidebar } from "@/components/app-sidebar"

export function AppShell({ children }: { children: React.ReactNode }) {
  const pathname = usePathname()

  // Страница входа — без сайдбара
  if (pathname === "/login") return <>{children}</>

  return (
    <SidebarProvider>
      <AppSidebar />
      <main className="m-3 w-full">
        <SidebarTrigger />
        {children}
      </main>
    </SidebarProvider>
  )
}
