{
  doCheck ? false,
  openssl,
  fetchFromGitHub,
  lib,
  ...
}:

let
  rev = "d01cd520e52ab8bcdad27496209a27022679d970";
  shortRev = lib.sources.shortRev rev;
  src = fetchFromGitHub {
    owner = "openssl";
    repo = "openssl";
    # https://github.com/openssl/openssl/commit/d01cd520e52ab8bcdad27496209a27022679d970
    # `feature/ech` branch
    inherit rev;
    hash = "sha256-CoHRiHD8gEHtoTHRVvI0vceGJ3WblKQAExTKx9smyGc=";
  };
in

(openssl.overrideAttrs {
  version = "feature-ech-${shortRev}";
  inherit src;
  # openssl nixpgks package has some patches that are not compatible with
  # the `feature/ech` branch
  patches = [ ];
  # This shit takes a lot of time so by default set to false
  inherit doCheck;
})
