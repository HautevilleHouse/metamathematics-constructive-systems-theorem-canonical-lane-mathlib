import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure ConstructiveFormalSystem where
  language : Type u
  formulas : Type v
  proofs : Type w
  axiomSet : formulas
  inferenceRules : List (formulas → formulas)
  consistencyCondition : Prop

structure ConstructiveFormalSystemEvidence (F : ConstructiveFormalSystem) where
  axiomSetClosed : F.axiomSet
  inferenceRulesClosed : F.inferenceRules
  consistencyConditionClosed : F.consistencyCondition

def ConstructiveFormalSystemClosed (F : ConstructiveFormalSystem) : Prop :=
  F.axiomSet ∧ F.inferenceRules ≠ [] ∧ F.consistencyCondition

theorem constructive_formal_system_closed_from_evidence (F : ConstructiveFormalSystem) (E : ConstructiveFormalSystemEvidence F) : ConstructiveFormalSystemClosed F := by
  exact And.intro E.axiomSetClosed (And.intro (by
    have : F.inferenceRules ≠ [] := by
      intro h
      have : F.inferenceRules = [] := h
      have : F.inferenceRules = E.inferenceRulesClosed := rfl
      exact E.inferenceRulesClosed (by
        intro h'
        exact h')
    exact this) E.consistencyConditionClosed)

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse
