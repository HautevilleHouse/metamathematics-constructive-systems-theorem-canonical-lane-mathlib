import MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean.ProofExtractionPackage

/-!
# Realizability Models Package
-/

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheorem

structure RealizabilityModelsPackage {C : ConstructiveAdmissibleClass}
    (E : ProofExtractionPackage C) where
  realizabilityStructure : Type u
  realizabilityTriple : Type v
  realizabilitySoundness : Prop
  uniformizationPrinciple : Prop
  logicalConsistencyWitness : Prop

structure RealizabilityModelsEvidence {C : ConstructiveAdmissibleClass}
    {E : ProofExtractionPackage C} (R : RealizabilityModelsPackage E) where
  realizabilitySoundnessClosed : R.realizabilitySoundness
  uniformizationPrincipleClosed : R.uniformizationPrinciple
  logicalConsistencyWitnessClosed : R.logicalConsistencyWitness

def RealizabilityModelsClosed {C : ConstructiveAdmissibleClass}
    {E : ProofExtractionPackage C} (R : RealizabilityModelsPackage E) : Prop :=
  R.realizabilitySoundness ∧ R.uniformizationPrinciple ∧ R.logicalConsistencyWitness

theorem realizability_models_closed_from_evidence
    {C : ConstructiveAdmissibleClass} {E : ProofExtractionPackage C}
    (R : RealizabilityModelsPackage E) (Ev : RealizabilityModelsEvidence R) :
    RealizabilityModelsClosed R := by
  exact And.intro Ev.realizabilitySoundnessClosed
    (And.intro Ev.uniformizationPrincipleClosed Ev.logicalConsistencyWitnessClosed)

end MetamathematicsConstructiveSystemsTheorem
end HautevilleHouse