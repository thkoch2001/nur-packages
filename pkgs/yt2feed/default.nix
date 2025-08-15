{
  lib,
  python3Packages,
  fetchFromGitHub
}:

python3Packages.buildPythonApplication rec {
  pname = "yt2feed";
  version = "0.2";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "thkoch2001";
    repo = "${pname}";
    rev = "v${version}";
    hash = "sha256-x1pB7GSb0cgCQ5goKGeUxRNE/tWfYbqa5hhNlR+Pits=";
  };

  buildInputs = with python3Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    jinja2
    markupsafe
    yt-dlp
  ];

  meta = {
    description = "Create podcast feeds from video channels via yt-dlp";
    homepage = "https://github.com/thkoch2001/yt2feed";
    license = lib.licenses.gpl3Plus;
    mainProgram = "yt2feed";
  };
}
