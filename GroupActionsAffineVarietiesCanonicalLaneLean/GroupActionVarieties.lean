import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure AffineVariety (k : Type) [Field k] where
  carrier : Set (k ^ n)
  polynomialRing : Type
  definingIdeal : Ideal polynomialRing
  zeroSetCondition : carrier = zeroLocus definingIdeal

structure AlgebraicGroupAction (k : Type) [Field k] (G : Type) [Group G] (V : AffineVariety k) where
  actionMap : G → V.carrier → V.carrier
  identityAction : ∀ x : V.carrier, actionMap 1 x = x
  compatibility : ∀ (g h : G) (x : V.carrier), actionMap (g * h) x = actionMap g (actionMap h x)
  morphismCondition : IsMorphism actionMap

structure AdmissibleClass extends AlgebraicGroupAction ℂ (ℂ*) ℂᵐᵒⁿᵒⁱᵈ where
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  AlgebraicGroupActionClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse