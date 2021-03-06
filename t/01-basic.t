use v6;
use Test;
use lib ('../lib','lib');
use Math::Constants;

my @num-constants-names = <
  ℎ
  ℏ
  A
  alpha-feigenbaum-constant
  alpha-particle-mass
  apery-constant
  boltzmann-constant
  catalan-constant
  conway-constant
  delta-feigenbaum-constant
  electron-mass
  elementary-charge
  euler-mascheroni-gamma
  eV
  F
  G
  gas-constant
  gauss-constant
  glaisher-kinkelin-constant
  golomb-dickman-constant
  k
  k0
  khinchin-constant
  L
  lp
  magnetic-permeability
  mill-constant
  mp
  neutron-mass
  phi
  planck-length
  planck-mass
  plancks-h
  plancks-reduced-h
  planck-temperature
  planck-time
  proton-mass
  q
  quantum-ratio
  sierpinski-gamma
  tp
  vacuum-permeability
  vacuum-permittivity
  γ
  δ
  ε0
  λ
  μ0
  φ
>;

my @num-constants;
@num-constants-names ==> map  { EVAL $_  }  ==> @num-constants;

@num-constants.map( { is .value.WHAT, (Num), "Type OK"} );

my @rat-constants-names = <
  α
  fine-structure-constant
  g
>;

my @rat-constants;
@rat-constants-names ==> map  { EVAL $_  }  ==> @rat-constants;

@rat-constants.map( { is .value.WHAT, (Rat), "Type OK"} );

my @int-constants-names = <
  c
  K0
>;

my @int-constants;
@int-constants-names ==> map  { EVAL $_  }  ==> @int-constants;

@int-constants.map( { is .value.WHAT, (Int), "Type OK"} );

is-approx ℎ/(2*π), ℏ.value, "Planck's constants";
is-approx φ.value, (1 + sqrt(5))/2, "Golden ratio";
is-approx α.value, 0.00729735256, "Fine structure";
is-approx q²/(4*π*ε0*ℏ*c), α.value, "Fine structure constant";
is-approx L.value, 6.022140857e23, "Avogadro's number";

is-approx 0.1c, c/10, "Speed of light as unit";

is-approx 0.1g, g/10, "Standard gravity";

is-approx 0.1eV, 1.0/(eV*10), "Electron Volts";

done-testing;
