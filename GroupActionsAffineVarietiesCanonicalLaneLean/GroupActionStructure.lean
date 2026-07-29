import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure GroupActionOnAffineVariety where
  group : Type u
  variety : Type v
  action : group → variety → variety
  regularAction : Prop
  closedOrbits : Prop
  quotientExists : Prop
  conclusion : closedOrbits ∧ quotientExists

structure AdmittedObject where
  actionData : GroupActionOnAffineVariety
  actionDataClosed : actionData.regularAction
  conclusion : actionData.conclusion

def AdmittedWitnessClosed (O : AdmittedObject) : Prop :=
  O.actionData.conclusion.1 ∧ O.actionData.conclusion.2

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse