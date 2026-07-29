import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsAffineVarietiesCanonicalLaneLean.GeometricQuotientPackage

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure LunaSlicePackage {k : Type} [Field k] [CharZero k] {G : Type} [Group G] [AffineAlgebraicGroup k G]
  {V : AffineVariety k} {A : AlgebraicGroupAction k G V} (Q : GeometricQuotientPackage A) where
  point : V.carrier
  slice : Set V.carrier
  stabilizerSliceAction : AlgebraicGroupAction k (stabilizer G point) (AffineVarietyWithPoint V point)
  sliceEtale : EtaleMorphism (slice → quotientStabilizer)
  mainTheorem : ∃ neighborhood U of point.orbit, U ≅ (G ×^stabilizer slice) / stabilizer

def LunaSlicePackageClosed {k : Type} [Field k] [CharZero k] {G : Type} [Group G] [AffineAlgebraicGroup k G]
  {V : AffineVariety k} {A : AlgebraicGroupAction k G V} {Q : GeometricQuotientPackage A}
  (L : LunaSlicePackage Q) : Prop :=
  L.sliceEtale ∧ L.mainTheorem

structure LunaSlicePackageEvidence {k : Type} [Field k] [CharZero k] {G : Type} [Group G] [AffineAlgebraicGroup k G]
  {V : AffineVariety k} {A : AlgebraicGroupAction k G V} {Q : GeometricQuotientPackage A}
  (L : LunaSlicePackage Q) where
  sliceEtaleClosed : L.sliceEtale
  mainTheoremClosed : L.mainTheorem

theorem luna_slice_closed_from_evidence {k : Type} [Field k] [CharZero k] {G : Type} [Group G] [AffineAlgebraicGroup k G]
  {V : AffineVariety k} {A : AlgebraicGroupAction k G V} {Q : GeometricQuotientPackage A}
  (L : LunaSlicePackage Q) (E : LunaSlicePackageEvidence L) : LunaSlicePackageClosed L := by
  exact And.intro E.sliceEtaleClosed E.mainTheoremClosed

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse