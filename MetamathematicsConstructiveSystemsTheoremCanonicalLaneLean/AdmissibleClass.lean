import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : MetamathematicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MetamathematicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse