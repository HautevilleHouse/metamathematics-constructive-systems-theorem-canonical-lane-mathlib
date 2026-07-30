import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure ConstructiveRealizabilityPackage where
  realizabilityRelation : Type u
  truthValues : Type v
  realizerFunction : Type w
  realizerForEachTheorem : Prop
  realizerClosedUnderRules : Prop

structure ConstructiveRealizabilityEvidence (R : ConstructiveRealizabilityPackage) where
  realizerForEachTheoremClosed : R.realizerForEachTheorem
  realizerClosedUnderRulesClosed : R.realizerClosedUnderRules

def ConstructiveRealizabilityClosed (R : ConstructiveRealizabilityPackage) : Prop :=
  R.realizerForEachTheorem ∧ R.realizerClosedUnderRules

theorem constructive_realizability_closed_from_evidence
    (R : ConstructiveRealizabilityPackage)
    (E : ConstructiveRealizabilityEvidence R) : ConstructiveRealizabilityClosed R := by
  exact And.intro E.realizerForEachTheoremClosed E.realizerClosedUnderRulesClosed

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse