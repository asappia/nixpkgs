{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  requests,
}:

buildPythonPackage rec {
  pname = "requests-futures";
  version = "1.0.2";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-a361eUAzboAPrrw9q1BjYO3slHj3si3FcIWK06p0WNo=";
  };

  propagatedBuildInputs = [ requests ];

  # Tests are disabled because they require being online
  doCheck = false;

  pythonImportsCheck = [ "requests_futures" ];

  meta = with lib; {
    description = "Asynchronous Python HTTP Requests for Humans using Futures";
    homepage = "https://github.com/ross/requests-futures";
    changelog = "https://github.com/ross/requests-futures/blob/v${version}/CHANGELOG.md";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ applePrincess ];
  };
}
