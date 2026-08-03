# 📐 Dihedrons, Complex Numbers, and Infinitesimals

> **Student Guide to 4D Matrix Algebras & Dual Infinitesimals**
>
> In Norman Wildberger's *Famous Math Problems* (FMP 21a–d & 22a–b), standard complex numbers are reconstructed not as ad-hoc imaginary roots $\sqrt{-1}$, but as 2D matrix sub-algebras within the 4D Dihedron algebra $D(F)$.

---

```idris
module Dihedrons_And_Infinitesimals

import QuickCheck
import Math.BoxInt
import Math.Multiset
import Math.DualComplex
import Math.Infinitesimal
import Math.Dihedron.Dihedron
import Math.Dihedron.Subalgebras

%default total
```

## 1. 🏛️ Three Matrix Geometries

Given any field $F$, the $2 \times 2$ matrix algebra $M_2(F)$ contains three canonical two-dimensional commutative sub-algebras:

- **Blue** $C_b(F)$: $i^2 = -1$ (Euclidean)
- **Red** $C_r(F)$: $j^2 = +1$ (Relativistic Minkowski)
- **Green** $C_g(F)$: $k^2 = +1$ or $\varepsilon^2 = 0$ (Null / Degenerate)

```idris
||| Verifies that Blue, Red, and Green subalgebra quadrances match their metric signatures
public export
prop_subalgebraSignatures : Property
prop_subalgebraSignatures =
  let a = the BoxInt 5
      b = the BoxInt 3
      qBlue  = quadranceDihedron (toDihedronBlue (MkBlue a b))
      qRed   = quadranceDihedron (toDihedronRed (MkRed a b))
      qGreen = quadranceDihedron (toDihedronGreen (MkGreen a b))
  in property (qBlue == 34 && qRed == 16 && qGreen == 16)
```

---

## 2. 🎛️ Dual Complex Algebraic Derivative

Evaluating a `PolyNumber` at a dual complex number $a + b\varepsilon$ yields exact differentiation without limits:

$$P(a + b\varepsilon) = P(a) + P'(a)\cdot b\varepsilon$$

```idris
||| Verifies exact Faulhaber derivative readout via dual complex numbers
public export
prop_dualDerivativeTheorem : Property
prop_dualDerivativeTheorem =
  let -- P(α) = 4 + 2α + α³  => P'(α) = 2 + 3α²
      poly = AddM 0 4 (AddM 1 2 (AddM 3 1 ZeroM))
      dualVal = MkDual 2 1
      res = evalDual poly dualVal
      -- P(2) = 4 + 4 + 8 = 16
      -- P'(2) = 2 + 12 = 14
  in property (res == MkDual 16 14)
```
