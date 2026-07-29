import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure GeometricQuotient (G : Type u) [Group G] (X : AffineVariety k) (ρ : GroupAction G X) where
  quotientVariety : AffineVariety k
  quotientMap : AffineVarietyMorphism X quotientVariety
  invariant : ∀ (g : G) (x : X), quotientMap.map x = quotientMap.map (ρ.act g x)
  universality : ∀ (Y : AffineVariety k) (f : AffineVarietyMorphism X Y),
    (∀ (g : G) (x : X), f.map x = f.map (ρ.act g x)) →
    ∃! (g : AffineVarietyMorphism quotientVariety Y), f.map = g.map ∘ quotientMap.map

def quotientedByAction (G : Type u) [Group G] (X : AffineVariety k) (ρ : GroupAction G X) : GeometricQuotient G X ρ := sorry

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse