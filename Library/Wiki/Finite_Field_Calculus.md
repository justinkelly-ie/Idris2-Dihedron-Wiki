# 🔬 Infinitesimal Calculus over Finite Fields

> **Student Guide to Curve Geometry over $\mathbb{F}_p$ (FMP 22d)**
>
> Tangent lines and intersections are computed via the double-zero algebraic criterion, demonstrating exact calculus over modular fields without topology or limit operations.

---

```idris
module Finite_Field_Calculus

import QuickCheck
import Math.BoxInt
import Math.Multiset
import Math.DualComplex
import Math.Infinitesimal
import Math.Dihedron.Dihedron

%default total
```

## 1. 📐 Double Zero Criterion

```idris
||| Verifies tangent vector readout for semi-cubical parabola y² = x³ at a=2
public export
prop_tangentVectorReadout : Property
prop_tangentVectorReadout =
  let a = the BoxInt 2
      -- x = α², y = α³ evaluated at a + ε
      xDual = evalDual (AddM 2 1 ZeroM) (MkDual a 1)
      yDual = evalDual (AddM 3 1 ZeroM) (MkDual a 1)
      dx = eps xDual -- 2a = 4
      dy = eps yDual -- 3a² = 12
  in property (dx == 4 && dy == 12)
```
