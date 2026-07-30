import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure ProofIrrelevanceSystem where
  proposition : Type u
  proof : proposition → Type v
  proofIrrelevance : ∀ (P : proposition) (p q : proof P), p = q
  soundness : ∀ (P : proposition), proof P → P
  completeness : ∀ (P : proposition), P → proof P

structure ProofIrrelevanceEvidence (S : ProofIrrelevanceSystem) where
  proofIrrelevanceClosed : S.proofIrrelevance
  soundnessClosed : S.soundness
  completenessClosed : S.completeness

def ProofIrrelevanceClosed (S : ProofIrrelevanceSystem) : Prop :=
  S.proofIrrelevance ∧ S.soundness ∧ S.completeness

theorem proof_irrelevance_closed_from_evidence (S : ProofIrrelevanceSystem) (E : ProofIrrelevanceEvidence S) : ProofIrrelevanceClosed S := by
  exact And.intro E.proofIrrelevanceClosed (And.intro E.soundnessClosed E.completenessClosed)

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse