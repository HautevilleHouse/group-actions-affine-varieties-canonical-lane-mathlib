import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsAffineVarietiesCanonicalLaneLean.LunaSliceTheorem

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure SubgroupReductivePackage {k : Type} [Field k] [CharZero k] {G : Type} [AffineAlgebraicGroup k G] where
  subgroup : Subgroup G
  reductiveCondition : IsReductive subgroup

def SubgroupReductivePackageClosed {k : Type} [Field k] [CharZero k] {G : Type} [AffineAlgebraicGroup k G]
  (S : SubgroupReductivePackage k G) : Prop :=
  S.reductiveCondition

structure MatsushimaTheoremPackage {k : Type} [Field k] [CharZero k] {G : Type} [AffineAlgebraicGroup k G]
  {V : AffineVariety k} {A : AlgebraicGroupAction k G V} (L : LunaSlicePackage A) where
  homogeneousSpace : V.carrier ≅ G / H for some H : SubgroupReductivePackage k G
  orbitClosureEquivalence : ∀ (x : V.carrier), IsClosed (orbit G x) ↔ H is reductive

def MatsushimaTheoremPackageClosed {k : Type} [Field k] [CharZero k] {G : Type} [AffineAlgebraicGroup k G]
  {V : AffineVariety k} {A : AlgebraicGroupAction k G V} {L : LunaSlicePackage A}
  (M : MatsushimaTheoremPackage L) : Prop :=
  M.orbitClosureEquivalence

structure MatsushimaTheoremPackageEvidence {k : Type} [Field k] [CharZero k] {G : Type} [AffineAlgebraicGroup k G]
  {V : AffineVariety k} {A : AlgebraicGroupAction k G V} {L : LunaSlicePackage A}
  (M : MatsushimaTheoremPackage L) where
  orbitClosureEquivalenceClosed : M.orbitClosureEquivalence

theorem matushima_theorem_closed_from_evidence {k : Type} [Field k] [CharZero k] {G : Type} [AffineAlgebraicGroup k G]
  {V : AffineVariety k} {A : AlgebraicGroupAction k G V} {L : LunaSlicePackage A}
  (M : MatsushimaTheoremPackage L) (E : MatsushimaTheoremPackageEvidence M) :
  MatsushimaTheoremPackageClosed M := by
  exact E.orbitClosureEquivalenceClosed

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse