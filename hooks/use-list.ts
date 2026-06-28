"use client"

import { useState, useEffect, useCallback } from "react"

// Загрузка списка из API с состоянием загрузки и ручным обновлением.
export function useList<T>(url: string) {
  const [data, setData] = useState<T[]>([])
  const [loading, setLoading] = useState(true)

  const refresh = useCallback(async () => {
    setLoading(true)
    try {
      const res = await fetch(url)
      const json = await res.json()
      setData(Array.isArray(json) ? json : [])
    } catch {
      setData([])
    } finally {
      setLoading(false)
    }
  }, [url])

  useEffect(() => {
    refresh()
  }, [refresh])

  return { data, loading, refresh }
}
