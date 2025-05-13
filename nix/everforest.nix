{
  fetchFromGitHub,
  fakeHash,
  trivialBuild,
}:
trivialBuild rec {
  pname = "everforest";
  version = "1.6.0";
  src = fetchFromGitHub {
    owner = "Theory-of-Everything";
    repo = "everforest-emacs";
    rev = "040fef9a5427c46a2e1bcd1cace803cfb84c658b";
    hash = "sha256-GpPivW7tzd9q+U6d5sv3ilfXmdPNDaSXqpJfK2Mk7i0=";
  };
}
