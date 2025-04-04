/- Copyright (c) Heather Macbeth, 2022.  All rights reserved. -/
import Mathlib.Data.Real.Basic
import Library.Basic

math2001_init

/- # Section 1.3: Tips and tricks
-/

/- here are a few calculations, just to test if Lean is running
-/

example : 2+2 = 4 :=
by ring

example : 2^3 = 8 :=
by ring

section compute
#eval 2^5
end compute


/- Exercise: choose some of these examples and type out the whole proofs printed in the text as Lean
proofs. -/


-- Example 1.3.1
example {a b : ℤ} (h1 : a = 2 * b + 5) (h2 : b = 3) :
a = 11 := by
 calc
   a = 2 * b + 5 := h1
   _ = 2 * 3 + 5 := by rw [h2]
   _ = 11 := by ring
 done

/- note how in the above example we can use the "by calc... done" form
whereas in following examples we just use "calc"
-/

-- Example 1.3.2
example {x : ℤ} (h1 : x + 4 = 2) : x = -2 :=
  calc
  x = (x + 4) - 4 := by ring
  _ = 2 - 4 := by rw[h1]
  _ = -2  := by ring

/- by the way, accidentally found the following also works
   (we aren't supposed to know the tatic "addarith" yet)
-/

-- Example 1.3.2
example {x : ℤ} (h1 : x + 4 = 2) : x = -2 :=
  calc
  x = -2 := by addarith[h1]

-- Example 1.3.3
example {a b : ℝ} (h1 : a - 5 * b = 4) (h2 : b + 2 = 3) : a = 9 :=
  calc
    a = (a - 5 * b) + 5 * b := by ring
    _ = 4 + 5 * b := by rw[h1]
    _ = 4 + 5 * (b + 2 - 2) := by ring
    _ = 4 + 5 * (3 - 2) := by rw[h2]
    _ = 9 := by ring


-- Example 1.3.4
example {w : ℚ} (h1 : 3 * w + 1 = 4) : w = 1 :=
  calc
  w = (1/3)*(3*w + 1) - (1/3) := by ring
  _ = (1/3)*4 - 1/3 := by rw[h1]
  _ = 4/3 - 1/3 := by ring
  _ = 1 := by ring

-- Example 1.3.5
example {x : ℤ} (h1 : 2 * x + 3 = x) : x = -3 :=
  calc
  x = 2*x + 3 - x - 3 := by ring
  _ = x - x - 3 := by rw [h1]
  _ = 0 - 3 := by ring
  _ = -3 := by ring

-- Example 1.3.6
example {x y : ℤ} (h1 : 2 * x - y = 4) (h2 : y - x + 1 = 2) : x = 5 :=
  calc
  x = 2*x - y - x + y := by ring
  _ = 4 - x + y := by rw [h1]
  _ = 4 + y - x := by ring
  _ = 4 + (y - x + 1) - 1 := by ring
  _ = 4 + 2 - 1 := by rw [h2]
  _ = 5 := by ring

-- Example 1.3.7
example {u v : ℚ} (h1 : u + 2 * v = 4) (h2 : u - 2 * v = 6) : u = 5 :=
   calc
  u = (1/2)*((u + 2*v) + (u - 2*v)) := by ring
  _ = (1/2)*(4 + 6) := by rw [h1, h2]
  _ = (1/2)*10 := by ring
  _ = 5 := by ring

-- Example 1.3.8
example {x y : ℝ} (h1 : x + y = 4) (h2 : 5 * x - 3 * y = 4) : x = 2 :=
  calc
  x = (1/8)*(3*x + 3*y + 5*x - 3*y) := by ring
  _ = (1/8)*(3*(x + y)+ (5*x - 3*y)) := by ring
  _ = (1/8)*(3*4 + 4) := by rw  [h1,h2]
  _ = (1/8)*(16) := by ring
  _ = 2 := by ring

-- Example 1.3.9
example {a b : ℚ} (h1 : a - 3 = 2 * b) : a ^ 2 - a + 3 = 4 * b ^ 2 + 10 * b + 9 :=
  calc
  a^2 - a + 3 = (a-3)*(a+2)+ 9 := by ring
  _= (2*b)*(a + 2) + 9 := by rw [h1]
  _= (2*b)*(a - 3 + 2 + 3 ) + 9 := by ring
  _= (2*b)*((a-3)+ 5) + 9 := by ring
  _= (2*b)*((2*b) + 5) + 9 := by rw [h1]
  _= (4*b^2 + 10*b +9) := by ring


-- Example 1.3.10
example {z : ℝ} (h1 : z ^ 2 - 2 = 0) : z ^ 4 - z ^ 3 - z ^ 2 + 2 * z + 1 = 3 :=
 calc
  z^4 - z^3 - z^2 + 2*z + 1 = (z^2 - z + 1)*(z^2-2) + 3 := by ring
  _ = (z^2 - z + 1)*0 + 3 := by rw [h1]
  _ = 3 := by ring


/-! # Exercises

Solve these problems yourself.  You may find it helpful to solve them on paper before typing them
up in Lean. -/


example {a b : ℤ} (h : a - b = 0) : a = b :=
  sorry

example {a b : ℝ} (h1 : a + 2 * b = 4) (h2 : a - b = 1) : a = 2 := by
  calc
    a = (1/3)*((a+2*b) + 2*(a-b)) := by ring
    _ = (1/3)*(4 + 2*1) := by rw[h1,h2]
    _ = 2 := by ring
  done

example {u v : ℝ} (h1 : u + 1 = v) : u ^ 2 + 3 * u + 1 = v ^ 2 + v - 1 :=
  calc
    u^2 + 3*u + 1 = (u+1)*(u+2) - 1 := by ring
    _ = (u + 1)*(u + 1 + 1) -1 := by ring
    _ = (v)*(v+1) - 1 := by rw[h1]
    _ = v^2 + v - 1 := by ring


example {t : ℚ} (ht : t ^ 2 - 4 = 0) :
    t ^ 4 + 3 * t ^ 3 - 3 * t ^ 2 - 2 * t - 2 = 10 * t + 2 :=
  calc
    t ^ 4 + 3 * t ^ 3 - 3 * t ^ 2 - 2 * t - 2 = (t^2-4)*(t^2+3*t+1) + 10*t+2 := by ring
     _ = (0)*(t^2+3*t+1) + 10*t+2 := by rw[ht]
     _ =10*t+2 := by ring



example {p q r : ℚ} (h1 : p + q + r = 0) (h2 : p * q + p * r + q * r = 2) :
    p ^ 2 + q ^ 2 + r ^ 2 = -4 := by
   calc
    p^2 + q^2 + r^2 = (p+q+r)^2 - 2*(p*q + p*r + q*r) := by ring
    _ = 0^2 - 2*(2) := by rw [h1,h2]
    _ = -4 := by ring
   done
