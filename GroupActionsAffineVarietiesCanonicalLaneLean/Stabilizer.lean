import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure Orbit (G : Type u) [Group G] (X : Type v) (ρ : MulAction G X) (x : X) where
  elements : Set X
  orbitProperty : elements = { y : X | ∃ (g : G), ρ.act g x = y }

structure Stabilizer (G : Type u) [Group G] (X : Type v) (ρ : MulAction G X) (x : X) where
  subgroup : Subgroup G
  stabilizerProperty : subgroup = { g : G | ρ.act g x = x }

theorem orbit_stabilizer (G : Type u) [Group G] (X : Type v) [MulAction G X] (x : X) :
    Fintype.card (Orbit G X x) * Fintype.card (Stabilizer G X x) = Fintype.card G := by
  sorry

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse