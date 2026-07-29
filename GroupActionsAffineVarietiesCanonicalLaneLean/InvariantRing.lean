---
---

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure InvariantRing (G : Type) [Group G] (V : AffineVariety) (act : GroupAction G V) where
  ring : Type
  isSubring : IsSubring ring (PolynomialRing ℂ (dimension V))
  invariantCondition : ∀ f : ring, ∀ g : G, ∀ x : V.carrier, f (act.action g x) = f x

def invariantRing (G : Type) [Group G] (V : AffineVariety) (act : GroupAction G V) : InvariantRing G V act := by
  sorry

theorem finiteness_of_invariant_ring_for_reductive_groups (G : Type) [Group G] [Reductive G] (V : AffineVariety) (act : GroupAction G V) : IsFiniteGenerated (invariantRing G V act).ring := by
  sorry

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse