{
  lib,
  fetchPypi,
  buildPythonPackage,
  pythonOlder,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "async-timeout";
  version = "5.0.1";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2TIaej1aal4YfoJNL6B5PON5ogKTV4LVVdbp0nNWd9M=";
  };

  propagatedBuildInputs = [ typing-extensions ];

  # Circular dependency on aiohttp
  doCheck = false;

  meta = {
    description = "Timeout context manager for asyncio programs";
    homepage = "https://github.com/aio-libs/async_timeout/";
    license = lib.licenses.asl20;
  };
}
