import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure RealizabilityStructure where
  baseCategory : Type u
  assembly : Type v
  realizabilityRelation : assembly → Prop → Prop
  realizersExistence : Prop
  naturalityCondition : Prop

structure RealizabilityEvidence (R : RealizabilityStructure) where
  realizabilityRelationClosed : R.realizabilityRelation
  realizersExistenceClosed : R.realizersExistence
  naturalityConditionClosed : R.naturalityCondition

def RealizabilityClosed (R : RealizabilityStructure) : Prop :=
  R.realizabilityRelation ∧ R.realizersExistence ∧ R.naturalityCondition

theorem realizability_closed_from_evidence (R : RealizabilityStructure) (E : RealizabilityEvidence R) : RealizabilityClosed R := by
  exact And.intro E.realizabilityRelationClosed (And.intro E.realizersExistenceClosed E.naturalityConditionClosed)

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse
