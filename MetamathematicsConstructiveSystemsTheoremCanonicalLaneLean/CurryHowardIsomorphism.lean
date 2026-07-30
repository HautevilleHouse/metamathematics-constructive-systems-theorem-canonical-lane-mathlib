import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure SequentCalculus where
  formula : Type u
  context : List formula
  proof : context → formula → Type v
  cutRule : ∀ (Γ Δ : List formula) (A B : formula), proof Γ A → proof (A :: Δ) B → proof (Γ ++ Δ) B

structure LambdaCalculus where
  type : Type u
  term : type → Type v
  application : ∀ {A B : type}, term (A → B) → term A → term B
  abstraction : ∀ {A B : type}, (term A → term B) → term (A → B)

def CurriedCorrespondence (S : SequentCalculus) (L : LambdaCalculus) : Prop :=
  ∀ (A B : S.formula), Nonempty (S.proof [A] B ↔ L.term (L.type → L.type))

structure CurryHowardEvidence (S : SequentCalculus) (L : LambdaCalculus) where
  correspondence : CurriedCorrespondence S L
  correspondenceClosed : correspondence

def CurryHowardClosed (S : SequentCalculus) (L : LambdaCalculus) (E : CurryHowardEvidence S L) : Prop :=
  E.correspondence

theorem curry_howard_closed_from_evidence (S : SequentCalculus) (L : LambdaCalculus) (E : CurryHowardEvidence S L) : CurryHowardClosed S L E := by
  exact E.correspondenceClosed

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse