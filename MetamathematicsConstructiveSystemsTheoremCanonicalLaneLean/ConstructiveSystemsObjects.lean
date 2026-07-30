import MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheorem

structure ConstructiveProofSpace where
  carrier : Type
  proofStructure : Prop

structure ConstructiveAdmittedObject where
  space : ConstructiveProofSpace
  consistencyProperty : Prop
  computationalAdequacy : Prop
  proofExtraction : Prop
  constructiveEmbedding : Prop
  conclusion : constructiveEmbedding

structure ConstructiveEndgameState where
  object : ConstructiveAdmittedObject

def ConstructiveWitnessClosed (O : ConstructiveAdmittedObject) : Prop :=
  O.constructiveEmbedding

end MetamathematicsConstructiveSystemsTheorem
end HautevilleHouse