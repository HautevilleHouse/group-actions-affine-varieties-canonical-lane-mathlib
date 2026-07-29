import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure GroupActionMorphism (G H : Type) [Group G] [Group H] where
  map : G → H
  respects_mul : ∀ g1 g2, map (g1 * g2) = map g1 * map g2

def GroupActionMorphismClosed {G H : Type} [Group G] [Group H] (φ : GroupActionMorphism G H) : Prop :=
  ∀ g, φ.respects_mul g 1 ∧ φ.respects_mul 1 g

theorem group_action_morphism_closed (G H : Type) [Group G] [Group H] (φ : GroupActionMorphism G H) : GroupActionMorphismClosed φ := by
  intro g
  exact ⟨φ.respects_mul g 1, φ.respects_mul 1 g⟩

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse