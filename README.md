# Eval Workbench — deployment package

Python/FastAPI + SQLite evaluation and annotation workbench.

The reviewed project source, tests and Chinese documentation are packaged in `eval-workbench-source.zip` (extracts to `eval-workbench/`). The Docker build extracts this archive and installs its pinned Python dependencies. No database, model keys or Git credentials are included.

Render configuration:
- Runtime: Docker
- Health check: `/health`
- Required secret: `EVAL_TOKEN`, a random value of at least 24 characters
- Persistent disk: mount `/var/data`; database `/var/data/eval.sqlite`
- One instance; confirm pricing before creating a paid service

First start seeds 12 synthetic tasks and 24 candidate responses only when the database is empty. AI-assisted sample scores are explicitly labelled. This is not evidence of real model API calls or human evaluation.

Source extraction locally: `python3 -m zipfile -e eval-workbench-source.zip .`
