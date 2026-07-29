import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsAffineVarietiesCanonicalLaneLean.InvariantTheoryPackage

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure GeometricQuotientPackage {k : Type} [Field k] {G : Type} [Group G] {V : AffineVariety k}
  {A : AlgebraicGroupAction k G V} (I : InvariantRingPackage A) where
  quotientVariety : AffineVariety k
  quotientMap : V.carrier → quotientVariety.carrier
  universalProperty : ∀ (W : AffineVariety k) (f : V.carrier → W.carrier) (hf : IsMorphism f),
    (∀ (x y : V.carrier), ∃ g : G, A.actionMap g x = y → f x = f y) →
    ∃! fbar : quotientVariety.carrier → W.carrier, IsMorphism fbar ∧ fbar ∘ quotientMap = f
  goodQuotientCondition : IsMorphism quotientMap ∧ quotientMap surjective

def GeometricQuotientPackageClosed {k : Type} [Field k] {G : Type} [Group G] {V : AffineVariety k}
  {A : AlgebraicGroupAction k G V} {I : InvariantRingPackage A} (Q : GeometricQuotientPackage I) : Prop :=
  Q.goodQuotientCondition.1 ∧ Q.goodQuotientCondition.2 ∧ Q.universalProperty

structure GeometricQuotientPackageEvidence {k : Type} [Field k] {G : Type} [Group G] {V : AffineVariety k}
  {A : AlgebraicGroupAction k G V} {I : InvariantRingPackage A} (Q : GeometricQuotientPackage I) where
  quotientMapMorphism : IsMorphism Q.quotientMap
  quotientMapSurjective : Q.quotientMap surjective
  universalPropertyClosed : ∀ (W : AffineVariety k) (f : V.carrier → W.carrier) (hf : IsMorphism f),
    (∀ (x y : V.carrier), ∃ g : G, A.actionMap g x = y → f x = f y) →
    ∃! fbar : Q.quotientVariety.carrier → W.carrier, IsMorphism fbar ∧ fbar ∘ Q.quotientMap = f

theorem geometric_quotient_closed_from_evidence {k : Type} [Field k] {G : Type} [Group G] {V : AffineVariety k}
  {A : AlgebraicGroupAction k G V} {I : InvariantRingPackage A} (Q : GeometricQuotientPackage I)
  (E : GeometricQuotientPackageEvidence Q) : GeometricQuotientPackageClosed Q := by
  refine And.intro E.quotientMapMorphism (And.intro E.quotientMapSurjective ?_)
  exact E.universalPropertyClosed

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse