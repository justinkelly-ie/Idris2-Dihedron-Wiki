# 🧮 Product and Chain Rules via Algebraic Infinitesimals

> **Student Guide to Purely Algebraic Calculus (FMP 22c)**
>
> Leibniz's product rule $(PQ)' = P'Q + PQ'$ and the chain rule $(P \circ Q)' = (P' \circ Q)Q'$ are proven algebraically from nilpotency ($\varepsilon^2 = 0$) alone.

---

```idris
module Product_And_Chain_Rules

import QuickCheck
import Core.BoxInt
import Math.Multiset
import Math.Infinitesimal
import Core.Polynumber

%default total
```

## 1. 📐 Product Rule Verification

```idris
||| Verifies algebraic product rule for Polynumbers P and Q
public export
prop_productRuleAlgebraic : Property
prop_productRuleAlgebraic =
  let p = MkPolynumber [intToBoxInt 3, intToBoxInt 2] -- 3 + 2x
      q = MkPolynumber [intToBoxInt 0, intToBoxInt 1, intToBoxInt 1] -- x + x²
      pq = mulPolynumber p q
      derivPQ = formalDerivativePolynumber pq
      p' = formalDerivativePolynumber p
      q' = formalDerivativePolynumber q
      rhs = addPolynumber (mulPolynumber p' q) (mulPolynumber p q')
  in property (derivPQ == rhs)
```
