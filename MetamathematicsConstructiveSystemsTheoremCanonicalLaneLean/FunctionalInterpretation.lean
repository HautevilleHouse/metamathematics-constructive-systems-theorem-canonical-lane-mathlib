import MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean.RealizabilityModels

/-!
# Functional Interpretation Package (Gödel's Dialectica)
-/

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheorem

structure FunctionalInterpretationPackage {C : ConstructiveAdmissibleClass}
    {E : ProofExtractionPackage C} {R : RealizabilityModelsPackage E} where
  interpretationMap : Type u
  translationSoundness : Prop
  typeLevelEncoding : Prop
  higherOrderReduction : Prop
  witnessExtractionViaInterpretation : Prop

structure FunctionalInterpretationEvidence {C : ConstructiveAdmissibleClass}
    {E : ProofExtractionPackage C} {R : RealizabilityModelsPackage E}
    (I : FunctionalInterpretationPackage C E R) where
  translationSoundnessClosed : I.translationSoundness
  typeLevelEncodingClosed : I.typeLevelEncoding
  higherOrderReductionClosed : I.higherOrderReduction
  witnessExtractionViaInterpretationClosed : I.witnessExtractionViaInterpretation

def FunctionalInterpretationClosed {C : ConstructiveAdmissibleClass}
    {E : ProofExtractionPackage C} {R : RealizabilityModelsPackage E}
    (I : FunctionalInterpretationPackage C E R) : Prop :=
  I.translationSoundness ∧ I.typeLevelEncoding ∧ I.higherOrderReduction ∧ I.witnessExtractionViaInterpretation

theorem functional_interpretation_closed_from_evidence
    {C : ConstructiveAdmissibleClass} {E : ProofExtractionPackage C}
    {R : RealizabilityModelsPackage E} (I : FunctionalInterpretationPackage C E R)
    (Ev : FunctionalInterpretationEvidence I) : FunctionalInterpretationClosed I := by
  exact And.intro Ev.translationSoundnessClosed
    (And.intro Ev.typeLevelEncodingClosed
      (And.intro Ev.higherOrderReductionClosed Ev.witnessExtractionViaInterpretationClosed))

end MetamathematicsConstructiveSystemsTheorem
end HautevilleHouse