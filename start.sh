#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$ROOT_DIR/.venv"
PYTHON_BIN="$VENV_DIR/bin/python"

if [[ ! -x "$PYTHON_BIN" ]]; then
  if ! python3 -m venv "$VENV_DIR"; then
    cat <<'EOF'
python3-venv is not installed on this machine.
Install it first, then rerun this script:

  sudo apt install python3-venv
EOF
    exit 1
  fi
fi

if ! "$PYTHON_BIN" -m pip --version >/dev/null 2>&1; then
  rm -rf "$VENV_DIR"
  if ! python3 -m venv "$VENV_DIR"; then
    cat <<'EOF'
python3-venv is not installed on this machine.
Install it first, then rerun this script:

  sudo apt install python3-venv
EOF
    exit 1
  fi
fi

"$PYTHON_BIN" -m pip install --upgrade pip
"$PYTHON_BIN" -m pip install -r "$ROOT_DIR/requirements.txt"
exec "$PYTHON_BIN" "$ROOT_DIR/run.py"