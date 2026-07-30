import MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean.ConstructiveAdmissibleClass

/-!
# Proof Extraction Package
-/

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheorem

structure ProofExtractionPackage {C : ConstructiveAdmissibleClass} where
  extractionProcedure : Type u
  extractedWitness : Type v
  extractionSoundness : Prop
  extractionTermination : Prop
  programExtractionFromProof : Prop

structure ProofExtractionEvidence {C : ConstructiveAdmissibleClass}
    (E : ProofExtractionPackage C) where
  extractionSoundnessClosed : E.extractionSoundness
  extractionTerminationClosed : E.extractionTermination
  programExtractionFromProofClosed : E.programExtractionFromProof

def ProofExtractionClosed {C : ConstructiveAdmissibleClass}
    (E : ProofExtractionPackage C) : Prop :=
  E.extractionSoundness ∧ E.extractionTermination ∧ E.programExtractionFromProof

theorem proof_extraction_closed_from_evidence
    {C : ConstructiveAdmissibleClass}
    (E : ProofExtractionPackage C) (Ev : ProofExtractionEvidence E) :
    ProofExtractionClosed E := by
  exact And.intro Ev.extractionSoundnessClosed
    (And.intro Ev.extractionTerminationClosed Ev.programExtractionFromProofClosed)

end MetamathematicsConstructiveSystemsTheorem
end HautevilleHouse