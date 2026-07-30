import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure ProofInterpretation where
  sourceSystem : ConstructiveFormalSystem
  targetSystem : ConstructiveFormalSystem
  interpretationMap : sourceSystem.formulas → targetSystem.formulas
  soundness : Prop
  faithfulness : Prop

def ProofInterpretationClosed (I : ProofInterpretation) : Prop :=
  I.soundness ∧ I.faithfulness

structure ProofInterpretationEvidence (I : ProofInterpretation) where
  soundnessClosed : I.soundness
  faithfulnessClosed : I.faithfulness

theorem proof_interpretation_closed_from_evidence (I : ProofInterpretation) (E : ProofInterpretationEvidence I) : ProofInterpretationClosed I := by
  exact And.intro E.soundnessClosed E.faithfulnessClosed

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse
