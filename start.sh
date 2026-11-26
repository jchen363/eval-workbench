#!/bin/sh
set -eu
python -m scripts.seed --db "${EVAL_DB:-/var/data/eval.sqlite}"
exec python -m app.run
