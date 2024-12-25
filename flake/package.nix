{
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
  lib,
  stdenv,
}: let
  pname = "hayabusa";
  version = "0.3.1";
in
  rustPlatform.buildRustPackage {
    inherit pname version;

    buildInputs = [
      openssl
    ];

    nativeBuildInputs = [
      pkg-config
    ];

    src = fetchFromGitHub {
      owner = "Notarin";
      repo = pname;
      rev = "v${version}";
      hash = "sha256-LoYLJovEYRAImvVWev+TlJCaDum8dGmFCBHT7jn9L1Q=";
    };

    cargoHash = "sha256-XrdMMzbshT5Jx6J+R0Dczffdcyn5y08lyLqQMjB4dxw=";

    meta = {
      description = "Hayabusa is a swift rust fetch program";
      broken = stdenv.hostPlatform.isDarwin;
      platforms = lib.platforms.all;
      maintainers = with lib.maintainers; [amadaluzia];
    };
  }
