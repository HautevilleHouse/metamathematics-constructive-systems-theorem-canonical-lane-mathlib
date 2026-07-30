import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

def ConstrainedMetamathematicsConstructiveSystemsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_metamathematics_constructive_systems_endgame (A : AdmissibleClass) : ConstrainedMetamathematicsConstructiveSystemsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse
