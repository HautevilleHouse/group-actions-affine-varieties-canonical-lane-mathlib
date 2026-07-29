---
---

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure GroupAction (G : Type) [Group G] (V : AffineVariety) where
  action : G → V.carrier → V.carrier
  identityAct : ∀ x : V.carrier, action (1 : G) x = x
  compatible : ∀ (g h : G) (x : V.carrier), action (g * h) x = action g (action h x)
  polynomial : ∀ g : G, IsPolynomialMap (action g)

def orbit (G : Type) [Group G] {V : AffineVariety} (act : GroupAction G V) (x : V.carrier) : Set (V.carrier) := { y | ∃ g : G, act.action g x = y }

def stabilizer (G : Type) [Group G] {V : AffineVariety} (act : GroupAction G V) (x : V.carrier) : Set G := { g | act.action g x = x }

theorem stabilizer_is_subgroup (G : Type) [Group G] {V : AffineVariety} (act : GroupAction G V) (x : V.carrier) : IsSubgroup (stabilizer G act x) := by
  sorry

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse