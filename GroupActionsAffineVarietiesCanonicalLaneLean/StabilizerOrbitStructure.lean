import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure Stabilizer (G : Type) [Group G] (V : AffineVariety k) (x : V) where
  elements : Set G
  closed_under_group : ∀ g h, g ∈ elements → h ∈ elements → g * h ∈ elements

def orbit (G : Type) [Group G] (act : GroupActionOnVariety G V) (x : V) : Set V :=
  { act.action g x | g : G }

def StabilizerClosed (G : Type) [Group G] (V : AffineVariety k) (x : V) (S : Stabilizer G V x) : Prop :=
  ∀ g h, S.closed_under_group g h

theorem stabilizer_closed (G : Type) [Group G] (V : AffineVariety k) (x : V) (S : Stabilizer G V x) : StabilizerClosed G V x S := by
  exact S.closed_under_group

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse