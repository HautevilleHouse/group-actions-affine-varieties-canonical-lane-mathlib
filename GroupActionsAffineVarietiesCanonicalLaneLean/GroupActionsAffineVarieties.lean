import CanonicalLaneMathlib.AdmissibleClass

/-!
# Group Actions on Affine Varieties Package

This module defines the domain-specific structures for group actions on affine varieties
within the admissible-class bridge framework.
-/

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure AffineVariety where
  carrier : Type u
  topology : TopologicalSpace carrier
  sheaf : Type v
  affineCover : Prop
  irreducible : Prop
  reduced : Prop

definition affineVarietyClosed (V : AffineVariety) : Prop :=
  V.affineCover ∧ V.irreducible ∧ V.reduced

structure AlgebraicGroup where
  carrier : Type u
  groupStructure : Group carrier
  topology : TopologicalSpace carrier
  algebraicStructure : Prop
  multiplicationMorphism : Prop
  inverseMorphism : Prop

definition algebraicGroupClosed (G : AlgebraicGroup) : Prop :=
  G.algebraicStructure ∧ G.multiplicationMorphism ∧ G.inverseMorphism

structure GroupAction where
  group : AlgebraicGroup
  variety : AffineVariety
  actionMap : group.carrier → variety.carrier → variety.carrier
  continuousAction : Prop
  algebraicAction : Prop
  equivariance : Prop

definition groupActionClosed (A : GroupAction) : Prop :=
  A.continuousAction ∧ A.algebraicAction ∧ A.equivariance

structure Orbit (A : GroupAction) (x : A.variety.carrier) where
  elements : Set A.variety.carrier
  orbitClosure : Prop
  stabilizer : Subgroup A.group.carrier
  orbitType : Prop

definition orbitClosed (A : GroupAction) (x : A.variety.carrier) (O : Orbit A x) : Prop :=
  O.orbitClosure ∧ O.orbitType

structure InvariantRing (A : GroupAction) where
  ring : Type u
  ringStructure : CommRing ring
  inclusion : ring → A.variety.sheaf
  invariantCondition : ∀ (f : ring) (g : A.group.carrier) (x : A.variety.carrier), 
    A.actionMap g x = x → inclusion f x = inclusion f (A.actionMap g x)

definition invariantRingClosed (A : GroupAction) (R : InvariantRing A) : Prop :=
  R.invariantCondition

structure QuotientVariety (A : GroupAction) where
  quotientSpace : Type u
  topology : TopologicalSpace quotientSpace
  sheaf : Type v
  quotientMap : A.variety.carrier → quotientSpace
  universalProperty : Prop
  goodQuotient : Prop
  geometricQuotient : Prop

definition quotientVarietyClosed (A : GroupAction) (Q : QuotientVariety A) : Prop :=
  Q.universalProperty ∧ Q.goodQuotient ∧ Q.geometricQuotient

structure AdmissibleGroupAction (A : AdmissibleClass) where
  groupAction : GroupAction
  varietyClosed : affineVarietyClosed groupAction.variety
  groupClosed : algebraicGroupClosed groupAction.group
  actionClosed : groupActionClosed groupAction.groupAction
  quotient : QuotientVariety groupAction.groupAction
  quotientClosed : quotientVarietyClosed groupAction.groupAction quotient
  invariantRing : InvariantRing groupAction.groupAction
  invariantRingClosed : invariantRingClosed groupAction.groupAction invariantRing

definition admissibleGroupActionClosed (A : AdmissibleClass) (AGA : AdmissibleGroupAction A) : Prop :=
  AGA.varietyClosed ∧ AGA.groupClosed ∧ AGA.actionClosed ∧ AGA.quotientClosed ∧ AGA.invariantRingClosed

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse