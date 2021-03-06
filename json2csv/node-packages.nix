# This file has been generated by node2nix 1.6.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "commander-2.20.0" = {
      name = "commander";
      packageName = "commander";
      version = "2.20.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/commander/-/commander-2.20.0.tgz";
        sha512 = "7j2y+40w61zy6YC2iRNpUe/NwhNyoXrYpHMrSunaMG64nRnaf96zO/KMQR4OyN/UnE5KLyEBnKHd4aG3rskjpQ==";
      };
    };
    "jsonparse-1.3.1" = {
      name = "jsonparse";
      packageName = "jsonparse";
      version = "1.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsonparse/-/jsonparse-1.3.1.tgz";
        sha1 = "3f4dae4a91fac315f71062f8521cc239f1366280";
      };
    };
    "lodash.get-4.4.2" = {
      name = "lodash.get";
      packageName = "lodash.get";
      version = "4.4.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash.get/-/lodash.get-4.4.2.tgz";
        sha1 = "2d177f652fa31e939b4438d5341499dfa3825e99";
      };
    };
  };
in
{
  json2csv = nodeEnv.buildNodePackage {
    name = "json2csv";
    packageName = "json2csv";
    version = "4.4.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/json2csv/-/json2csv-4.4.1.tgz";
      sha512 = "agsrAZNNl3Ep+0HUKleuaqMDlYUwtTrjtNLW6Ja8A9Q6QSLMJ0ssowmamHryI4twUFNhFMMkX5Kcjd2B/wcx7A==";
    };
    dependencies = [
      sources."commander-2.20.0"
      sources."jsonparse-1.3.1"
      sources."lodash.get-4.4.2"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Convert JSON to CSV";
      homepage = "https://github.com/zemirco/json2csv#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = false;
  };
}