import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure ConstructiveEvidence where
  proofTerm : Type u
  extractabilityCondition : Prop
  extractabilityWitness : extractabilityCondition

def ConstructiveEvidenceClosed (E : ConstructiveEvidence) : Prop :=
  E.extractabilityCondition

theorem constructive_evidence_closed_from_evidence (E : ConstructiveEvidence) :
    ConstructiveEvidenceClosed E := by
  exact E.extractabilityWitness

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse
