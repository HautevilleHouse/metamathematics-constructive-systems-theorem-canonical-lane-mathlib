import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure GödelNumbering where
  formulaEncoding : ConstructiveFormalSystem.formulas → ℕ
  proofEncoding : ConstructiveFormalSystem.proofs → ℕ
  encodingInjective : Prop
  enumerationComplete : Prop

structure GödelNumberingEvidence (G : GödelNumbering) where
  encodingInjectiveClosed : G.encodingInjective
  enumerationCompleteClosed : G.enumerationComplete

def GödelNumberingClosed (G : GödelNumbering) : Prop :=
  G.encodingInjective ∧ G.enumerationComplete

theorem gödel_numbering_closed_from_evidence (G : GödelNumbering) (E : GödelNumberingEvidence G) : GödelNumberingClosed G := by
  exact And.intro E.encodingInjectiveClosed E.enumerationCompleteClosed

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse
