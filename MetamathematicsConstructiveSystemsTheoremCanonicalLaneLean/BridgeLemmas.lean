import canonicalLaneMathlib.MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MetamathematicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MetamathematicsConstructiveSystemsTheoremCanonicalLaneLean
end HautevilleHouse