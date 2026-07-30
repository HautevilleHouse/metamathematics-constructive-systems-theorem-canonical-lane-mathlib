import MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean.FunctionalInterpretation

/-!
# Consistency Proof Package
-/

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheorem

structure ConsistencyProofPackage {C : ConstructiveAdmissibleClass}
    {E : ProofExtractionPackage C} {R : RealizabilityModelsPackage E}
    {I : FunctionalInterpretationPackage C E R} where
  consistencyStatement : Prop
  interpretationYieldsConsistency : Prop
  normalizationProcedure : Prop
  relativeConsistencyWithClassical : Prop
  noContradictionDerivable : Prop

structure ConsistencyProofEvidence {C : ConstructiveAdmissibleClass}
    {E : ProofExtractionPackage C} {R : RealizabilityModelsPackage E}
    {I : FunctionalInterpretationPackage C E R}
    (P : ConsistencyProofPackage C E R I) where
  consistencyStatementClosed : P.consistencyStatement
  interpretationYieldsConsistencyClosed : P.interpretationYieldsConsistency
  normalizationProcedureClosed : P.normalizationProcedure
  relativeConsistencyWithClassicalClosed : P.relativeConsistencyWithClassical
  noContradictionDerivableClosed : P.noContradictionDerivable

def ConsistencyProofClosed {C : ConstructiveAdmissibleClass}
    {E : ProofExtractionPackage C} {R : RealizabilityModelsPackage E}
    {I : FunctionalInterpretationPackage C E R}
    (P : ConsistencyProofPackage C E R I) : Prop :=
  P.consistencyStatement ∧ P.interpretationYieldsConsistency ∧ P.normalizationProcedure ∧
  P.relativeConsistencyWithClassical ∧ P.noContradictionDerivable

theorem consistency_proof_closed_from_evidence
    {C : ConstructiveAdmissibleClass} {E : ProofExtractionPackage C}
    {R : RealizabilityModelsPackage E} {I : FunctionalInterpretationPackage C E R}
    (P : ConsistencyProofPackage C E R I) (Ev : ConsistencyProofEvidence P) :
    ConsistencyProofClosed P := by
  exact And.intro Ev.consistencyStatementClosed
    (And.intro Ev.interpretationYieldsConsistencyClosed
      (And.intro Ev.normalizationProcedureClosed
        (And.intro Ev.relativeConsistencyWithClassicalClosed Ev.noContradictionDerivableClosed)))

end MetamathematicsConstructiveSystemsTheorem
end HautevilleHouse