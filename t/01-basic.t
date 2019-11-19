﻿use v6;
use Test;
use lib ('../lib','lib');
use Math::Constants;

my @constants-names = <
  ℎ
  ℏ
  A
  alpha-feigenbaum-constant
  apery-constant
  boltzmann-constant
  c
  catalan-constant
  conway-constant
  delta-feigenbaum-constant
  electron-mass
  elementary-charge
  euler-mascheroni-gamma
  eulernumber-e
  eV
  F
  fine-structure-constant
  g
  G
  gas-constant
  gauss-constant
  glaisher-kinkelin-constant
  golomb-dickman-constant
  k
  k0
  K0
  khinchin-constant
  L
  lp
  magnetic-permittivity
  mill-constant
  mp
  neutron-mass
  phi
  pi
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
  α
  γ
  δ
  ε0
  λ
  μ0
  φ
>;

my @constants;
@constants-names ==> map  { EVAL $_  }  ==> @constants;

@constants.map( { is .WHAT, (Num), "Type OK"} );

is c.WHAT, (Int), "c is OK";
is g.WHAT, (Rat), "g is OK";
is α.WHAT, (Rat), "e is OK";

is-approx ℎ/(2*π), ℏ, "Planck's constants";
is-approx φ, (1 + sqrt(5))/2, "Golden ratio";
is-approx α, 0.00729735256, "Fine structure";
is-approx q²/(4*π*ε0*ℏ*c), α, "Fine structure constant";
is-approx L, 6.022140857e23, "Avogadro's number";

is-approx 0.1c, c/10, "Speed of light as unit";

is-approx 0.1g, g/10, "Standard gravity";


done-testing;
