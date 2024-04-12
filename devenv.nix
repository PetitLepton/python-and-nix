{ pkgs, ... }:
{
  languages.python = {
    package = pkgs.python311;
    enable = true;
  };

  scripts.init.exec = ''
    python -m venv .venv/
    source .venv/bin/activate
    python -m pip install -r requirements.txt
  '';

  scripts.update-virtual-environment.exec = ''
    python -m pip install --upgrade -r requirements.txt
  '';

  enterShell = ''
    source .venv/bin/activate
  '';
}
