import canonicalLaneMathlib.MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure ConstructiveSystemsEvidence (A : AdmissibleClass) where
  bridgeProof : bridgeClosed A
  gateProof : gateClosed A

def ConstructiveSystemsClosed (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constructive_systems_closed_from_evidence (A : AdmissibleClass)
    (E : ConstructiveSystemsEvidence A) : ConstructiveSystemsClosed A := by
  exact And.intro E.bridgeProof E.gateProof

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse