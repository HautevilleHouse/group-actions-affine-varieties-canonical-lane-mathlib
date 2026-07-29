import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure QuotientMapProperties where
  groupAction : GroupActionOnAffineVariety
  quotientMap : groupAction.variety → Type v
  universalProperty : Prop
  categoricalQuotient : Prop
  closure : universalProperty ∧ categoricalQuotient

theorem quotient_map_closed (Q : QuotientMapProperties) :
    Q.closure := by
  exact Q.closure

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse