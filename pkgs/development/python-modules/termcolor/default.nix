{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatch-vcs,
  hatchling,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "termcolor";
  version = "2.5.0";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mY2NJ9ptSEQujh8BYRkHa2kNliUHUx30iQ/NLbLvim8=";
  };

  nativeBuildInputs = [
    hatch-vcs
    hatchling
  ];

  pythonImportsCheck = [ "termcolor" ];

  nativeCheckInputs = [ pytestCheckHook ];

  meta = with lib; {
    description = "ANSI color formatting for output in terminal";
    homepage = "https://github.com/termcolor/termcolor";
    license = licenses.mit;
  };
}
