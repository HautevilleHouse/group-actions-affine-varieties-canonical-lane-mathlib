---
---

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

def AdmissibleActionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem admissible_action_endgame (A : AdmissibleClass) :
    AdmissibleActionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse