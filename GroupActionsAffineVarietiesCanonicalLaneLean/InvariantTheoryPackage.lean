import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsAffineVarietiesCanonicalLaneLean.GroupActionVarieties

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure InvariantRingPackage {k : Type} [Field k] {G : Type} [Group G] {V : AffineVariety k}
  (A : AlgebraicGroupAction k G V) where
  ring : Type
  finitelyGenerated : Prop
  separatesOrbits : Prop
  ringOfInvariants : subringOf (polynomialRing V)

def InvariantRingPackageClosed {k : Type} [Field k] {G : Type} [Group G] {V : AffineVariety k}
  {A : AlgebraicGroupAction k G V} (I : InvariantRingPackage A) : Prop :=
  I.finitelyGenerated ∧ I.separatesOrbits

structure InvariantRingPackageEvidence {k : Type} [Field k] {G : Type} [Group G] {V : AffineVariety k}
  {A : AlgebraicGroupAction k G V} (I : InvariantRingPackage A) where
  finitelyGeneratedClosed : I.finitelyGenerated
  separatesOrbitsClosed : I.separatesOrbits

theorem invariant_ring_closed_from_evidence {k : Type} [Field k] {G : Type} [Group G] {V : AffineVariety k}
  {A : AlgebraicGroupAction k G V} (I : InvariantRingPackage A) (E : InvariantRingPackageEvidence I) :
  InvariantRingPackageClosed I := by
  exact And.intro E.finitelyGeneratedClosed E.separatesOrbitsClosed

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse