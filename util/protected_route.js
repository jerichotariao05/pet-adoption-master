'use client'

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";

export default function ProtectedRoute({ children }) {
  const [isSession, setSession] = useState(null);
  const router = useRouter();

  useEffect(() => {
    const storedSessionData = localStorage.getItem("admin");

    if (!storedSessionData) {
      localStorage.removeItem("admin");
      router.push("/admin");
    } else {
      setSession(true);
    }
  }, [router]);


  if (isSession === null) {
    return <div>Loading...</div>;
  }

  return <>{isSession ? <>{children}</> : null}</>;
}
