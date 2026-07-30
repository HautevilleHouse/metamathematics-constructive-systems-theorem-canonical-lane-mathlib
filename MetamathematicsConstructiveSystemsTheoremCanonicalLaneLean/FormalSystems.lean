import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure FormalSystemsPackage where
  axiomSystem : Type u
  deductionRules : Type v
  consistencyProof : Prop
  completenessProperty : Prop
  decidableCheck : Prop

structure FormalSystemsEvidence (F : FormalSystemsPackage) where
  consistencyProofClosed : F.consistencyProof
  completenessPropertyClosed : F.completenessProperty
  decidableCheckClosed : F.decidableCheck

def FormalSystemsClosed (F : FormalSystemsPackage) : Prop :=
  F.consistencyProof ∧ F.completenessProperty ∧ F.decidableCheck

theorem formal_systems_closed_from_evidence (F : FormalSystemsPackage)
    (E : FormalSystemsEvidence F) : FormalSystemsClosed F := by
  exact And.intro E.consistencyProofClosed
    (And.intro E.completenessPropertyClosed E.decidableCheckClosed)

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse