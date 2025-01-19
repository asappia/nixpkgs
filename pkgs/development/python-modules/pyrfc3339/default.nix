{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  pytz,
}:

buildPythonPackage rec {
  pname = "pyrfc3339";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pyRFC3339";
    inherit version;
    sha256 = "sha256-5HhDN56jXBKWw7bGepSKGkkK4FhO38veoOr/td0plgs=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ pytz ];

  doCheck = false; # tests are not including in PyPI tarball

  meta = with lib; {
    description = "Generate and parse RFC 3339 timestamps";
    homepage = "https://github.com/kurtraschke/pyRFC3339";
    license = licenses.mit;
  };
}
