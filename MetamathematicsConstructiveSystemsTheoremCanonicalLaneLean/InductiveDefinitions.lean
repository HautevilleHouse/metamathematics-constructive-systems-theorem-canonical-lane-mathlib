import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

structure InductiveDefinitionsPackage where
  baseCases : Type u
  inductiveRules : Type v
  smallestSetClosure : Prop
  recursionPrinciple : Prop
  inductionPrinciple : Prop

structure InductiveDefinitionsEvidence (I : InductiveDefinitionsPackage) where
  smallestSetClosureClosed : I.smallestSetClosure
  recursionPrincipleClosed : I.recursionPrinciple
  inductionPrincipleClosed : I.inductionPrinciple

def InductiveDefinitionsClosed (I : InductiveDefinitionsPackage) : Prop :=
  I.smallestSetClosure ∧ I.recursionPrinciple ∧ I.inductionPrinciple

theorem inductive_definitions_closed_from_evidence
    (I : InductiveDefinitionsPackage)
    (E : InductiveDefinitionsEvidence I) : InductiveDefinitionsClosed I := by
  exact And.intro E.smallestSetClosureClosed
    (And.intro E.recursionPrincipleClosed E.inductionPrincipleClosed)

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse