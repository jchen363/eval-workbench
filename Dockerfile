FROM python:3.12-slim
WORKDIR /app
COPY eval-workbench-source.zip /app/source.zip
RUN python -m zipfile -e /app/source.zip /app && rm /app/source.zip && pip install --no-cache-dir -r /app/eval-workbench/requirements.txt && useradd --uid 10001 --create-home appuser && mkdir -p /var/data && chown appuser /var/data
COPY start.sh /app/start.sh
COPY eval-workbench-source.zip /app/eval-workbench/app/static/eval-workbench-source.zip
WORKDIR /app/eval-workbench
USER appuser
ENV EVAL_DB=/var/data/eval.sqlite EVAL_HOST=0.0.0.0 PORT=8765
EXPOSE 8765
CMD ["sh", "/app/start.sh"]
