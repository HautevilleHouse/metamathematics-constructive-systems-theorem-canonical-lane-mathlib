import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure TermSystem where
  term : Type u
  reduction : term → term → Prop
  normalForm : term → Prop
  reductionReflexive : ∀ (t : term), reduction t t
  reductionTransitive : ∀ (t u v : term), reduction t u → reduction u v → reduction t v
  normalFormIrreducible : ∀ (t u : term), normalForm t → ¬ reduction t u

structure NormalizationProof (S : TermSystem) where
  strongNormalization : ∀ (t : S.term), ∃ (n : ℕ), ∀ (seq : ℕ → S.term), seq 0 = t → (∀ i, S.reduction (seq i) (seq (i+1))) → ∃ i, S.normalForm (seq i)
  confluence : ∀ (t u v : S.term), S.reduction t u → S.reduction t v → ∃ w, S.reduction u w ∧ S.reduction v w
  strongNormalizationClosed : strongNormalization
  confluenceClosed : confluence

def NormalizationClosed (S : TermSystem) (P : NormalizationProof S) : Prop :=
  P.strongNormalization ∧ P.confluence

theorem normalization_closed_from_proof (S : TermSystem) (P : NormalizationProof S) : NormalizationClosed S P := by
  exact And.intro P.strongNormalizationClosed P.confluenceClosed

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse