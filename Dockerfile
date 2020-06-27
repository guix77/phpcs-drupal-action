FROM guillaumeduveau/docker-phpcs-drupal:latest

COPY app /app

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
