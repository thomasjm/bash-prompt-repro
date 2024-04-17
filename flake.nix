{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=master";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        python = pkgs.python3.withPackages (ps: [ps.bash_kernel]);
      in
        {
          packages = {
            kernelspec = pkgs.writeText "packages-index-yaml.json" (pkgs.lib.generators.toJSON {} {
              displayName = "Bash";
              language = "bash";
              argv = [
                "${python}/bin/python"
                "-m"
                "bash_kernel"
                "-f"
                "{connection_file}"
              ];
            });

            papermill = pkgs.python3.pkgs.papermill;
          };
        }
    );
}
