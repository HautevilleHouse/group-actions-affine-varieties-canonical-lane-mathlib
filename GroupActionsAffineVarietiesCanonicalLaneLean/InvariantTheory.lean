import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure InvariantRingStructure where
  groupAction : GroupActionOnAffineVariety
  ringOfInvariants : Type w
  finitelyGenerated : Prop
  separationProperty : Prop
  closure : finitelyGenerated ∧ separationProperty

theorem invariant_ring_closed (I : InvariantRingStructure) :
    I.closure := by
  exact I.closure

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse