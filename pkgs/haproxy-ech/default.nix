{

  haproxy,
  fetchgit,
  pkgs,
  lib,
  ...
}:

let
  openssl-ech = pkgs.callPackage ../openssl-ech { };
  rev = "73732abfb246d2a32c33cab45ddea2642dc31587";
  shortRev = lib.sources.shortRev rev;
  src = fetchgit {
    # https://github.com/haproxy/haproxy/commit/73732abfb246d2a32c33cab45ddea2642dc31587
    url = "https://github.com/haproxy/haproxy.git";
    inherit rev;
    hash = "sha256-1LH2ZaWYU7cC77pn3mGYnB076gy/FcYqHvei/JbD3BY=";
  };
in

(haproxy.override {
  openssl = openssl-ech;
}).overrideAttrs
  (old: {
    version = "git-${shortRev}";
    inherit src;
    buildFlags = old.buildFlags ++ [ "USE_ECH=1" ];
    env.NIX_CFLAGS_COMPILE = "-march=x86-64-v3 -flto=auto";
  })
