import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure KripkeFrame where
  world : Type u
  preorder : world → world → Prop
  preorderReflexive : ∀ (w : world), preorder w w
  preorderTransitive : ∀ (u v w : world), preorder u v → preorder v w → preorder u w

structure KripkeModel (F : KripkeFrame) where
  valuation : F.world → String → Prop
  monotonicity : ∀ (w v : F.world), F.preorder w v → ∀ (p : String), valuation w p → valuation v p

def KripkeSatisfaction (F : KripkeFrame) (M : KripkeModel F) (w : F.world) (φ : String) : Prop :=
  M.valuation w φ

theorem kripke_monotonicity_preserved (F : KripkeFrame) (M : KripkeModel F) (w v : F.world) (h : F.preorder w v) (φ : String) (hφ : KripkeSatisfaction F M w φ) : KripkeSatisfaction F M v φ := by
  exact M.monotonicity w v h φ hφ

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse