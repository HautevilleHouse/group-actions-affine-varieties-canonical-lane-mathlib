import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsAffineVarietiesCanonicalLaneLean

structure AffineVariety (k : Type) [Field k] where
  carrier : Set (k^n)
  polynomial_ideal : Ideal (k[X1,…,Xn])
  carrier_eq_zero_set : carrier = { x | ∀ f ∈ polynomial_ideal, f x = 0 }

def AffineVarietyClosed (k : Type) [Field k] (V : AffineVariety k) : Prop :=
  V.carrier = { x | ∀ f ∈ V.polynomial_ideal, f x = 0 }

theorem affine_variety_closed (k : Type) [Field k] (V : AffineVariety k) : AffineVarietyClosed V := by
  exact V.carrier_eq_zero_set

end GroupActionsAffineVarietiesCanonicalLaneLean
end HautevilleHouse