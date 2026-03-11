# fijxu-nur-packages

Packages that I packaged for myself.

## Packages

- [SPCPlay](./pkgs/spcplay/default.nix): <https://github.com/dgrfactory/spcplay>
- [OpenMPT](./pkgs/openmpt/default.nix): <https://openmpt.org>
- [HAProxy with ECH](./pkgs/haproxy-ech/default.nix): <https://github.com/haproxy/haproxy>
  - A build of HAProxy with ECH enabled using [OpenSSL with ECH](./pkgs/openssl-ech/default.nix), (only works in x86-64-v3 CPUs because I'm too lazy to make adapt the Nix package to other shit).
  - Unstable since I'm using the latest commit from the git repository! I did try using the latest stable but it wasn't able to build with the OpenSSL `master` branch nor `feature/ech` branch, so I had to go with the latest commit.
  - This package is being used in production for https://nadeko.net selfhosted services.
- [OpenSSL with ECH](./pkgs/openssl-ech/default.nix): <https://github.com/openssl/openssl/tree/feature/ech>
  - Build of OpenSSL using the `feature/ech` branch, used for [HAProxy with ECH](./pkgs/haproxy-ech/default.nix)
