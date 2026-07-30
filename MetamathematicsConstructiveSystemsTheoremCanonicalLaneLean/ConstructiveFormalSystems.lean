import canonicalLaneMathlib.MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean.ConstructiveSystemsEvidence

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure ConstructiveFormalSystem (A : AdmissibleClass) where
  languageDefined : Prop
  deductionRules : Prop
  consistencyProof : Prop
  completenessProof : Prop
  languageDefinedClosed : languageDefined
  deductionRulesClosed : deductionRules
  consistencyProofClosed : consistencyProof
  completenessProofClosed : completenessProof
  evidence : ConstructiveSystemsEvidence A

def FormalSystemClosed (F : ConstructiveFormalSystem A) : Prop :=
  F.languageDefined ∧ F.deductionRules ∧ F.consistencyProof ∧ F.completenessProof

theorem formal_system_closed_from_evidence (F : ConstructiveFormalSystem A) : FormalSystemClosed F := by
  exact And.intro F.languageDefinedClosed
    (And.intro F.deductionRulesClosed
      (And.intro F.consistencyProofClosed F.completenessProofClosed))

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse