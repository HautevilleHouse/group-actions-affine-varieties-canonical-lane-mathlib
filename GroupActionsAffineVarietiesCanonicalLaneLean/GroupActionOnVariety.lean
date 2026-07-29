import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure GroupActionOnVariety (G : Type) [Group G] (V : AffineVariety k) where
  action : G → V → V
  identity : ∀ x, action 1 x = x
  compatibility : ∀ g h x, action (g * h) x = action g (action h x)

def GroupActionOnVarietyClosed (G : Type) [Group G] (V : AffineVariety k) (act : GroupActionOnVariety G V) : Prop :=
  (∀ x, act.identity x) ∧ (∀ g h x, act.compatibility g h x)

theorem group_action_on_variety_closed (G : Type) [Group G] (V : AffineVariety k) (act : GroupActionOnVariety G V) : GroupActionOnVarietyClosed G V act := by
  exact ⟨act.identity, act.compatibility⟩

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse