import { describe, it, expect } from "vitest"
import { cn, shortTeacherName } from "./utils"

describe("shortTeacherName", () => {
  it("сокращает ФИО до фамилии с инициалами", () => {
    expect(shortTeacherName("Смирнова Ольга Викторовна")).toBe("Смирнова О.В.")
  })

  it("работает с двумя словами", () => {
    expect(shortTeacherName("Иванов Иван")).toBe("Иванов И.")
  })

  it("возвращает одну фамилию без инициалов", () => {
    expect(shortTeacherName("Петров")).toBe("Петров")
  })

  it("обрезает лишние пробелы", () => {
    expect(shortTeacherName("  Кузьмин   Андрей   Игоревич  ")).toBe("Кузьмин А.И.")
  })
})

describe("cn", () => {
  it("объединяет классы", () => {
    expect(cn("a", "b")).toBe("a b")
  })

  it("отбрасывает falsy-значения", () => {
    expect(cn("a", false, undefined, "b")).toBe("a b")
  })

  it("разрешает конфликты tailwind в пользу последнего", () => {
    expect(cn("p-2", "p-4")).toBe("p-4")
  })
})
