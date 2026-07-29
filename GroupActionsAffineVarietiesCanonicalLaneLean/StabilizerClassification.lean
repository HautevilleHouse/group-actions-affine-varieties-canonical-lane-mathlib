---
---

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure StabilizerClassification (G : Type) [Group G] (V : AffineVariety) (act : GroupAction G V) where
  finiteManyOrbits : Prop
  orbitTypes : List (Set G)
  genericStabilizer : Set G

def principalOrbitType (G : Type) [Group G] (V : AffineVariety) (act : GroupAction G V) : StabilizerClassification G V act := by
  sorry

theorem principal_orbit_type_exists (G : Type) [Group G] (V : AffineVariety) (act : GroupAction G V) [Reductive G] : ∃ (H : Set G) (isClosed : IsClosedSubgroup H), True := by
  sorry

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse