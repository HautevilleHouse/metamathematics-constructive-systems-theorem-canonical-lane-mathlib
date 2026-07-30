import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure SelfReferenceLemma where
  fixedPointFormula : ConstructiveFormalSystem.formulas
  equivalenceProof : ConstructiveFormalSystem.proofs
  selfReferenceProperty : Prop

structure SelfReferenceEvidence (S : SelfReferenceLemma) where
  fixedPointFormulaClosed : S.fixedPointFormula
  equivalenceProofClosed : S.equivalenceProof
  selfReferencePropertyClosed : S.selfReferenceProperty

def SelfReferenceClosed (S : SelfReferenceLemma) : Prop :=
  S.fixedPointFormula ∧ S.equivalenceProof ∧ S.selfReferenceProperty

theorem self_reference_closed_from_evidence (S : SelfReferenceLemma) (E : SelfReferenceEvidence S) : SelfReferenceClosed S := by
  exact And.intro E.fixedPointFormulaClosed (And.intro E.equivalenceProofClosed E.selfReferencePropertyClosed)

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse
