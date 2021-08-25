use v6;
unit class Math::Constants:ver<0.1.2>:auth<github:JJ>;

class Constant {
	has Str  $.name;
        has Real $.value;
        has Real $.uncertainty = 0e0;
        has Str  $.units       = '';
	has Str  $.symbol      = '';

        method Str { ~$!value }
        method Num { $!value }
        method Numeric { $!value }
        method gist {
		my $uncertainty = $!uncertainty == 0e0 ?? '' !! '±' ~ ~$!uncertainty;
		my $units       = $!units              ?? '' !! ' ' ~ $!units; # that "space" is actually U2009 -- a thin space
	       	~$!value ~ $uncertainty ~ $!units;
	}
}

# The fundamental constants which define the SI system

constant \avogadro-constant is export(:physics :fundamental :defined) = Constant.new(
  name        => 'Avogadro constant', 
  value       => 6.02214076e+23, 
  uncertainty => 0, 
  units       => 'mol⁻¹',
  symbol      => 'L'
);
constant \kg-amu is export(:DEFAULT :physics :fundamental :defined) := avogadro-constant;
constant \L      is export(:DEFAULT :physics :fundamental :defined) := avogadro-constant;
constant \Na     is export(:DEFAULT :physics :fundamental :defined) := avogadro-constant;

constant \boltzmann-constant is export(:DEFAULT :physics :fundamental :defined) = Constant.new(
  name        => 'Boltzmann constant', 
  value       => 1.380649e-23, 
  uncertainty => 0, 
  units       => 'J·K⁻¹'
);

constant \elementary-charge is export(:DEFAULT :physics :fundamental :defined) = Constant.new(
  name        => 'elementary charge', 
  value       => 1.602176634e-19, 
  uncertainty => 0, 
  units       => 'C',
  symbol      => 'q'
);
constant \q  is export(:DEFAULT :physics :fundamental :defined) := elementary-charge;

constant \planck-constant is export(:physics :fundamental :defined) = Constant.new(
  name        => 'Planck constant', 
  value       => 6.62607015e-34, 
  uncertainty => 0, 
  units       => 'J·Hz⁻¹',
  symbol      => 'ℎ'
);
constant \plancks-h is export(:DEFAULT :physics :fundamental :defined) := planck-constant;
constant \ℎ         is export(:DEFAULT :physics :fundamental :defined) := planck-constant;

constant \speed-of-light-vacuum is export(:DEFAULT :physics :fundamental :defined) = Constant.new(
  name        => 'speed of light in vacuum', 
  value       => 299792458, 
  uncertainty => 0, 
  units       => 'm·s⁻¹',
  symbol      => 'c'
);
constant \c  is export(:DEFAULT :physics :fundamental :defined) := speed-of-light-vacuum;

constant \hyperfine-transition-frequency-of-Cs_133 is export(:DEFAULT :physics :fundamental :defined) = Constant.new(
  name        => 'hyperfine transition frequency of Cs-133', 
  value       => 9.192631770e9, 
  uncertainty => 0, 
  units       => 'Hz'
);

constant \luminous-efficacy is export(:DEFAULT :physics :fundamental :defined) = Constant.new(
  name        => 'luminous efficacy',
  value       => 683,
  uncertainty => 0,
  units       => 'lm·W⁻¹'
);


# Some other defined values

constant \standard-acceleration-gravity is export(:DEFAULT :physics :defined) = Constant.new(
  name        => 'standard acceleration of gravity',
  value       => 9.80665,
  uncertainty => 0,
  units       => 'm·s⁻²',
  symbol      => 'g'
);
constant \g is export(:DEFAULT :physics :defined) := standard-acceleration-gravity;

constant \wien-frequency-displacement-law-constant is export(:physics :defined) = Constant.new(
  name        => 'Wien frequency displacement law constant',
  value       => 58789257570,
  uncertainty => 0,
  units       => 'Hz·K⁻¹'
);

constant \wien-wavelength-displacement-law-constant is export(:physics :defined) = Constant.new(
  name        => 'Wien wavelength displacement law constant',
  value       => 0.002897771955,
  uncertainty => 0,
  units       => 'm·K'
);

constant \standard-atmosphere is export(:physics :measured) = Constant.new(
  name        => 'standard atmosphere',
  value       => 101325,
  uncertainty => 0,
  units       => 'Pa'
);

constant \standard-state-pressure is export(:physics :measured) = Constant.new(
  name        => 'standard-state pressure',
  value       => 100000,
  uncertainty => 0,
  units       => 'Pa'
);

# Values derived from the fundamental constants
#   These also have no uncertainty, but not all can be expressed
#   exactly as floating point numbers.

constant \reduced-planck-constant is export(:physics :derived) = Constant.new(
  name        => 'reduced Planck constant',
  value       => ℎ ÷ (2 × π),
  uncertainty => 0,
  units       => 'J·s',
  symbol      => 'ℏ'
);
constant \plancks-reduced-h  is export(:DEFAULT :physics :derived) := reduced-planck-constant;
constant \ℏ  is export(:DEFAULT :physics :derived) := reduced-planck-constant;

constant \atomic-unit-of-action is export(:physics :derived) = Constant.new(
  name        => 'atomic unit of action',
  value       => +ℏ,
  uncertainty => 0,
  units       => 'J·s'
);

constant \atomic-unit-of-charge is export(:physics :derived) = Constant.new(
  name        => 'atomic unit of charge',
  value       => +q,
  uncertainty => 0,
  units       => 'C'
);

constant \electron-volt is export(:DEFAULT :physics :derived) = Constant.new(
  name        => 'electron volt',
  value       => +q,
  uncertainty => 0,
  units       => 'J',
  symbol      => 'eV'
);
constant \eV is export(:DEFAULT :physics :derived) := electron-volt;

constant \boltzmann-constant-in-eV-K is export(:physics :derived) = Constant.new(
  name        => 'Boltzmann constant in eV/K',
  value       => boltzmann-constant / eV,
  uncertainty => 0,
  units       => 'eV·K⁻¹'
);

constant \boltzmann-constant-in-Hz-K is export(:physics :derived) = Constant.new(
  name        => 'Boltzmann constant in Hz/K',
  value       => boltzmann-constant ÷ ℎ,
  uncertainty => 0,
  units       => 'Hz·K⁻¹'
);

constant \boltzmann-constant-in-inverse-meter-per-kelvin is export(:physics :derived) = Constant.new(
  name        => 'Boltzmann constant in inverse meter per kelvin',
  value       => boltzmann-constant ÷ (ℎ × c),
  uncertainty => 0,
  units       => 'm⁻¹·K⁻¹'
);

constant \conductance-quantum is export(:physics :derived) = Constant.new(
  name        => 'conductance quantum',
  value       => 2 × q² ÷ ℎ,
  uncertainty => 0,
  units       => 'S'
);

constant \josephson-constant is export(:physics :derived) = Constant.new(
  name        => 'Josephson constant',
  value       => 2 × q ÷ ℎ,
  uncertainty => 0,
  units       => 'Hz·V⁻¹',
  symbol      => 'Kj'
);
constant \Kj   is export(:physics :derived) := josephson-constant;

constant \conventional-value-of-josephson-constant is export(:physics :derived) = Constant.new(
  name        => 'conventional value of Josephson constant',
  value       => 4.835979e14,
  uncertainty => 0,
  units       => 'Hz·V⁻¹',
  symbol      => 'Kj90'
);
constant \Kj90 is export(:physics :derived) := conventional-value-of-josephson-constant;

constant \von-klitzing-constant is export(:physics :derived) = Constant.new(
  name        => 'von Klitzing constant',
  value       => ℎ ÷ q²,
  uncertainty => 0,
  units       => 'Ω',
  symbol      => 'RK'
);
constant \RK   is export(:physics :derived) := von-klitzing-constant;

constant \conventional-value-of-von-klitzing-constant is export(:physics :derived) = Constant.new(
  name        => 'conventional value of von Klitzing constant',
  value       => 25812.807,
  uncertainty => 0,
  units       => 'Ω',
  symbol      => 'RK90'
);
constant \RK90 is export(:physics :derived) := conventional-value-of-von-klitzing-constant;

constant \conventional-value-of-ampere_90 is export(:physics :derived) = Constant.new(
  name        => 'conventional value of ampere-90',
  value       => (Kj90÷Kj) × (RK90÷RK),
  uncertainty => 0,
  units       => 'A'
);

constant \conventional-value-of-coulomb_90 is export(:physics :derived) = Constant.new(
  name        => 'conventional value of coulomb-90',
  value       => (Kj90÷Kj) × (RK90÷RK),
  uncertainty => 0,
  units       => 'C'
);

constant \conventional-value-of-farad_90 is export(:physics :derived) = Constant.new(
  name        => 'conventional value of farad-90',
  value       => RK90 ÷ RK,
  uncertainty => 0,
  units       => 'F'
);

constant \conventional-value-of-henry_90 is export(:physics :derived) = Constant.new(
  name        => 'conventional value of henry-90',
  value       => RK ÷ RK90,
  uncertainty => 0,
  units       => 'H'
);

constant \conventional-value-of-ohm_90 is export(:physics :derived) = Constant.new(
  name        => 'conventional value of ohm-90',
  value       => RK ÷ RK90,
  uncertainty => 0,
  units       => 'Ω'
);

constant \conventional-value-of-volt_90 is export(:physics :derived) = Constant.new(
  name        => 'conventional value of volt-90',
  value       => Kj90 ÷ Kj,
  uncertainty => 0,
  units       => 'V'
);

constant \conventional-value-of-watt_90 is export(:physics :derived) = Constant.new(
  name        => 'conventional value of watt-90',
  value       => (Kj90²÷Kj²) × (RK90÷RK),
  uncertainty => 0,
  units       => 'W'
);

constant \electron-volt-hertz-relationship is export(:physics :derived) = Constant.new(
  name        => 'electron volt-hertz relationship',
  value       => eV ÷ ℎ,
  uncertainty => 0,
  units       => 'Hz'
);
constant \quantum-ratio is export(:DEFAULT :physics :derived) := electron-volt-hertz-relationship;

constant \electron-volt-inverse-meter-relationship is export(:physics :derived) = Constant.new(
  name        => 'electron volt-inverse meter relationship',
  value       => eV ÷ (ℎ×c),
  uncertainty => 0,
  units       => 'm⁻¹'
);

constant \electron-volt-joule-relationship is export(:physics :derived) = Constant.new(
  name        => 'electron volt-joule relationship',
  value       => +q,
  uncertainty => 0,
  units       => 'J'
);

constant \electron-volt-kelvin-relationship is export(:physics :derived) = Constant.new(
  name        => 'electron volt-kelvin relationship',
  value       => eV ÷ boltzmann-constant,
  uncertainty => 0,
  units       => 'K'
);

constant \electron-volt-kilogram-relationship is export(:physics :derived) = Constant.new(
  name        => 'electron volt-kilogram relationship',
  value       => eV ÷ c²,
  uncertainty => 0,
  units       => 'kg'
);

constant \elementary-charge-over-h-bar is export(:physics :derived) = Constant.new(
  name        => 'elementary charge over h-bar',
  value       => q ÷ ℏ,
  uncertainty => 0,
  units       => 'A·J⁻¹'
);

constant \faraday-constant is export(:DEFAULT :physics :derived) = Constant.new(
  name        => 'Faraday constant',
  value       => q × Na,
  uncertainty => 0,
  units       => 'C·mol⁻¹',
  symbol      => 'F'
);
constant \F is export(:DEFAULT :physics :derived) := faraday-constant;

constant \first-radiation-constant is export(:physics :derived) = Constant.new(
  name        => 'first radiation constant',
  value       => 2 × π × ℎ × c²,
  uncertainty => 0,
  units       => 'W·m²'
);

constant \first-radiation-constant-for-spectral-radiance is export(:physics :derived) = Constant.new(
  name        => 'first radiation constant for spectral radiance',
  value       => 2 × ℎ × c²,
  uncertainty => 0,
  units       => 'W·m²·sr⁻¹'
);

constant \hertz-electron-volt-relationship is export(:physics :derived) = Constant.new(
  name        => 'hertz-electron volt relationship',
  value       => ℎ ÷ eV,
  uncertainty => 0,
  units       => 'eV'
);

constant \hertz-inverse-meter-relationship is export(:physics :derived) = Constant.new(
  name        => 'hertz-inverse meter relationship',
  value       => 1 ÷ c,
  uncertainty => 0,
  units       => 'm⁻¹'
);

constant \hertz-joule-relationship is export(:physics :derived) = Constant.new(
  name        => 'hertz-joule relationship',
  value       => +ℎ,
  uncertainty => 0,
  units       => 'J'
);

constant \hertz-kelvin-relationship is export(:physics :derived) = Constant.new(
  name        => 'hertz-kelvin relationship',
  value       => ℎ ÷ boltzmann-constant,
  uncertainty => 0,
  units       => 'K'
);

constant \hertz-kilogram-relationship is export(:physics :derived) = Constant.new(
  name        => 'hertz-kilogram relationship',
  value       => ℎ ÷ c²,
  #value       => 1 ÷ c × 1e9,
  uncertainty => 0,
  units       => 'kg'
);

constant \inverse-meter-electron-volt-relationship is export(:physics :derived) = Constant.new(
  name        => 'inverse meter-electron volt relationship',
  value       => ℎ × c ÷ eV,
  uncertainty => 0,
  units       => 'eV'
);

constant \inverse-meter-hertz-relationship is export(:physics :derived) = Constant.new(
  name        => 'inverse meter-hertz relationship',
  value       => +c,
  uncertainty => 0,
  units       => 'Hz'
);

constant \inverse-meter-joule-relationship is export(:physics :derived) = Constant.new(
  name        => 'inverse meter-joule relationship',
  value       => ℎ × c,
  uncertainty => 0,
  units       => 'J'
);

constant \inverse-meter-kelvin-relationship is export(:physics :derived) = Constant.new(
  name        => 'inverse meter-kelvin relationship',
  value       => ℎ × c ÷ boltzmann-constant,
  uncertainty => 0,
  units       => 'K'
);

constant \inverse-meter-kilogram-relationship is export(:physics :derived) = Constant.new(
  name        => 'inverse meter-kilogram relationship',
  value       => ℎ÷c,
  uncertainty => 0,
  units       => 'kg'
);

constant \inverse-of-conductance-quantum is export(:physics :derived) = Constant.new(
  name        => 'inverse of conductance quantum',
  value       => ℎ ÷ (2 × q²),
  uncertainty => 0,
  units       => 'Ω'
);

constant \joule-electron-volt-relationship is export(:physics :derived) = Constant.new(
  name        => 'joule-electron volt relationship',
  value       => 1 ÷ q,
  uncertainty => 0,
  units       => 'eV'
);

constant \joule-hertz-relationship is export(:physics :derived) = Constant.new(
  name        => 'joule-hertz relationship',
  value       => 1 ÷ ℎ,
  uncertainty => 0,
  units       => 'Hz'
);

constant \joule-inverse-meter-relationship is export(:physics :derived) = Constant.new(
  name        => 'joule-inverse meter relationship',
  value       => 1 ÷ (ℎ × c),
  uncertainty => 0,
  units       => 'm⁻¹'
);

constant \joule-kelvin-relationship is export(:physics :derived) = Constant.new(
  name        => 'joule-kelvin relationship',
  value       => 1 ÷ boltzmann-constant,
  uncertainty => 0,
  units       => 'K'
);

constant \joule-kilogram-relationship is export(:physics :derived) = Constant.new(
  name        => 'joule-kilogram relationship',
  value       => 1 ÷ c²,
  uncertainty => 0,
  units       => 'kg'
);

constant \kelvin-electron-volt-relationship is export(:physics :derived) = Constant.new(
  name        => 'kelvin-electron volt relationship',
  value       => boltzmann-constant ÷ eV,
  uncertainty => 0,
  units       => 'eV'
);

constant \kelvin-hertz-relationship is export(:physics :derived) = Constant.new(
  name        => 'kelvin-hertz relationship',
  value       => boltzmann-constant ÷ ℎ,
  uncertainty => 0,
  units       => 'Hz'
);

constant \kelvin-inverse-meter-relationship is export(:physics :derived) = Constant.new(
  name        => 'kelvin-inverse meter relationship',
  value       => boltzmann-constant ÷ (c × ℎ),
  uncertainty => 0,
  units       => 'm⁻¹'
);

constant \kelvin-joule-relationship is export(:physics :derived) = Constant.new(
  name        => 'kelvin-joule relationship',
  value       => +boltzmann-constant,
  uncertainty => 0,
  units       => 'J'
);

constant \kelvin-kilogram-relationship is export(:physics :derived) = Constant.new(
  name        => 'kelvin-kilogram relationship',
  value       => boltzmann-constant ÷ c²,
  uncertainty => 0,
  units       => 'kg'
);

constant \kilogram-electron-volt-relationship is export(:physics :derived) = Constant.new(
  name        => 'kilogram-electron volt relationship',
  value       => c² ÷ q,
  uncertainty => 0,
  units       => 'eV'
);

constant \kilogram-hertz-relationship is export(:physics :derived) = Constant.new(
  name        => 'kilogram-hertz relationship',
  value       => c² ÷ ℎ,
  uncertainty => 0,
  units       => 'Hz'
);

constant \kilogram-inverse-meter-relationship is export(:physics :derived) = Constant.new(
  name        => 'kilogram-inverse meter relationship',
  value       => c ÷ ℎ,
  uncertainty => 0,
  units       => 'm⁻¹'
);

constant \kilogram-joule-relationship is export(:physics :derived) = Constant.new(
  name        => 'kilogram-joule relationship',
  value       => c²,
  uncertainty => 0,
  units       => 'J',
  symbol      => 'K0'
);
constant \coulomb-constant is export(:DEFAULT :physics :derived) := kilogram-joule-relationship;
constant \K0               is export(:DEFAULT :physics :derived) := kilogram-joule-relationship;

constant \kilogram-kelvin-relationship is export(:physics :derived) = Constant.new(
  name        => 'kilogram-kelvin relationship',
  value       => c² ÷ boltzmann-constant,
  uncertainty => 0,
  units       => 'K'
);

constant \loschmidt-constant-stp is export(:physics :derived) = Constant.new(
  name        => 'Loschmidt constant (273.15 K, 100 kPa)',
  value       => 100000 ÷ boltzmann-constant ÷ 273.15,
  uncertainty => 0,
  units       => 'm⁻³'
);

constant \loschmidt-constant-ntp is export(:physics :derived) = Constant.new(
  name        => 'Loschmidt constant (273.15 K, 101.325 kPa)',
  value       => 101325 ÷ boltzmann-constant ÷ 273.15,
  uncertainty => 0,
  units       => 'm⁻³'
);

constant \mag-flux-quantum is export(:physics :derived) = Constant.new(
  name        => 'mag. flux quantum',
  value       => ℎ ÷ 2 ÷ q,
  uncertainty => 0,
  units       => 'Wb'
);

constant \molar-gas-constant is export(:physics :derived) = Constant.new(
  name        => 'molar gas constant',
  value       => Na × boltzmann-constant,
  uncertainty => 0,
  units       => 'J·mol⁻¹·K⁻¹'
);
constant \gas-constant is export(:DEFAULT :physics :derived) := molar-gas-constant;

constant \molar-planck-constant is export(:physics :derived) = Constant.new(
  name        => 'molar Planck constant',
  value       => Na × ℎ,
  uncertainty => 0,
  units       => 'J·Hz⁻¹·mol⁻¹'
);

constant \molar-volume-of-ideal-gas-stp is export(:physics :derived) = Constant.new(
  name        => 'molar volume of ideal gas (273.15 K, 100 kPa)',
  value       => Na × boltzmann-constant × 273.15 ÷ 100000,
  uncertainty => 0,
  units       => 'm³·mol⁻¹'
);

constant \molar-volume-of-ideal-gas-ntp is export(:physics :derived) = Constant.new(
  name        => 'molar volume of ideal gas (273.15 K, 101.325 kPa)',
  value       => Na × boltzmann-constant × 273.15 ÷ 101325,
  uncertainty => 0,
  units       => 'm³·mol⁻¹'
);

constant \natural-unit-of-action is export(:physics :derived) = Constant.new(
  name        => 'natural unit of action',
  value       => +ℏ,
  uncertainty => 0,
  units       => 'J·s'
);

constant \natural-unit-of-action-in-eV-s is export(:physics :derived) = Constant.new(
  name        => 'natural unit of action in eV s',
  value       => ℏ ÷ q,
  uncertainty => 0,
  units       => 'eV·s'
);

constant \natural-unit-of-velocity is export(:physics :derived) = Constant.new(
  name        => 'natural unit of velocity',
  value       => +c,
  uncertainty => 0,
  units       => 'm·s⁻¹'
);

constant \planck-constant-in-eV-Hz is export(:physics :derived) = Constant.new(
  name        => 'Planck constant in eV/Hz',
  value       => ℎ ÷ q,
  uncertainty => 0,
  units       => 'eV·Hz⁻¹'
);

constant \reduced-planck-constant-in-eV-s is export(:physics :derived) = Constant.new(
  name        => 'reduced Planck constant in eV s',
  value       => ℏ ÷ q,
  uncertainty => 0,
  units       => 'eV·s'
);

constant \reduced-planck-constant-times-c-in-MeV-fm is export(:physics :measured) = Constant.new(
  name        => 'reduced Planck constant times c in MeV fm',
  value       => ℏ × c ÷ q × 1000000000,
  uncertainty => 0,
  units       => 'MeV·fm'
);

constant \second-radiation-constant is export(:physics :derived) = Constant.new(
  name        => 'second radiation constant',
  value       => ℎ × c ÷ boltzmann-constant,
  uncertainty => 0,
  units       => 'm·K'
);

constant \stefan-boltzmann-constant is export(:physics :derived) = Constant.new(
  name        => 'Stefan-Boltzmann constant',
  value       => 2 × π⁵ × boltzmann-constant⁴ ÷ (15 × ℎ³ × c²),
  uncertainty => 0,
  units       => 'W·m⁻²·K⁻⁴'
);

# Other constants based on measurements

constant \alpha-particle-electron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'alpha particle-electron mass ratio', 
  value       => 7294.29954142, 
  uncertainty => 0.00000024, 
  units       => ''
);


constant \alpha-particle-mass is export(:DEFAULT :physics :measured) = Constant.new(
  name        => 'alpha particle mass',
  value       => 6.6446573357e-27,
  uncertainty => 0.0000000020e-27,
  units       => 'kg'
);

constant \alpha-particle-mass-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'alpha particle mass energy equivalent',
  value       => 5.9719201914e-10,
  uncertainty => 0.0000000018e-10,
  units       => 'J'
);

constant \alpha-particle-mass-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'alpha particle mass energy equivalent in MeV',
  value       => 3727.3794066,
  uncertainty => 0.0000011,
  units       => 'MeV'
);

constant \alpha-particle-mass-in-u is export(:physics :measured) = Constant.new(
  name        => 'alpha particle mass in u',
  value       => 4.001506179127,
  uncertainty => 0.000000000063,
  units       => 'u'
);

constant \alpha-particle-molar-mass is export(:physics :measured) = Constant.new(
  name        => 'alpha particle molar mass',
  value       => 4.0015061777e-3,
  uncertainty => 0.0000000012e-3,
  units       => 'kg·mol⁻¹'
);

constant \alpha-particle-proton-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'alpha particle-proton mass ratio',
  value       => 3.97259969009,
  uncertainty => 0.00000000022,
  units       => ''
);

constant \alpha-particle-relative-atomic-mass is export(:physics :measured) = Constant.new(
  name        => 'alpha particle relative atomic mass',
  value       => 4.001506179127,
  uncertainty => 0.000000000063,
  units       => ''
);

constant \angstrom-star is export(:physics :measured) = Constant.new(
  name        => 'Angstrom star',
  value       => 1.00001495e-10,
  uncertainty => 0.00000090e-10,
  units       => 'm'
);

constant \atomic-mass-constant is export(:physics :measured) = Constant.new(
  name        => 'atomic mass constant',
  value       => 1.6605390666e-27,
  uncertainty => 0.00000000050e-27,
  units       => 'kg'
);

constant \atomic-mass-constant-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'atomic mass constant energy equivalent',
  value       => 1.4924180856e-10,
  uncertainty => 0.00000000045e-10,
  units       => 'J'
);

constant \atomic-mass-constant-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'atomic mass constant energy equivalent in MeV',
  value       => 931.49410242,
  uncertainty => 0.00000028,
  units       => 'MeV'
);

constant \atomic-mass-unit-electron-volt-relationship is export(:physics :measured) = Constant.new(
  name        => 'atomic mass unit-electron volt relationship',
  value       => 931494102.42,
  uncertainty => 0.0000000028e8,
  units       => 'eV'
);

constant \atomic-mass-unit-hartree-relationship is export(:physics :measured) = Constant.new(
  name        => 'atomic mass unit-hartree relationship',
  value       => 34231776.874,
  uncertainty => 0.0000000010e7,
  units       => 'E_h'
);

constant \atomic-mass-unit-hertz-relationship is export(:physics :measured) = Constant.new(
  name        => 'atomic mass unit-hertz relationship',
  value       => 2.25234271871e+23,
  uncertainty => 0.00000000068e23,
  units       => 'Hz'
);

constant \atomic-mass-unit-inverse-meter-relationship is export(:physics :measured) = Constant.new(
  name        => 'atomic mass unit-inverse meter relationship',
  value       => 7.5130066104e14,
  uncertainty => 0.0000000023e14,
  units       => 'm⁻¹'
);

constant \atomic-mass-unit-joule-relationship is export(:physics :measured) = Constant.new(
  name        => 'atomic mass unit-joule relationship',
  value       => 1.4924180856e-10,
  uncertainty => 0.00000000045e-10,
  units       => 'J'
);

constant \atomic-mass-unit-kelvin-relationship is export(:physics :measured) = Constant.new(
  name        => 'atomic mass unit-kelvin relationship',
  value       => 1.08095401916e13,
  uncertainty => 0.00000000033e13,
  units       => 'K'
);

constant \atomic-mass-unit-kilogram-relationship is export(:physics :measured) = Constant.new(
  name        => 'atomic mass unit-kilogram relationship',
  value       => 1.6605390666e-27,
  uncertainty => 0.00000000050e-27,
  units       => 'kg'
);

constant \atomic-unit-of_1st-hyperpolarizability is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of 1st hyperpolarizability',
  value       => 3.2063613061e-53,
  uncertainty => 0.0000000015e-53,
  units       => 'C³·m³·J⁻²'
);

constant \atomic-unit-of_2nd-hyperpolarizability is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of 2nd hyperpolarizability',
  value       => 6.2353799905e-65,
  uncertainty => 0.0000000038e-65,
  units       => 'C⁴·m⁴·J⁻³'
);

constant \atomic-unit-of-charge-density is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of charge density',
  value       => 1.08120238457e12,
  uncertainty => 0.00000000049e12,
  units       => 'C·m⁻³'
);

constant \atomic-unit-of-current is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of current',
  value       => 6.62361823751e-3,
  uncertainty => 0.000000000013e-3,
  units       => 'A'
);

constant \atomic-unit-of-electric-dipole-mom is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of electric dipole mom.',
  value       => 8.4783536255e-30,
  uncertainty => 0.0000000013e-30,
  units       => 'C·m'
);

constant \atomic-unit-of-electric-field is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of electric field',
  value       => 5.14220674763e11,
  uncertainty => 0.00000000078e11,
  units       => 'V·m⁻¹'
);

constant \atomic-unit-of-electric-field-gradient is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of electric field gradient',
  value       => 9.7173624292e21,
  uncertainty => 0.0000000029e21,
  units       => 'V·m⁻²'
);

constant \atomic-unit-of-electric-polarizability is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of electric polarizability',
  value       => 1.64877727436e-41,
  uncertainty => 0.00000000050e-41,
  units       => 'C²·m²·J⁻¹'
);

constant \atomic-unit-of-electric-potential is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of electric potential',
  value       => 27.211386245988,
  uncertainty =>  0.000000000053,
  units       => 'V'
);

constant \atomic-unit-of-electric-quadrupole-mom is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of electric quadrupole mom.',
  value       => 4.4865515246e-40,
  uncertainty => 0.0000000014e-40,
  units       => 'C·m²'
);

constant \atomic-unit-of-energy is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of energy',
  value       => 4.3597447222071e-18,
  uncertainty => 0.0000000000085e-18,
  units       => 'J'
);

constant \atomic-unit-of-force is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of force',
  value       => 8.2387234983e-8,
  uncertainty => 0.0000000012e-8,
  units       => 'N'
);

constant \atomic-unit-of-length is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of length',
  value       => 5.29177210903e-11,
  uncertainty => 0.00000000080e-11,
  units       => 'm'
);

constant \atomic-unit-of-mag-dipole-mom is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of mag. dipole mom.',
  value       => 1.85480201566e-23,
  uncertainty => 0.00000000056e-23,
  units       => 'J·T⁻¹'
);

constant \atomic-unit-of-mag-flux-density is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of mag. flux density',
  value       => 2.35051756758e5,
  uncertainty => 0.00000000071e5,
  units       => 'T'
);

constant \atomic-unit-of-magnetizability is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of magnetizability',
  value       => 7.8910366008e-29,
  uncertainty => 0.0000000048e-29,
  units       => 'J·T⁻²'
);

constant \atomic-unit-of-mass is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of mass',
  value       => 9.1093837015e-31,
  uncertainty => 0.0000000028e-31,
  units       => 'kg'
);

constant \atomic-unit-of-momentum is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of momentum',
  value       => 1.9928519141e-24,
  uncertainty => 0.00000000030e-24,
  units       => 'kg·m·s⁻¹'
);

constant \atomic-unit-of-permittivity is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of permittivity',
  value       => 1.11265005545e-10,
  uncertainty => 0.00000000017e-10,
  units       => 'F·m⁻¹'
);

constant \atomic-unit-of-time is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of time',
  value       => 2.4188843265857e-17,
  uncertainty => 0.0000000000047e-17,
  units       => 's'
);

constant \atomic-unit-of-velocity is export(:physics :measured) = Constant.new(
  name        => 'atomic unit of velocity',
  value       => 2.18769126364e6,
  uncertainty => 0.00000000033e6,
  units       => 'm·s⁻¹'
);

constant \bohr-magneton is export(:physics :measured) = Constant.new(
  name        => 'Bohr magneton',
  value       => 9.2740100783e-24,
  uncertainty => 0.0000000028e-24,
  units       => 'J·T⁻¹'
);

constant \bohr-magneton-in-eV-T is export(:physics :measured) = Constant.new(
  name        => 'Bohr magneton in eV/T',
  value       => 5.7883818060e-5,
  uncertainty => 0.0000000017e-5,
  units       => 'eV·T⁻¹'
);

constant \bohr-magneton-in-Hz-T is export(:physics :measured) = Constant.new(
  name        => 'Bohr magneton in Hz/T',
  value       => 1.39962449361e10,
  uncertainty => 0.00000000042e10,
  units       => 'Hz·T⁻¹'
);

constant \bohr-magneton-in-inverse-meter-per-tesla is export(:physics :measured) = Constant.new(
  name        => 'Bohr magneton in inverse meter per tesla',
  value       => 46.686447783,
  uncertainty =>  0.000000014,
  units       => 'm⁻¹·T⁻¹'
);

constant \bohr-magneton-in-K-T is export(:physics :measured) = Constant.new(
  name        => 'Bohr magneton in K/T',
  value       => 0.67171381563,
  uncertainty => 0.00000000020,
  units       => 'K·T⁻¹'
);

constant \bohr-radius is export(:physics :measured) = Constant.new(
  name        => 'Bohr radius',
  value       => 5.29177210903e-11,
  uncertainty => 0.00000000080e-11,
  units       => 'm'
);

constant \characteristic-impedance-of-vacuum is export(:physics :measured) = Constant.new(
  name        => 'characteristic impedance of vacuum',
  value       => 376.730313668,
  uncertainty =>   0.000000057,
  units       => 'Ω'
);

constant \classical-electron-radius is export(:physics :measured) = Constant.new(
  name        => 'classical electron radius',
  value       => 2.8179403262e-15,
  uncertainty => 0.0000000013e-15,
  units       => 'm'
);

constant \compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'Compton wavelength',
  value       => 2.42631023867e-12,
  uncertainty => 0.00000000073e-12,
  units       => 'm'
);

constant \copper-x-unit is export(:physics :measured) = Constant.new(
  name        => 'Copper x unit',
  value       => 1.00207697e-13,
  uncertainty => 0.00000028e-13,
  units       => 'm'
);

constant \deuteron-electron-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'deuteron-electron mag. mom. ratio',
  value       => -4.664345551e-4,
  uncertainty =>  0.000000012e-4,
  units       => ''
);

constant \deuteron-electron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'deuteron-electron mass ratio',
  value       => 3670.48296788,
  uncertainty =>    0.00000013,
  units       => ''
);

constant \deuteron-g-factor is export(:physics :measured) = Constant.new(
  name        => 'deuteron g factor',
  value       => 0.8574382338,
  uncertainty => 0.0000000022,
  units       => ''
);

constant \deuteron-mag-mom is export(:physics :measured) = Constant.new(
  name        => 'deuteron mag. mom.',
  value       => 4.330735094e-27,
  uncertainty => 0.000000011e-27,
  units       => 'J·T⁻¹'
);

constant \deuteron-mag-mom-to-bohr-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'deuteron mag. mom. to Bohr magneton ratio',
  value       => 4.669754570e-4,
  uncertainty => 0.000000012e-4,
  units       => ''
);

constant \deuteron-mag-mom-to-nuclear-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'deuteron mag. mom. to nuclear magneton ratio',
  value       => 0.8574382338,
  uncertainty => 0.0000000022,
  units       => ''
);

constant \deuteron-mass is export(:physics :measured) = Constant.new(
  name        => 'deuteron mass',
  value       => 3.3435837724e-27,
  uncertainty => 0.0000000010e-27,
  units       => 'kg'
);

constant \deuteron-mass-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'deuteron mass energy equivalent',
  value       => 3.00506323102e-10,
  uncertainty => 0.00000000091e-10,
  units       => 'J'
);

constant \deuteron-mass-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'deuteron mass energy equivalent in MeV',
  value       => 1875.61294257,
  uncertainty =>    0.00000057,
  units       => 'MeV'
);

constant \deuteron-mass-in-u is export(:physics :measured) = Constant.new(
  name        => 'deuteron mass in u',
  value       => 2.013553212745,
  uncertainty => 0.000000000040,
  units       => 'u'
);

constant \deuteron-molar-mass is export(:physics :measured) = Constant.new(
  name        => 'deuteron molar mass',
  value       => 2.01355321205e-3,
  uncertainty => 0.00000000061e-3,
  units       => 'kg·mol⁻¹'
);

constant \deuteron-neutron-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'deuteron-neutron mag. mom. ratio',
  value       => -0.44820653,
  uncertainty =>  0.00000011,
  units       => ''
);

constant \deuteron-proton-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'deuteron-proton mag. mom. ratio',
  value       => 0.30701220939,
  uncertainty => 0.00000000079,
  units       => ''
);

constant \deuteron-proton-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'deuteron-proton mass ratio',
  value       => 1.99900750139,
  uncertainty => 0.00000000011,
  units       => ''
);

constant \deuteron-relative-atomic-mass is export(:physics :measured) = Constant.new(
  name        => 'deuteron relative atomic mass',
  value       => 2.013553212745,
  uncertainty => 0.000000000040,
  units       => ''
);

constant \deuteron-rms-charge-radius is export(:physics :measured) = Constant.new(
  name        => 'deuteron rms charge radius',
  value       => 2.12799e-15,
  uncertainty => 0.00074e-15,
  units       => 'm'
);

constant \electron-charge-to-mass-quotient is export(:physics :measured) = Constant.new(
  name        => 'electron charge to mass quotient',
  value       => -1.75882001076e11,
  uncertainty =>  0.00000000053e11,
  units       => 'C·kg⁻¹'
);

constant \electron-deuteron-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-deuteron mag. mom. ratio',
  value       => -2143.9234915,
  uncertainty =>     0.0000056,
  units       => ''
);

constant \electron-deuteron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-deuteron mass ratio',
  value       => 2.724437107462e-4,
  uncertainty => 0.000000000096e-4,
  units       => ''
);

constant \electron-g-factor is export(:physics :measured) = Constant.new(
  name        => 'electron g factor',
  value       => -2.00231930436256,
  uncertainty =>  0.00000000000035,
  units       => ''
);

constant \electron-gyromag-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron gyromag. ratio',
  value       => 1.76085963023e11,
  uncertainty => 0.00000000053e11,
  units       => 's⁻¹·T⁻¹'
);

constant \electron-gyromag-ratio-in-MHz-T is export(:physics :measured) = Constant.new(
  name        => 'electron gyromag. ratio in MHz/T',
  value       => 28024.9514242,
  uncertainty =>     0.0000085,
  units       => 'MHz·T⁻¹'
);

constant \electron-helion-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-helion mass ratio',
  value       => 1.819543074573e-4,
  uncertainty => 0.000000000079e-4,
  units       => ''
);

constant \electron-mag-mom is export(:physics :measured) = Constant.new(
  name        => 'electron mag. mom.',
  value       => -9.2847647043e-24,
  uncertainty => 0.0000000028e-24,
  units       => 'J·T⁻¹'
);

constant \electron-mag-mom-anomaly is export(:physics :measured) = Constant.new(
  name        => 'electron mag. mom. anomaly',
  value       => 1.15965218128e-3,
  uncertainty => 0.00000000018e-3,
  units       => ''
);

constant \electron-mag-mom-to-bohr-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron mag. mom. to Bohr magneton ratio',
  value       => -1.00115965218128,
  uncertainty =>  0.00000000000018,
  units       => ''
);

constant \electron-mag-mom-to-nuclear-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron mag. mom. to nuclear magneton ratio',
  value       => -1838.28197188,
  uncertainty =>     0.00000011,
  units       => ''
);

constant \electron-mass is export(:DEFAULT :physics :measured) = Constant.new(
  name        => 'electron mass',
  value       => 9.1093837015e-31,
  uncertainty => 0.0000000028e-31,
  units       => 'kg'
);

constant \electron-mass-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'electron mass energy equivalent',
  value       => 8.1871057769e-14,
  uncertainty => 0.0000000025e-14,
  units       => 'J'
);

constant \electron-mass-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'electron mass energy equivalent in MeV',
  value       => 0.51099895000,
  uncertainty => 0.00000000015,
  units       => 'MeV'
);

constant \electron-mass-in-u is export(:physics :measured) = Constant.new(
  name        => 'electron mass in u',
  value       => 5.48579909065e-4,
  uncertainty => 0.00000000016e-4,
  units       => 'u'
);

constant \electron-molar-mass is export(:physics :measured) = Constant.new(
  name        => 'electron molar mass',
  value       => 5.4857990888e-7,
  uncertainty => 0.0000000017e-7,
  units       => 'kg·mol⁻¹'
);

constant \electron-muon-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-muon mag. mom. ratio',
  value       => 206.7669883,
  uncertainty =>   0.0000046,
  units       => ''
);

constant \electron-muon-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-muon mass ratio',
  value       => 4.83633169e-3,
  uncertainty => 0.00000011e-3,
  units       => ''
);

constant \electron-neutron-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-neutron mag. mom. ratio',
  value       => 960.92050,
  uncertainty =>   0.00023,
  units       => ''
);

constant \electron-neutron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-neutron mass ratio',
  value       => 5.4386734424e-4,
  uncertainty => 0.0000000026e-4,
  units       => ''
);

constant \electron-proton-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-proton mag. mom. ratio',
  value       => -658.21068789,
  uncertainty =>    0.00000020,
  units       => ''
);

constant \electron-proton-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-proton mass ratio',
  value       => 5.44617021487e-4,
  uncertainty => 0.00000000033e-4,
  units       => ''
);

constant \electron-relative-atomic-mass is export(:physics :measured) = Constant.new(
  name        => 'electron relative atomic mass',
  value       => 5.48579909065e-4,
  uncertainty => 0.00000000016e-4,
  units       => ''
);

constant \electron-tau-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-tau mass ratio',
  value       => 2.87585e-4,
  uncertainty => 0.00019e-4,
  units       => ''
);

constant \electron-to-alpha-particle-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron to alpha particle mass ratio',
  value       => 1.370933554787e-4,
  uncertainty => 0.000000000045e-4,
  units       => ''
);

constant \electron-to-shielded-helion-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron to shielded helion mag. mom. ratio',
  value       => 864.058257,
  uncertainty =>   0.000010,
  units       => ''
);

constant \electron-to-shielded-proton-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron to shielded proton mag. mom. ratio',
  value       => -658.2275971,
  uncertainty =>    0.0000072,
  units       => ''
);

constant \electron-triton-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'electron-triton mass ratio',
  value       => 1.819200062251e-4,
  uncertainty => 0.000000000090e-4,
  units       => ''
);

constant \electron-volt-atomic-mass-unit-relationship is export(:physics :measured) = Constant.new(
  name        => 'electron volt-atomic mass unit relationship',
  value       => 1.07354410233e-9,
  uncertainty => 0.00000000032e-9,
  units       => 'u'
);

constant \electron-volt-hartree-relationship is export(:physics :measured) = Constant.new(
  name        => 'electron volt-hartree relationship',
  value       => 3.6749322175655e-2,
  uncertainty => 0.0000000000071e-2,
  units       => 'E_h'
);

constant \fermi-coupling-constant is export(:physics :measured) = Constant.new(
  name        => 'Fermi coupling constant',
  value       => 1.1663787e-5,
  uncertainty => 0.0000006e-5,
  units       => 'GeV⁻²'
);

constant \fine-structure-constant is export(:DEFAULT :physics :measured) = Constant.new(
  name        => 'fine-structure constant',
  value       => 0.0072973525693,
  uncertainty => 0.0000000000011,
  units       => '',
  symbol      => 'α'
);
constant \α is export(:DEFAULT :physics :measured) := fine-structure-constant;

constant \hartree-atomic-mass-unit-relationship is export(:physics :measured) = Constant.new(
  name        => 'hartree-atomic mass unit relationship',
  value       => 2.92126232205e-8,
  uncertainty => 0.00000000088e-8,
  units       => 'u'
);

constant \hartree-electron-volt-relationship is export(:physics :measured) = Constant.new(
  name        => 'hartree-electron volt relationship',
  value       => 27.211386245988,
  uncertainty =>  0.000000000053,
  units       => 'eV'
);

constant \hartree-energy is export(:physics :measured) = Constant.new(
  name        => 'Hartree energy',
  value       => 4.3597447222071e-18,
  uncertainty => 0.0000000000085e-18,
  units       => 'J'
);

constant \hartree-energy-in-eV is export(:physics :measured) = Constant.new(
  name        => 'Hartree energy in eV',
  value       => 27.211386245988,
  uncertainty =>  0.000000000053,
  units       => 'eV'
);

constant \hartree-hertz-relationship is export(:physics :measured) = Constant.new(
  name        => 'hartree-hertz relationship',
  value       => 6.579683920502e15,
  uncertainty => 0.000000000013e15,
  units       => 'Hz'
);

constant \hartree-inverse-meter-relationship is export(:physics :measured) = Constant.new(
  name        => 'hartree-inverse meter relationship',
  value       => 2.1947463136320e7,
  uncertainty => 0.0000000000043e7,
  units       => 'm⁻¹'
);

constant \hartree-joule-relationship is export(:physics :measured) = Constant.new(
  name        => 'hartree-joule relationship',
  value       => 4.3597447222071e-18,
  uncertainty => 0.0000000000085e-18,
  units       => 'J'
);

constant \hartree-kelvin-relationship is export(:physics :measured) = Constant.new(
  name        => 'hartree-kelvin relationship',
  value       => 3.1577502480407e5,
  uncertainty => 0.0000000000061e5,
  units       => 'K'
);

constant \hartree-kilogram-relationship is export(:physics :measured) = Constant.new(
  name        => 'hartree-kilogram relationship',
  value       => 4.8508702095432e-35,
  uncertainty => 0.0000000000094e-35,
  units       => 'kg'
);

constant \helion-electron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'helion-electron mass ratio',
  value       => 5495.88528007,
  uncertainty =>    0.00000024,
  units       => ''
);

constant \helion-g-factor is export(:physics :measured) = Constant.new(
  name        => 'helion g factor',
  value       => -4.255250615,
  uncertainty =>  0.000000050,
  units       => ''
);

constant \helion-mag-mom is export(:physics :measured) = Constant.new(
  name        => 'helion mag. mom.',
  value       => -1.074617532e-26,
  uncertainty =>  0.000000013e-26,
  units       => 'J·T⁻¹'
);

constant \helion-mag-mom-to-bohr-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'helion mag. mom. to Bohr magneton ratio',
  value       => -1.158740958e-3,
  uncertainty =>  0.000000014e-3,
  units       => ''
);

constant \helion-mag-mom-to-nuclear-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'helion mag. mom. to nuclear magneton ratio',
  value       => -2.127625307,
  uncertainty =>  0.000000025,
  units       => ''
);

constant \helion-mass is export(:physics :measured) = Constant.new(
  name        => 'helion mass',
  value       => 5.0064127796e-27,
  uncertainty => 0.0000000015e-27,
  units       => 'kg'
);

constant \helion-mass-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'helion mass energy equivalent',
  value       => 4.4995394125e-10,
  uncertainty => 0.0000000014e-10,
  units       => 'J'
);

constant \helion-mass-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'helion mass energy equivalent in MeV',
  value       => 2808.39160743,
  uncertainty =>    0.00000085,
  units       => 'MeV'
);

constant \helion-mass-in-u is export(:physics :measured) = Constant.new(
  name        => 'helion mass in u',
  value       => 3.014932247175,
  uncertainty => 0.000000000097,
  units       => 'u'
);

constant \helion-molar-mass is export(:physics :measured) = Constant.new(
  name        => 'helion molar mass',
  value       => 3.01493224613e-3,
  uncertainty => 0.00000000091e-3,
  units       => 'kg·mol⁻¹'
);

constant \helion-proton-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'helion-proton mass ratio',
  value       => 2.99315267167,
  uncertainty => 0.00000000013,
  units       => ''
);

constant \helion-relative-atomic-mass is export(:physics :measured) = Constant.new(
  name        => 'helion relative atomic mass',
  value       => 3.014932247175,
  uncertainty => 0.000000000097,
  units       => ''
);

constant \helion-shielding-shift is export(:physics :measured) = Constant.new(
  name        => 'helion shielding shift',
  value       => 5.996743e-5,
  uncertainty => 0.000010e-5,
  units       => ''
);

constant \hertz-atomic-mass-unit-relationship is export(:physics :measured) = Constant.new(
  name        => 'hertz-atomic mass unit relationship',
  value       => 4.4398216652e-24,
  uncertainty => 0.0000000013e-24,
  units       => 'u'
);

constant \hertz-hartree-relationship is export(:physics :measured) = Constant.new(
  name        => 'hertz-hartree relationship',
  value       => 1.5198298460570e-16,
  uncertainty => 0.0000000000029e-16,
  units       => 'E_h'
);

constant \inverse-fine-structure-constant is export(:physics :measured) = Constant.new(
  name        => 'inverse fine-structure constant',
  value       => 137.035999084,
  uncertainty =>   0.000000021,
  units       => ''
);

constant \inverse-meter-atomic-mass-unit-relationship is export(:physics :measured) = Constant.new(
  name        => 'inverse meter-atomic mass unit relationship',
  value       => 1.33102505010e-15,
  uncertainty => 0.00000000040e-15,
  units       => 'u'
);

constant \inverse-meter-hartree-relationship is export(:physics :measured) = Constant.new(
  name        => 'inverse meter-hartree relationship',
  value       => 4.5563352529120e-8,
  uncertainty => 0.0000000000088e-8,
  units       => 'E_h'
);

constant \joule-atomic-mass-unit-relationship is export(:physics :measured) = Constant.new(
  name        => 'joule-atomic mass unit relationship',
  value       => 6.7005352565e9,
  uncertainty => 0.0000000020e9,
  units       => 'u'
);

constant \joule-hartree-relationship is export(:physics :measured) = Constant.new(
  name        => 'joule-hartree relationship',
  value       => 2.2937122783963e17,
  uncertainty => 0.0000000000045e17,
  units       => 'E_h'
);

constant \kelvin-atomic-mass-unit-relationship is export(:physics :measured) = Constant.new(
  name        => 'kelvin-atomic mass unit relationship',
  value       => 9.2510873014e-14,
  uncertainty => 0.0000000028e-14,
  units       => 'u'
);

constant \kelvin-hartree-relationship is export(:physics :measured) = Constant.new(
  name        => 'kelvin-hartree relationship',
  value       => 3.1668115634556e-6,
  uncertainty => 0.0000000000061e-6,
  units       => 'E_h'
);

constant \kilogram-atomic-mass-unit-relationship is export(:physics :measured) = Constant.new(
  name        => 'kilogram-atomic mass unit relationship',
  value       => 6.0221407621e26,
  uncertainty => 0.0000000018e26,
  units       => 'u'
);

constant \kilogram-hartree-relationship is export(:physics :measured) = Constant.new(
  name        => 'kilogram-hartree relationship',
  value       => 2.0614857887409e34,
  uncertainty => 0.0000000000040e34,
  units       => 'E_h'
);

constant \lattice-parameter-of-silicon is export(:physics :measured) = Constant.new(
  name        => 'lattice parameter of silicon',
  value       => 5.431020511e-10,
  uncertainty => 0.000000089e-10,
  units       => 'm'
);

constant \lattice-spacing-of-ideal-Si_220 is export(:physics :measured) = Constant.new(
  name        => 'lattice spacing of ideal Si (220)',
  value       => 1.920155716e-10,
  uncertainty => 0.000000032e-10,
  units       => 'm'
);

constant \molar-mass-constant is export(:physics :measured) = Constant.new(
  name        => 'molar mass constant',
  value       => 0.99999999965e-3,
  uncertainty => 0.00000000030e-3,
  units       => 'kg·mol⁻¹'
);

constant \molar-mass-of-carbon_12 is export(:physics :measured) = Constant.new(
  name        => 'molar mass of carbon-12',
  value       => 0.0119999999958,
  uncertainty => 0.0000000000036,
  units       => 'kg·mol⁻¹'
);

constant \molar-volume-of-silicon is export(:physics :measured) = Constant.new(
  name        => 'molar volume of silicon',
  value       => 1.205883199e-5,
  uncertainty => 0.000000060e-5,
  units       => 'm³·mol⁻¹'
);

constant \molybdenum-x-unit is export(:physics :measured) = Constant.new(
  name        => 'Molybdenum x unit',
  value       => 1.00209952e-13,
  uncertainty => 0.00000053e-13,
  units       => 'm'
);

constant \muon-compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'muon Compton wavelength',
  value       => 1.173444110e-14,
  uncertainty => 0.000000026e-14,
  units       => 'm'
);

constant \muon-electron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'muon-electron mass ratio',
  value       => 206.7682830,
  uncertainty =>   0.0000046,
  units       => ''
);

constant \muon-g-factor is export(:physics :measured) = Constant.new(
  name        => 'muon g factor',
  value       => -2.0023318418,
  uncertainty =>  0.0000000013,
  units       => ''
);

constant \muon-mag-mom is export(:physics :measured) = Constant.new(
  name        => 'muon mag. mom.',
  value       => -4.49044830e-26,
  uncertainty =>  0.00000010e-26,
  units       => 'J·T⁻¹'
);

constant \muon-mag-mom-anomaly is export(:physics :measured) = Constant.new(
  name        => 'muon mag. mom. anomaly',
  value       => 1.16592089e-3,
  uncertainty => 0.00000063e-3,
  units       => ''
);

constant \muon-mag-mom-to-bohr-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'muon mag. mom. to Bohr magneton ratio',
  value       => -4.84197047e-3,
  uncertainty =>  0.00000011e-3,
  units       => ''
);

constant \muon-mag-mom-to-nuclear-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'muon mag. mom. to nuclear magneton ratio',
  value       => -8.89059703,
  uncertainty =>  0.00000020,
  units       => ''
);

constant \muon-mass is export(:physics :measured) = Constant.new(
  name        => 'muon mass',
  value       => 1.883531627e-28,
  uncertainty => 0.000000042e-28,
  units       => 'kg'
);

constant \muon-mass-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'muon mass energy equivalent',
  value       => 1.692833804e-11,
  uncertainty => 0.000000038e-11,
  units       => 'J'
);

constant \muon-mass-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'muon mass energy equivalent in MeV',
  value       => 105.6583755,
  uncertainty =>   0.0000023,
  units       => 'MeV'
);

constant \muon-mass-in-u is export(:physics :measured) = Constant.new(
  name        => 'muon mass in u',
  value       => 0.1134289259,
  uncertainty => 0.0000000025,
  units       => 'u'
);

constant \muon-molar-mass is export(:physics :measured) = Constant.new(
  name        => 'muon molar mass',
  value       => 1.134289259e-4,
  uncertainty => 0.000000025e-4,
  units       => 'kg·mol⁻¹'
);

constant \muon-neutron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'muon-neutron mass ratio',
  value       => 0.1124545170,
  uncertainty => 0.0000000025,
  units       => ''
);

constant \muon-proton-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'muon-proton mag. mom. ratio',
  value       => -3.183345142,
  uncertainty =>  0.000000071,
  units       => ''
);

constant \muon-proton-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'muon-proton mass ratio',
  value       => 0.1126095264,
  uncertainty => 0.0000000025,
  units       => ''
);

constant \muon-tau-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'muon-tau mass ratio',
  value       => 0.0594635,
  uncertainty => 0.0000040,
  units       => ''
);

constant \natural-unit-of-energy is export(:physics :measured) = Constant.new(
  name        => 'natural unit of energy',
  value       => 8.1871057769e-14,
  uncertainty => 0.0000000025e-14,
  units       => 'J'
);

constant \natural-unit-of-energy-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'natural unit of energy in MeV',
  value       => 0.51099895000,
  uncertainty => 0.00000000015,
  units       => 'MeV'
);

constant \natural-unit-of-length is export(:physics :measured) = Constant.new(
  name        => 'natural unit of length',
  value       => 3.8615926796e-13,
  uncertainty => 0.0000000012e-13,
  units       => 'm'
);

constant \natural-unit-of-mass is export(:physics :measured) = Constant.new(
  name        => 'natural unit of mass',
  value       => 9.1093837015e-31,
  uncertainty => 0.0000000028e-31,
  units       => 'kg'
);

constant \natural-unit-of-momentum is export(:physics :measured) = Constant.new(
  name        => 'natural unit of momentum',
  value       => 2.73092453075e-22,
  uncertainty => 0.00000000082e-22,
  units       => 'kg·m·s⁻¹'
);

constant \natural-unit-of-momentum-in-MeV-c is export(:physics :measured) = Constant.new(
  name        => 'natural unit of momentum in MeV/c',
  value       => 0.51099895000,
  uncertainty => 0.00000000015,
  units       => 'MeV/c'
);

constant \natural-unit-of-time is export(:physics :measured) = Constant.new(
  name        => 'natural unit of time',
  value       => 1.28808866819e-21,
  uncertainty => 0.00000000039e-21,
  units       => 's'
);

constant \neutron-compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'neutron Compton wavelength',
  value       => 1.31959090581e-15,
  uncertainty => 0.00000000075e-15,
  units       => 'm'
);

constant \neutron-electron-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron-electron mag. mom. ratio',
  value       => 1.04066882e-3,
  uncertainty => 0.00000025e-3,
  units       => ''
);

constant \neutron-electron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron-electron mass ratio',
  value       => 1838.68366173,
  uncertainty =>    0.00000089,
  units       => ''
);

constant \neutron-g-factor is export(:physics :measured) = Constant.new(
  name        => 'neutron g factor',
  value       => -3.82608545,
  uncertainty =>  0.00000090,
  units       => ''
);

constant \neutron-gyromag-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron gyromag. ratio',
  value       => 1.83247171e8,
  uncertainty => 0.00000043e8,
  units       => 's⁻¹·T⁻¹'
);

constant \neutron-gyromag-ratio-in-MHz-T is export(:physics :measured) = Constant.new(
  name        => 'neutron gyromag. ratio in MHz/T',
  value       => 29.1646931,
  uncertainty =>  0.0000069,
  units       => 'MHz·T⁻¹'
);

constant \neutron-mag-mom is export(:physics :measured) = Constant.new(
  name        => 'neutron mag. mom.',
  value       => -9.6623651e-27,
  uncertainty =>  0.0000023e-27,
  units       => 'J·T⁻¹'
);

constant \neutron-mag-mom-to-bohr-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron mag. mom. to Bohr magneton ratio',
  value       => -1.04187563e-3,
  uncertainty =>  0.00000025e-3,
  units       => ''
);

constant \neutron-mag-mom-to-nuclear-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron mag. mom. to nuclear magneton ratio',
  value       => -1.91304273,
  uncertainty =>  0.00000045,
  units       => ''
);

constant \neutron-mass is export(:DEFAULT :physics :measured) = Constant.new(
  name        => 'neutron mass',
  value       => 1.67492749804e-27,
  uncertainty => 0.00000000095e-27,
  units       => 'kg'
);

constant \neutron-mass-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'neutron mass energy equivalent',
  value       => 1.50534976287e-10,
  uncertainty => 0.00000000086e-10,
  units       => 'J'
);

constant \neutron-mass-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'neutron mass energy equivalent in MeV',
  value       => 939.56542052,
  uncertainty =>   0.00000054,
  units       => 'MeV'
);

constant \neutron-mass-in-u is export(:physics :measured) = Constant.new(
  name        => 'neutron mass in u',
  value       => 1.00866491595,
  uncertainty => 0.00000000049,
  units       => 'u'
);

constant \neutron-molar-mass is export(:physics :measured) = Constant.new(
  name        => 'neutron molar mass',
  value       => 1.00866491560e-3,
  uncertainty => 0.00000000057e-3,
  units       => 'kg·mol⁻¹'
);

constant \neutron-muon-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron-muon mass ratio',
  value       => 8.89248406,
  uncertainty => 0.00000020,
  units       => ''
);

constant \neutron-proton-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron-proton mag. mom. ratio',
  value       => -0.68497934,
  uncertainty =>  0.00000016,
  units       => ''
);

constant \neutron-proton-mass-difference is export(:physics :measured) = Constant.new(
  name        => 'neutron-proton mass difference',
  value       => 2.30557435e-30,
  uncertainty => 0.00000082e-30,
  units       => 'kg'
);

constant \neutron-proton-mass-difference-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'neutron-proton mass difference energy equivalent',
  value       => 2.07214689e-13,
  uncertainty => 0.00000074e-13,
  units       => 'J'
);

constant \neutron-proton-mass-difference-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'neutron-proton mass difference energy equivalent in MeV',
  value       => 1.29333236,
  uncertainty => 0.00000046,
  units       => 'MeV'
);

constant \neutron-proton-mass-difference-in-u is export(:physics :measured) = Constant.new(
  name        => 'neutron-proton mass difference in u',
  value       => 1.38844933e-3,
  uncertainty => 0.00000049e-3,
  units       => 'u'
);

constant \neutron-proton-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron-proton mass ratio',
  value       => 1.00137841931,
  uncertainty => 0.00000000049,
  units       => ''
);

constant \neutron-relative-atomic-mass is export(:physics :measured) = Constant.new(
  name        => 'neutron relative atomic mass',
  value       => 1.00866491595,
  uncertainty => 0.00000000049,
  units       => ''
);

constant \neutron-tau-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron-tau mass ratio',
  value       => 0.528779,
  uncertainty => 0.000036,
  units       => ''
);

constant \neutron-to-shielded-proton-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'neutron to shielded proton mag. mom. ratio',
  value       => -0.68499694,
  uncertainty =>  0.00000016,
  units       => ''
);

constant \newtonian-constant-of-gravitation is export(:physics :measured) = Constant.new(
  name        => 'Newtonian constant of gravitation',
  value       => 6.67430e-11,
  uncertainty => 0.00015e-11,
  units       => 'm³·kg⁻¹·s⁻²',
  symbol      => 'G'
);
constant \gravitation-constant is export(:DEFAULT :physics :measured) := newtonian-constant-of-gravitation;
constant \G                    is export(:DEFAULT :physics :measured) := newtonian-constant-of-gravitation;

constant \newtonian-constant-of-gravitation-over-h-bar-c is export(:physics :measured) = Constant.new(
  name        => 'Newtonian constant of gravitation over h-bar c',
  value       => 6.70883e-39,
  uncertainty => 0.00015e-39,
  units       => '(GeV/c²)⁻²'
);

constant \nuclear-magneton is export(:physics :measured) = Constant.new(
  name        => 'nuclear magneton',
  value       => 5.0507837461e-27,
  uncertainty => 0.0000000015e-27,
  units       => 'J·T⁻¹'
);

constant \nuclear-magneton-in-eV-T is export(:physics :measured) = Constant.new(
  name        => 'nuclear magneton in eV/T',
  value       => 3.15245125844e-8,
  uncertainty => 0.00000000096e-8,
  units       => 'eV·T⁻¹'
);

constant \nuclear-magneton-in-inverse-meter-per-tesla is export(:physics :measured) = Constant.new(
  name        => 'nuclear magneton in inverse meter per tesla',
  value       => 0.0254262341353,
  uncertainty => 0.0000000000078,
  units       => 'm⁻¹·T⁻¹'
);

constant \nuclear-magneton-in-K-T is export(:physics :measured) = Constant.new(
  name        => 'nuclear magneton in K/T',
  value       => 3.6582677756e-4,
  uncertainty => 0.0000000011e-4,
  units       => 'K·T⁻¹'
);

constant \nuclear-magneton-in-MHz-T is export(:physics :measured) = Constant.new(
  name        => 'nuclear magneton in MHz/T',
  value       => 7.6225932291,
  uncertainty => 0.0000000023,
  units       => 'MHz·T⁻¹'
);

constant \planck-length is export(:DEFAULT :physics :measured) = Constant.new(
  name        => 'Planck length',
  value       => 1.616255e-35,
  uncertainty => 0.000018e-35,
  units       => 'm',
  symbol      => 'lp'
);
constant \lp is export(:DEFAULT :physics :measured) := planck-length;

constant \planck-mass is export(:DEFAULT :physics :measured) = Constant.new(
  name        => 'Planck mass',
  value       => 2.176434e-8,
  uncertainty => 0.000024e-8,
  units       => 'kg',
  symbol      => 'mp'
);
constant \mp is export(:DEFAULT :physics :measured) := planck-mass;

constant \planck-mass-energy-equivalent-in-GeV is export(:physics :measured) = Constant.new(
  name        => 'Planck mass energy equivalent in GeV',
  value       => 1.220890e19,
  uncertainty => 0.000014e19,
  units       => 'GeV'
);

constant \planck-temperature is export(:DEFAULT :physics :measured) = Constant.new(
  name        => 'Planck temperature',
  value       => 1.416784e32,
  uncertainty => 0.000016e32,
  units       => 'K',
  symbol      => 'Tp'
);
constant \Tp is export(:DEFAULT :physics :measured) := planck-temperature;

constant \planck-time is export(:DEFAULT :physics :measured) = Constant.new(
  name        => 'Planck time',
  value       => 5.391247e-44,
  uncertainty => 0.000060e-44,
  units       => 's',
  symbol      => 'tp'
);
constant \tp is export(:DEFAULT :physics :measured) := planck-time;

constant \proton-charge-to-mass-quotient is export(:physics :measured) = Constant.new(
  name        => 'proton charge to mass quotient',
  value       => 9.5788331560e7,
  uncertainty => 0.0000000029e7,
  units       => 'C·kg⁻¹'
);

constant \proton-compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'proton Compton wavelength',
  value       => 1.32140985539e-15,
  uncertainty => 0.00000000040e-15,
  units       => 'm'
);

constant \proton-electron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'proton-electron mass ratio',
  value       => 1836.15267343,
  uncertainty =>    0.00000011,
  units       => ''
);

constant \proton-g-factor is export(:physics :measured) = Constant.new(
  name        => 'proton g factor',
  value       => 5.5856946893,
  uncertainty => 0.0000000016,
  units       => ''
);

constant \proton-gyromag-ratio is export(:physics :measured) = Constant.new(
  name        => 'proton gyromag. ratio',
  value       => 2.6752218744e8,
  uncertainty => 0.0000000011e8,
  units       => 's⁻¹·T⁻¹'
);

constant \proton-gyromag-ratio-in-MHz-T is export(:physics :measured) = Constant.new(
  name        => 'proton gyromag. ratio in MHz/T',
  value       => 42.577478518,
  uncertainty =>  0.000000018,
  units       => 'MHz·T⁻¹'
);

constant \proton-mag-mom is export(:physics :measured) = Constant.new(
  name        => 'proton mag. mom.',
  value       => 1.41060679736e-26,
  uncertainty => 0.00000000060e-26,
  units       => 'J·T⁻¹'
);

constant \proton-mag-mom-to-bohr-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'proton mag. mom. to Bohr magneton ratio',
  value       => 1.52103220230e-3,
  uncertainty => 0.00000000046e-3,
  units       => ''
);

constant \proton-mag-mom-to-nuclear-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'proton mag. mom. to nuclear magneton ratio',
  value       => 2.79284734463,
  uncertainty => 0.00000000082,
  units       => ''
);

constant \proton-mag-shielding-correction is export(:physics :measured) = Constant.new(
  name        => 'proton mag. shielding correction',
  value       => 2.5689e-5,
  uncertainty => 0.0011e-5,
  units       => ''
);

constant \proton-mass is export(:DEFAULT :physics :measured) = Constant.new(
  name        => 'proton mass',
  value       => 1.67262192369e-27,
  uncertainty => 0.00000000051e-27,
  units       => 'kg'
);

constant \proton-mass-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'proton mass energy equivalent',
  value       => 1.50327761598e-10,
  uncertainty => 0.00000000046e-10,
  units       => 'J'
);

constant \proton-mass-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'proton mass energy equivalent in MeV',
  value       => 938.27208816,
  uncertainty =>   0.00000029,
  units       => 'MeV'
);

constant \proton-mass-in-u is export(:physics :measured) = Constant.new(
  name        => 'proton mass in u',
  value       => 1.007276466621,
  uncertainty => 0.000000000053,
  units       => 'u'
);

constant \proton-molar-mass is export(:physics :measured) = Constant.new(
  name        => 'proton molar mass',
  value       => 1.00727646627e-3,
  uncertainty => 0.00000000031e-3,
  units       => 'kg·mol⁻¹'
);

constant \proton-muon-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'proton-muon mass ratio',
  value       => 8.88024337,
  uncertainty => 0.00000020,
  units       => ''
);

constant \proton-neutron-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'proton-neutron mag. mom. ratio',
  value       => -1.45989805,
  uncertainty =>  0.00000034,
  units       => ''
);

constant \proton-neutron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'proton-neutron mass ratio',
  value       => 0.99862347812,
  uncertainty => 0.00000000049,
  units       => ''
);

constant \proton-relative-atomic-mass is export(:physics :measured) = Constant.new(
  name        => 'proton relative atomic mass',
  value       => 1.007276466621,
  uncertainty => 0.000000000053,
  units       => ''
);

constant \proton-rms-charge-radius is export(:physics :measured) = Constant.new(
  name        => 'proton rms charge radius',
  value       => 8.414e-16,
  uncertainty => 0.019e-16,
  units       => 'm'
);

constant \proton-tau-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'proton-tau mass ratio',
  value       => 0.528051,
  uncertainty => 0.000036,
  units       => ''
);

constant \quantum-of-circulation is export(:physics :measured) = Constant.new(
  name        => 'quantum of circulation',
  value       => 3.6369475516e-4,
  uncertainty => 0.0000000011e-4,
  units       => 'm²·s⁻¹'
);

constant \quantum-of-circulation-times_2 is export(:physics :measured) = Constant.new(
  name        => 'quantum of circulation times 2',
  value       => 7.2738951032e-4,
  uncertainty => 0.0000000022e-4,
  units       => 'm²·s⁻¹'
);

constant \reduced-compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'reduced Compton wavelength',
  value       => 3.8615926796e-13,
  uncertainty => 0.0000000012e-13,
  units       => 'm'
);

constant \reduced-muon-compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'reduced muon Compton wavelength',
  value       => 1.867594306e-15,
  uncertainty => 0.000000042e-15,
  units       => 'm'
);

constant \reduced-neutron-compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'reduced neutron Compton wavelength',
  value       => 2.1001941552e-16,
  uncertainty => 0.0000000012e-16,
  units       => 'm'
);

constant \reduced-proton-compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'reduced proton Compton wavelength',
  value       => 2.10308910336e-16,
  uncertainty => 0.00000000064e-16,
  units       => 'm'
);

constant \reduced-tau-compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'reduced tau Compton wavelength',
  value       => 1.110538e-16,
  uncertainty => 0.000075e-16,
  units       => 'm'
);

constant \rydberg-constant is export(:physics :measured) = Constant.new(
  name        => 'Rydberg constant',
  value       => 10973731.568160,
  uncertainty =>        0.000021,
  units       => 'm⁻¹'
);

constant \rydberg-constant-times-c-in-Hz is export(:physics :measured) = Constant.new(
  name        => 'Rydberg constant times c in Hz',
  value       => 3.2898419602508e+15,
  uncertainty => 0.0000000000064e15,
  units       => 'Hz'
);

constant \rydberg-constant-times-hc-in-eV is export(:physics :measured) = Constant.new(
  name        => 'Rydberg constant times hc in eV',
  value       => 13.605693122994,
  uncertainty =>  0.000000000026,
  units       => 'eV'
);

constant \rydberg-constant-times-hc-in-J is export(:physics :measured) = Constant.new(
  name        => 'Rydberg constant times hc in J',
  value       => 2.1798723611035e-18,
  uncertainty => 0.0000000000042e-18,
  units       => 'J'
);

constant \sackur-tetrode-constant_1-K_100-kPa is export(:physics :measured) = Constant.new(
  name        => 'Sackur-Tetrode constant (1 K, 100 kPa)',
  value       => -1.15170753706,
  uncertainty =>  0.00000000045,
  units       => ''
);

constant \sackur-tetrode-constant_1-K_101325-kPa is export(:physics :measured) = Constant.new(
  name        => 'Sackur-Tetrode constant (1 K, 101.325 kPa)',
  value       => -1.16487052358,
  uncertainty =>  0.00000000045,
  units       => ''
);

constant \shielded-helion-gyromag-ratio is export(:physics :measured) = Constant.new(
  name        => 'shielded helion gyromag. ratio',
  value       => 2.037894569e8,
  uncertainty => 0.000000024e8,
  units       => 's⁻¹·T⁻¹'
);

constant \shielded-helion-gyromag-ratio-in-MHz-T is export(:physics :measured) = Constant.new(
  name        => 'shielded helion gyromag. ratio in MHz/T',
  value       => 32.43409942,
  uncertainty =>  0.00000038,
  units       => 'MHz·T⁻¹'
);

constant \shielded-helion-mag-mom is export(:physics :measured) = Constant.new(
  name        => 'shielded helion mag. mom.',
  value       => -1.074553090e-26,
  uncertainty =>  0.000000013e-26,
  units       => 'J·T⁻¹'
);

constant \shielded-helion-mag-mom-to-bohr-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'shielded helion mag. mom. to Bohr magneton ratio',
  value       => -1.158671471e-3,
  uncertainty =>  0.000000014e-3,
  units       => ''
);

constant \shielded-helion-mag-mom-to-nuclear-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'shielded helion mag. mom. to nuclear magneton ratio',
  value       => -2.127497719,
  uncertainty =>  0.000000025,
  units       => ''
);

constant \shielded-helion-to-proton-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'shielded helion to proton mag. mom. ratio',
  value       => -0.7617665618,
  uncertainty =>  0.0000000089,
  units       => ''
);

constant \shielded-helion-to-shielded-proton-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'shielded helion to shielded proton mag. mom. ratio',
  value       => -0.7617861313,
  uncertainty =>  0.0000000033,
  units       => ''
);

constant \shielded-proton-gyromag-ratio is export(:physics :measured) = Constant.new(
  name        => 'shielded proton gyromag. ratio',
  value       => 2.675153151e8,
  uncertainty => 0.000000029e8,
  units       => 's⁻¹·T⁻¹'
);

constant \shielded-proton-gyromag-ratio-in-MHz-T is export(:physics :measured) = Constant.new(
  name        => 'shielded proton gyromag. ratio in MHz/T',
  value       => 42.57638474,
  uncertainty =>  0.00000046,
  units       => 'MHz·T⁻¹'
);

constant \shielded-proton-mag-mom is export(:physics :measured) = Constant.new(
  name        => 'shielded proton mag. mom.',
  value       => 1.410570560e-26,
  uncertainty => 0.000000015e-26,
  units       => 'J·T⁻¹'
);

constant \shielded-proton-mag-mom-to-bohr-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'shielded proton mag. mom. to Bohr magneton ratio',
  value       => 1.520993128e-3,
  uncertainty => 0.000000017e-3,
  units       => ''
);

constant \shielded-proton-mag-mom-to-nuclear-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'shielded proton mag. mom. to nuclear magneton ratio',
  value       => 2.792775599,
  uncertainty => 0.000000030,
  units       => ''
);

constant \shielding-difference-of-d-and-p-in-HD is export(:physics :measured) = Constant.new(
  name        => 'shielding difference of d and p in HD',
  value       => 2.0200e-8,
  uncertainty => 0.0020e-8,
  units       => ''
);

constant \shielding-difference-of-t-and-p-in-HT is export(:physics :measured) = Constant.new(
  name        => 'shielding difference of t and p in HT',
  value       => 2.4140e-8,
  uncertainty => 0.0020e-8,
  units       => ''
);

constant \tau-compton-wavelength is export(:physics :measured) = Constant.new(
  name        => 'tau Compton wavelength',
  value       => 6.97771e-16,
  uncertainty => 0.00047e-16,
  units       => 'm'
);

constant \tau-electron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'tau-electron mass ratio',
  value       => 3477.23,
  uncertainty =>    0.23,
  units       => ''
);

constant \tau-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'tau energy equivalent',
  value       => 1776.86,
  uncertainty =>    0.12,
  units       => 'MeV'
);

constant \tau-mass is export(:physics :measured) = Constant.new(
  name        => 'tau mass',
  value       => 3.16754e-27,
  uncertainty => 0.00021e-27,
  units       => 'kg'
);

constant \tau-mass-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'tau mass energy equivalent',
  value       => 2.84684e-10,
  uncertainty => 0.00019e-10,
  units       => 'J'
);

constant \tau-mass-in-u is export(:physics :measured) = Constant.new(
  name        => 'tau mass in u',
  value       => 1.90754,
  uncertainty => 0.00013,
  units       => 'u'
);

constant \tau-molar-mass is export(:physics :measured) = Constant.new(
  name        => 'tau molar mass',
  value       => 1.90754e-3,
  uncertainty => 0.00013e-3,
  units       => 'kg·mol⁻¹'
);

constant \tau-muon-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'tau-muon mass ratio',
  value       => 16.8170,
  uncertainty =>  0.0011,
  units       => ''
);

constant \tau-neutron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'tau-neutron mass ratio',
  value       => 1.89115,
  uncertainty => 0.00013,
  units       => ''
);

constant \tau-proton-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'tau-proton mass ratio',
  value       => 1.89376,
  uncertainty => 0.00013,
  units       => ''
);

constant \thomson-cross-section is export(:physics :measured) = Constant.new(
  name        => 'Thomson cross section',
  value       => 6.6524587321e-29,
  uncertainty => 0.0000000060e-29,
  units       => 'm²'
);

constant \triton-electron-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'triton-electron mass ratio',
  value       => 5496.92153573,
  uncertainty =>    0.00000027,
  units       => ''
);

constant \triton-g-factor is export(:physics :measured) = Constant.new(
  name        => 'triton g factor',
  value       => 5.957924931,
  uncertainty => 0.000000012,
  units       => ''
);

constant \triton-mag-mom is export(:physics :measured) = Constant.new(
  name        => 'triton mag. mom.',
  value       => 1.5046095202e-26,
  uncertainty => 0.0000000030e-26,
  units       => 'J·T⁻¹'
);

constant \triton-mag-mom-to-bohr-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'triton mag. mom. to Bohr magneton ratio',
  value       => 1.6223936651e-3,
  uncertainty => 0.0000000032e-3,
  units       => ''
);

constant \triton-mag-mom-to-nuclear-magneton-ratio is export(:physics :measured) = Constant.new(
  name        => 'triton mag. mom. to nuclear magneton ratio',
  value       => 2.9789624656,
  uncertainty => 0.0000000059,
  units       => ''
);

constant \triton-mass is export(:physics :measured) = Constant.new(
  name        => 'triton mass',
  value       => 5.0073567446e-27,
  uncertainty => 0.0000000015e-27,
  units       => 'kg'
);

constant \triton-mass-energy-equivalent is export(:physics :measured) = Constant.new(
  name        => 'triton mass energy equivalent',
  value       => 4.5003878060e-10,
  uncertainty => 0.0000000014e-10,
  units       => 'J'
);

constant \triton-mass-energy-equivalent-in-MeV is export(:physics :measured) = Constant.new(
  name        => 'triton mass energy equivalent in MeV',
  value       => 2808.92113298,
  uncertainty =>    0.00000085,
  units       => 'MeV'
);

constant \triton-mass-in-u is export(:physics :measured) = Constant.new(
  name        => 'triton mass in u',
  value       => 3.01550071621,
  uncertainty => 0.00000000012,
  units       => 'u'
);

constant \triton-molar-mass is export(:physics :measured) = Constant.new(
  name        => 'triton molar mass',
  value       => 3.01550071517e-3,
  uncertainty => 0.00000000092e-3,
  units       => 'kg·mol⁻¹'
);

constant \triton-proton-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'triton-proton mass ratio',
  value       => 2.99371703414,
  uncertainty => 0.00000000015,
  units       => ''
);

constant \triton-relative-atomic-mass is export(:physics :measured) = Constant.new(
  name        => 'triton relative atomic mass',
  value       => 3.01550071621,
  uncertainty => 0.00000000012,
  units       => ''
);

constant \triton-to-proton-mag-mom-ratio is export(:physics :measured) = Constant.new(
  name        => 'triton to proton mag. mom. ratio',
  value       => 1.0666399191,
  uncertainty => 0.0000000021,
  units       => ''
);

constant \unified-atomic-mass-unit is export(:physics :measured) = Constant.new(
  name        => 'unified atomic mass unit',
  value       => 1.66053906660e-27,
  uncertainty => 0.00000000050e-27,
  units       => 'kg'
);

constant \vacuum-electric-permittivity is export(:physics :measured) = Constant.new(
  name        => 'vacuum electric permittivity',
  value       => 8.8541878128e-12,
  uncertainty => 0.0000000013e-12,
  units       => 'F·m⁻¹',
  symbol      => 'ε0'
);
constant \vacuum-permittivity is export(:DEFAULT :physics :measured) := vacuum-electric-permittivity;
constant \ε0                  is export(:DEFAULT :physics :measured) := vacuum-electric-permittivity;

constant \vacuum-mag-permeability is export(:physics :measured) = Constant.new(
  name        => 'vacuum mag. permeability',
  value       => 1.25663706212e-6,
  uncertainty => 0.00000000019e-6,
  units       => 'N·A⁻²',
  symbol      => 'μ0'
);
constant \magnetic-permeability is export(:DEFAULT :physics :measured) := vacuum-mag-permeability;
constant \vacuum-permeability   is export(:DEFAULT :physics :measured) := vacuum-mag-permeability;
constant \μ0                    is export(:DEFAULT :physics :measured) := vacuum-mag-permeability;

constant \weak-mixing-angle is export(:physics :measured) = Constant.new(
  name        => 'weak mixing angle',
  value       => 0.22290,
  uncertainty => 0.00030,
  units       => ''
);

constant \w-to-z-mass-ratio is export(:physics :measured) = Constant.new(
  name        => 'W to Z mass ratio',
  value       => 0.88153,
  uncertainty => 0.00017,
  units       => ''
);

# Mathematics constants

my constant phi                           is export(:DEFAULT :math) = Constant.new(
  name   => 'Golden Ratio',
  value  => 1.61803398874989e0,
  symbol => 'φ'
);
my constant φ  is export := phi;

my constant alpha-feigenbaum-constant     is export(:DEFAULT :math) = Constant.new(
  name  => 'alpha Feigenbaum constant',
  value => 2.502907875095892822283e0
);

my constant delta-feigenbaum-constant     is export(:DEFAULT :math) = Constant.new(
  name   => 'delta Feigenbaum constant',
  value  => 4.669201609102990e0,
  symbol => 'δ'
);
my constant δ  is export(:DEFAULT :math) := delta-feigenbaum-constant;

my constant apery-constant                is export(:DEFAULT :math) = Constant.new(
  name  => 'Apery constant',
  value => 1.2020569031595942853997381e0
);

my constant conway-constant               is export(:DEFAULT :math) = Constant.new(
  name   => 'Conway constant',
  value  => 1.303577269034e0,
  symbol => 'λ'
);
my constant λ  is export(:DEFAULT :math) := conway-constant;

my constant khinchin-constant             is export(:DEFAULT :math) = Constant.new(
  name   => 'Khinchin constant',
  value  => 2.6854520010e0,
  symbol => 'k0'
);
my constant k0 is export(:DEFAULT :math) := khinchin-constant;

my constant glaisher-kinkelin-constant    is export(:DEFAULT :math) = Constant.new(
  name   => 'Glaisher-Kinkelin constant',
  value  => 1.2824271291e0,
  symbol => 'A'
);
my constant A  is export(:DEFAULT :math) := glaisher-kinkelin-constant;

my constant golomb-dickman-constant       is export(:DEFAULT :math) = Constant.new(
  name  => 'Golomb Dickman constant',
  value => 0.62432998854355e0
);

my constant catalan-constant              is export(:DEFAULT :math) = Constant.new(
  name  => 'Catalan constant',
  value => 0.915965594177219015054603514e0
);

my constant mill-constant                 is export(:DEFAULT :math) = Constant.new(
  name  => 'Mill constant',
  value => 1.3063778838630806904686144e0
);

my constant gauss-constant                is export(:DEFAULT :math) = Constant.new(
  name  => 'Gauss Constant',
  value => 0.8346268e0
);

my constant euler-mascheroni-gamma        is export(:DEFAULT :math) = Constant.new(
  name   => 'Euler Mascheroni constant',
  value  => 0.57721566490153286060e0,
  symbol => 'γ'
);
my constant γ is export(:DEFAULT :math) := euler-mascheroni-gamma;

my constant sierpinski-gamma              is export(:DEFAULT :math) = Constant.new(
  name   => 'Sierpinski gamma',
  value  => 2.5849817595e0,
  symbol => 'k'
);
my constant k  is export(:DEFAULT :math) := sierpinski-gamma;

# Use them as units

sub postfix:<c>  (Real $value) is export(:DEFAULT :physics :fundamental :defined) {
    return c×$value;
}

sub postfix:<g>  (Real $value) is export(:DEFAULT :physics :defined) {
    return g×$value;
}

sub postfix:<eV>  (Real $value) is export(:DEFAULT :physics :derived) {
    return $value / eV;
}

=begin pod
=head1 Math::Constants

Math::Constants - A few constants defined in Raku

=head1 SYNOPSIS

	#!/usr/bin/env raku
	
	use v6;
	use Math::Constants;

	say "We have ", phi, " ", plancks-h, " ",  plancks-reduced-h, " ", 
	    c, " ", G, " and ", fine-structure-constant, " plus ",
	    elementary-charge, " and ", vacuum-permittivity ;
		
	say "And also  φ ", φ, " α ", α,  " ℎ ",  ℎ, " and ℏ ", ℏ,
	    " with e ", e, " and ε0 ", ε0;

	say "We are flying at speed ", .1c;

=head1 DESCRIPTION

Math::Constants is a collection of Math and Physics constants that
will save you the trouble of defining them.

=head2 Constant values

Each constant is defined as an object, an instance of a class which contains the
necessary information for the constant. (This behaviour is new in version 0.9.)

The accessors available for each constant are:
=begin item
value

This is the value of the constant. All constants have a useful value!
=end item

=begin item
name

This is the name of the constant. For the physics constants, this contains the full
name of the constant as given by NIST.
=end item

=begin item
uncertainty

This is the uncertainty in the value of the constant. Where the value is known exactly
then this is given as 0.
=end item

=begin item
units

This is a string containing the units of the physics constant.
=end item

When the constant is evaluated in a numeric or string context, the value of the
constant is used. This is compatible with usage of the module in version 0.1.1
or older.

For example, C<my $speed = 0.1 × speed-of-light-vacuum; say $speed> will produce
"C<29979245.8>".

However, be careful. The object contains an explicit C<gist> method which will
generate a string containing the value, the uncertainity (if given) and the
units (if given). Thus a program using C<say> directly on a constant defined
here will give unexpected results: "C<say speed-of-light-vacuum;>" will produce
"C<299792458 m·s⁻¹>", and "C<say alpha-particle-mass;>" will produce
"C<6.6446573357e-27±2e-36 kg>". The space before the units is a unicode thin
space as specified by the SI standards.

=head2 EXPORT tags

To decrease the pollution of your programs name-space, several tags are available.

In order to maintain compatibility with earlier versions of this module,
the DEFAULT tag has been applied to exactly those constants which were
defined in the previously released version of this module -- 0.1.1.

Thus the code
  C<use Math::Constants;>
will define exactly the same constants in all versions 0.1.1 and later.

The code
  C<use Math::Constants math;>
will define all math constants; no physics constants will be defined.

More variety is possible in deciding which physics constants will be defined.

The seven fundamental physics constants can be included by using the C<fundamental> tag.
These are the seven constants which define the SI system of units: the speed of light,
Planck's constant, elementary charge, Boltzmann's constants, Avogadro's constant,
The hyperfine transition frequency of Cs, and the luminous efficacy of 540 THz radiation.

Other physics constants which are defined exactly, such as the standard acceleration
due to gravity, can be included using the C<defined> tag.

Constants which are derived from other constants which are defined exactly
(i.e. those using the C<fundamental> and C<defined> tags)
can be defined by including the C<derived> tag.
These constants are calculated from the values from which they are derived
rather than using the values given by NIST. This gives more precise values,
the values given by NIST being truncated with less precision that is
available using 64-bit floating point numbers.

The remaining constants, those which rely on physical measurements, can be included by
using the C<measured> tag. Note that constants which at first sight appear as if they
could be calculated from other measured values are B<not> calculated, but the NIST values are used.
The precision with which (for example) the ratio of the proton and electron masses can be measured
might be greater than the precision with which either of the two individual masses can be measured.

=head2 Constants included

=head3 Mathematical constants
=begin table
Constant name                                                  | variable name | DEFAULT | math
=============================================================|===============|=========|=========
Golden ratio | phi | DFLT | math
Golden ratio | φ | DFLT | math
Feigenbaum constants | alpha-feigenbaum-constant | DFLT | math
Feigenbaum constants | delta-feigenbaum-constant | DFLT | math
Feigenbaum constants | δ | DFLT | math
Apéry's constant | apery-constant | DFLT | math
Conway's constant | conway-constant | DFLT | math
Conway's constant | λ | DFLT | math
Khinchin's constant | khinchin-constant | DFLT | math
Khinchin's constant | k0 | DFLT | math
Glaisher–Kinkelin constant | glaisher-kinkelin-constant | DFLT | math
Glaisher–Kinkelin constant | A | DFLT | math
Golomb–Dickman constant | golomb-dickman-constant | DFLT | math
Catalan's constant | catalan-constant | DFLT | math
Mill's constant | mill-constant | DFLT | math
Gauss's constant | gauss-constant | DFLT | math
Euler–Mascheroni constant | euler-mascheroni-gamma | DFLT | math
Euler–Mascheroni constant | γ | DFLT | math
Sierpiński's constant | sierpinski-gamma | DFLT | math
Sierpiński's constant | k | DFLT | math
=end table

=head3 Physical constants

All the physical constants have the CODATA 2018 recommended values. These reflect the new definitions of the kilogram and ampere as of 2019-05-20.
All constants given in L<https://physics.nist.giv/cuu/Constants> are defined here. Constants whose value can be derived from other exact values
are calculated, and so will give more precise values than those in the NIST tables, but all agree to the level of precision given by NIST.

=begin table
CODATA name                                                  | variable name | DEFAULT | physics | fundamental | defined | derived | measured
=============================================================|===============|=========|=========|=============|=========|=========|==========
alpha particle-electron mass ratio                           | alpha-particle-electron-mass-ratio                           |   | phys |   |   |   | msrd
alpha particle mass                                          | alpha-particle-mass                                          | DFLT | phys |   |   |   | msrd
alpha particle mass energy equivalent                        | alpha-particle-mass-energy-equivalent                        |   | phys |   |   |   | msrd
alpha particle mass energy equivalent in MeV                 | alpha-particle-mass-energy-equivalent-in-MeV                 |   | phys |   |   |   | msrd
alpha particle mass in u                                     | alpha-particle-mass-in-u                                     |   | phys |   |   |   | msrd
alpha particle molar mass                                    | alpha-particle-molar-mass                                    |   | phys |   |   |   | msrd
alpha particle-proton mass ratio                             | alpha-particle-proton-mass-ratio                             |   | phys |   |   |   | msrd
alpha particle relative atomic mass                          | alpha-particle-relative-atomic-mass                          |   | phys |   |   |   | msrd
Angstrom star                                                | angstrom-star                                                |   | phys |   |   |   | msrd
atomic mass constant                                         | atomic-mass-constant                                         |   | phys |   |   |   | msrd
atomic mass constant energy equivalent                       | atomic-mass-constant-energy-equivalent                       |   | phys |   |   |   | msrd
atomic mass constant energy equivalent in MeV                | atomic-mass-constant-energy-equivalent-in-MeV                |   | phys |   |   |   | msrd
atomic mass unit-electron volt relationship                  | atomic-mass-unit-electron-volt-relationship                  |   | phys |   |   |   | msrd
atomic mass unit-hartree relationship                        | atomic-mass-unit-hartree-relationship                        |   | phys |   |   |   | msrd
atomic mass unit-hertz relationship                          | atomic-mass-unit-hertz-relationship                          |   | phys |   |   |   | msrd
atomic mass unit-inverse meter relationship                  | atomic-mass-unit-inverse-meter-relationship                  |   | phys |   |   |   | msrd
atomic mass unit-joule relationship                          | atomic-mass-unit-joule-relationship                          |   | phys |   |   |   | msrd
atomic mass unit-kelvin relationship                         | atomic-mass-unit-kelvin-relationship                         |   | phys |   |   |   | msrd
atomic mass unit-kilogram relationship                       | atomic-mass-unit-kilogram-relationship                       |   | phys |   |   |   | msrd
atomic unit of 1st hyperpolarizability                       | atomic-unit-of_1st-hyperpolarizability                       |   | phys |   |   |   | msrd
atomic unit of 2nd hyperpolarizability                       | atomic-unit-of_2nd-hyperpolarizability                       |   | phys |   |   |   | msrd
atomic unit of action                                        | atomic-unit-of-action                                        |   | phys |   |   | drvd |  
atomic unit of charge                                        | atomic-unit-of-charge                                        |   | phys |   |   | drvd |  
atomic unit of charge density                                | atomic-unit-of-charge-density                                |   | phys |   |   |   | msrd
atomic unit of current                                       | atomic-unit-of-current                                       |   | phys |   |   |   | msrd
atomic unit of electric dipole mom.                          | atomic-unit-of-electric-dipole-mom                           |   | phys |   |   |   | msrd
atomic unit of electric field                                | atomic-unit-of-electric-field                                |   | phys |   |   |   | msrd
atomic unit of electric field gradient                       | atomic-unit-of-electric-field-gradient                       |   | phys |   |   |   | msrd
atomic unit of electric polarizability                       | atomic-unit-of-electric-polarizability                       |   | phys |   |   |   | msrd
atomic unit of electric potential                            | atomic-unit-of-electric-potential                            |   | phys |   |   |   | msrd
atomic unit of electric quadrupole mom.                      | atomic-unit-of-electric-quadrupole-mom                       |   | phys |   |   |   | msrd
atomic unit of energy                                        | atomic-unit-of-energy                                        |   | phys |   |   |   | msrd
atomic unit of force                                         | atomic-unit-of-force                                         |   | phys |   |   |   | msrd
atomic unit of length                                        | atomic-unit-of-length                                        |   | phys |   |   |   | msrd
atomic unit of mag. dipole mom.                              | atomic-unit-of-mag-dipole-mom                                |   | phys |   |   |   | msrd
atomic unit of mag. flux density                             | atomic-unit-of-mag-flux-density                              |   | phys |   |   |   | msrd
atomic unit of magnetizability                               | atomic-unit-of-magnetizability                               |   | phys |   |   |   | msrd
atomic unit of mass                                          | atomic-unit-of-mass                                          |   | phys |   |   |   | msrd
atomic unit of momentum                                      | atomic-unit-of-momentum                                      |   | phys |   |   |   | msrd
atomic unit of permittivity                                  | atomic-unit-of-permittivity                                  |   | phys |   |   |   | msrd
atomic unit of time                                          | atomic-unit-of-time                                          |   | phys |   |   |   | msrd
atomic unit of velocity                                      | atomic-unit-of-velocity                                      |   | phys |   |   |   | msrd
Avogadro constant                                            | avogadro-constant                                            |   | phys | fund | def |   |  
Avogadro constant                                            | L                                                            | DFLT | phys | fund | def |   |  
Avogadro constant                                            | Na                                                           | DFLT | phys | fund | def |   |  
Avogadro constant                                            | kg-amu                                                       | DFLT | phys | fund | def |   |  
Bohr magneton                                                | bohr-magneton                                                |   | phys |   |   |   | msrd
Bohr magneton in eV/T                                        | bohr-magneton-in-eV-T                                        |   | phys |   |   |   | msrd
Bohr magneton in Hz/T                                        | bohr-magneton-in-Hz-T                                        |   | phys |   |   |   | msrd
Bohr magneton in inverse meter per tesla                     | bohr-magneton-in-inverse-meter-per-tesla                     |   | phys |   |   |   | msrd
Bohr magneton in K/T                                         | bohr-magneton-in-K-T                                         |   | phys |   |   |   | msrd
Bohr radius                                                  | bohr-radius                                                  |   | phys |   |   |   | msrd
Boltzmann constant                                           | boltzmann-constant                                           | DFLT | phys | fund | def |   |  
Boltzmann constant                                           | k                                                            | DFLT | phys | fund | def |   |  
Boltzmann constant in eV/K                                   | boltzmann-constant-in-eV-K                                   |   | phys |   |   | drvd |  
Boltzmann constant in Hz/K                                   | boltzmann-constant-in-Hz-K                                   |   | phys |   |   | drvd |  
Boltzmann constant in inverse meter per kelvin               | boltzmann-constant-in-inverse-meter-per-kelvin               |   | phys |   |   | drvd |  
characteristic impedance of vacuum                           | characteristic-impedance-of-vacuum                           |   | phys |   |   |   | msrd
classical electron radius                                    | classical-electron-radius                                    |   | phys |   |   |   | msrd
Compton wavelength                                           | compton-wavelength                                           |   | phys |   |   |   | msrd
conductance quantum                                          | conductance-quantum                                          |   | phys |   |   | drvd |  
conventional value of ampere-90                              | conventional-value-of-ampere_90                              |   | phys |   |   | drvd |  
conventional value of coulomb-90                             | conventional-value-of-coulomb_90                             |   | phys |   |   | drvd |  
conventional value of farad-90                               | conventional-value-of-farad_90                               |   | phys |   |   | drvd |  
conventional value of henry-90                               | conventional-value-of-henry_90                               |   | phys |   |   | drvd |  
conventional value of Josephson constant                     | conventional-value-of-josephson-constant                     |   | phys |   |   | drvd |  
conventional value of Josephson constant                     | Kj90                                                         |   | phys |   |   | drvd |  
conventional value of ohm-90                                 | conventional-value-of-ohm_90                                 |   | phys |   |   | drvd |  
conventional value of volt-90                                | conventional-value-of-volt_90                                |   | phys |   |   | drvd |  
conventional value of von Klitzing constant                  | conventional-value-of-von-klitzing-constant                  |   | phys |   |   | drvd |  
conventional value of von Klitzing constant                  | RK90                                                         |   | phys |   |   | drvd |  
conventional value of watt-90                                | conventional-value-of-watt_90                                |   | phys |   |   | drvd |  
Copper x unit                                                | copper-x-unit                                                |   | phys |   |   |   | msrd
deuteron-electron mag. mom. ratio                            | deuteron-electron-mag-mom-ratio                              |   | phys |   |   |   | msrd
deuteron-electron mass ratio                                 | deuteron-electron-mass-ratio                                 |   | phys |   |   |   | msrd
deuteron g factor                                            | deuteron-g-factor                                            |   | phys |   |   |   | msrd
deuteron mag. mom.                                           | deuteron-mag-mom                                             |   | phys |   |   |   | msrd
deuteron mag. mom. to Bohr magneton ratio                    | deuteron-mag-mom-to-bohr-magneton-ratio                      |   | phys |   |   |   | msrd
deuteron mag. mom. to nuclear magneton ratio                 | deuteron-mag-mom-to-nuclear-magneton-ratio                   |   | phys |   |   |   | msrd
deuteron mass                                                | deuteron-mass                                                |   | phys |   |   |   | msrd
deuteron mass energy equivalent                              | deuteron-mass-energy-equivalent                              |   | phys |   |   |   | msrd
deuteron mass energy equivalent in MeV                       | deuteron-mass-energy-equivalent-in-MeV                       |   | phys |   |   |   | msrd
deuteron mass in u                                           | deuteron-mass-in-u                                           |   | phys |   |   |   | msrd
deuteron molar mass                                          | deuteron-molar-mass                                          |   | phys |   |   |   | msrd
deuteron-neutron mag. mom. ratio                             | deuteron-neutron-mag-mom-ratio                               |   | phys |   |   |   | msrd
deuteron-proton mag. mom. ratio                              | deuteron-proton-mag-mom-ratio                                |   | phys |   |   |   | msrd
deuteron-proton mass ratio                                   | deuteron-proton-mass-ratio                                   |   | phys |   |   |   | msrd
deuteron relative atomic mass                                | deuteron-relative-atomic-mass                                |   | phys |   |   |   | msrd
deuteron rms charge radius                                   | deuteron-rms-charge-radius                                   |   | phys |   |   |   | msrd
electron charge to mass quotient                             | electron-charge-to-mass-quotient                             |   | phys |   |   |   | msrd
electron-deuteron mag. mom. ratio                            | electron-deuteron-mag-mom-ratio                              |   | phys |   |   |   | msrd
electron-deuteron mass ratio                                 | electron-deuteron-mass-ratio                                 |   | phys |   |   |   | msrd
electron g factor                                            | electron-g-factor                                            |   | phys |   |   |   | msrd
electron gyromag. ratio                                      | electron-gyromag-ratio                                       |   | phys |   |   |   | msrd
electron gyromag. ratio in MHz/T                             | electron-gyromag-ratio-in-MHz-T                              |   | phys |   |   |   | msrd
electron-helion mass ratio                                   | electron-helion-mass-ratio                                   |   | phys |   |   |   | msrd
electron mag. mom.                                           | electron-mag-mom                                             |   | phys |   |   |   | msrd
electron mag. mom. anomaly                                   | electron-mag-mom-anomaly                                     |   | phys |   |   |   | msrd
electron mag. mom. to Bohr magneton ratio                    | electron-mag-mom-to-bohr-magneton-ratio                      |   | phys |   |   |   | msrd
electron mag. mom. to nuclear magneton ratio                 | electron-mag-mom-to-nuclear-magneton-ratio                   |   | phys |   |   |   | msrd
electron mass                                                | electron-mass                                                | DFLT | phys |   |   |   | msrd
electron mass energy equivalent                              | electron-mass-energy-equivalent                              |   | phys |   |   |   | msrd
electron mass energy equivalent in MeV                       | electron-mass-energy-equivalent-in-MeV                       |   | phys |   |   |   | msrd
electron mass in u                                           | electron-mass-in-u                                           |   | phys |   |   |   | msrd
electron molar mass                                          | electron-molar-mass                                          |   | phys |   |   |   | msrd
electron-muon mag. mom. ratio                                | electron-muon-mag-mom-ratio                                  |   | phys |   |   |   | msrd
electron-muon mass ratio                                     | electron-muon-mass-ratio                                     |   | phys |   |   |   | msrd
electron-neutron mag. mom. ratio                             | electron-neutron-mag-mom-ratio                               |   | phys |   |   |   | msrd
electron-neutron mass ratio                                  | electron-neutron-mass-ratio                                  |   | phys |   |   |   | msrd
electron-proton mag. mom. ratio                              | electron-proton-mag-mom-ratio                                |   | phys |   |   |   | msrd
electron-proton mass ratio                                   | electron-proton-mass-ratio                                   |   | phys |   |   |   | msrd
electron relative atomic mass                                | electron-relative-atomic-mass                                |   | phys |   |   |   | msrd
electron-tau mass ratio                                      | electron-tau-mass-ratio                                      |   | phys |   |   |   | msrd
electron to alpha particle mass ratio                        | electron-to-alpha-particle-mass-ratio                        |   | phys |   |   |   | msrd
electron to shielded helion mag. mom. ratio                  | electron-to-shielded-helion-mag-mom-ratio                    |   | phys |   |   |   | msrd
electron to shielded proton mag. mom. ratio                  | electron-to-shielded-proton-mag-mom-ratio                    |   | phys |   |   |   | msrd
electron-triton mass ratio                                   | electron-triton-mass-ratio                                   |   | phys |   |   |   | msrd
electron volt-atomic mass unit relationship                  | electron-volt-atomic-mass-unit-relationship                  |   | phys |   |   |   | msrd
electron volt                                                | electron-volt                                                | DFLT | phys |   |   | drvd |  
electron volt                                                | eV                                                           | DFLT | phys |   |   | drvd |  
electron volt-hartree relationship                           | electron-volt-hartree-relationship                           |   | phys |   |   |   | msrd
electron volt-hertz relationship                             | electron-volt-hertz-relationship                             |   | phys |   |   | drvd |  
electron volt-hertz relationship                             | quantum-ratio                                                | DFLT | phys |   |   | drvd |  
electron volt-inverse meter relationship                     | electron-volt-inverse-meter-relationship                     |   | phys |   |   | drvd |  
electron volt-joule relationship                             | electron-volt-joule-relationship                             |   | phys |   |   | drvd |  
electron volt-kelvin relationship                            | electron-volt-kelvin-relationship                            |   | phys |   |   | drvd |  
electron volt-kilogram relationship                          | electron-volt-kilogram-relationship                          |   | phys |   |   | drvd |  
elementary charge                                            | elementary-charge                                            | DFLT | phys | fund | def |   |  
elementary charge                                            | q                                                            | DFLT | phys | fund | def |   |  
elementary charge over h-bar                                 | elementary-charge-over-h-bar                                 |   | phys |   |   | drvd |  
Faraday constant                                             | faraday-constant                                             | DFLT | phys |   |   | drvd |  
Faraday constant                                             | F                                                            | DFLT | phys |   |   | drvd |  
Fermi coupling constant                                      | fermi-coupling-constant                                      |   | phys |   |   |   | msrd
fine-structure constant                                      | fine-structure-constant                                      | DFLT | phys |   |   |   | msrd
fine-structure constant                                      | α                                                            | DFLT | phys |   |   |   | msrd
first radiation constant                                     | first-radiation-constant                                     |   | phys |   |   | drvd |  
first radiation constant for spectral radiance               | first-radiation-constant-for-spectral-radiance               |   | phys |   |   | drvd |  
hartree-atomic mass unit relationship                        | hartree-atomic-mass-unit-relationship                        |   | phys |   |   |   | msrd
hartree-electron volt relationship                           | hartree-electron-volt-relationship                           |   | phys |   |   |   | msrd
Hartree energy                                               | hartree-energy                                               |   | phys |   |   |   | msrd
Hartree energy in eV                                         | hartree-energy-in-eV                                         |   | phys |   |   |   | msrd
hartree-hertz relationship                                   | hartree-hertz-relationship                                   |   | phys |   |   |   | msrd
hartree-inverse meter relationship                           | hartree-inverse-meter-relationship                           |   | phys |   |   |   | msrd
hartree-joule relationship                                   | hartree-joule-relationship                                   |   | phys |   |   |   | msrd
hartree-kelvin relationship                                  | hartree-kelvin-relationship                                  |   | phys |   |   |   | msrd
hartree-kilogram relationship                                | hartree-kilogram-relationship                                |   | phys |   |   |   | msrd
helion-electron mass ratio                                   | helion-electron-mass-ratio                                   |   | phys |   |   |   | msrd
helion g factor                                              | helion-g-factor                                              |   | phys |   |   |   | msrd
helion mag. mom.                                             | helion-mag-mom                                               |   | phys |   |   |   | msrd
helion mag. mom. to Bohr magneton ratio                      | helion-mag-mom-to-bohr-magneton-ratio                        |   | phys |   |   |   | msrd
helion mag. mom. to nuclear magneton ratio                   | helion-mag-mom-to-nuclear-magneton-ratio                     |   | phys |   |   |   | msrd
helion mass energy equivalent                                | helion-mass-energy-equivalent                                |   | phys |   |   |   | msrd
helion mass energy equivalent in MeV                         | helion-mass-energy-equivalent-in-MeV                         |   | phys |   |   |   | msrd
helion mass                                                  | helion-mass                                                  |   | phys |   |   |   | msrd
helion mass in u                                             | helion-mass-in-u                                             |   | phys |   |   |   | msrd
helion molar mass                                            | helion-molar-mass                                            |   | phys |   |   |   | msrd
helion-proton mass ratio                                     | helion-proton-mass-ratio                                     |   | phys |   |   |   | msrd
helion relative atomic mass                                  | helion-relative-atomic-mass                                  |   | phys |   |   |   | msrd
helion shielding shift                                       | helion-shielding-shift                                       |   | phys |   |   |   | msrd
hertz-atomic mass unit relationship                          | hertz-atomic-mass-unit-relationship                          |   | phys |   |   |   | msrd
hertz-electron volt relationship                             | hertz-electron-volt-relationship                             |   | phys |   |   | drvd |  
hertz-hartree relationship                                   | hertz-hartree-relationship                                   |   | phys |   |   |   | msrd
hertz-inverse meter relationship                             | hertz-inverse-meter-relationship                             |   | phys |   |   | drvd |  
hertz-joule relationship                                     | hertz-joule-relationship                                     |   | phys |   |   | drvd |  
hertz-kelvin relationship                                    | hertz-kelvin-relationship                                    |   | phys |   |   | drvd |  
hertz-kilogram relationship                                  | hertz-kilogram-relationship                                  |   | phys |   |   | drvd |  
hyperfine transition frequency of Cs-133                     | hyperfine-transition-frequency-of-Cs_133                     | DFLT | phys | fund | def |   |  
inverse fine-structure constant                              | inverse-fine-structure-constant                              |   | phys |   |   |   | msrd
inverse meter-atomic mass unit relationship                  | inverse-meter-atomic-mass-unit-relationship                  |   | phys |   |   |   | msrd
inverse meter-electron volt relationship                     | inverse-meter-electron-volt-relationship                     |   | phys |   |   | drvd |  
inverse meter-hartree relationship                           | inverse-meter-hartree-relationship                           |   | phys |   |   |   | msrd
inverse meter-hertz relationship                             | inverse-meter-hertz-relationship                             |   | phys |   |   | drvd |  
inverse meter-joule relationship                             | inverse-meter-joule-relationship                             |   | phys |   |   | drvd |  
inverse meter-kelvin relationship                            | inverse-meter-kelvin-relationship                            |   | phys |   |   | drvd |  
inverse meter-kilogram relationship                          | inverse-meter-kilogram-relationship                          |   | phys |   |   | drvd |  
inverse of conductance quantum                               | inverse-of-conductance-quantum                               |   | phys |   |   | drvd |  
Josephson constant                                           | josephson-constant                                           |   | phys |   |   | drvd |  
Josephson constant                                           | Kj                                                           |   | phys |   |   | drvd |  
joule-atomic mass unit relationship                          | joule-atomic-mass-unit-relationship                          |   | phys |   |   |   | msrd
joule-electron volt relationship                             | joule-electron-volt-relationship                             |   | phys |   |   | drvd |  
joule-hartree relationship                                   | joule-hartree-relationship                                   |   | phys |   |   |   | msrd
joule-hertz relationship                                     | joule-hertz-relationship                                     |   | phys |   |   | drvd |  
joule-inverse meter relationship                             | joule-inverse-meter-relationship                             |   | phys |   |   | drvd |  
joule-kelvin relationship                                    | joule-kelvin-relationship                                    |   | phys |   |   | drvd |  
joule-kilogram relationship                                  | joule-kilogram-relationship                                  |   | phys |   |   | drvd |  
kelvin-atomic mass unit relationship                         | kelvin-atomic-mass-unit-relationship                         |   | phys |   |   |   | msrd
kelvin-electron volt relationship                            | kelvin-electron-volt-relationship                            |   | phys |   |   | drvd |  
kelvin-hartree relationship                                  | kelvin-hartree-relationship                                  |   | phys |   |   |   | msrd
kelvin-hertz relationship                                    | kelvin-hertz-relationship                                    |   | phys |   |   | drvd |  
kelvin-inverse meter relationship                            | kelvin-inverse-meter-relationship                            |   | phys |   |   | drvd |  
kelvin-joule relationship                                    | kelvin-joule-relationship                                    |   | phys |   |   | drvd |  
kelvin-kilogram relationship                                 | kelvin-kilogram-relationship                                 |   | phys |   |   | drvd |  
kilogram-atomic mass unit relationship                       | kilogram-atomic-mass-unit-relationship                       |   | phys |   |   |   | msrd
kilogram-electron volt relationship                          | kilogram-electron-volt-relationship                          |   | phys |   |   | drvd |  
kilogram-hartree relationship                                | kilogram-hartree-relationship                                |   | phys |   |   |   | msrd
kilogram-hertz relationship                                  | kilogram-hertz-relationship                                  |   | phys |   |   | drvd |  
kilogram-inverse meter relationship                          | kilogram-inverse-meter-relationship                          |   | phys |   |   | drvd |  
kilogram-joule relationship                                  | coulomb-constant                                             | DFLT | phys |   |   | drvd |  
kilogram-joule relationship                                  | K0                                                           | DFLT | phys |   |   | drvd |  
kilogram-joule relationship                                  | kilogram-joule-relationship                                  |   | phys |   |   | drvd |  
kilogram-kelvin relationship                                 | kilogram-kelvin-relationship                                 |   | phys |   |   | drvd |  
lattice parameter of silicon                                 | lattice-parameter-of-silicon                                 |   | phys |   |   |   | msrd
lattice spacing of ideal Si (220)                            | lattice-spacing-of-ideal-Si_220                              |   | phys |   |   |   | msrd
Loschmidt constant (273.15 K, 100 kPa)                       | loschmidt-constant-stp                                       |   | phys |   |   | drvd |  
Loschmidt constant (273.15 K, 101.325 kPa)                   | loschmidt-constant-ntp                                       |   | phys |   |   | drvd |  
luminous efficacy                                            | luminous-efficacy                                            | DFLT | phys | fund | def |   |  
mag. flux quantum                                            | mag-flux-quantum                                             |   | phys |   |   | drvd |  
molar gas constant                                           | gas-constant                                                 | DFLT | phys |   |   | drvd |  
molar gas constant                                           | molar-gas-constant                                           |   | phys |   |   | drvd |  
molar mass constant                                          | molar-mass-constant                                          |   | phys |   |   |   | msrd
molar mass of carbon-12                                      | molar-mass-of-carbon_12                                      |   | phys |   |   |   | msrd
molar Planck constant                                        | molar-planck-constant                                        |   | phys |   |   | drvd |  
molar volume of ideal gas (273.15 K, 100 kPa)                | molar-volume-of-ideal-gas-stp                                |   | phys |   |   | drvd |  
molar volume of ideal gas (273.15 K, 101.325 kPa)            | molar-volume-of-ideal-gas-ntp                                |   | phys |   |   | drvd |  
molar volume of silicon                                      | molar-volume-of-silicon                                      |   | phys |   |   |   | msrd
Molybdenum x unit                                            | molybdenum-x-unit                                            |   | phys |   |   |   | msrd
muon Compton wavelength                                      | muon-compton-wavelength                                      |   | phys |   |   |   | msrd
muon-electron mass ratio                                     | muon-electron-mass-ratio                                     |   | phys |   |   |   | msrd
muon g factor                                                | muon-g-factor                                                |   | phys |   |   |   | msrd
muon mag. mom. anomaly                                       | muon-mag-mom-anomaly                                         |   | phys |   |   |   | msrd
muon mag. mom.                                               | muon-mag-mom                                                 |   | phys |   |   |   | msrd
muon mag. mom. to Bohr magneton ratio                        | muon-mag-mom-to-bohr-magneton-ratio                          |   | phys |   |   |   | msrd
muon mag. mom. to nuclear magneton ratio                     | muon-mag-mom-to-nuclear-magneton-ratio                       |   | phys |   |   |   | msrd
muon mass energy equivalent in MeV                           | muon-mass-energy-equivalent-in-MeV                           |   | phys |   |   |   | msrd
muon mass energy equivalent                                  | muon-mass-energy-equivalent                                  |   | phys |   |   |   | msrd
muon mass in u                                               | muon-mass-in-u                                               |   | phys |   |   |   | msrd
muon mass                                                    | muon-mass                                                    |   | phys |   |   |   | msrd
muon molar mass                                              | muon-molar-mass                                              |   | phys |   |   |   | msrd
muon-neutron mass ratio                                      | muon-neutron-mass-ratio                                      |   | phys |   |   |   | msrd
muon-proton mag. mom. ratio                                  | muon-proton-mag-mom-ratio                                    |   | phys |   |   |   | msrd
muon-proton mass ratio                                       | muon-proton-mass-ratio                                       |   | phys |   |   |   | msrd
muon-tau mass ratio                                          | muon-tau-mass-ratio                                          |   | phys |   |   |   | msrd
natural unit of action in eV s                               | natural-unit-of-action-in-eV-s                               |   | phys |   |   | drvd |  
natural unit of action                                       | natural-unit-of-action                                       |   | phys |   |   | drvd |  
natural unit of energy in MeV                                | natural-unit-of-energy-in-MeV                                |   | phys |   |   |   | msrd
natural unit of energy                                       | natural-unit-of-energy                                       |   | phys |   |   |   | msrd
natural unit of length                                       | natural-unit-of-length                                       |   | phys |   |   |   | msrd
natural unit of mass                                         | natural-unit-of-mass                                         |   | phys |   |   |   | msrd
natural unit of momentum in MeV/c                            | natural-unit-of-momentum-in-MeV-c                            |   | phys |   |   |   | msrd
natural unit of momentum                                     | natural-unit-of-momentum                                     |   | phys |   |   |   | msrd
natural unit of time                                         | natural-unit-of-time                                         |   | phys |   |   |   | msrd
natural unit of velocity                                     | natural-unit-of-velocity                                     |   | phys |   |   | drvd |  
neutron Compton wavelength                                   | neutron-compton-wavelength                                   |   | phys |   |   |   | msrd
neutron-electron mag. mom. ratio                             | neutron-electron-mag-mom-ratio                               |   | phys |   |   |   | msrd
neutron-electron mass ratio                                  | neutron-electron-mass-ratio                                  |   | phys |   |   |   | msrd
neutron g factor                                             | neutron-g-factor                                             |   | phys |   |   |   | msrd
neutron gyromag. ratio in MHz/T                              | neutron-gyromag-ratio-in-MHz-T                               |   | phys |   |   |   | msrd
neutron gyromag. ratio                                       | neutron-gyromag-ratio                                        |   | phys |   |   |   | msrd
neutron mag. mom.                                            | neutron-mag-mom                                              |   | phys |   |   |   | msrd
neutron mag. mom. to Bohr magneton ratio                     | neutron-mag-mom-to-bohr-magneton-ratio                       |   | phys |   |   |   | msrd
neutron mag. mom. to nuclear magneton ratio                  | neutron-mag-mom-to-nuclear-magneton-ratio                    |   | phys |   |   |   | msrd
neutron mass                                                 | neutron-mass                                                 | DFLT | phys |   |   |   | msrd
neutron mass energy equivalent in MeV                        | neutron-mass-energy-equivalent-in-MeV                        |   | phys |   |   |   | msrd
neutron mass energy equivalent                               | neutron-mass-energy-equivalent                               |   | phys |   |   |   | msrd
neutron mass in u                                            | neutron-mass-in-u                                            |   | phys |   |   |   | msrd
neutron molar mass                                           | neutron-molar-mass                                           |   | phys |   |   |   | msrd
neutron-muon mass ratio                                      | neutron-muon-mass-ratio                                      |   | phys |   |   |   | msrd
neutron-proton mag. mom. ratio                               | neutron-proton-mag-mom-ratio                                 |   | phys |   |   |   | msrd
neutron-proton mass difference energy equivalent in MeV      | neutron-proton-mass-difference-energy-equivalent-in-MeV      |   | phys |   |   |   | msrd
neutron-proton mass difference energy equivalent             | neutron-proton-mass-difference-energy-equivalent             |   | phys |   |   |   | msrd
neutron-proton mass difference in u                          | neutron-proton-mass-difference-in-u                          |   | phys |   |   |   | msrd
neutron-proton mass difference                               | neutron-proton-mass-difference                               |   | phys |   |   |   | msrd
neutron-proton mass ratio                                    | neutron-proton-mass-ratio                                    |   | phys |   |   |   | msrd
neutron relative atomic mass                                 | neutron-relative-atomic-mass                                 |   | phys |   |   |   | msrd
neutron-tau mass ratio                                       | neutron-tau-mass-ratio                                       |   | phys |   |   |   | msrd
neutron to shielded proton mag. mom. ratio                   | neutron-to-shielded-proton-mag-mom-ratio                     |   | phys |   |   |   | msrd
Newtonian constant of gravitation                            | newtonian-constant-of-gravitation                            |   | phys |   |   |   | msrd
Newtonian constant of gravitation                            | gravitation-constant                                         | DFLT | phys |   |   |   | msrd
Newtonian constant of gravitation                            | G                                                            | DFLT | phys |   |   |   | msrd
Newtonian constant of gravitation over h-bar c               | newtonian-constant-of-gravitation-over-h-bar-c               |   | phys |   |   |   | msrd
nuclear magneton in eV/T                                     | nuclear-magneton-in-eV-T                                     |   | phys |   |   |   | msrd
nuclear magneton in inverse meter per tesla                  | nuclear-magneton-in-inverse-meter-per-tesla                  |   | phys |   |   |   | msrd
nuclear magneton in K/T                                      | nuclear-magneton-in-K-T                                      |   | phys |   |   |   | msrd
nuclear magneton in MHz/T                                    | nuclear-magneton-in-MHz-T                                    |   | phys |   |   |   | msrd
nuclear magneton                                             | nuclear-magneton                                             |   | phys |   |   |   | msrd
Planck constant                                              | planck-constant                                              |   | phys | fund | def |   |  
Planck constant                                              | plancks-h                                                    | DFLT | phys | fund | def |   |  
Planck constant                                              | ℎ                                                            | DFLT | phys | fund | def |   |  
Planck constant in eV/Hz                                     | planck-constant-in-eV-Hz                                     |   | phys |   |   | drvd |  
Planck length                                                | planck-length                                                | DFLT | phys |   |   |   | msrd
Planck length                                                | lp                                                           | DFLT | phys |   |   |   | msrd
Planck mass energy equivalent in GeV                         | planck-mass-energy-equivalent-in-GeV                         |   | phys |   |   |   | msrd
Planck mass                                                  | planck-mass                                                  | DFLT | phys |   |   |   | msrd
Planck mass                                                  | mp                                                           | DFLT | phys |   |   |   | msrd
Planck temperature                                           | planck-temperature                                           | DFLT | phys |   |   |   | msrd
Planck temperature                                           | Tp                                                           | DFLT | phys |   |   |   | msrd
Planck time                                                  | planck-time                                                  | DFLT | phys |   |   |   | msrd
Planck time                                                  | tp                                                           | DFLT | phys |   |   |   | msrd
proton charge to mass quotient                               | proton-charge-to-mass-quotient                               |   | phys |   |   |   | msrd
proton Compton wavelength                                    | proton-compton-wavelength                                    |   | phys |   |   |   | msrd
proton-electron mass ratio                                   | proton-electron-mass-ratio                                   |   | phys |   |   |   | msrd
proton g factor                                              | proton-g-factor                                              |   | phys |   |   |   | msrd
proton gyromag. ratio in MHz/T                               | proton-gyromag-ratio-in-MHz-T                                |   | phys |   |   |   | msrd
proton gyromag. ratio                                        | proton-gyromag-ratio                                         |   | phys |   |   |   | msrd
proton mag. mom.                                             | proton-mag-mom                                               |   | phys |   |   |   | msrd
proton mag. mom. to Bohr magneton ratio                      | proton-mag-mom-to-bohr-magneton-ratio                        |   | phys |   |   |   | msrd
proton mag. mom. to nuclear magneton ratio                   | proton-mag-mom-to-nuclear-magneton-ratio                     |   | phys |   |   |   | msrd
proton mag. shielding correction                             | proton-mag-shielding-correction                              |   | phys |   |   |   | msrd
proton mass energy equivalent in MeV                         | proton-mass-energy-equivalent-in-MeV                         |   | phys |   |   |   | msrd
proton mass energy equivalent                                | proton-mass-energy-equivalent                                |   | phys |   |   |   | msrd
proton mass                                                  | proton-mass                                                  | DFLT | phys |   |   |   | msrd
proton mass in u                                             | proton-mass-in-u                                             |   | phys |   |   |   | msrd
proton molar mass                                            | proton-molar-mass                                            |   | phys |   |   |   | msrd
proton-muon mass ratio                                       | proton-muon-mass-ratio                                       |   | phys |   |   |   | msrd
proton-neutron mag. mom. ratio                               | proton-neutron-mag-mom-ratio                                 |   | phys |   |   |   | msrd
proton-neutron mass ratio                                    | proton-neutron-mass-ratio                                    |   | phys |   |   |   | msrd
proton relative atomic mass                                  | proton-relative-atomic-mass                                  |   | phys |   |   |   | msrd
proton rms charge radius                                     | proton-rms-charge-radius                                     |   | phys |   |   |   | msrd
proton-tau mass ratio                                        | proton-tau-mass-ratio                                        |   | phys |   |   |   | msrd
quantum of circulation                                       | quantum-of-circulation                                       |   | phys |   |   |   | msrd
quantum of circulation times 2                               | quantum-of-circulation-times_2                               |   | phys |   |   |   | msrd
reduced Compton wavelength                                   | reduced-compton-wavelength                                   |   | phys |   |   |   | msrd
reduced muon Compton wavelength                              | reduced-muon-compton-wavelength                              |   | phys |   |   |   | msrd
reduced neutron Compton wavelength                           | reduced-neutron-compton-wavelength                           |   | phys |   |   |   | msrd
reduced Planck constant                                      | reduced-planck-constant                                      |   | phys |   |   | drvd |  
reduced Planck constant                                      | plancks-reduced-h                                            | DFLT | phys |   |   | drvd |  
reduced Planck constant                                      | ℏ                                                            | DFLT | phys |   |   | drvd |  
reduced Planck constant in eV s                              | reduced-planck-constant-in-eV-s                              |   | phys |   |   | drvd |  
reduced Planck constant times c in MeV fm                    | reduced-planck-constant-times-c-in-MeV-fm                    |   | phys |   |   |   | msrd
reduced proton Compton wavelength                            | reduced-proton-compton-wavelength                            |   | phys |   |   |   | msrd
reduced tau Compton wavelength                               | reduced-tau-compton-wavelength                               |   | phys |   |   |   | msrd
Rydberg constant                                             | rydberg-constant                                             |   | phys |   |   |   | msrd
Rydberg constant times c in Hz                               | rydberg-constant-times-c-in-Hz                               |   | phys |   |   |   | msrd
Rydberg constant times hc in eV                              | rydberg-constant-times-hc-in-eV                              |   | phys |   |   |   | msrd
Rydberg constant times hc in J                               | rydberg-constant-times-hc-in-J                               |   | phys |   |   |   | msrd
Sackur-Tetrode constant (1 K, 100 kPa)                       | sackur-tetrode-constant_1-K_100-kPa                          |   | phys |   |   |   | msrd
Sackur-Tetrode constant (1 K, 101.325 kPa)                   | sackur-tetrode-constant_1-K_101325-kPa                       |   | phys |   |   |   | msrd
second radiation constant                                    | second-radiation-constant                                    |   | phys |   |   | drvd |  
shielded helion gyromag. ratio in MHz/T                      | shielded-helion-gyromag-ratio-in-MHz-T                       |   | phys |   |   |   | msrd
shielded helion gyromag. ratio                               | shielded-helion-gyromag-ratio                                |   | phys |   |   |   | msrd
shielded helion mag. mom.                                    | shielded-helion-mag-mom                                      |   | phys |   |   |   | msrd
shielded helion mag. mom. to Bohr magneton ratio             | shielded-helion-mag-mom-to-bohr-magneton-ratio               |   | phys |   |   |   | msrd
shielded helion mag. mom. to nuclear magneton ratio          | shielded-helion-mag-mom-to-nuclear-magneton-ratio            |   | phys |   |   |   | msrd
shielded helion to proton mag. mom. ratio                    | shielded-helion-to-proton-mag-mom-ratio                      |   | phys |   |   |   | msrd
shielded helion to shielded proton mag. mom. ratio           | shielded-helion-to-shielded-proton-mag-mom-ratio             |   | phys |   |   |   | msrd
shielded proton gyromag. ratio in MHz/T                      | shielded-proton-gyromag-ratio-in-MHz-T                       |   | phys |   |   |   | msrd
shielded proton gyromag. ratio                               | shielded-proton-gyromag-ratio                                |   | phys |   |   |   | msrd
shielded proton mag. mom.                                    | shielded-proton-mag-mom                                      |   | phys |   |   |   | msrd
shielded proton mag. mom. to Bohr magneton ratio             | shielded-proton-mag-mom-to-bohr-magneton-ratio               |   | phys |   |   |   | msrd
shielded proton mag. mom. to nuclear magneton ratio          | shielded-proton-mag-mom-to-nuclear-magneton-ratio            |   | phys |   |   |   | msrd
shielding difference of d and p in HD                        | shielding-difference-of-d-and-p-in-HD                        |   | phys |   |   |   | msrd
shielding difference of t and p in HT                        | shielding-difference-of-t-and-p-in-HT                        |   | phys |   |   |   | msrd
speed of light in vacuum                                     | speed-of-light-vacuum                                        | DFLT | phys | fund | def |   |  
speed of light in vacuum                                     | c                                                            | DFLT | phys | fund | def |   |  
standard acceleration of gravity                             | standard-acceleration-gravity                                | DFLT | phys |   | def |   |  
standard acceleration of gravity                             | g                                                            | DFLT | phys |   | def |   |  
standard atmosphere                                          | standard-atmosphere                                          |   | phys |   |   |   | msrd
standard-state pressure                                      | standard-state-pressure                                      |   | phys |   |   |   | msrd
Stefan-Boltzmann constant                                    | stefan-boltzmann-constant                                    |   | phys |   |   | drvd |  
tau Compton wavelength                                       | tau-compton-wavelength                                       |   | phys |   |   |   | msrd
tau-electron mass ratio                                      | tau-electron-mass-ratio                                      |   | phys |   |   |   | msrd
tau energy equivalent                                        | tau-energy-equivalent                                        |   | phys |   |   |   | msrd
tau mass energy equivalent                                   | tau-mass-energy-equivalent                                   |   | phys |   |   |   | msrd
tau mass                                                     | tau-mass                                                     |   | phys |   |   |   | msrd
tau mass in u                                                | tau-mass-in-u                                                |   | phys |   |   |   | msrd
tau molar mass                                               | tau-molar-mass                                               |   | phys |   |   |   | msrd
tau-muon mass ratio                                          | tau-muon-mass-ratio                                          |   | phys |   |   |   | msrd
tau-neutron mass ratio                                       | tau-neutron-mass-ratio                                       |   | phys |   |   |   | msrd
tau-proton mass ratio                                        | tau-proton-mass-ratio                                        |   | phys |   |   |   | msrd
Thomson cross section                                        | thomson-cross-section                                        |   | phys |   |   |   | msrd
triton-electron mass ratio                                   | triton-electron-mass-ratio                                   |   | phys |   |   |   | msrd
triton g factor                                              | triton-g-factor                                              |   | phys |   |   |   | msrd
triton mag. mom. to Bohr magneton ratio                      | triton-mag-mom-to-bohr-magneton-ratio                        |   | phys |   |   |   | msrd
triton mag. mom. to nuclear magneton ratio                   | triton-mag-mom-to-nuclear-magneton-ratio                     |   | phys |   |   |   | msrd
triton mag. mom.                                             | triton-mag-mom                                               |   | phys |   |   |   | msrd
triton mass energy equivalent in MeV                         | triton-mass-energy-equivalent-in-MeV                         |   | phys |   |   |   | msrd
triton mass energy equivalent                                | triton-mass-energy-equivalent                                |   | phys |   |   |   | msrd
triton mass in u                                             | triton-mass-in-u                                             |   | phys |   |   |   | msrd
triton mass                                                  | triton-mass                                                  |   | phys |   |   |   | msrd
triton molar mass                                            | triton-molar-mass                                            |   | phys |   |   |   | msrd
triton-proton mass ratio                                     | triton-proton-mass-ratio                                     |   | phys |   |   |   | msrd
triton relative atomic mass                                  | triton-relative-atomic-mass                                  |   | phys |   |   |   | msrd
triton to proton mag. mom. ratio                             | triton-to-proton-mag-mom-ratio                               |   | phys |   |   |   | msrd
unified atomic mass unit                                     | unified-atomic-mass-unit                                     |   | phys |   |   |   | msrd
vacuum electric permittivity                                 | vacuum-electric-permittivity                                 |   | phys |   |   |   | msrd
vacuum electric permittivity                                 | vacuum-permittivity                                          | DFLT | phys |   |   |   | msrd
vacuum electric permittivity                                 | ε0                                                           | DFLT | phys |   |   |   | msrd
vacuum mag. permeability                                     | vacuum-mag-permeability                                      |   | phys |   |   |   | msrd
vacuum mag. permeability                                     | vacuum-permeability                                          | DFLT | phys |   |   |   | msrd
vacuum mag. permeability                                     | magnetic-permeability                                        | DFLT | phys |   |   |   | msrd
vacuum mag. permeability                                     | μ0                                                           | DFLT | phys |   |   |   | msrd
von Klitzing constant                                        | von-klitzing-constant                                        |   | phys |   |   | drvd |  
von Klitzing constant                                        | RK                                                           |   | phys |   |   | drvd |  
weak mixing angle                                            | weak-mixing-angle                                            |   | phys |   |   |   | msrd
Wien frequency displacement law constant                     | wien-frequency-displacement-law-constant                     |   | phys |   | def |   |  
Wien wavelength displacement law constant                    | wien-wavelength-displacement-law-constant                    |   | phys |   | def |   |  
W to Z mass ratio                                            | w-to-z-mass-ratio                                            |   | phys |   |   |   | msrd
=end table

=head1 Issues and suggestions

Please post them L<in GitHub|https://github.com/JJ/p6-math-constants/issues>. Pull requests are also welcome.

=head1 AUTHOR

JJ Merelo <jjmerelo@gmail.com>

Kevin Pye <Kevin.Pye@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2016 JJ Merelo

Copyright 2021 Kevin Pye

This library is free software; you can redistribute it and/or modify
it under the GPL 3.0.

=end pod
