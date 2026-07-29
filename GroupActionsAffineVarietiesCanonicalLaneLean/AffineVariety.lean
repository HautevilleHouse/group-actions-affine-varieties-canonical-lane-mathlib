---
---

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure AffineVariety where
  carrier : Set (ℂ^n)
  definingPolynomials : List (Polynomial ℂ)
  reduced : Prop
  irreducible : Prop
  dimension : ℕ

def affineSpace : ℕ → Type := fun n => ℂ^n

theorem affine_variety_closed_under_ideal (V : AffineVariety) :
    IdealOfVanishing V.carrier = rad (Ideal.generated V.definingPolynomials) := by
  sorry

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse