# 🧮 Product and Chain Rules via Algebraic Infinitesimals

> **Student Guide to Purely Algebraic Calculus (FMP 22c)**
>
> Leibniz's product rule $(PQ)' = P'Q + PQ'$ and the chain rule $(P \circ Q)' = (P' \circ Q)Q'$ are proven algebraically from nilpotency ($\varepsilon^2 = 0$) alone.

---

```idris
module Product_And_Chain_Rules

import QuickCheck
import Math.BoxInt
import Math.Multiset
import Math.DualComplex
import Math.Infinitesimal

%default total
```

## 1. 📐 Product Rule Verification

```idris
||| Verifies algebraic product rule for PolyNumbers P and Q
public export
prop_productRuleAlgebraic : Property
prop_productRuleAlgebraic =
  let p = AddM 0 3 (AddM 1 2 ZeroM) -- 3 + 2α
      q = AddM 1 1 (AddM 2 1 ZeroM) -- α + α²
      pq = mulPoly p q
      derivPQ = derivePoly pq
      p' = derivePoly p
      q' = derivePoly q
      rhs = addMultiset (mulPoly p' q) (mulPoly p q')
  in property (annihilateMultiset derivPQ == annihilateMultiset rhs)
```
