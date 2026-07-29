---
---

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure QuotientVariety (G : Type) [Group G] (V : AffineVariety) (act : GroupAction G V) where
  quotientSet : Set (ℂ^k)
  quotientMap : V.carrier → quotientSet
  universalProperty : ∀ (W : AffineVariety) (f : V.carrier → W.carrier) (hf : ∀ (x : V.carrier) (g : G), f (act.action g x) = f x), ∃! (φ : quotientSet → W.carrier), φ ∘ quotientMap = f

def categoricalQuotient (G : Type) [Group G] (V : AffineVariety) (act : GroupAction G V) : QuotientVariety G V act := by
  sorry

theorem quotient_variety_is_affine (G : Type) [Group G] (V : AffineVariety) (act : GroupAction G V) : IsAffine (categoricalQuotient G V act).quotientSet := by
  sorry

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse