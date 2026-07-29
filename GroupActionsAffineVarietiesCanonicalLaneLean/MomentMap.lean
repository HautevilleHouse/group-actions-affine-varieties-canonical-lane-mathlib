import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure MomentMap where
  groupAction : GroupActionOnAffineVariety
  momentMap : groupAction.variety → Type u
  hamiltonianAction : Prop
  imageClosed : Prop
  closure : hamiltonianAction ∧ imageClosed

theorem moment_map_closed (M : MomentMap) :
    M.closure := by
  exact M.closure

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse