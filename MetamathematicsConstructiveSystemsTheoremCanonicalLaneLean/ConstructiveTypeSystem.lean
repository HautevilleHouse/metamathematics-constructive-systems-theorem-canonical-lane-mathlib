import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure ConstructiveTypeSystem where
  baseType : Type u
  identityType : baseType → baseType → Type v
  productType : baseType → baseType → baseType
  functionType : baseType → baseType → baseType
  constructiveConnectives : Prop
  identityTypeReflexive : ∀ (a : baseType), identityType a a
  identityTypeTransport : ∀ {a b : baseType}, identityType a b → (∀ (P : baseType → Type w), P a → P b)
  productIntroduction : ∀ (a b : baseType), identityType (productType a b) (productType a b)
  functionIntroduction : ∀ (a b : baseType), identityType (functionType a b) (functionType a b)
  constructiveConnectivesTerm : constructiveConnectives

structure ConstructiveTypeEvidence (T : ConstructiveTypeSystem) where
  identityTypeReflexiveClosed : T.identityTypeReflexive
  identityTypeTransportClosed : T.identityTypeTransport
  productIntroductionClosed : T.productIntroduction
  functionIntroductionClosed : T.functionIntroduction

def ConstructiveTypeClosed (T : ConstructiveTypeSystem) : Prop :=
  T.constructiveConnectives ∧
  T.identityTypeReflexive ∧
  T.identityTypeTransport ∧
  T.productIntroduction ∧
  T.functionIntroduction

theorem constructive_type_closed_from_evidence (T : ConstructiveTypeSystem) (E : ConstructiveTypeEvidence T) : ConstructiveTypeClosed T := by
  exact And.intro T.constructiveConnectivesTerm
    (And.intro E.identityTypeReflexiveClosed
      (And.intro E.identityTypeTransportClosed
        (And.intro E.productIntroductionClosed E.functionIntroductionClosed)))

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse