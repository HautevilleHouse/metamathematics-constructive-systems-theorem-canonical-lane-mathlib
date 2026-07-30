import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure ReducibilityInterpretation where
  sourceSystem : Type u
  targetSystem : Type v
  reductionMap : sourceSystem → targetSystem
  preservationTheorems : Prop
  soundnessWitness : preservationTheorems

def ReducibilityInterpretationClosed (R : ReducibilityInterpretation) : Prop :=
  R.preservationTheorems

theorem reducibility_interpretation_closed_from_evidence (R : ReducibilityInterpretation) :
    ReducibilityInterpretationClosed R := by
  exact R.soundnessWitness

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse
