{ pkgs, lib, config, inputs, ... }:

{
  env.PYTHONNOUSERSITE="1";

  packages = [ pkgs.git ];

  languages.python.enable = true;
  languages.python.version = "3.11";
  # Fix issue with manylinuex, see https://github.com/cachix/nixpkgs-python/issues/44
  languages.python.manylinux.enable = false;

  scripts.init.exec = ''
    python -m venv .venv/
    source .venv/bin/activate
    python -m pip install -r requirements.txt
  '';

  scripts.update-virtual-environment.exec = ''
    python -m pip install --upgrade -r requirements.txt
  '';

  enterShell = ''
    if [ -d .venv ]; then
      unset PYTHONPATH 
      source .venv/bin/activate
    else
      init
    fi;
  '';
}
