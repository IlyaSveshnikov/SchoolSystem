"use client"

import { Calendar, LibraryBig, ChartColumnBig, School, Users, GraduationCap, DoorOpen, Sun, Moon, LogOut } from "lucide-react"
import { usePathname, useRouter } from "next/navigation"
import Link from "next/link"
import { useTheme } from "next-themes"

import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarHeader
} from "@/components/ui/sidebar"

// Menu items.
const items = [
  { title: "Предметы", url: "/subjects", icon: LibraryBig },
  { title: "Учителя", url: "/teachers", icon: Users },
  { title: "Ученики", url: "/students", icon: GraduationCap },
  { title: "Классы", url: "/classes", icon: DoorOpen },
  { title: "Расписание", url: "/schedule", icon: Calendar },
  { title: "Аналитика", url: "/analytics", icon: ChartColumnBig },
]

export function AppSidebar() {
  const pathname = usePathname()
  const router = useRouter()
  const { resolvedTheme, setTheme } = useTheme()

  async function handleLogout() {
    await fetch("/api/auth/logout", { method: "POST" })
    router.replace("/login")
    router.refresh()
  }

  return (
    <Sidebar>
      <SidebarHeader>
        <Link href="/" className="mt-3 mb-1 flex items-center gap-2 px-2 rounded-md hover:bg-sidebar-accent transition-colors">
          <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary text-primary-foreground shrink-0">
            <School className="h-5 w-5" />
          </div>
          <div className="leading-tight">
            <div className="text-base font-semibold">ЭИС «Школа»</div>
            <div className="text-xs text-muted-foreground">Панель управления</div>
          </div>
        </Link>
      </SidebarHeader>
      <SidebarContent>
        <SidebarGroup>
          <SidebarGroupContent>
            <SidebarMenu>
              {items.map((item) => (
                <SidebarMenuItem key={item.title}>
                  <SidebarMenuButton asChild isActive={pathname === item.url}>
                    <a href={item.url}>
                      <item.icon />
                      <span>{item.title}</span>
                    </a>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
      <SidebarFooter>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton onClick={() => setTheme(resolvedTheme === "dark" ? "light" : "dark")}>
              <Moon className="block dark:hidden" />
              <Sun className="hidden dark:block" />
              <span className="block dark:hidden">Тёмная тема</span>
              <span className="hidden dark:block">Светлая тема</span>
            </SidebarMenuButton>
          </SidebarMenuItem>
          <SidebarMenuItem>
            <SidebarMenuButton onClick={handleLogout}>
              <LogOut />
              <span>Выйти</span>
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarFooter>
    </Sidebar>
  )
}
