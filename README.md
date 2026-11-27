# Eval Workbench · LLM Evaluation & Annotation

An AI-assisted personal project for organizing prompts, candidate responses, rubric scores, error categories and review histories. Built with Python/FastAPI, JavaScript and SQLite.

- [Live demo](https://eval-workbench.onrender.com/) — access token required; the free instance may take time to wake up.
- [Source package](eval-workbench-source.zip) — includes application code, tests and Chinese technical documentation.
- [MIT License](LICENSE) — applies to the original project source and documentation, including the source archive. Third-party dependencies retain their own licenses.

## Features

Question and answer management; four-dimension scoring; error categorization; reviewer workflow; version history and conflict checks; filtered statistics; CSV/JSON import and export; feedback tracking.

## Run locally

Requires Python 3.12. Extract the source package, then run:

```bash
python3 -m zipfile -e eval-workbench-source.zip .
cd eval-workbench
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python -m scripts.seed
python -m app.run
```

Open http://127.0.0.1:8765. API documentation: `/api/docs`. The extracted `README.md` and `docs/` explain the data model, evaluation rubric, deployment and limitations.

## Tests

```bash
python -m pip install -r requirements-dev.txt
python -m pytest -q
node --test tests/demo.test.mjs
```

The project includes 26 Python tests and 6 JavaScript tests. The sample workflow uses 12 synthetic questions, 24 candidate responses and 16 AI-generated preliminary assessments. These are demonstration data, not evidence of real model API calls or independent human evaluation.

## Deployment

The root Dockerfile extracts the source archive for deployment. Render settings:

- Runtime: Docker
- Health check: `/health`
- Required secret: `EVAL_TOKEN`, a random value of at least 24 characters, configured on the hosting platform and never committed
- Single application instance
- Optional paid persistent disk: `/var/data`, database `/var/data/eval.sqlite`

The current demo uses free compute without a persistent disk. SQLite records can be lost after restart or redeployment; export data before relying on them. This is a prototype with no verified user accounts or production availability guarantee.

No runtime databases, model API keys or deployment access tokens are included in this repository.
